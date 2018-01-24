//
//  RTText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "RTText.h"
#import "RTPrivate.h"

@interface RTText ()

@property (nonatomic,strong) NSArray<NSValue*>* ranges;
@property (nonatomic,strong) NSMutableAttributedString *attrString;

@end

@implementation RTText

- (instancetype)initWithString:(NSString *)str{
    if (self = [super init]) {
        self.attrString = [[NSMutableAttributedString alloc] initWithString:str];
    }
    return self;
}

- (instancetype)initWithAttributedString:(NSAttributedString *)attrString {
    if (self = [super init]) {
        self.attrString = attrString.mutableCopy;
    }
    return self;
}

- (RTText *(^)(NSInteger, NSInteger))range {
    return ^(NSInteger loc, NSInteger len) {
        self.ranges = @[r(loc,len)];
        return self;
    };
}

- (RTText *)whole {
    self.ranges = @[r(0, self.attrString.length)];
    return self;
}

- (RTText *(^)(NSString *))matches {
    return ^(NSString *expStr) {
        NSMutableArray *ranges = @[].mutableCopy;
        [self.attrString.string matches:expStr usingBlock:^(NSRange range) {
            [ranges addObject:[NSValue valueWithRange:range]];
        }];
        self.ranges = ranges;
        return self;
    };
}

- (RTText *)rt {
    if (_ranges == nil) {
        self.ranges = @[r(0, self.attrString.length)];
    }
    return self;
}

- (RTText *(^)(RTStyle *))style {
    return ^(RTStyle *style) {
        return [self addAttributes:style.attributes];
    };
}

- (RTText *(^)(UIColor *))color {
    return ^(UIColor *color) {
        return [self addAttributes:@{NSForegroundColorAttributeName:color}];
    };
}

- (RTText *(^)(UIFont *))font {
    return ^(UIFont *font) {
        return [self addAttributes:@{NSFontAttributeName:font}];
    };
}

- (RTText *(^)(UIColor *))background {
    return ^(UIColor *color) {
        return [self addAttributes:@{NSBackgroundColorAttributeName:color}];
    };
}

- (RTText *(^)(UIColor*))underline {
    return ^(UIColor *color) {
        return [self addAttributes:@{
                                     NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                                     NSUnderlineColorAttributeName:color
                                     }];
    };
}

- (RTText *)addAttributes:(NSDictionary*)attrs {
    for (NSValue *range in self.ranges) {
        [self.attrString addAttributes:attrs
                              range:range.rangeValue];
        
    }
    return self;
}

- (RTText *(^)(id<RTTextConvertible>))join {
    return ^(id<RTTextConvertible> text) {
        [self.attrString appendAttributedString:text.rt.attrString];
        return self;
    };
}

- (void)replaceTextInRange:(NSRange)range withText:(id<RTTextConvertible>)text {
    [self.attrString replaceCharactersInRange:range withAttributedString:text.rt.attrString];
    self.ranges = @[r(0, self.length)];
}

- (RTText*)richTextWithParser:(id<RTParser>)converter {
    NSString *str = self.attrString.string;
    if (converter == nil) {
        return self;
    }
    __block NSUInteger offset = 0;
    [str matches:converter.pattern usingBlock:^(NSRange range) {
        NSString *text = [str substringWithRange:range];
        id<RTTextConvertible> rt = [converter parse:text];
        if (range.location == NSNotFound) {
            return ;
        }
        if (range.length == 0) {
            return ;
        }
        range.location = range.location - offset;
        [self replaceTextInRange:range withText:rt];
        offset += range.length - rt.length;
    }];
    return self;
}

- (RTText *(^)(id<RTParser>))parseWith {
    return ^(id<RTParser> parser){
        return [self richTextWithParser:parser];
    };
}

- (NSUInteger)length {
    return self.attrString.length;
}

@end

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

@end

@implementation RTText
{
    NSMutableAttributedString *_attributedString;
}

- (instancetype)init {
    return [self initWithText:nil];
}

- (instancetype)initWithText:(id<RTText>)text {
    if (self = [super init]) {
        if (text) {
            _attributedString = text.attributedString.mutableCopy;
        } else {
            _attributedString = [[NSMutableAttributedString alloc] init];
        }
        self.ranges = @[r(0, self.length)];
    }
    return self;
}

- (NSAttributedString *)attributedString {
    return _attributedString;
}

- (RTText *(^)(NSInteger, NSInteger))range {
    return ^(NSInteger loc, NSInteger len) {
        self.ranges = @[r(loc,len)];
        return self;
    };
}

- (RTText *(^)())whole {
    return ^() {
        self.ranges = @[r(0, self.length)];
        return self;
    };
}

- (RTText *(^)(NSString *))matches {
    return ^(NSString *expStr) {
        NSMutableArray *ranges = @[].mutableCopy;
        [_attributedString.string matches:expStr usingBlock:^(NSRange range) {
            [ranges addObject:[NSValue valueWithRange:range]];
        }];
        self.ranges = ranges;
        return self;
    };
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
        [_attributedString addAttributes:attrs
                              range:range.rangeValue];
        
    }
    return self;
}

- (RTText *(^)(id<RTText>))join {
    return ^(id<RTText> text) {
        [_attributedString appendAttributedString:text.attributedString];
        self.ranges = @[r(0, self.length)];
        return self;
    };
}

- (void)replaceTextInRange:(NSRange)range withText:(id<RTText>)text {
    [_attributedString replaceCharactersInRange:range withAttributedString:text.attributedString];
    self.ranges = @[r(0, self.length)];
}

- (void)replaceTextMatchedPattern:(NSString *)pattern withParser:(Parser)parser {
    NSString *str = _attributedString.string;
    if (parser == nil) {
        return;
    }
    __block NSUInteger offset = 0;
    [str matches:pattern usingBlock:^(NSRange range) {
        NSString *text = [str substringWithRange:range];
        id<RTText> rt = parser(text);
        if (range.location == NSNotFound || range.length == 0) {
            return ;
        }
        range.location = range.location - offset;
        [self replaceTextInRange:range withText:rt];
        offset += range.length - rt.length;
    }];
}

- (NSUInteger)length {
    return self.attributedString.length;
}

@end

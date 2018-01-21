//
//  ZHRichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "ZHRichText.h"
#import "ZHPrivate.h"

@interface ZHRichText ()

@property (nonatomic,strong) NSArray<NSValue*>* ranges;
@property (nonatomic,strong) NSMutableAttributedString *attrStr;

@end

@implementation ZHRichText

- (instancetype)initWithString:(NSString *)str{
    if (self = [super init]) {
        self.attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    }
    return self;
}

- (instancetype)initWithAttributedString:(NSAttributedString *)attrStr {
    if (self = [super init]) {
        self.attrStr = attrStr.mutableCopy;
    }
    return self;
}

- (ZHRichText *(^)(NSInteger, NSInteger))range {
    return ^(NSInteger loc, NSInteger len) {
        self.ranges = @[r(loc,len)];
        return self;
    };
}

- (ZHRichText *)whole {
    self.ranges = @[r(0, self.attrStr.length)];
    return self;
}

- (ZHRichText *(^)(NSString *))matches {
    return ^(NSString *expStr) {
        NSMutableArray *ranges = @[].mutableCopy;
        [self.attrStr.string matches:expStr usingBlock:^(NSRange range) {
            [ranges addObject:[NSValue valueWithRange:range]];
        }];
        self.ranges = ranges;
        return self;
    };
}

- (ZHRichText *)rt {
    if (_ranges == nil) {
        self.ranges = @[r(0, self.attrStr.length)];
    }
    return self;
}

- (ZHRichText *(^)(ZHRichTextStyle *))style {
    return ^(ZHRichTextStyle *style) {
        return [self addAttributes:style.attributes];
    };
}

- (ZHRichText *(^)(UIColor *))color {
    return ^(UIColor *color) {
        return [self addAttributes:@{NSForegroundColorAttributeName:color}];
    };
}

- (ZHRichText *(^)(UIFont *))font {
    return ^(UIFont *font) {
        return [self addAttributes:@{NSFontAttributeName:font}];
    };
}

- (ZHRichText *(^)(UIColor *))background {
    return ^(UIColor *color) {
        return [self addAttributes:@{NSBackgroundColorAttributeName:color}];
    };
}

- (ZHRichText *(^)(UIColor*))underline {
    return ^(UIColor *color) {
        return [self addAttributes:@{
                                     NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                                     NSUnderlineColorAttributeName:color
                                     }];
    };
}

- (ZHRichText *)addAttributes:(NSDictionary*)attrs {
    for (NSValue *range in self.ranges) {
        [self.attrStr addAttributes:attrs
                              range:range.rangeValue];
        
    }
    return self;
}

- (ZHRichText *(^)(id<ZHRichTextConvertible>))join {
    return ^(id<ZHRichTextConvertible> text) {
        [self.attrStr appendAttributedString:text.rt.attrStr];
        return self;
    };
}

- (void)replaceTextInRange:(NSRange)range withText:(id<ZHRichTextConvertible>)text {
    [self.attrStr replaceCharactersInRange:range withAttributedString:text.rt.attrStr];
    self.ranges = @[r(0, self.length)];
}

- (NSUInteger)length {
    return self.attrStr.length;
}

@end

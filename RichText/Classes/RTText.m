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

- (instancetype)initWithHTML:(NSString *)htmlStr {
    if (self = [super init]) {
        NSDictionary *options = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType};
        NSData *data = [(htmlStr ?: @"") dataUsingEncoding:NSUnicodeStringEncoding];
        _attributedString = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
        self.ranges = @[r(0, self.length)];
    }
    return self;
}

- (instancetype)initWithFormat:(NSString *)format, ... {
    va_list texts;
    va_start(texts, format);
    NSString *str = [[NSString alloc] initWithFormat:format arguments:texts];
    va_end(texts);
    return [self initWithText:str];
}

- (NSAttributedString *)attributedString {
    return [_attributedString copy];
}

- (RTText *(^)(NSInteger, NSInteger))range {
    return ^(NSInteger loc, NSInteger len) {
        self.ranges = @[r(loc,len)];
        return self;
    };
}

- (RTText *(^)())whole {
    return ^() {
        return self.range(0,self.length);
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

- (RTText *(^)(RTStyle *))setStyle {
    return ^(RTStyle *style) {
        return [self addAttributes:style.attributes];
    };
}

- (RTText *(^)(UIColor *))setColor {
    return ^(UIColor *color) {
        return [self addAttributes:@{NSForegroundColorAttributeName:color}];
    };
}

- (RTText *(^)(UIFont *))setFont {
    return ^(UIFont *font) {
        return [self addAttributes:@{NSFontAttributeName:font}];
    };
}

- (RTText *(^)(UIColor *))setBackgroundColor {
    return ^(UIColor *color) {
        return [self addAttributes:@{NSBackgroundColorAttributeName:color}];
    };
}

- (RTText *(^)(UIColor *))setStrokeColor {
    return ^(UIColor *color) {
        return [self addAttributes:@{NSStrokeColorAttributeName:color}];
    };
}

- (RTText *(^)(CGFloat))setStrokeWidth {
    return ^(CGFloat width) {
        return [self addAttributes:@{NSStrokeWidthAttributeName:@(width)}];
    };
}

- (RTText *(^)(CGFloat))setKern {
    return ^(CGFloat kern) {
        return [self addAttributes:@{NSKernAttributeName:@(kern)}];
    };
}

- (RTText *(^)(NSShadow *))setShadow {
    return ^(NSShadow *shadow) {
        return [self addAttributes:@{
                                     NSShadowAttributeName:shadow,
                                     NSVerticalGlyphFormAttributeName:@0
                                     }];
    };
}

- (RTText *(^)(CGFloat))setObliqueness {
    return ^(CGFloat obliqueness) {
        return [self addAttributes:@{NSObliquenessAttributeName:@(obliqueness)}];
    };
}

- (RTText *(^)(CGFloat))setExpansion {
    return ^(CGFloat expansion) {
        return [self addAttributes:@{NSExpansionAttributeName:@(expansion)}];
    };
}

- (RTText *(^)(UIColor*))setUnderline {
    return ^(UIColor *color) {
        return [self addAttributes:@{
                                     NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                                     NSUnderlineColorAttributeName:color
                                     }];
    };
}

- (RTText *)addAttributes:(NSDictionary*)attrs {
    if (attrs == nil) {
        return self;
    }
    for (NSValue *range in self.ranges) {
        [_attributedString addAttributes:attrs
                              range:range.rangeValue];
        
    }
    return self;
}

- (RTText *(^)(id<RTText>))join {
    return ^(id<RTText> text) {
        [self appendText:text];
        return self;
    };
}

- (void)replaceTextInRange:(NSRange)range withText:(id<RTText>)text {
    [_attributedString replaceCharactersInRange:range withAttributedString:text.attributedString];
    self.ranges = @[r(0, self.length)];
}

- (void)replaceTextMatchedPattern:(NSString *)pattern withParser:(RTParser)parser {
    NSString *str = _attributedString.string;
    if (parser == nil) {
        return;
    }
    __block NSUInteger offset = 0;
    [str matches:pattern usingBlock:^(NSRange range) {
        if (range.location == NSNotFound || range.length == 0) {
            return ;
        }
        range.location = range.location - offset;
        NSString *text = [str substringWithRange:range];
        id<RTText> rt = parser(text);
        if (rt) {
            [self replaceTextInRange:range withText:rt];
            offset += range.length - rt.length;
        }
    }];
}

- (RTText *)subtextToIndex:(NSUInteger)to {
    NSRange range = NSMakeRange(0, to);
    return [self subtextWithRange:range];
}

- (RTText *)subtextFromIndex:(NSUInteger)from {
    NSRange range = NSMakeRange(from, 0);
    return [self subtextWithRange:range];
}

- (RTText *)subtextWithRange:(NSRange)range {
    NSAttributedString *attrStr = [_attributedString attributedSubstringFromRange:range];
    return [[RTText alloc] initWithText:attrStr];
}

- (void)deleteCharactersInRange:(NSRange)range {
    [_attributedString deleteCharactersInRange:range];
    self.ranges = @[r(0, self.length)];
}

- (void)insertText:(id<RTText>)text atIndex:(NSUInteger)loc {
    [_attributedString insertAttributedString:text.attributedString atIndex:loc];
    self.ranges = @[r(0, self.length)];
}

- (void)appendText:(id<RTText>)text {
    [_attributedString appendAttributedString:text.attributedString];
    self.ranges = @[r(0, self.length)];
}

- (NSUInteger)length {
    return self.attributedString.length;
}

@end

//
//  NSString+ZHRichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "NSString+ZHRichText.h"
#import "ZHRichText.h"
#import "ZHPrivate.h"
#import "ZHRichTextConverter.h"

@implementation NSString(ZHRichText)

- (ZHRichText*)richTextWithConverter:(id<ZHRichTextConverter>)converter {
    ZHRichText *richtext = [[ZHRichText alloc] initWithString:self];
    if (converter == nil) {
        return richtext.range(0,self.length);
    }
    __block NSUInteger offset = 0;
    [self matches:converter.pattern usingBlock:^(NSRange range) {
        NSString *text = [self substringWithRange:range];
        id<ZHRichTextConvertible> rt = [converter convertFromText:text];
        if (range.location == NSNotFound) {
            return ;
        }
        if (range.length == 0) {
            return ;
        }
        range.location = range.location - offset;
        [richtext replaceTextInRange:range withText:rt];
        offset += range.length - rt.length;
    }];
    return richtext;
}

- (ZHRichText *(^)(id<ZHRichTextConverter>))parse {
    return ^(id<ZHRichTextConverter> parser){
        return [self richTextWithConverter:parser];
    };
}

- (ZHRichText *)rt {
    return [self richTextWithConverter:nil];
}

- (ZHRichText *(^)(id<ZHRichTextConvertible>))join {
    return ^(id<ZHRichTextConvertible> text) {
        return self.rt.join(text);
    };
}

- (ZHRichText *(^)(NSString *))matches {
    return ^(NSString *expStr) {
        return self.rt.matches(expStr);
    };
}

- (ZHRichText *(^)(NSInteger, NSInteger))range {
    return ^(NSInteger loc, NSInteger len) {
        return self.rt.range(loc, len);;
    };
}

- (ZHRichText *)whole {
    return self.rt;
}

@end


//
//  NSString+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "NSString+RichText.h"
#import "RTText.h"
#import "RTPrivate.h"
#import "RTParser.h"

@implementation NSString(RichText)


- (RTText*)richTextWithParser:(id<RTParser>)converter {
    RTText *richtext = [[RTText alloc] initWithString:self];
    if (converter == nil) {
        return richtext.range(0,self.length);
    }
    __block NSUInteger offset = 0;
    [self matches:converter.pattern usingBlock:^(NSRange range) {
        if (range.location == NSNotFound) {
            return ;
        }
        if (range.length == 0) {
            return ;
        }
        
        NSString *text = [self substringWithRange:range];
        id<RTTextConvertible> rt = [converter parse:text];

        if (rt.length == 0) {
            return ;
        }

        range.location = range.location - offset;
        [richtext replaceTextInRange:range withText:rt];
        offset += range.length - rt.length;
    }];
    return richtext;
}

- (RTText *(^)(id<RTParser>))parseWith {
    return ^(id<RTParser> parser){
        return [self richTextWithParser:parser];
    };
}

- (RTText *)rt {
    return [self richTextWithParser:nil];
}

- (RTText *(^)(id<RTTextConvertible>))join {
    return ^(id<RTTextConvertible> text) {
        return self.rt.join(text);
    };
}

- (RTText *(^)(NSString *))matches {
    return ^(NSString *expStr) {
        return self.rt.matches(expStr);
    };
}

- (RTText *(^)(NSInteger, NSInteger))range {
    return ^(NSInteger loc, NSInteger len) {
        return self.rt.range(loc, len);;
    };
}

- (RTText *)whole {
    return self.rt;
}

@end


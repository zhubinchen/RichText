//
//  NSString+ZHRichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "NSString+ZHRichText.h"
#import "ZHRichText.h"

#define RTImplementation

@implementation NSString(ZHRichText)

- (ZHRichText *)rt {
    ZHRichText *rt = [[ZHRichText alloc] initWithString:self];
    return rt.range(0, self.length);
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


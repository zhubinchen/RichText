//
//  NSAttributedString+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import "NSAttributedString+RichText.h"
#import "RTText.h"

@implementation NSAttributedString(ZHRichText)

- (RTText *)rt {
    RTText *rt = [[RTText alloc] initWithAttributedString:self];
    return rt.range(0, self.length);
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

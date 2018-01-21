//
//  ZHPrivate.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "ZHPrivate.h"

@implementation  NSString(ZHPrivate)

- (void)matches:(NSString *)exp usingBlock:(void(^)(NSRange))block {
    NSError *err = nil;
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:exp options:NSRegularExpressionCaseInsensitive error:&err];
    NSAssert(err == nil, err.localizedDescription);

    [regExp enumerateMatchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, self.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        if (result.range.location != NSNotFound) {
            block(result.range);
        }
    }];
}

@end


//
//  ZHPrivate.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "ZHPrivate.h"

@implementation  NSString(ZHPrivate)

- (NSArray<NSValue *> *)matches:(NSString *)expStr {
    NSError *err = nil;
    NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:expStr options:NSRegularExpressionCaseInsensitive error:&err];
    NSAssert(err == nil, err.localizedDescription);
    NSMutableArray *ranges = [NSMutableArray array];
    [exp enumerateMatchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, self.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        [ranges addObject:[NSValue valueWithRange:result.range]];
    }];
    return ranges;
}

@end


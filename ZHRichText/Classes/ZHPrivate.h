//
//  ZHPrivate.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import <Foundation/Foundation.h>

static inline NSValue* r(NSUInteger loc, NSUInteger len) {
    return [NSValue valueWithRange:NSMakeRange(loc, len)];
}

@interface NSString(ZHPrivate)

- (NSArray<NSValue*>*)matches:(NSString*)expStr;

@end


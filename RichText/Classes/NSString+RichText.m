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

rt1(matches, NSString*)
rt1(parseWith, id<RTParser>)
rt1(join, id<RTTextConvertible>)
rt2(range, NSInteger, NSInteger)

- (RTText *)rt {
    return [[RTText alloc] initWithString:self];
}

- (RTText *)whole {
    return self.rt;
}

@end


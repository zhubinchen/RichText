//
//  NSString+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "NSString+RichText.h"
#import "RTText.h"
#import "RTPrivate.h"

@implementation NSString(RichText)

rt_imp
rt_imp1(join)

#pragma mark Rangeable

rt_imp0(whole)
rt_imp1(matches)
rt_imp2(range)

#pragma mark Styleable

rt_imp1(color)
rt_imp1(font)
rt_imp1(background)
rt_imp1(style)
rt_imp1(underline)

- (NSAttributedString *)attributedString {
    return [[NSAttributedString alloc] initWithString:self];
}

@end


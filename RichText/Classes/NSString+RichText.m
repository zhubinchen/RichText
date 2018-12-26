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

_rt_imp
_rt_imp1(join)

#pragma mark Rangeable

_rt_imp0(whole)
_rt_imp1(matches)
_rt_imp2(range)
_rt_imp1_i(rangeTo)
_rt_imp1_i(rangeFrom)
_rt_imp1_i(first)
_rt_imp1_i(last)
#pragma mark Styleable

_rt_imp1(setColor)
_rt_imp1(setFont)
_rt_imp1(setBackgroundColor)
_rt_imp1(setStyle)
_rt_imp1(setUnderline)
_rt_imp1(setStrokeColor)
_rt_imp1(setShadow)
_rt_imp1_f(setStrokeWidth)
_rt_imp1_f(setExpansion)
_rt_imp1_f(setObliqueness)
_rt_imp1_f(setKern)

- (NSAttributedString *)attributedString {
    return [[NSAttributedString alloc] initWithString:self];
}

@end


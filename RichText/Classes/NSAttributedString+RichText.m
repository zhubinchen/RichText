//
//  NSAttributedString+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import "NSAttributedString+RichText.h"
#import "RTText.h"

@implementation NSAttributedString(ZHRichText)

_rt_imp
_rt_imp1(join)

#pragma mark Rangeable

_rt_imp0(whole)
_rt_imp1(matches)
_rt_imp2(range)

#pragma mark Styleable

_rt_imp1(setColor)
_rt_imp1(setFont)
_rt_imp1(setBackground)
_rt_imp1(setStyle)
_rt_imp1(setUnderline)

- (NSAttributedString *)attributedString {
    return self;
}

@end

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

#pragma mark Styleable

_rt_imp1(setColor)
_rt_imp1(setFont)
_rt_imp1(setBackgroundColor)
_rt_imp1(setStyle)
_rt_imp1(setUnderline)
_rt_imp1(setStrokeColor)
_rt_imp1(setShadow)

- (RTText *(^)(CGFloat))setStrokeWidth {
    return ^(CGFloat width) {
        return self._rt.setStrokeWidth(width);
    };
}

- (RTText *(^)(CGFloat))setExpansion {
    return ^(CGFloat width) {
        return self._rt.setExpansion(width);
    };
}

- (RTText *(^)(CGFloat))setObliqueness {
    return ^(CGFloat width) {
        return self._rt.setObliqueness(width);
    };
}

- (NSAttributedString *)attributedString {
    return [[NSAttributedString alloc] initWithString:self];
}

@end


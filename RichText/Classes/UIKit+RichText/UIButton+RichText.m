//
//  UIButton+RichText.m
//  Pods-RichText_Example
//
//  Created by zhubch on 2018/2/6.
//

#import "UIButton+RichText.h"
#import "NSString+RichText.h"
#import "NSAttributedString+RichText.h"
#import <objc/runtime.h>
#import "RTDefines.h"

@implementation UIButton(RichText)

- (void)setRichText:(id<RTText>)richText forState:(UIControlState)state {
    [self setAttributedTitle:richText.attributedString forState:state];
}

- (id<RTText>)richTextForState:(UIControlState)state {
    return [self attributedTitleForState:state];
}

- (id<RTText>)currentRichText {
    return self.currentAttributedTitle;
}

- (void)setStyle:(RTStyle *)style forState:(UIControlState)state {
    void *key = "rt_style";
    objc_setAssociatedObject(self, key + state, style, OBJC_ASSOCIATION_RETAIN);
    NSString *title = [self titleForState:state];
    if (title && style) {
        [self setRichText:title.setStyle(style) forState:state];
    }
}

- (RTStyle *)styleForState:(UIControlState)state {
    void *key = "rt_style";
    return objc_getAssociatedObject(self, key + state);
}

- (void)rt_setTitle:(NSString *)title forState:(UIControlState)state {
    RTStyle *style = [self styleForState:state];
    if (title && style) {
        [self setRichText:title.setStyle(style) forState:state];
    } else {
        [self rt_setTitle:title forState:state];
    }
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _rt_swizzle(setTitle:forState:, rt_setTitle:forState:);
    });
}

@end

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
    
    objc_setAssociatedObject(self, "rt_style" + state, style, OBJC_ASSOCIATION_RETAIN);
    NSString *title = [self titleForState:state];
    if (title && style) {
        [self setRichText:title.setStyle(style) forState:state];
    }
}

- (RTStyle *)styleForState:(UIControlState)state {
    return objc_getAssociatedObject(self, "rt_style" + state);
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
        Class class = [self class];
        
        SEL originalSelector = @selector(setTitle:forState:);
        SEL swizzledSelector = @selector(rt_setTitle:forState:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

@end

//
//  UITextField+RichText.m
//  Pods-RichText_Example
//
//  Created by zhubch on 2018/2/6.
//

#import "UITextField+RichText.h"
#import "NSString+RichText.h"
#import "NSAttributedString+RichText.h"
#import <objc/runtime.h>

@implementation UITextField(RichText)

- (void)setRichText:(id<RTText>)richText {
    self.attributedText = richText.attributedString;
}

- (id<RTText>)richText {
    return self.attributedText;
}

- (void)setRichTextPlaceholder:(id<RTText>)richTextPlaceholder {
    self.attributedPlaceholder = richTextPlaceholder.attributedString;
}

- (id<RTText>)richTextPlaceholder {
    return self.attributedPlaceholder;
}

- (void)setStyle:(RTStyle *)style {
    objc_setAssociatedObject(self, "rt_style", style, OBJC_ASSOCIATION_RETAIN);
    if (self.text && style) {
        self.richText = self.text.setStyle(style);
    }
}

- (RTStyle *)style {
    return objc_getAssociatedObject(self, "rt_style");
}

- (void)rt_setText:(NSString *)text {
    if (self.style == nil) {
        [self rt_setText:text];
        return;
    }
    self.richText = text.setStyle(self.style);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(setText:);
        SEL swizzledSelector = @selector(rt_setText:);
        
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


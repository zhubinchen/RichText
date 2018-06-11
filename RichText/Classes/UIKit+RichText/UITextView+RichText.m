//
//  UITextView+RichText.m
//  Pods-RichText_Example
//
//  Created by zhubch on 2018/2/6.
//

#import "UITextView+RichText.h"
#import "NSString+RichText.h"
#import "NSAttributedString+RichText.h"
#import <objc/runtime.h>

@implementation UITextView(RichText)

- (void)rt_setText:(NSString *)text {
    if (self.style == nil) {
        [self rt_setText:text];
    }
    self.richText = text.setStyle(self.style);
}

- (void)setRichText:(id<RTText>)richText {
    self.attributedText = richText.attributedString;
}

- (id<RTText>)richText {
    return self.attributedText;
}

- (void)setStyle:(RTStyle *)style {
    objc_setAssociatedObject(self, "rt_style", style, OBJC_ASSOCIATION_RETAIN);
    if (style == nil) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
        return;
    }
    if (self.text && style) {
        self.richText = self.text.setStyle(style);
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textViewDidChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    
}

- (RTStyle *)style {
    return objc_getAssociatedObject(self, "rt_style");
}

- (void)textViewDidChange:(NSNotification *)notification {
    UITextView *textView = notification.object;
    
    if (textView.style && textView.text) {
        textView.richText = textView.text.setStyle(textView.style);
    }
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


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
#import "RTDefines.h"

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

- (void)setStyleId:(NSString *)styleId {
    objc_setAssociatedObject(self, "rt_styleId", styleId, OBJC_ASSOCIATION_RETAIN);
    if (styleId) {
        self.style = [RTStyle findStyleByIdentifier:self.styleId];
    }
}

- (NSString *)styleId {
    return objc_getAssociatedObject(self, "rt_styleId");
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _rt_swizzle(setText:, rt_setText:);
    });
}

@end


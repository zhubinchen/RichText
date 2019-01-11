//
//  UILabel+RichText.m
//  Pods-RichText_Example
//
//  Created by zhubch on 2018/2/6.
//

#import "UILabel+RichText.h"
#import "NSString+RichText.h"
#import "NSAttributedString+RichText.h"
#import <objc/runtime.h>
#import "RTDefines.h"

@implementation UILabel(RichText)

- (void)setRichText:(id<RTText>)richText {
    self.attributedText = richText.attributedString;
}

- (id<RTText>)richText {
    return self.attributedText;
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


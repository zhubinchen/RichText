//
//  UIExtensions.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import "UIExtensions.h"
#import "NSAttributedString+RichText.h"

@implementation UILabel(RichText)

- (void)setRichText:(id<RTText>)richText {
    self.attributedText = richText.attributedString;
}

- (id<RTText>)richText {
    return self.attributedText;
}

@end

@implementation UITextView(RichText)

- (void)setRichText:(id<RTText>)richText {
    self.attributedText = richText.attributedString;
}

- (id<RTText>)richText {
    return self.attributedText;
}

@end

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

@end

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

@end





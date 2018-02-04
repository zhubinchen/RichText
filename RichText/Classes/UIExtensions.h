//
//  UIExtensions.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import <UIKit/UIKit.h>
#import "RTProtocols.h"

@interface UILabel(RichText)

@property(readwrite) id<RTText> richText;

@end

@interface UITextView(RichText)

@property(readwrite) id<RTText> richText;

@end

@interface UITextField(RichText)

@property(readwrite) id<RTText> richText;
@property(readwrite) id<RTText> richTextPlaceholder;

@end

@interface UIButton(RichText)

- (void)setRichText:(id<RTText>)richText forState:(UIControlState)state;

- (id<RTText>)richTextForState:(UIControlState)state;

- (id<RTText>)currentRichText;

@end


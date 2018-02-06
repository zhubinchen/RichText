//
//  UIExtensions.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import <UIKit/UIKit.h>
#import "RTProtocols.h"
#import "RTStyle.h"

@interface UILabel(RichText)

@property(readwrite) id<RTText> richText;
@property(readwrite) RTStyle *style;

@end

@interface UITextView(RichText)

@property(readwrite) id<RTText> richText;
@property(readwrite) RTStyle *style;

@end

@interface UITextField(RichText)

@property(readwrite) id<RTText> richText;
@property(readwrite) id<RTText> richTextPlaceholder;
@property(readwrite) RTStyle *style;

@end

@interface UIButton(RichText)

- (void)setRichText:(id<RTText>)richText forState:(UIControlState)state;

- (id<RTText>)richTextForState:(UIControlState)state;

- (id<RTText>)currentRichText;

@end


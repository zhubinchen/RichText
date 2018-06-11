//
//  UIButton+RichText.h
//  Pods-RichText_Example
//
//  Created by zhubch on 2018/2/6.
//

#import <UIKit/UIKit.h>
#import "RTProtocols.h"
#import "RTStyle.h"

@interface UIButton(RichText)

- (void)setRichText:(id<RTText>)richText forState:(UIControlState)state;

- (id<RTText>)richTextForState:(UIControlState)state;

- (id<RTText>)currentRichText;

- (void)setStyle:(RTStyle*)style forState:(UIControlState)state;

- (RTStyle*)styleForState:(UIControlState)state;

@end

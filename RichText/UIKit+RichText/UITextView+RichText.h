//
//  UITextView+RichText.h
//  Pods-RichText_Example
//
//  Created by zhubch on 2018/2/6.
//

#import <UIKit/UIKit.h>
#import "RTProtocols.h"
#import "RTStyle.h"

@interface UITextView(RichText)

@property(readwrite) id<RTText> richText;
@property(readwrite) RTStyle *style;
@property(readwrite) IBInspectable NSString *styleId;

@end

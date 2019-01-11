//
//  UITextField+RichText.h
//  Pods-RichText_Example
//
//  Created by zhubch on 2018/2/6.
//

#import <UIKit/UIKit.h>
#import "RTProtocols.h"
#import "RTStyle.h"

@interface UITextField(RichText)

@property(readwrite) id<RTText> richText;
@property(readwrite) id<RTText> richTextPlaceholder;
@property(readwrite) RTStyle *style;
@property(readwrite) IBInspectable NSString *styleId;

@end

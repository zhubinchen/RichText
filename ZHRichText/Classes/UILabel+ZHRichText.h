//
//  UILabel+ZHRichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import <UIKit/UIKit.h>
#import "ZHRichTextConvertible.h"

@interface UILabel(ZHRichText)

@property(readwrite) id<ZHRichTextConvertible> richText;

@end

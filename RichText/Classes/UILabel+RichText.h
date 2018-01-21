//
//  UILabel+RichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import <UIKit/UIKit.h>
#import "RTTextConvertible.h"

@interface UILabel(RichText)

@property(readwrite) id<RTTextConvertible> richText;

@end

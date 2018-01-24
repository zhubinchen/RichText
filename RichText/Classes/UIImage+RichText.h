//
//  UIImage+RichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import <UIKit/UIKit.h>
#import "RTTextConvertible.h"

@interface UIImage(RichText) <RTTextConvertible>

@property(readonly) UIImage*(^withSize)(CGFloat,CGFloat);

@end

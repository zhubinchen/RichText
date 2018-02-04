//
//  UIImage+RichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import <UIKit/UIKit.h>
#import "RTText.h"

@interface UIImage(RichText) <RTText>

@property(readonly) UIImage*(^withSize)(CGFloat,CGFloat);

@end

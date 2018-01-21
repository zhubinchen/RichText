//
//  UIImage+RichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import <UIKit/UIKit.h>
#import "RTImage.h"

@interface UIImage(RichText)

@property(readonly) RTImage*(^withSize)(CGFloat,CGFloat);

@end

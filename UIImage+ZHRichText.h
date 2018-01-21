//
//  UIImage+ZHRichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import <UIKit/UIKit.h>
#import "ZHRichTextImage.h"

@interface UIImage(ZHRichText)

@property(readonly) ZHRichTextImage*(^withSize)(CGFloat,CGFloat);

@end

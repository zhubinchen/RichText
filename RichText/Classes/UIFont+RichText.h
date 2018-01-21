//
//  UIFont+RichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/18.
//

#import <UIKit/UIKit.h>

@interface UIFont(RichText)

+ (UIFont*(^)(CGFloat))thin;
+ (UIFont*(^)(CGFloat))regular;
+ (UIFont*(^)(CGFloat))bold;
+ (UIFont*(^)(CGFloat))medium;
+ (UIFont*(^)(NSString*))name;

@end

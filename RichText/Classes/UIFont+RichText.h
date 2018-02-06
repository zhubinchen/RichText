//
//  UIFont+RichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/18.
//

#import <UIKit/UIKit.h>

@interface UIFont(RichText)

@property(class,readonly) UIFont *(^size)(CGFloat);

#if UIKIT_DEFINE_AS_PROPERTIES
@property(class,readonly) UIFont*(^thin)(CGFloat);
@property(class,readonly) UIFont*(^regular)(CGFloat);
@property(class,readonly) UIFont*(^bold)(CGFloat);
@property(class,readonly) UIFont*(^medium)(CGFloat);
@property(class,readonly) UIFont*(^name)(NSString*);
#else
+ (UIFont*(^)(CGFloat))thin;
+ (UIFont*(^)(CGFloat))regular;
+ (UIFont*(^)(CGFloat))bold;
+ (UIFont*(^)(CGFloat))medium;
+ (UIFont*(^)(NSString*))name;
#endif

@end

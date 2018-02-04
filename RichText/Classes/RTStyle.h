//
//  ZHStyle.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import <UIKit/UIKit.h>

@interface RTStyle : NSObject

@property(nonatomic,strong) UIColor             *color;
@property(nonatomic,strong) UIFont              *font;
@property(nonatomic,strong) UIColor             *background;
@property(nonatomic,strong) UIColor             *underline;

+ (instancetype)create:(void(^)(RTStyle *style))maker;

@property(readonly) NSDictionary      *attributes;

@end



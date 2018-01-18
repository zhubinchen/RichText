//
//  ZHStyle.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import <UIKit/UIKit.h>

@interface ZHStyle : NSObject

@property(nonatomic,strong) UIColor             *color;
@property(nonatomic,strong) UIFont              *font;
@property(nonatomic,strong) UIColor             *background;
@property(nonatomic,strong) UIColor             *underline;
@property(nonatomic,strong) NSParagraphStyle    *paragraphStyle;

+ (instancetype)create:(void(^)(ZHStyle *style))maker;

@property(readonly) NSDictionary      *attributes;

@end



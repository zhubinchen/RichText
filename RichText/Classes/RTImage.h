//
//  RTImage.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/18.
//

#import <Foundation/Foundation.h>
#import "RTTextConvertible.h"

@class RTText;

@interface RTImage : NSObject <RTTextConvertible>

@property(nonatomic,assign) CGSize             size;
@property(nonatomic,strong) UIImage            *image;

+ (instancetype)imageNamed:(NSString*)name size:(CGSize)size;

@end


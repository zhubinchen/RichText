//
//  ZHRichTextImage.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/18.
//

#import <Foundation/Foundation.h>
#import "ZHRichTextConvertible.h"

@class ZHRichText;

@interface ZHRichTextImage : NSObject <ZHRichTextConvertible>

@property(nonatomic,assign) CGSize             size;
@property(nonatomic,strong) UIImage            *image;

+ (instancetype)imageNamed:(NSString*)name size:(CGSize)size;

@end

//
//  UIImage+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import "UIImage+RichText.h"

@implementation UIImage(RichText)

- (RTImage *(^)(CGFloat, CGFloat))withSize {
    return ^(CGFloat w,CGFloat h) {
        RTImage *image = [[RTImage alloc] init];
        image.image = self;
        image.size = CGSizeMake(w, h);
        return image;
    };
}

@end

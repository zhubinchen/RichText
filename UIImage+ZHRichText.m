//
//  UIImage+ZHRichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import "UIImage+ZHRichText.h"

@implementation UIImage(ZHRichText)

- (ZHRichTextImage *(^)(CGFloat, CGFloat))withSize {
    return ^(CGFloat w,CGFloat h) {
        ZHRichTextImage *image = [[ZHRichTextImage alloc] init];
        image.image = self;
        image.size = CGSizeMake(w, h);
        return image;
    };
}

@end

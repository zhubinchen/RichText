//
//  UIImage+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import "UIImage+RichText.h"
#import "RTText.h"
#import "NSAttributedString+RichText.h"

@implementation UIImage(RichText)

rt_imp
rt_imp1(join)

-(NSUInteger)length {
    return 1;
}

- (NSAttributedString *)attributedString {
    CGFloat scale = [UIScreen mainScreen].scale;
    
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.bounds = CGRectMake(0, 0, self.size.width / scale, self.size.height / scale);
    attach.image = self;
    return [NSAttributedString attributedStringWithAttachment:attach];
}

- (UIImage *(^)(CGFloat, CGFloat))withSize {
    return ^(CGFloat w,CGFloat h) {
        CGSize newSize = CGSizeMake(w, h);
        UIGraphicsBeginImageContext(newSize);
        [self drawInRect:CGRectMake(0, 0, w, h)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    };
}

@end

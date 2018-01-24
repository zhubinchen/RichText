//
//  UIImage+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import "UIImage+RichText.h"
#import "RTText.h"

@implementation UIImage(RichText)

- (RTText *(^)(id<RTTextConvertible>))join {
    return ^(id<RTTextConvertible> text){
        return self.rt.join(text);
    };
}

-(NSUInteger)length {
    return 1;
}

- (RTText *)rt {
    CGFloat scale = [UIScreen mainScreen].scale;
    
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.bounds = CGRectMake(0, 0, self.size.width / scale, self.size.height / scale);
    attach.image = self;
    NSAttributedString *attrStringing = [NSAttributedString attributedStringWithAttachment:attach];
    return [[RTText alloc] initWithAttributedString:attrStringing];
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

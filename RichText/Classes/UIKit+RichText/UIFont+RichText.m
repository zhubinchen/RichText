//
//  UIFont+RichText.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/18.
//

#import "UIFont+RichText.h"

@implementation UIFont(RTText)

+ (UIFont*(^)(CGFloat))thin {
    return ^(CGFloat size) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightThin];
    };
}

+ (UIFont*(^)(CGFloat))regular {
    return ^(CGFloat size) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
    };
}

+ (UIFont*(^)(CGFloat))bold {
    return ^(CGFloat size) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightBold];
    };
}

+ (UIFont*(^)(CGFloat))medium {
    return ^(CGFloat size) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
    };
}

+ (UIFont *(^)(NSString *))name {
    return ^(NSString *name) {
        return [UIFont fontWithName:name size:16];
    };
}

- (UIFont *(^)(CGFloat))size {
    return ^(CGFloat size) {
        return [self fontWithSize:size];
    };
}

@end

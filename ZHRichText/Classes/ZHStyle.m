//
//  ZHStyle.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import "ZHStyle.h"

@implementation ZHStyle

+ (instancetype)create:(void (^)(ZHStyle *))maker {
    ZHStyle *style = [[self alloc] init];
    maker([[self alloc] init]);
    return style;
}

- (NSDictionary *)attributes {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    if (_font) {
        [attrs setObject:_font forKey:NSFontAttributeName];
    }
    if (_color) {
        [attrs setObject:_color forKey:NSForegroundColorAttributeName];
    }
    if (_background) {
        [attrs setObject:_background forKey:NSBackgroundColorAttributeName];
    }
    if (_underline) {
        [attrs setObject:@(NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
        [attrs setObject:_underline forKey:NSUnderlineColorAttributeName];
    }
    if (_paragraphStyle) {
        [attrs setObject:_paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    return attrs;
}

@end

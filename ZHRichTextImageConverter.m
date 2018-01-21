//
//  ZHRichTextImageConverter.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import "ZHRichTextImageConverter.h"
#import "ZHRichText.h"

@implementation ZHRichTextImageConverter

+ (instancetype)default {
    static ZHRichTextImageConverter *converter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        converter = [[ZHRichTextImageConverter alloc] init];
    });
    return converter;
}

- (NSString *)pattern {
    return @"\\[.+?\\]";
}

- (id<ZHRichTextConvertible>)convertFromText:(NSString *)text {
    return [ZHRichTextImage imageNamed:@"smile" size:CGSizeMake(30, 30)];
}

@end

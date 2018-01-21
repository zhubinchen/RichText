//
//  RTImageParser.m
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import "RTImageParser.h"
#import "RTText.h"

@implementation RTImageParser

+ (instancetype)parser {
    static RTImageParser *parser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        parser = [[RTImageParser alloc] init];
    });
    return parser;
}

- (NSString *)pattern {
    return @"\\[.+?\\]";
}

- (id<RTTextConvertible>)parse:(NSString *)text {
    return [RTImage imageNamed:@"smile" size:CGSizeMake(30, 30)];
}

@end

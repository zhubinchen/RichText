//
//  RTText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import <UIKit/UIKit.h>
#import "RTStyle.h"
#import "RTProtocols.h"

typedef id<RTText>(^RTParser)(NSString* string);

@interface RTText: NSObject<RTText, RTRangeable, RTStyleable>

- (instancetype)initWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

- (instancetype)initWithText:(id<RTText>)text;

// HTML 转成RTText，效率较低，复杂的HTML可能耗时很长
- (instancetype)initWithHTML:(NSString*)htmlStr;

- (RTText *)subtextToIndex:(NSUInteger)to;

- (RTText *)subtextFromIndex:(NSUInteger)from;

- (RTText *)subtextWithRange:(NSRange)range;

- (void)deleteCharactersInRange:(NSRange)range;

- (void)insertText:(id<RTText>)text atIndex:(NSUInteger)loc;

- (void)appendText:(id<RTText>)text;

- (void)replaceTextInRange:(NSRange)range withText:(id<RTText>)text;

// 每次匹配到pattern时，都会调用parser，调用参数是匹配的内容，并用parser的返回值替换匹配到的内容
- (void)replaceTextMatchedPattern:(NSString*)pattern withParser:(RTParser)parser;

@end


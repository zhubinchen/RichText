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

// 当前操作的ranges
@property (readonly) NSArray<NSValue*>* selectedRanges;

- (instancetype)initWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

- (instancetype)initWithText:(id<RTText>)text;

// HTML 转成RTText，可能耗时很长
- (instancetype)initWithHTML:(NSString*)htmlStr;

- (RTText *)subtextToIndex:(NSUInteger)to;

- (RTText *)subtextFromIndex:(NSUInteger)from;

- (RTText *)subtextWithRange:(NSRange)range;

// 拼接，会重置selectedRanges
- (void)appendText:(id<RTText>)text;

// 插入，会重置selectedRanges
- (void)insertText:(id<RTText>)text atIndex:(NSUInteger)loc;

// 删除，会重置selectedRanges
- (void)deleteCharactersInRange:(NSRange)range;

// 替换，会重置selectedRanges
- (void)replaceTextInRange:(NSRange)range withText:(id<RTText>)text;

// 匹配到pattern时，都会调用parser(匹配的内容)，并用parser的返回值替换匹配到的内容，会重置selectedRanges
- (void)replaceTextMatchedPattern:(NSString*)pattern withParser:(RTParser)parser;

@end


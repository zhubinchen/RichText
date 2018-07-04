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

@interface RTText: NSObject<RTText, RTRangeable,RTStyleable>

- (instancetype)initWithText:(id<RTText>)text;

- (instancetype)initWithHTML:(NSString*)htmlStr;

- (RTText *)subtextToIndex:(NSUInteger)to;

- (RTText *)subtextFromIndex:(NSUInteger)from;

- (RTText *)subtextWithRange:(NSRange)range;

- (void)deleteCharactersInRange:(NSRange)range;

- (void)insertText:(id<RTText>)text atIndex:(NSUInteger)loc;

- (void)appendText:(id<RTText>)text;

- (void)replaceTextInRange:(NSRange)range withText:(id<RTText>)text;

- (void)replaceTextMatchedPattern:(NSString*)pattern withParser:(RTParser)parser;

@end

extern RTText *rt(id<RTText> text, ...);



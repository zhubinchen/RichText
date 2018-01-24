//
//  NSString+RichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import <Foundation/Foundation.h>
#import "RTTextConvertible.h"
#import "RTParser.h"

@class RTText;

@interface NSString(RichText) <RTTextConvertible>

@property(readonly) RTText*(^range)(NSInteger,NSInteger);
@property(readonly) RTText*(^matches)(NSString*);
@property(readonly) RTText*(^parseWith)(id<RTParser>);
@property(readonly) RTText* whole;

@end

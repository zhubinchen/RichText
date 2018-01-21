//
//  NSAttributedString+RichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import <Foundation/Foundation.h>
#import "RTTextConvertible.h"

@class RTText;

@interface NSAttributedString(RichText) <RTTextConvertible>

@property(readonly) RTText*(^range)(NSInteger,NSInteger);
@property(readonly) RTText*(^matches)(NSString*);
@property(readonly) RTText* whole;

@end

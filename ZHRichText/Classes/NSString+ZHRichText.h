//
//  NSString+ZHRichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import <Foundation/Foundation.h>
#import "ZHRichTextConvertible.h"

@class ZHRichText;

@interface NSString(ZHRichText) <ZHRichTextConvertible>

@property(readonly) ZHRichText*(^range)(NSInteger,NSInteger);
@property(readonly) ZHRichText*(^matches)(NSString*);
@property(readonly) ZHRichText* whole;

@end

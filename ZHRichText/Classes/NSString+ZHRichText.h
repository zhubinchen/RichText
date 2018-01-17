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

@property(nonatomic,readonly) ZHRichText*(^range)(NSInteger,NSInteger);
@property(nonatomic,readonly) ZHRichText*(^matches)(NSString*);
@property(nonatomic,readonly) ZHRichText* whole;

@end

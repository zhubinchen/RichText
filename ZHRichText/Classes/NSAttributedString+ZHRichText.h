//
//  NSAttributedString+ZHRichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/17.
//

#import <Foundation/Foundation.h>
#import "ZHRichTextConvertible.h"

@class ZHRichText;

@interface NSAttributedString(ZHRichText) <ZHRichTextConvertible>

@property(nonatomic,readonly) ZHRichText*(^range)(NSInteger,NSInteger);
@property(nonatomic,readonly) ZHRichText*(^matches)(NSString*);
@property(nonatomic,readonly) ZHRichText* whole;

@end

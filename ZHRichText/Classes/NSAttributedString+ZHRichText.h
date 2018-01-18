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

@property(readonly) ZHRichText*(^range)(NSInteger,NSInteger);
@property(readonly) ZHRichText*(^matches)(NSString*);
@property(readonly) ZHRichText* whole;

@end

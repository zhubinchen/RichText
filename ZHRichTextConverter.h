//
//  ZHRichTextConverter.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import <Foundation/Foundation.h>
#import "ZHRichTextConvertible.h"

@protocol ZHRichTextConverter

@property(readonly) NSString *pattern;

- (id<ZHRichTextConvertible>)convertFromText:(NSString*)text;

@end

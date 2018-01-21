//
//  RTParser.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/19.
//

#import <Foundation/Foundation.h>
#import "RTTextConvertible.h"

@protocol RTParser

@property(readonly) NSString *pattern;

- (id<RTTextConvertible>)parse:(NSString*)text;

@end

//
//  RTText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import <UIKit/UIKit.h>
#import "RTStyle.h"
#import "RTTextConvertible.h"
#import "RTParser.h"

@interface RTText: NSObject<RTTextConvertible, RTRangeable, RTStyleable>

- (instancetype)initWithString:(NSString *)str;

- (instancetype)initWithAttributedString:(NSAttributedString *)attrString;

- (void)replaceTextInRange:(NSRange)range withText:(id<RTTextConvertible>)text;

@end





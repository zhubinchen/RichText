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

@interface RTText: NSObject<RTTextConvertible>

// 选择要操作的范围
@property(readonly) RTText*(^range)(NSInteger,NSInteger); // 指定范围
@property(readonly) RTText*(^matches)(NSString*); // 匹配正则的范围
@property(readonly) RTText* whole; // 全部范围

// 用style对象设置属性
@property(readonly) RTText*(^style)(RTStyle*);

// 设置单个属性
@property(readonly) RTText*(^color)(UIColor*);
@property(readonly) RTText*(^background)(UIColor*);
@property(readonly) RTText*(^font)(UIFont*);
@property(readonly) RTText*(^paragraphStyle)(NSParagraphStyle*);
@property(readonly) RTText*(^underline)(UIColor*);
@property(readonly) RTText*(^parseWith)(id<RTParser>);

@property(readonly) NSUInteger length;

- (instancetype)initWithString:(NSString *)str;

- (instancetype)initWithAttributedString:(NSAttributedString *)attrStr;

- (void)replaceTextInRange:(NSRange)range withText:(id<RTTextConvertible>)text;

@end





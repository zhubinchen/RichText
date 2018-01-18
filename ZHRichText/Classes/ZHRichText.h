//
//  ZHRichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import <UIKit/UIKit.h>
#import "ZHStyle.h"
#import "ZHRichTextConvertible.h"
#import "UILabel+ZHRichText.h"
#import "NSString+ZHRichText.h"
#import "NSAttributedString+ZHRichText.h"
#import "UIFont+ZHRichText.h"

@interface ZHRichText: NSObject<ZHRichTextConvertible>

// 选择要操作的范围
@property(readonly) ZHRichText*(^range)(NSInteger,NSInteger); // 指定范围
@property(readonly) ZHRichText*(^matches)(NSString*); // 匹配正则的范围
@property(readonly) ZHRichText* whole; // 全部范围

// 用style对象设置属性
@property(readonly) ZHRichText*(^style)(ZHStyle*);

// 设置单个属性
@property(readonly) ZHRichText*(^color)(UIColor*);
@property(readonly) ZHRichText*(^background)(UIColor*);
@property(readonly) ZHRichText*(^font)(UIFont*);
@property(readonly) ZHRichText*(^paragraphStyle)(NSParagraphStyle*);
@property(readonly) ZHRichText*(^underline)(UIColor*);

- (instancetype)initWithString:(NSString *)str;

- (instancetype)initWithAttributedString:(NSAttributedString *)attrStr;

@end





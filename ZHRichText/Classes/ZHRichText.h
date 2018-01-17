//
//  ZHRichText.h
//  Pods-ZHRichText_Example
//
//  Created by zhubch on 2018/1/16.
//

#import <UIKit/UIKit.h>
#import "ZHStyle.h"
#import "ZHRichTextConvertible.h"

@interface ZHRichText: NSObject<ZHRichTextConvertible>

// 选择要操作的范围
@property(nonatomic,readonly) ZHRichText*(^range)(NSInteger,NSInteger); // 指定范围
@property(nonatomic,readonly) ZHRichText*(^matches)(NSString*); // 匹配正则的范围
@property(nonatomic,readonly) ZHRichText* whole; // 全部范围

// 用style对象设置属性
@property(nonatomic,readonly) ZHRichText*(^style)(ZHStyle*);

// 设置单个属性
@property(nonatomic,readonly) ZHRichText*(^color)(UIColor*);
@property(nonatomic,readonly) ZHRichText*(^background)(UIColor*);
@property(nonatomic,readonly) ZHRichText*(^font)(UIFont*);
@property(nonatomic,readonly) ZHRichText*(^paragraphStyle)(NSParagraphStyle*);
@property(nonatomic,readonly) ZHRichText*(^underline)(UIColor*);

- (instancetype)initWithString:(NSString *)str;

- (instancetype)initWithAttributedString:(NSAttributedString *)attrStr;

@end





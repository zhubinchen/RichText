//
//  ZHRichTextConvertible.h
//  Pods
//
//  Created by zhubch on 2018/1/16.
//

#ifndef ZHRichTextConvertible_h
#define ZHRichTextConvertible_h

@class ZHRichText;

// 实现CHStringConvertible协议的对象就可以拼接
@protocol ZHRichTextConvertible

@property(nonatomic,readonly) ZHRichText *rt;
@property(nonatomic,readonly) ZHRichText *(^join)(id<ZHRichTextConvertible>);

@end


#endif /* ZHRichTextConvertible_h */

//
//  RTProtocols.h
//  Pods
//
//  Created by zhubch on 2018/1/16.
//

#ifndef RTProtocols_h
#define RTProtocols_h

@class RTText;
@class RTStyle;

@protocol RTText
@property (readonly) NSAttributedString *attributedString; // 可以通过这个把RTText转成NSAttributedString
@property (readonly) NSUInteger length; // 长度，UIImage为1
@property (readonly) RTText*(^join)(id<RTText> aText); // 拼接，拼接后重置操作范围
@end

@protocol RTStyleable
@property (readonly) RTText*(^setStyle)(RTStyle* style);
@property (readonly) RTText*(^setColor)(UIColor* color); // 设置前景色
@property (readonly) RTText*(^setBackgroundColor)(UIColor* color); // 设置背景色
@property (readonly) RTText*(^setStrokeColor)(UIColor* color); // 设置边框颜色
@property (readonly) RTText*(^setStrokeWidth)(CGFloat width); // 设置边框宽度，width < 0时有空心效果
@property (readonly) RTText*(^setFont)(UIFont* font); // 设置字体
@property (readonly) RTText*(^setUnderline)(UIColor* color);
@property (readonly) RTText*(^setShadow)(NSShadow* shadow); // 设置阴影
@property (readonly) RTText*(^setObliqueness)(CGFloat obliqueness); // 设置倾斜度
@property (readonly) RTText*(^setExpansion)(CGFloat expansion); // 设置拉伸
@property (readonly) RTText*(^setKern)(CGFloat kern); // 设置行间距
@end

@protocol RTRangeable
@property (readonly) RTText*(^range)(NSInteger loc,NSInteger len); // 改变范围到NSMakeRange(loc,len)
@property (readonly) RTText*(^rangeTo)(NSInteger to); // 改变范围到NSMakeRange(0,to)
@property (readonly) RTText*(^rangeFrom)(NSInteger from); // 改变范围到NSMakeRange(from,len - from)
@property (readonly) RTText*(^first)(NSInteger count); // first(3) 前三个
@property (readonly) RTText*(^last)(NSInteger count); // last(2) 后两个

@property (readonly) RTText*(^matches)(NSString *pattern); // 匹配正则的范围
@property (readonly) RTText*(^whole)(); // 全部范围
@end

#endif /* RTProtocols_h */

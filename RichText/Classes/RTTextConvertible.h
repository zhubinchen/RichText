//
//  RTTextConvertible.h
//  Pods
//
//  Created by zhubch on 2018/1/16.
//

#ifndef RTTextConvertible_h
#define RTTextConvertible_h

@class RTText;
@class RTStyle;
@protocol RTParser;

@protocol RTTextConvertible

@property(readonly) RTText *rt;
@property(readonly) RTText *(^join)(id<RTTextConvertible>);
@property(readonly) NSUInteger length;

@end

@protocol RTRangeable

@property(readonly) RTText*(^range)(NSInteger,NSInteger); // 指定范围
@property(readonly) RTText*(^matches)(NSString*); // 匹配正则的范围
@property(readonly) RTText* whole; // 全部范围

@end

@protocol RTStyleable

// 用style对象设置属性
@property(readonly) RTText*(^style)(RTStyle*);

// 设置单个属性
@property(readonly) RTText*(^color)(UIColor*);
@property(readonly) RTText*(^background)(UIColor*);
@property(readonly) RTText*(^font)(UIFont*);
@property(readonly) RTText*(^paragraphStyle)(NSParagraphStyle*);
@property(readonly) RTText*(^underline)(UIColor*);
@property(readonly) RTText*(^parseWith)(id<RTParser>);

@end


#define rt1(func,pramaType) - (RTText *(^)(pramaType))func { \
return ^(pramaType prama) { \
return self.rt.func(prama);\
};\
}

#define rt2(func,pramaType1,pramaType2) - (RTText *(^)(pramaType1,pramaType2))func { \
return ^(pramaType1 prama1,pramaType2 prama2) { \
return self.rt.func(prama1,prama2);\
};\
}

#endif /* RTTextConvertible_h */

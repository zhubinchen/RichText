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
@protocol RTParser;

@protocol RTText

@property(readonly) NSAttributedString *attributedString;
@property(readonly) NSUInteger length;

@property(readonly) RTText*(^join)(id<RTText>);

@end

@protocol RTRangeable

@property(readonly) RTText*(^range)(NSInteger,NSInteger); // 指定范围
@property(readonly) RTText*(^matches)(NSString*); // 匹配正则的范围
@property(readonly) RTText*(^whole)(); // 全部范围

@end

@protocol RTStyleable

// 用style对象设置属性
@property(readonly) RTText*(^style)(RTStyle*);

// 设置单个属性
@property(readonly) RTText*(^color)(UIColor*);
@property(readonly) RTText*(^background)(UIColor*);
@property(readonly) RTText*(^font)(UIFont*);
@property(readonly) RTText*(^underline)(UIColor*);

@end

#define rt_imp - (RTText *)rt { \
    return [[RTText alloc] initWithText:self]; \
}

#define rt_imp0(func) - (RTText *(^)())func { \
return ^() { \
return self.rt.func();\
};\
}

#define rt_imp1(func) - (RTText *(^)(id))func { \
return ^(id prama) { \
return self.rt.func(prama);\
};\
}

#define rt_imp2(func) - (RTText *(^)(NSInteger,NSInteger))func { \
return ^(NSInteger prama1,NSInteger prama2) { \
return self.rt.func(prama1,prama2);\
};\
}

#endif /* RTProtocols_h */

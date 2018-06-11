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

@property(readonly) NSAttributedString *attributedString;
@property(readonly) NSUInteger length;

@property(readonly) RTText*(^join)(id<RTText>);

@property(readonly) RTText*(^setStyle)(RTStyle*);
@property(readonly) RTText*(^setColor)(UIColor*);
@property(readonly) RTText*(^setBackground)(UIColor*);
@property(readonly) RTText*(^setFont)(UIFont*);
@property(readonly) RTText*(^setUnderline)(UIColor*);

@end

@protocol RTRangeable

@property(readonly) RTText*(^range)(NSInteger,NSInteger); // 指定范围
@property(readonly) RTText*(^matches)(NSString*); // 匹配正则的范围
@property(readonly) RTText*(^whole)(); // 全部范围

@end


#define _rt_imp - (RTText *)_rt { \
    return [[RTText alloc] initWithText:self]; \
}

#define _rt_imp0(func) - (RTText *(^)())func { \
return ^() { \
return self._rt.func();\
};\
}

#define _rt_imp1(func) - (RTText *(^)(id))func { \
return ^(id prama) { \
return self._rt.func(prama);\
};\
}

#define _rt_imp2(func) - (RTText *(^)(NSInteger,NSInteger))func { \
return ^(NSInteger prama1,NSInteger prama2) { \
return self._rt.func(prama1,prama2);\
};\
}

#endif /* RTProtocols_h */

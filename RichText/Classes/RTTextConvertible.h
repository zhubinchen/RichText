//
//  RTTextConvertible.h
//  Pods
//
//  Created by zhubch on 2018/1/16.
//

#ifndef RTTextConvertible_h
#define RTTextConvertible_h

@class RTText;

@protocol RTTextConvertible

@property(readonly) RTText *rt;
@property(readonly) NSUInteger length;
@property(readonly) RTText *(^join)(id<RTTextConvertible>);

@end


#endif /* RTTextConvertible_h */

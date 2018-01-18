//
//  ZHRichTextConvertible.h
//  Pods
//
//  Created by zhubch on 2018/1/16.
//

#ifndef ZHRichTextConvertible_h
#define ZHRichTextConvertible_h

@class ZHRichText;

@protocol ZHRichTextConvertible

@property(readonly) ZHRichText *rt;
@property(readonly) ZHRichText *(^join)(id<ZHRichTextConvertible>);

@end


#endif /* ZHRichTextConvertible_h */

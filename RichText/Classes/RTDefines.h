//
//  RTDefines.h
//  Pods-RichText_Example
//
//  Created by 朱炳程 on 2018/12/26.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#ifndef RTDefines_h
#define RTDefines_h

#define _rt_imp - (RTText *)_rt { \
return [[RTText alloc] initWithText:self]; \
}

#define _rt_imp0(func) - (RTText *(^)(void))func { \
return ^() { \
return self._rt.func();\
};\
}

#define _rt_imp1(func) - (RTText *(^)(id))func { \
return ^(id prama) { \
return self._rt.func(prama);\
};\
}

#define _rt_imp1_f(func) - (RTText *(^)(CGFloat))func { \
return ^(CGFloat prama) { \
return self._rt.func(prama);\
};\
}

#define _rt_imp1_i(func) - (RTText *(^)(NSInteger))func { \
return ^(NSInteger prama) { \
return self._rt.func(prama);\
};\
}

#define _rt_imp2(func) - (RTText *(^)(NSInteger,NSInteger))func { \
return ^(NSInteger prama1,NSInteger prama2) { \
return self._rt.func(prama1,prama2);\
};\
}

#define _rt_swizzle(x,y) \
swizzle(self, @selector(x), @selector(y));\

static inline void swizzle(Class clazz, SEL original, SEL swizzled) {
    
    Method originalMethod = class_getInstanceMethod(clazz, original);
    Method swizzledMethod = class_getInstanceMethod(clazz, swizzled);
    
    BOOL didAddMethod =
    class_addMethod(clazz,
                    original,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(clazz,
                            swizzled,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

#endif

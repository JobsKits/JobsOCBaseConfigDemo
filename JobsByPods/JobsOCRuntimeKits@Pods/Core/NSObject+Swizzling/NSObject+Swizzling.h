//
//  NSObject+Swizzling.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_SWIZZLING_9AFB64F218
#define JOBS_HEADER_GUARD_NSOBJECT_SWIZZLING_9AFB64F218

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
/// 参考资料：https://juejin.cn/post/6869670856705081358
@interface NSObject (Swizzling)
/**
 
     Method Swizzling
     Class class = NSClassFromString(@"__NSDictionaryM");//✅
     Class class = objc_getClass("__NSDictionaryM");//✅
     Class class = object_getClass(@"__NSDictionaryM");//❌ Returns the class of an object.
    Example:
     [objc_getClass("__NSDictionaryM") swizzlingMethod:@selector(setObject:forKey:) swizzledSelector:@selector(swizzled_setObject:forKey:)];
 */
-(void)swizzlingInstanceMethod:(SEL _Nonnull)originalSelector
              swizzledSelector:(SEL _Nonnull)swizzledSelector;

@end
/// 不同类的方法交换
void TYFFSwizzleMethod(Class _Nonnull originalCls,
                       SEL _Nonnull originalSelector,
                       Class _Nonnull swizzledCls,
                       SEL _Nonnull swizzledSelector);
/// 同一个类的方法交换
void MethodSwizzle(Class _Nonnull c,
                   SEL _Nonnull _orig,
                   SEL _Nonnull _new);

void objc_setAssociatedObject_weak(id _Nonnull object,
                              const void * _Nonnull key,
                              id _Nullable value,
                              objc_AssociationPolicy associationPolicy);
#endif /* JOBS_HEADER_GUARD_NSOBJECT_SWIZZLING_9AFB64F218 */

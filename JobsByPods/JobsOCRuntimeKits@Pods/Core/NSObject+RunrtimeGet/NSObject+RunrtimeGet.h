//
//  NSObject+RunrtimeGet.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_RUNRTIMEGET_CC974C36F8
#define JOBS_HEADER_GUARD_NSOBJECT_RUNRTIMEGET_CC974C36F8

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN
/// runtime方式获取对象的一些属性
@interface NSObject (RunrtimeGet)

-(id _Nullable)object:(NSObject *)object getIvar:(Ivar)ivar;
-(Ivar _Nullable)classGetInstanceVariableWithClass:(Class _Nullable)cls
                              instanceVariableName:(NSString *_Nonnull)instanceVariableName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_RUNRTIMEGET_CC974C36F8 */

//
//  NSObject+Class.h
//  JobsClass
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_CLASS_4F2CFC83DE

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#define JOBS_HEADER_GUARD_NSOBJECT_CLASS_4F2CFC83DE

#import <Foundation/Foundation.h>
#import "JobsClassInline.h"

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Class)
#pragma mark —— 返回并打印成员变量列表
-(JobsRetArrByVoidBlock _Nonnull)printIvarList;
-(JobsRetArrByVoidBlock _Nonnull)ivarList;
#pragma mark —— 返回并打印属性列表
-(JobsRetArrByVoidBlock _Nonnull)printPropertyList;
-(JobsRetArrByVoidBlock _Nonnull)propertyList;
#pragma mark —— 返回并打印方法列表
-(JobsRetArrByVoidBlock _Nonnull)printMethodList;
-(JobsRetArrByVoidBlock _Nonnull)methodList;
#pragma mark —— 返回并打印协议列表
-(JobsRetArrByVoidBlock _Nonnull)printProtocolList;
-(JobsRetArrByVoidBlock _Nonnull)protocolList;
/// 1、字典是hash映射，是无序的，如果需要有序则需要避开字典，所以对模型进行操作是大前提
/// 2、字典和模型的差距在于序列化
/// 3、字典化的模型里面，依据有序的（从上至下）属性名字排列，去取值，映射到数组里面
/// 4、要成为字典的Key，只需要遵循NSCopying协议
-(JobsRetArrByVoidBlock _Nonnull)readModelPropertyValueByOrder;
-(JobsRetBOOLByIDBlock _Nonnull)isKindOfClass;
-(JobsRetBOOLByIDBlock _Nonnull)isMemberOfClass;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_CLASS_4F2CFC83DE */

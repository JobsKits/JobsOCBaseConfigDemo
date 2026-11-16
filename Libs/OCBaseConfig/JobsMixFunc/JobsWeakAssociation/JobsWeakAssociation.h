//
//  JobsWeakAssociation.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_WEAK_ASSOCIATION_H
#define JOBS_WEAK_ASSOCIATION_H

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 必须成对读取：关联对象本身是 retained holder，value 按真正 weak 语义归零。
FOUNDATION_EXPORT void JobsSetAssociatedWeakObject(id _Nullable object, const void *_Nullable key, id _Nullable value);
FOUNDATION_EXPORT id _Nullable JobsGetAssociatedWeakObject(id _Nullable object, const void *_Nullable key);

NS_ASSUME_NONNULL_END

#endif /* JOBS_WEAK_ASSOCIATION_H */

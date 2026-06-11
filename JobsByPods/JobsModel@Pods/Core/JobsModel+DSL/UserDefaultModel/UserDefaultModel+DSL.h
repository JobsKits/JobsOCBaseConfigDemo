//
//  UserDefaultModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_USERDEFAULTMODEL_DSL_6D0372B4D2AB7418
#define JOBS_HEADER_GUARD_USERDEFAULTMODEL_DSL_6D0372B4D2AB7418

#if __has_include(<JobsModel/UserDefaultModel.h>)
#import <JobsModel/UserDefaultModel.h>
#else
#import "UserDefaultModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultModel (DSL)

#pragma mark —— 来自 UserDefaultModel
-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(__kindof NSObject <NSCoding> * data))byObj;
-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(int data))byIntValue;
-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(float data))byFloatValue;
-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(BOOL data))byBooLValue;
-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(NSInteger data))byNSIntValue;
-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(CGFloat data))byCGfloatValue;
-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(NSString * data))byKey;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_USERDEFAULTMODEL_DSL_6D0372B4D2AB7418 */

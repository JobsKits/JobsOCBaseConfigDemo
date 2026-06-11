//
//  FMNameModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_FMNAMEMODEL_DSL_0B40D367600DE366
#define JOBS_HEADER_GUARD_FMNAMEMODEL_DSL_0B40D367600DE366

#if __has_include(<JobsModel/FMNameModel.h>)
#import <JobsModel/FMNameModel.h>
#else
#import "FMNameModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FMNameModel (DSL)

#pragma mark —— 来自 FMNameModel
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byFirstNameTF;
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byMiddleNameTF;
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byLastNameTF;
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byIdTypeTF;
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byIdNumberTF;
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byFirstName;
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byMiddleName;
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byLastName;
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byIdType;
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byIdNumber;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FMNAMEMODEL_DSL_0B40D367600DE366 */

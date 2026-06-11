//
//  RACModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_RACMODEL_DSL_4016E35506849EB4
#define JOBS_HEADER_GUARD_RACMODEL_DSL_4016E35506849EB4

#if __has_include(<JobsModel/RACModel.h>)
#import <JobsModel/RACModel.h>
#else
#import "RACModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface RACModel (DSL)

#pragma mark —— 来自 RACProtocol
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock;
-(__kindof RACModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_RACMODEL_DSL_4016E35506849EB4 */

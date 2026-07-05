//
//  RACModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_RACMODEL_DSL_1A6AB7308CE2157C
#define JOBS_HEADER_GUARD_RACMODEL_DSL_1A6AB7308CE2157C

#import "JobsModel.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface RACModel (DSL)

-(JobsRetRACModelByRACDisposablePointerBlock _Nonnull)byRacDisposable;
-(JobsRetRACModelByRACSubjectPointerBlock _Nonnull)byRacSubject;
-(JobsRetRACModelByRACSignalPointerBlock _Nonnull)byReqSignal;
-(JobsRetRACModelByRACCommandPointerBlock _Nonnull)byActionCommand;
-(JobsRetRACModelByRACSequencePointerBlock _Nonnull)byDataSequence;
-(JobsRetRACModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection;
-(JobsRetRACModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler;
-(JobsRetRACModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler;
-(JobsRetRACModelByRACTuplePointerBlock _Nonnull)byDataTuple;
-(JobsRetRACModelByMutableDicBlock _Nonnull)bySignalDisposableMap;
-(JobsRetRACModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock;
-(JobsRetRACModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_RACMODEL_DSL_1A6AB7308CE2157C */

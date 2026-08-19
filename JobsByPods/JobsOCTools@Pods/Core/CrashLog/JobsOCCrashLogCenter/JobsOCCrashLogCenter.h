//
//  JobsOCCrashLogCenter.h
//  JobsOCTools
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <fcntl.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <mach/mach.h>
#import <signal.h>
#import <unistd.h>
#import <UIKit/UIKit.h>
#import <JobsOCTools/JobsOCCrashLogFileInfo.h>
#import <JobsOCTools/JobsOCCrashLogMemorySnapshot.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCrashLogCenter : NSObject

+(instancetype)sharedManager;
+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager;

-(jobsByVoidBlock _Nonnull)startMonitoring;
-(jobsByVoidBlock _Nonnull)markAppLaunched;
-(jobsByVoidBlock _Nonnull)markSafeExitPoint;
-(JobsRetBOOLByVoidBlock _Nonnull)didCrashLastRun;
-(JobsRetJobsOCCrashLogMemorySnapshotByVoidBlock _Nonnull)latestMemorySnapshot;

-(JobsRetStrByVoidBlock _Nonnull)logPathHint;
-(JobsRetJobsOCCrashLogFileInfoByVoidBlock _Nonnull)fileInfo;
-(JobsRetBOOLByVoidBlock _Nonnull)ensureFileExists;
-(jobsByStrBlock _Nonnull)append;
-(jobsByStrBlock _Nonnull)writeCrashSync;
-(JobsRetStrByVoidBlock _Nonnull)readAll;
-(JobsRetStrByUIntegerBlock _Nonnull)readTailByKilobytes;
-(JobsRetBOOLByNSStringBlock _Nonnull)clearWithMessage;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCCrashLogCenter
-(JobsRetJobsOCCrashLogCenterByBOOLBlock _Nonnull)byHasStartedSession;
-(JobsRetJobsOCCrashLogCenterByJobsOCCrashLogMemorySnapshotBlock _Nonnull)byMemorySnapshot;
-(JobsRetJobsOCCrashLogCenterByNSDateBlock _Nonnull)bySessionStartedAt;
-(JobsRetJobsOCCrashLogCenterByNSStringBlock _Nonnull)bySessionID;
-(JobsRetJobsOCCrashLogCenterBydispatch_source_tBlock _Nonnull)byMemoryTimer;
-(JobsRetJobsOCCrashLogCenterByuint64_tBlock _Nonnull)byPeakFootprint;
-(JobsRetJobsOCCrashLogCenterByuint64_tBlock _Nonnull)bySessionStartFootprint;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCCrashLogCenter
@end

NS_ASSUME_NONNULL_END

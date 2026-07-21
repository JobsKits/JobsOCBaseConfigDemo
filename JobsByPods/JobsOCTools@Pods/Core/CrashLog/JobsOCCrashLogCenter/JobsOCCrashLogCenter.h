//
//  JobsOCCrashLogCenter.h
//  JobsOCTools
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <fcntl.h>
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

-(void)startMonitoring;
-(void)markAppLaunched;
-(void)markSafeExitPoint;
-(BOOL)didCrashLastRun;
-(nullable JobsOCCrashLogMemorySnapshot *)latestMemorySnapshot;

-(NSString *)logPathHint;
-(JobsOCCrashLogFileInfo *)fileInfo;
-(BOOL)ensureFileExists;
-(void)append:(NSString *)text;
-(void)writeCrashSync:(NSString *)text;
-(NSString *)readAll;
-(NSString *)readTailByKilobytes:(NSUInteger)kilobytes;
-(BOOL)clearWithMessage:(NSString *_Nullable *_Nullable)message;

@end

NS_ASSUME_NONNULL_END

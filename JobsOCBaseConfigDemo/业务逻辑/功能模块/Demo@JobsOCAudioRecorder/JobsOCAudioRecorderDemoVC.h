//
//  JobsOCAudioRecorderDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsOCAudioRecorder/JobsOCAudioRecorder.h>)
#import <JobsOCAudioRecorder/JobsOCAudioRecorder.h>
#else
#import "JobsOCAudioRecorder.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@interface JobsOCAudioRecorderDemoVC : BaseViewController <UITableViewDataSource,UITableViewDelegate,JobsOCAudioRecorderEngineDelegate>
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCAudioRecorderDemoVC
-(JobsRetJobsOCAudioRecorderDemoVCByBOOLBlock _Nonnull)byPermissionGranted;
-(JobsRetJobsOCAudioRecorderDemoVCByNSArrayJobsOCAudioRecordingBlock _Nonnull)byRecordings;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCAudioRecorderDemoVC
@end

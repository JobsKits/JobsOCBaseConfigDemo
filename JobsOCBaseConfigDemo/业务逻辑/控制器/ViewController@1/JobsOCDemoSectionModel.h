//
//  JobsOCDemoSectionModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCDemoSectionModel : NSObject

Prop_copy()NSString *title;
Prop_copy()NSString *sectionDescription;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

+(JobsRetJobsOCDemoSectionModelByStrBlock _Nonnull)sectionWithTitle;
-(JobsRetJobsOCDemoSectionModelByStrBlock _Nonnull)byTitle;
-(JobsRetJobsOCDemoSectionModelByStrBlock _Nonnull)bySectionDescription;

@end

NS_ASSUME_NONNULL_END

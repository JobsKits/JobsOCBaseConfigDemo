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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCDemoSectionModel : NSObject

Prop_copy()NSString *title;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

+(instancetype)sectionWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

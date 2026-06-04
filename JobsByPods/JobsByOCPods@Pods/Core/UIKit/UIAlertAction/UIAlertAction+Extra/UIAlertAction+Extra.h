//
//  UIAlertAction+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertAction (Extra)

@end

NS_ASSUME_NONNULL_END

#ifndef JOBS_MAKE_ALERT_ACTION_BY_HELPER
#define JOBS_MAKE_ALERT_ACTION_BY_HELPER

NS_INLINE __kindof UIAlertAction *_Nonnull JobsMakeAlertActionBy(JobsAlertModel *_Nonnull model){
    return [UIAlertAction actionWithTitle:model.alertActionTitle
                                    style:model.alertActionStyle
                                  handler:model.alertActionBlock];
}

#endif

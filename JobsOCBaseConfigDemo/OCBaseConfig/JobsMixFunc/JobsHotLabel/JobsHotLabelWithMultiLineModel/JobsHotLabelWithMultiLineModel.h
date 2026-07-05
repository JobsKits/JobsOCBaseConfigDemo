//
//  JobsHotLabelWithMultiLineModel.h
//  JobsHotLabel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSHOTLABELWITHMULTILINEMODEL_E4AC7F6CBA
#define JOBS_HEADER_GUARD_JOBSHOTLABELWITHMULTILINEMODEL_E4AC7F6CBA

#import <Foundation/Foundation.h>

#import "JobsModelDSL.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsHotLabelWithMultiLineModel : UIViewModel

Prop_strong()JobsHeaderFooterViewModel *headerViewModel;
Prop_strong()JobsHeaderFooterViewModel *footerViewModel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSHOTLABELWITHMULTILINEMODEL_E4AC7F6CBA */

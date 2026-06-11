//
//  UIViewController+EmptyData.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_EMPTYDATA_311C53F695
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_EMPTYDATA_311C53F695

#import <UIKit/UIKit.h>
#import <JobsByOCPods/UIView+EmptyData.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 当ViewController的view上啥也没有的时候，出现提示，方便调试
@interface UIViewController (EmptyData)

-(void)ifEmptyData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_EMPTYDATA_311C53F695 */

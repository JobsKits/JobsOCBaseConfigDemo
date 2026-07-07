//
//  RandomTestVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import "JobsByOCPods.h"
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import "JobsBaseUI.h"
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import "JobsLanMgr.h"
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsRandomUtils/JobsRandomUtilsHeader.h>)
#import "JobsRandomUtilsHeader.h"
#else
#import "JobsRandomUtilsHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface RandomTestVC : BaseViewController

@end

NS_ASSUME_NONNULL_END

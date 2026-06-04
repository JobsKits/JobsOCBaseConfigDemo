//
//  JobsRecordPresentedViewController.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBS_RECORD_PRESENTED_VIEW_CONTROLLER_EB23A7E2
#define JOBS_HEADER_GUARD_JOBS_RECORD_PRESENTED_VIEW_CONTROLLER_EB23A7E2

#import <UIKit/UIKit.h>
#import "BaseProtocol.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

#ifndef JOBS_RECORD_PRESENTED_VIEW_CONTROLLER_DECLARED
#define JOBS_RECORD_PRESENTED_VIEW_CONTROLLER_DECLARED
@interface JobsRecordPresentedViewController : NSObject<BaseProtocol>

Prop_strong()NSMutableArray <__kindof UIViewController *>*presentedVCMutArr;

@end
#endif

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_RECORD_PRESENTED_VIEW_CONTROLLER_EB23A7E2 */

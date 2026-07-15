//
//  JobsAppDoorForgotCodeContentView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORFORGOTCODECONTENTVIEW_ABB1B0B936
#define JOBS_HEADER_GUARD_JOBSAPPDOORFORGOTCODECONTENTVIEW_ABB1B0B936

#import <UIKit/UIKit.h>
#import "BaseContentView.h"
#import "JobsAppDoorConfig.h"
#import "JobsAppDoorInputViewHeader.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsBaseProtocolHeader.h"
#import "JobsHotLabel.h"
#import "JobsLanMgr.h"
#import "JobsMakes.h"
#import "JobsByOCPods.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 忘记密码页
@interface JobsAppDoorForgotCodeContentView : BaseContentView
<
BaseViewProtocol
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORFORGOTCODECONTENTVIEW_ABB1B0B936 */

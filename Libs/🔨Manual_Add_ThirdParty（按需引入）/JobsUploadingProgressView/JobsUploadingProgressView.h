//
//  JobsUploadingProgressView.h
//  JobsUploadingProgressView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSUPLOADINGPROGRESSVIEW_FCCCA7F94C
#define JOBS_HEADER_GUARD_JOBSUPLOADINGPROGRESSVIEW_FCCCA7F94C

#import <UIKit/UIKit.h>

#import "JobsLanMgr.h"

#import "JobsBaseUI.h"

#import "JobsMakes.h"

#import "JobsByOCPods.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsUploadingProgressView : BaseView

Prop_strong()UIColor *strokeColor; // 圆的线条颜色
Prop_copy()NSString *titleStr; // 描述文字
Prop_strong()UIImage *imge; // 圆内Logo
Prop_assign()CGFloat width; // 提示框 w
Prop_assign()CGFloat height; // 提示框 h
Prop_assign()CGFloat radius; // 圆半径

+(instancetype)sharedManager;
-(void)updateProgressText:(NSString *)progressText;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSUPLOADINGPROGRESSVIEW_FCCCA7F94C */

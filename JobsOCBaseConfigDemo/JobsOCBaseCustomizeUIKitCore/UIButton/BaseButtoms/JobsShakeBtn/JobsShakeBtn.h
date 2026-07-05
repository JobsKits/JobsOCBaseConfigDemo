//
//  JobsShakeBtn.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSHAKEBTN_FA305CA67E
#define JOBS_HEADER_GUARD_JOBSSHAKEBTN_FA305CA67E

#import <UIKit/UIKit.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsOCRuntimeKits.h"

#import "JobsLoadingImageHeader.h"

#import "JobsOCDSL.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 高仿iOS长按删除+抖动
@interface JobsShakeBtn : UIButton

Prop_assign(getter=isShaking)BOOL shaking;// 是否抖动
Prop_strong()UIImageView *iconBtn;// 右上角的按钮

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSHAKEBTN_FA305CA67E */

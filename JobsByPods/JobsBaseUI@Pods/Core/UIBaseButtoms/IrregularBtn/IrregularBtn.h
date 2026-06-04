//
//  IrregularBtn.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_IRREGULARBTN_DEF4E6EC9F
#define JOBS_HEADER_GUARD_IRREGULARBTN_DEF4E6EC9F

#import <UIKit/UIKit.h>

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

/// 不规则多边形按钮
@interface IrregularBtn : UIButton

Prop_strong()NSMutableArray <NSValue *>*pointMutArr;

@end
#endif /* JOBS_HEADER_GUARD_IRREGULARBTN_DEF4E6EC9F */

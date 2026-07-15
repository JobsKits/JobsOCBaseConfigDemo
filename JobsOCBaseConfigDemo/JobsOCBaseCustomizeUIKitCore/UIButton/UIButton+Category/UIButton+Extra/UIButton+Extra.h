//
//  UIButton+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_EXTRA_A29F7FE6D1
#define JOBS_HEADER_GUARD_UIBUTTON_EXTRA_A29F7FE6D1

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIButton+UI.h"
#import "UILabel+Measure.h"
#import "UIView+AutoSelfAdaptionSize.h"
#import "UIView+Masonry.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extra)

Prop_assign()CGFloat imageTitleSpace;

-(JobsRetBtnByNSUIntegerBlock _Nonnull)makeBtnTitleByShowingType;
-(JobsRetBtnByNSUIntegerBlock _Nonnull)makeBtnSubTitleByShowingType;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTON_EXTRA_A29F7FE6D1 */

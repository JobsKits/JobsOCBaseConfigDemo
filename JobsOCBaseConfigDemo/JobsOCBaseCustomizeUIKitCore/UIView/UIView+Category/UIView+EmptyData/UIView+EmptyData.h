//
//  UIView+EmptyData.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EMPTYDATA_3DC85032A5
#define JOBS_HEADER_GUARD_UIVIEW_EMPTYDATA_3DC85032A5

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIView+Extra.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsLanMgr.h"

#import "JobsOCDSL.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EmptyData)

Prop_strong()UILabel *tipsLab;
Prop_copy()NSString *tipsTitle;

-(jobsByVoidBlock _Nonnull)cleanSubview;
-(jobsByClsBlock _Nonnull)cleanSubviewBy;
-(void)ifEmptyData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EMPTYDATA_3DC85032A5 */

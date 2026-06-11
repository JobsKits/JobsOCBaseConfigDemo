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
#import <JobsByOCPods/UIView+Extra.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

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

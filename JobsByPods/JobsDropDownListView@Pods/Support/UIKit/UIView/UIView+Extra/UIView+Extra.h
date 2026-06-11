//
//  UIView+Extra.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/20.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_36C2D6A45A
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_36C2D6A45A

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extra)<BaseViewProtocol>

Prop_assign()CGFloat jobsVisible;
/// 数据（字符串）定宽
-(JobsRetCGFloatByIDBlock _Nonnull)widthByData;
/// 数据（字符串）定高
-(JobsRetCGFloatByIDBlock _Nonnull)heightByData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_36C2D6A45A */

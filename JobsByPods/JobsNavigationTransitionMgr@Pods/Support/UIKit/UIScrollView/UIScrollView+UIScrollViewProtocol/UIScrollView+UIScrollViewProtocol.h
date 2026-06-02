//
//  UIScrollView+UIScrollViewProtocol.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UISCROLLVIEW_UISCROLLVIEWPROTOCOL_FF524CFD11
#define JOBS_HEADER_GUARD_UISCROLLVIEW_UISCROLLVIEWPROTOCOL_FF524CFD11

#pragma once

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <JobsNavigationTransitionMgr/NSObject+Extra.h>
//#import <JobsNavigationTransitionMgr/<#name#>.h>

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (UIScrollViewProtocol)<UIScrollViewProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISCROLLVIEW_UISCROLLVIEWPROTOCOL_FF524CFD11 */

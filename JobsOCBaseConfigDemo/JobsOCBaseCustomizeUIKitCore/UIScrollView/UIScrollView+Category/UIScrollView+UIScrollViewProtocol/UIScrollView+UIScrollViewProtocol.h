//
//  UIScrollView+UIScrollViewProtocol.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UISCROLLVIEW_UISCROLLVIEWPROTOCOL_E3F441459D

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#define JOBS_HEADER_GUARD_UISCROLLVIEW_UISCROLLVIEWPROTOCOL_E3F441459D

#import <objc/runtime.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>
#import "NSObject+Extra.h"

#import "JobsBaseProtocolHeader.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (UIScrollViewProtocol)<UIScrollViewProtocol>

-(JobsRetScrollViewByScrollDirectionBlock _Nonnull)byDirection;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISCROLLVIEW_UISCROLLVIEWPROTOCOL_E3F441459D */

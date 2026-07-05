//
//  LOTAnimationMJRefreshHeader.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LOTANIMATIONMJREFRESHHEADER_15356351F1
#define JOBS_HEADER_GUARD_LOTANIMATIONMJREFRESHHEADER_15356351F1

#pragma once

#import <UIKit/UIKit.h>
#import "JobsOCDSL.h"

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#import "JobsModelDSL.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 下拉刷新Lottie动画
@interface LOTAnimationMJRefreshHeader : MJRefreshGifHeader

-(JobsRetLOTAnimationMJRefreshHeaderByRefreshConfigModelBlock _Nonnull)byRefreshConfigModel;
-(JobsRetLOTAnimationMJRefreshHeaderBySizeBlock _Nonnull)bySize;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_LOTANIMATIONMJREFRESHHEADER_15356351F1 */

//
//  NSObject+GKPhotoBrowser.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_GKPHOTOBROWSER_E24A2992C1
#define JOBS_HEADER_GUARD_NSOBJECT_GKPHOTOBROWSER_E24A2992C1

#pragma once

#import <UIKit/UIKit.h>
#import <JobsNavigationTransitionMgr/NSObject+Extra.h>

#if __has_include(<GKPhotoBrowser/GKPhotoBrowser.h>)
#import <GKPhotoBrowser/GKPhotoBrowser.h>
#else
#import "GKPhotoBrowser.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

/// 图片查看器
@interface NSObject (GKPhotoBrowser)<GKPhotoBrowserDelegate>
/// 针对数据源是 UIImage * 的 GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                         imageDataMutArr:(NSMutableArray <UIImage *>*)imageDataMutArr;
/// 针对数据源是 NSURL * 的 GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                          imageUrlMutArr:(NSMutableArray <NSURL *>*)imageUrlMutArr;
/// 针对数据源是 NSString * 的 GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                       imageUrlStrMutArr:(NSMutableArray <NSString *>*)imageUrlStrMutArr;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_GKPHOTOBROWSER_E24A2992C1 */

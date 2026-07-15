//
//  NSObject+GKPhotoBrowser.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_GKPHOTOBROWSER_902207F716
#define JOBS_HEADER_GUARD_NSOBJECT_GKPHOTOBROWSER_902207F716

#pragma once

#import <UIKit/UIKit.h>
#import "NSObject+Extra.h"

#if __has_include(<GKPhotoBrowser/GKPhotoBrowser.h>)
#import <GKPhotoBrowser/GKPhotoBrowser.h>
#else
#import "GKPhotoBrowser.h"
#endif

#import "JobsLanMgr.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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
#endif /* JOBS_HEADER_GUARD_NSOBJECT_GKPHOTOBROWSER_902207F716 */

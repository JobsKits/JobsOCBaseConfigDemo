//
//  MPods.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef MPods_h
#define MPods_h
/// 极大程度上尊重作者，不去污染源代码的基础上，用分类去实现一些功能
#import "ZMJCell+CustomView.h"
#import "FMDatabase+Manager.h"

#if __has_include(<TKPermissionKit/TKPermissionKit.h>)
#import <TKPermissionKit/TKPermissionKit.h>
#else
#import "TKPermissionKit.h"
#endif
/// JXCategoryView
#if __has_include(<JXCategoryViewExtra/JXCategoryViewExtra.h>)
#import <JXCategoryViewExtra/JXCategoryViewExtra.h>
#else
#import "JXCategoryTimelineView.h"
#import "JXCategoryTitleBackgroundView.h"
#endif
/// RAC_Define
#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#else
#import "RACEXTKeyPathCoding.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
#else
#import "RACEXTRuntimeExtensions.h"
#endif

#if __has_include(<KTVHTTPCache/KTVHTTPCache.h>)
#import <KTVHTTPCache/KTVHTTPCache.h>
#else
#import "KTVHTTPCache.h"
#endif

#if __has_include(<GTCaptcha4/GTCaptcha4.h>)
#import <GTCaptcha4/GTCaptcha4.h>
#else
#import "GTCaptcha4.h"
#endif

#endif /* MPods_h */

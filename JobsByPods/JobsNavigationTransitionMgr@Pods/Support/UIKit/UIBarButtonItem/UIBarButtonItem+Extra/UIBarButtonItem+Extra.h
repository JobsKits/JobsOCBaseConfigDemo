//
//  UIBarButtonItem+Extra.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBARBUTTONITEM_EXTRA_9BBA40644C
#define JOBS_HEADER_GUARD_UIBARBUTTONITEM_EXTRA_9BBA40644C

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
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

@interface UIBarButtonItem (Extra)

+(JobsRetBarButtonItemByViewBlock _Nonnull)initBy;
-(JobsRetBarButtonItemByRACCommandBlock _Nonnull)byRacCommand;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIBarButtonItem * _Nullable JobsBarButtonItem(__kindof UIView *_Nullable view){
    return [UIBarButtonItem.alloc initWithCustomView:view];
}
#endif /* JOBS_HEADER_GUARD_UIBARBUTTONITEM_EXTRA_9BBA40644C */

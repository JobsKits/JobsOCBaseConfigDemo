//
//  UICollectionViewCell+ShakeAnimation.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_8845157841
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_8845157841

#pragma once

#import <UIKit/UIKit.h>
#import <JobsBaseUI/NSMutableArray+Extra.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (ShakeAnimation)

-(void)beginShake;// 实现cell抖动方法
-(void)stopShake;// 实现cell停止抖动方法

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_8845157841 */

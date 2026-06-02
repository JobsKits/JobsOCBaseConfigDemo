//
//  XLChannelItem.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLCHANNELITEM_DD22BCE148
#define JOBS_HEADER_GUARD_XLCHANNELITEM_DD22BCE148

#import <UIKit/UIKit.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@interface XLChannelItem : UICollectionViewCell
/// 标题
Prop_copy()NSString *title;
/// 是否正在移动状态
Prop_assign()BOOL isMoving;
/// 是否被固定
Prop_assign()BOOL isFixed;

@end
#endif /* JOBS_HEADER_GUARD_XLCHANNELITEM_DD22BCE148 */

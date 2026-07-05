//
//  XLChannelItem.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLCHANNELITEM_DD22BCE148
#define JOBS_HEADER_GUARD_XLCHANNELITEM_DD22BCE148

#import <UIKit/UIKit.h>

#import "JobsByOCPods.h"

#import "JobsMakes.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

@interface XLChannelItem : UICollectionViewCell
/// 标题
Prop_copy()NSString *title;
/// 是否正在移动状态
Prop_assign()BOOL isMoving;
/// 是否被固定
Prop_assign()BOOL isFixed;

@end
#endif /* JOBS_HEADER_GUARD_XLCHANNELITEM_DD22BCE148 */

//
//  UIMarkProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIMARKPROTOCOL_F841A11BC6
#define JOBS_HEADER_GUARD_UIMARKPROTOCOL_F841A11BC6

#import <UIKit/UIKit.h>
#import "BaseLayerProtocol.h"
#import "JobsDefines.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UIMarkProtocol <NSObject>
@optional
#pragma mark —— 标记📌
Prop_strong(nullable)NSIndexPath *indexPath;
Prop_strong(nullable)NSNumber *currentPage; // 网路请求分页数据的时候的当前页码
Prop_strong(nullable)NSNumber *pageSize;
Prop_strong(nullable)NSNumber *pageNum;
Prop_assign()NSInteger section;
Prop_assign()NSInteger row;
Prop_assign()NSInteger item;
Prop_assign()CGPoint lastPoint;
Prop_assign()NSInteger index;
Prop_assign()BOOL isMark; // 是否被标记。标记的意思可以是是否维护中等等......
Prop_assign()CGFloat presentUpHeight; // 当一个VC被以present的形式推出的时候，距离手机屏幕下边距的距离

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIMARKPROTOCOL_F841A11BC6 */

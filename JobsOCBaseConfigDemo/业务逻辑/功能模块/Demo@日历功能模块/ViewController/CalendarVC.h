//
//  CalendarVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h> // 用来读取，修改和创建日历上的事件

#import "JobsOCCalendarHeader.h"

#import "JobsLanMgr.h"

#import "JobsOCDSL.h"

#import "JobsBaseUI.h"

#import "JobsMakes.h"

#import "JobsModelDSL.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface CalendarVC : BaseViewController
<
JobsOCCalendarDataSource
,JobsOCCalendarDelegate
,JobsOCCalendarDelegateAppearance
>

@end

NS_ASSUME_NONNULL_END

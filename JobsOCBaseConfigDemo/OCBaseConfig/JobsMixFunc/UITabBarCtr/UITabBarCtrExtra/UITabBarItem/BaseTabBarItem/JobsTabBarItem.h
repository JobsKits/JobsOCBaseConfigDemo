//
//  JobsTabBarItem.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTABBARITEM_507E339139
#define JOBS_HEADER_GUARD_JOBSTABBARITEM_507E339139

#import <UIKit/UIKit.h>
#import "JobsTabBarItemConfig.h"

#import "JobsBlock.h"

#import "JobsByOCPods.h"

NS_ASSUME_NONNULL_BEGIN

#warning UITabBarItem 不是 UIView的子类，所以无法在其子类里面添加任何手势以及视图
@interface JobsTabBarItem : UITabBarItem

+(JobsRetTabBarItemByConfigBlock _Nonnull)initByConfig;
-(instancetype)initWithConfig:(JobsTabBarItemConfig *_Nullable)config;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSTABBARITEM_507E339139 */

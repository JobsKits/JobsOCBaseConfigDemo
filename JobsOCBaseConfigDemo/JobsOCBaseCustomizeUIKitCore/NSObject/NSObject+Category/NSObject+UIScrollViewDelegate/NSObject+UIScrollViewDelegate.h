//
//  NSObject+UIScrollViewDelegate.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_UISCROLLVIEWDELEGATE_08A8418DF3
#define JOBS_HEADER_GUARD_NSOBJECT_UISCROLLVIEWDELEGATE_08A8418DF3

#import <UIKit/UIKit.h>
#import "UIScrollView+UIScrollViewProtocol.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// ⚠️主类实现了此代理即会屏蔽此分类的实现，因为是在NSObject分类实现，所以可覆盖面包括UIViewController 和UIView
@interface NSObject (UIScrollViewDelegate)<UIScrollViewDelegate>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_UISCROLLVIEWDELEGATE_08A8418DF3 */

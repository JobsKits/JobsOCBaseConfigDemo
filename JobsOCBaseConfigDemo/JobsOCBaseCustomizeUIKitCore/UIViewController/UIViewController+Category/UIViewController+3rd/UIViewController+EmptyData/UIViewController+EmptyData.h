//
//  UIViewController+EmptyData.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_EMPTYDATA_311C53F695
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_EMPTYDATA_311C53F695

#import <UIKit/UIKit.h>
#import "UIView+EmptyData.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 当ViewController的view上啥也没有的时候，出现提示，方便调试
@interface UIViewController (EmptyData)

-(void)ifEmptyData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_EMPTYDATA_311C53F695 */

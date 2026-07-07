//
//  NSObject+JobsDropDownListView.h
//  JobsDropDownListView
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_JOBSDROPDOWNLISTVIEW_1C2FAE1D39
#define JOBS_HEADER_GUARD_NSOBJECT_JOBSDROPDOWNLISTVIEW_1C2FAE1D39

#import <UIKit/UIKit.h>
#import "JobsDropDownListView.h"
#import "JobsDropDownListTBVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JobsDropDownListView)

/// 以锚点 View 为基准弹出下拉 / 上拉列表；每一行使用 UIViewModel 承接图片、主标题和副标题。
-(JobsDropDownListView *_Nullable)jobsMotivateDropDownListFromView:(UIView *_Nonnull)motivateFromView
                                                         direction:(JobsDropDownListViewDirection)direction
                                                              data:(NSArray <__kindof UIViewModel *>*_Nullable)data
                                                motivateViewOffset:(CGFloat)motivateViewOffset
                                                       finishBlock:(jobsByIDBlock _Nullable)finishBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_JOBSDROPDOWNLISTVIEW_1C2FAE1D39 */

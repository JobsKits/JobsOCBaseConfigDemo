//
//  TLAnimationProtocol.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TLANIMATIONPROTOCOL_E2E13554C4
#define JOBS_HEADER_GUARD_TLANIMATIONPROTOCOL_E2E13554C4

#import <UIKit/UIKit.h>

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TLAnimationProtocol <NSObject>

@required
/**
 UITabBarItem选中动画, UITabBarItem 被选中时调用
 
 - parameter button:         UITabBarItem 的按钮: 真实类型UITabBarButton
 - parameter imageView:      tabBarButton的_info（imageView）属性
 - parameter textLabel:      tabBarButton的_label属性
 */
-(void)playSelectAnimationWhitTabBarButton:(UIView *)button
                           buttonImageView:(UIImageView *)imageView
                           buttonTextLabel:(UILabel *)textLabel;

@optional
/**
 UITabBarItem撤销选中动画, UITabBarItem 被选中时调用
 
 - parameter button:         UITabBarItem 的按钮: 真实类型UITabBarButton
 - parameter imageView:      tabBarButton的_info（imageView）属性
 - parameter textLabel:      tabBarButton的_label属性
 */
-(void)playDeselectAnimationWhitTabBarButton:(UIView *)button
                             buttonImageView:(UIImageView *)imageView
                             buttonTextLabel:(UILabel *)textLabel;

/** 选中当前Item时，上一个被选中的item的索引 小于当前选中的 item */
Prop_assign(getter=isFromLeft)BOOL fromLeft;
/** 撤销选中当前Item时，下一个被选中的item的索引 大于当前选中的 item */
Prop_assign(getter=isToRight)BOOL toRight;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_TLANIMATIONPROTOCOL_E2E13554C4 */

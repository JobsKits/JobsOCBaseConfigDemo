//
//  RBCLikeButton.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_RBCLIKEBUTTON_2909D184F3
#define JOBS_HEADER_GUARD_RBCLIKEBUTTON_2909D184F3

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"

#import "JobsBaseProtocolHeader.h"

#import "JobsModelDSL.h"

#import "JobsMakes.h"

#import "JobsLoadingImageHeader.h"

#import "JobsStringUtilsHeader.h"

#import "JobsOCDSL.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

/// 高仿抖音点赞动画
@interface RBCLikeButton : UIButton
<
BaseButtonProtocol,
AppToolsProtocol,
UILocationProtocol
>

Prop_assign()NSInteger thumpNum;/// 点赞数
Prop_assign()RBCLikeButtonStatus thumbStatus;/// 按钮状态

-(void)recoverLike; // 恢复点赞
-(void)cancelLike;  // 取消点赞
/**
 设置点赞
 
 @param selected YES:设置为点赞状态 NO:设置为默认状态(非点赞状态)
 @param thumbNum 点赞数
 @param animation 是否需要动画
 */
-(void)setThumbWithSelected:(BOOL)selected
                   thumbNum:(NSInteger)thumbNum
                  animation:(BOOL)animation;

@end
#endif /* JOBS_HEADER_GUARD_RBCLIKEBUTTON_2909D184F3 */

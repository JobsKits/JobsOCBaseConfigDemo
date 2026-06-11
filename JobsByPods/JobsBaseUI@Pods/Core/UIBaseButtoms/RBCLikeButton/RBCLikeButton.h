//
//  RBCLikeButton.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_RBCLIKEBUTTON_2909D184F3
#define JOBS_HEADER_GUARD_RBCLIKEBUTTON_2909D184F3

#import <UIKit/UIKit.h>
#import <JobsBaseUI/UIView+Extra.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImage.h>)
#import <JobsLoadingImage/JobsLoadingImage.h>
#else
#import "JobsLoadingImage.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

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

//
//  UIViewModelProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWMODELPROTOCOL_74EE2B3175
#define JOBS_HEADER_GUARD_UIVIEWMODELPROTOCOL_74EE2B3175

#import <UIKit/UIKit.h>
#import "XProtocol.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 全局的共用的属性。所有属性的大集合
@protocol UIViewModelProtocol<XProtocol>
//<
//NSObject,
//BaseLayerProtocol, /// <NSObject>：BaseLayerProtocol_synthesize、BaseLayerProtocol_dynamic
//UILocationProtocol, /// <NSObject>：UILocationProtocol_synthesize、UILocationProtocol_dynamic
//UIMarkProtocol, /// <NSObject>：UIMarkProtocol_synthesize、UIMarkProtocol_dynamic
//UIPictureAndBackGroundCorProtocol, /// <NSObject>： UIPictureAndBackGroundCorProtocol_synthesize、UIPictureAndBackGroundCorProtocol_dynamic
//UITextModelProtocol, /// <NSObject>：UITextModelProtocol_synthesize、UITextModelProtocol_dynamic
//UIViewModelOthersProtocol, /// <NSObject>：UIViewModelOthersProtocol_synthesize、UIViewModelOthersProtocol_dynamic
////BaseButtonProtocol, /// <NSObject>：
////UITextFieldProtocol, /// <NSObject>：
//RACProtocol /// <NSObject>：
//>
@optional
#pragma mark —— 文字配置
Prop_copy(nullable)JobsRetIDByIDBlock jobsBlock;
Prop_strong(nullable)NSMutableArray <JobsRetIDByIDBlock>*jobsBlockMutArr;
#pragma mark —— 图片配置
/// 普通图
Prop_copy(nullable)NSString *normalImageURLString;
Prop_strong(nullable)NSURL *normalImageURL;
/// 背景图
Prop_copy(nullable)NSString *normalBgImageURLString;
Prop_strong(nullable)NSURL *normalBgImageURL;
/// 标题用图片替代文字显示
Prop_strong()UIImage *titleImage;
#pragma mark —— UI约束
Prop_copy(nullable)jobsByMASConstraintMakerBlock masonryBlock; /// Masonry
Prop_assign()CGRect imageViewFrame;

@end

NS_ASSUME_NONNULL_END
/// 自带的属性
#endif /* JOBS_HEADER_GUARD_UIVIEWMODELPROTOCOL_74EE2B3175 */

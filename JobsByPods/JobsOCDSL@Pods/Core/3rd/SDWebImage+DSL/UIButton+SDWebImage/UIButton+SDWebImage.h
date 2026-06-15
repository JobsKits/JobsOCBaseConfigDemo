//
//  UIButton+SDWebImage.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SDWebImage)

Prop_copy(readonly,nonnull)JobsRetBtnByURLBlock imageURL;
Prop_copy(readonly,nonnull)JobsRetBtnByImageBlock placeholderImage;
Prop_copy(readonly,nonnull)JobsRetButBySDWebImageOptionsBlocks options;
Prop_copy(readonly,nonnull)JobsRetButBySDExternalCompletionBlocks completed;
Prop_copy(readonly,nonnull)JobsRetButBySDImageLoaderProgressBlocks progress;
#pragma mark —— 设置普通图片的方法
/// 如果用此方法进行图片赋值，则：jobsResetBtnImage失灵。必须还是用此方法，方可进行图片修改
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock normalLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock highlightedlLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock disabledLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock selectedLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock focusedLoad API_AVAILABLE(ios(9.0));
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock applicationLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock reservedLoad;
#pragma mark —— 设置背景图片的方法
/// 如果用此方法进行图片赋值，则：jobsResetBtnBgImage失灵。必须还是用此方法，方可进行图片修改
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock bgNormalLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock bgHighlightedlLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock bgDisabledLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock bgSelectedLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock bgFocusedLoad API_AVAILABLE(ios(9.0));
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock bgApplicationLoad;
Prop_copy(readonly,nonnull)JobsRetBtnByVoidBlock bgReservedLoad;

@end

NS_ASSUME_NONNULL_END

//
//  UIButtonConfiguration+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTONCONFIGURATION_DSL_2D0E9CC78F
#define JOBS_HEADER_GUARD_UIBUTTONCONFIGURATION_DSL_2D0E9CC78F

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

API_IOS15_TVOS15_UNAVAILABLE_WATCHOS
@interface UIButtonConfiguration (DSL)

#pragma mark —— 背景 / 样式
-(JobsRetBtnConfigByBackgroundBlock _Nonnull)byBackground;
-(JobsRetBtnConfigByImageBlock _Nonnull)byBackgroundImage;
-(JobsRetBtnConfigByCornerStyleBlock _Nonnull)byCornerStyle API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigBySizeBlock _Nonnull)byButtonSize API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByMacIdiomStyleBlock _Nonnull)byMacIdiomStyle API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByBaseBackgroundCorBlock _Nonnull)byBaseBackgroundColor API_AVAILABLE(ios(16.0));
-(JobsReBtnConfigByBaseForegroundCorBlock _Nonnull)byBaseForegroundColor API_AVAILABLE(ios(16.0));
#pragma mark —— 图片 / 指示器
-(JobsRetBtnConfigByImageBlock _Nonnull)byImage API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByImageCorTransformerBlock _Nonnull)byImageColorTransformer API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByPreferredSymbolConfigForImageBlock _Nonnull)byPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByShowsActivityIndicatorBlock _Nonnull)byShowsActivityIndicator API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByActivityIndicatorCorTransformerBlock _Nonnull)byActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByIndicatorBlock _Nonnull)byIndicator API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByIndicatorColorTransformerBlock _Nonnull)byIndicatorColorTransformer API_AVAILABLE(ios(16.0));
#pragma mark —— 主标题 / 副标题
-(JobsRetBtnConfigByStrBlock _Nonnull)byTitle API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByStrBlock _Nonnull)bySubTitle API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigBySubtitleBlock _Nonnull)bySubtitle API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByAttributedStrBlock _Nonnull)byAttributedTitle API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByAttributedSubtitleBlock _Nonnull)byAttributedSubtitle API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByTitleTextAttributesTransformerBlock _Nonnull)byTitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigBySubtitleTextAttributesTransformerBlock _Nonnull)bySubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByTitleLineBreakModeBlock _Nonnull)byTitleLineBreakMode API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByTitleLineBreakModeBlock _Nonnull)bySubTitleLineBreakMode API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigBySubtitleLineBreakModeBlock _Nonnull)bySubtitleLineBreakMode API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByTitleAlignmentBlock _Nonnull)byTitleAlignment API_AVAILABLE(ios(16.0));
#pragma mark —— 布局
-(JobsRetBtnConfigByContentInsetsBlock _Nonnull)byContentInsets API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByImagePlacementBlock _Nonnull)byImagePlacement API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByCGFloatBlock _Nonnull)byImagePadding API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByCGFloatBlock _Nonnull)byTitlePadding API_AVAILABLE(ios(16.0));
-(JobsRetBtnConfigByVoidBlock _Nonnull)bySetDefaultContentInsets API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
-(JobsRetBtnConfigByAutomaticallyUpdateForSelectionBlock _Nonnull)byAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0));

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTONCONFIGURATION_DSL_2D0E9CC78F */

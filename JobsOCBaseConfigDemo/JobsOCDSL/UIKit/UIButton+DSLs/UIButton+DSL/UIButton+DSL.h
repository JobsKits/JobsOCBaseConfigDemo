//
//  UIButton+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月10日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_DSL_37F5B7F4E2
#define JOBS_HEADER_GUARD_UIBUTTON_DSL_37F5B7F4E2

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (DSL)

/// 设置 configuration。
-(JobsRetBtnByButtonConfigurationBlock _Nonnull)byConfiguration API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
/// 请求刷新 configuration。
-(JobsRetBtnByVoidBlock _Nonnull)bySetNeedsUpdateConfiguration API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
/// 立即刷新 configuration。
-(JobsRetBtnByVoidBlock _Nonnull)byUpdateConfiguration API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
/// 设置 configurationUpdateHandler。
-(JobsRetBtnByConfigurationUpdateHandlerBlock _Nonnull)byConfigurationUpdateHandler API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
/// 设置 automaticallyUpdatesConfiguration。
-(JobsRetBtnByBOOLBlock _Nonnull)byAutomaticallyUpdatesConfiguration API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
/// 设置 role。
-(JobsRetBtnByRoleBlock _Nonnull)byRole API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(watchos);
/// 设置 pointerInteractionEnabled。
-(JobsRetBtnByBOOLBlock _Nonnull)byPointerInteractionEnabled API_AVAILABLE(ios(13.4)) API_UNAVAILABLE(watchos, tvos);
/// 设置 pointerStyleProvider。
-(JobsRetBtnByPointerStyleProviderBlock _Nonnull)byPointerStyleProvider API_AVAILABLE(ios(13.4)) API_UNAVAILABLE(watchos, tvos);
/// 设置 menu。
-(JobsRetBtnByMenuBlock _Nonnull)byMenu API_AVAILABLE(ios(14.0), tvos(17.0)) API_UNAVAILABLE(watchos);
/// 设置 preferredMenuElementOrder。
-(JobsRetBtnByContextMenuConfigurationElementOrderBlock _Nonnull)byPreferredMenuElementOrder API_AVAILABLE(ios(16.0), tvos(17.0)) API_UNAVAILABLE(watchos);
/// 设置 changesSelectionAsPrimaryAction。
-(JobsRetBtnByBOOLBlock _Nonnull)byChangesSelectionAsPrimaryAction API_AVAILABLE(ios(15.0), tvos(17.0)) API_UNAVAILABLE(watchos);
/// 设置普通状态标题。
-(JobsRetBtnByStringBlock _Nonnull)byTitle;
/// 设置普通状态标题颜色。
-(JobsRetBtnByCorBlock _Nonnull)byTitleCor;
/// 设置普通状态标题阴影颜色。
-(JobsRetBtnByCorBlock _Nonnull)byTitleShadowCor;
/// 设置普通状态图片。
-(JobsRetBtnByImageBlock _Nonnull)byImage;
/// 设置普通状态背景图片。
-(JobsRetBtnByImageBlock _Nonnull)byBackgroundImage;
/// 设置普通状态 SF Symbol 配置。
-(JobsRetBtnBySymbolConfigurationBlock _Nonnull)byPreferredSymbolConfiguration API_AVAILABLE(ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
/// 设置普通状态富文本标题。
-(JobsRetBtnByAttributedStringBlock _Nonnull)byAttributedTitle API_AVAILABLE(ios(6.0));
/// 设置标题字体。
-(JobsRetBtnByFontBlock _Nonnull)byTitleFont;
/// 回调 UIButton 原生 titleLabel，便于继续使用 UILabel+DSL。
-(JobsRetBtnByLabelBlock _Nonnull)byTitleLabel;
/// 回调 BaseButton 等子类可能持有的 subtitleLabel。不存在时回调 nil，不中断链式调用。
-(JobsRetBtnByLabelBlock _Nonnull)bySubtitleLabel;
/// 回调 UIButton 原生 imageView。
-(JobsRetBtnByImageViewBlock _Nonnull)byImageView;
/// 设置标题对齐方式；BaseButton 等子类若持有 titleAlignment 属性，也会同步写入。
-(JobsRetBtnByTextAlignmentBlock _Nonnull)byTitleAlignment;
/// 设置标题换行方式；BaseButton 等子类若持有 lineBreakMode / titleLineBreakMode 属性，也会同步写入。
-(JobsRetBtnByLineBreakModeBlock _Nonnull)byLineBreakMode;
/// 设置 titleShadowOffset。
-(JobsRetBtnByCGSizeBlock _Nonnull)byTitleShadowOffset API_UNAVAILABLE(tvos) API_UNAVAILABLE(visionos, watchos);
/// 设置内容边距；iOS 15+ 的 UIButtonConfiguration 兼容由封装内部处理。
-(JobsRetBtnByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets API_UNAVAILABLE(watchos);
/// 设置 titleEdgeInsets。
-(JobsRetBtnByUIEdgeInsetsBlock _Nonnull)byTitleEdgeInsets API_UNAVAILABLE(watchos);
/// 设置 imageEdgeInsets。
-(JobsRetBtnByUIEdgeInsetsBlock _Nonnull)byImageEdgeInsets API_UNAVAILABLE(watchos);
/// 设置 reversesTitleShadowWhenHighlighted。
-(JobsRetBtnByBOOLBlock _Nonnull)byReversesTitleShadowWhenHighlighted API_UNAVAILABLE(watchos);
/// 设置 adjustsImageWhenHighlighted。
-(JobsRetBtnByBOOLBlock _Nonnull)byAdjustsImageWhenHighlighted API_UNAVAILABLE(watchos);
/// 设置 adjustsImageWhenDisabled。
-(JobsRetBtnByBOOLBlock _Nonnull)byAdjustsImageWhenDisabled API_UNAVAILABLE(watchos);
/// 设置 showsTouchWhenHighlighted。
-(JobsRetBtnByBOOLBlock _Nonnull)byShowsTouchWhenHighlighted API_UNAVAILABLE(tvos) API_UNAVAILABLE(watchos);

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTON_DSL_37F5B7F4E2 */

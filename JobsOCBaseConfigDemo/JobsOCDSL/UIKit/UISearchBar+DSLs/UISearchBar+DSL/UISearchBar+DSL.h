//
//  UISearchBar+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UISEARCHBAR_DSL_6B65B6BC4E
#define JOBS_HEADER_GUARD_UISEARCHBAR_DSL_6B65B6BC4E

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UISearchBar (DSL)

#pragma mark —— 基础文本
-(JobsRetSearchBarByStringBlock _Nonnull)byText;
-(JobsRetSearchBarByStringBlock _Nonnull)byPrompt;
-(JobsRetSearchBarByStringBlock _Nonnull)byPlaceholder;
#pragma mark —— 代理
-(JobsRetSearchBarByDelegateBlock _Nonnull)byDelegate;
#pragma mark —— 样式
-(JobsRetSearchBarByBarStyleBlock _Nonnull)byBarStyle API_UNAVAILABLE(tvos);
-(JobsRetSearchBarBySearchBarStyleBlock _Nonnull)bySearchBarStyle API_AVAILABLE(ios(7.0));
-(JobsRetSearchBarByBOOLBlock _Nonnull)byTranslucent API_AVAILABLE(ios(3.0));
-(JobsRetSearchBarByCorBlock _Nonnull)byTintColor;
-(JobsRetSearchBarByCorBlock _Nonnull)byBarTintColor API_AVAILABLE(ios(7.0));
#pragma mark —— 按钮
-(JobsRetSearchBarByBOOLBlock _Nonnull)byShowsBookmarkButton API_UNAVAILABLE(tvos);
-(JobsRetSearchBarByBOOLBlock _Nonnull)byShowsCancelButton API_UNAVAILABLE(tvos);
-(JobsRetSearchBarByBOOLBlock _Nonnull)byShowsSearchResultsButton API_AVAILABLE(ios(3.2)) API_UNAVAILABLE(tvos);
-(JobsRetSearchBarByBOOLBlock _Nonnull)bySearchResultsButtonSelected API_AVAILABLE(ios(3.2)) API_UNAVAILABLE(tvos);
#pragma mark —— scope
-(JobsRetSearchBarByArrBlock _Nonnull)byScopeButtonTitles API_AVAILABLE(ios(3.0));
-(JobsRetSearchBarByNSIntegerBlock _Nonnull)bySelectedScopeButtonIndex API_AVAILABLE(ios(3.0));
-(JobsRetSearchBarByBOOLBlock _Nonnull)byShowsScopeBar API_AVAILABLE(ios(3.0));
#pragma mark —— 输入视图
-(JobsRetSearchBarByViewBlock _Nonnull)byInputAccessoryView API_UNAVAILABLE(visionos);
-(JobsRetSearchBarByBOOLBlock _Nonnull)byEnabled API_AVAILABLE(ios(16.4), tvos(16.4)) API_UNAVAILABLE(watchos);
#pragma mark —— 图片
-(JobsRetSearchBarByImageBlock _Nonnull)byBackgroundImage API_AVAILABLE(ios(5.0));
-(JobsRetSearchBarByImageBlock _Nonnull)byScopeBarBackgroundImage API_AVAILABLE(ios(5.0));
#pragma mark —— 位置
-(JobsRetSearchBarByOffsetBlock _Nonnull)bySearchFieldBackgroundPositionAdjustment API_AVAILABLE(ios(5.0));
-(JobsRetSearchBarByOffsetBlock _Nonnull)bySearchTextPositionAdjustment API_AVAILABLE(ios(5.0));
#pragma mark —— Dictation
-(JobsRetSearchBarByBOOLBlock _Nonnull)byLookToDictateEnabled API_AVAILABLE(ios(17.0), visionos(1.0)) API_UNAVAILABLE(tvos, watchos, macos);

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISEARCHBAR_DSL_6B65B6BC4E */

//
//  UIButton+UIControlState.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_UICONTROLSTATE_FCD4543E26
#define JOBS_HEADER_GUARD_UIBUTTON_UICONTROLSTATE_FCD4543E26

#pragma once

#import <UIKit/UIKit.h>

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

@interface UIButton (UIControlState)
#pragma mark —— UIButton.image
-(JobsRetImageByNSUIntegerBlock _Nonnull)imageByState;
-(JobsRetImageByVoidBlock _Nonnull)imageByNormalState;
-(JobsRetImageByVoidBlock _Nonnull)imageByHighlightedState;
-(JobsRetImageByVoidBlock _Nonnull)imageByDisabledState;
-(JobsRetImageByVoidBlock _Nonnull)imageBySelectedState;
-(JobsRetImageByVoidBlock _Nonnull)imageByFocusedState API_AVAILABLE(ios(9.0));
-(JobsRetImageByVoidBlock _Nonnull)imageByApplicationState;
-(JobsRetImageByVoidBlock _Nonnull)imageByReservedState;
-(JobsRetBtnByImageBlock _Nonnull)normalStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)highlightedStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)disabledStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)selectedStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)focusedStateImageBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByImageBlock _Nonnull)applicationStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)reservedStateImageBy;
-(JobsRetBtnByImageAndControlStateBlock _Nonnull)imageForStateBy;
#pragma mark —— UIButton.backgroundImage
-(JobsRetImageByNSUIntegerBlock _Nonnull)backgroundImageByState;
-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByNormalState;
-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByHighlightedState;
-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByDisabledState;
-(JobsRetImageByVoidBlock _Nonnull)backgroundImageBySelectedState;
-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByFocusedState API_AVAILABLE(ios(9.0));
-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByApplicationState;
-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByReservedState;
-(JobsRetBtnByImageBlock _Nonnull)normalStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)highlightedStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)disabledStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)selectedStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)focusedStateBackgroundImageBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByImageBlock _Nonnull)applicationStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)reservedStateBackgroundImageBy;
-(JobsRetBtnByImageAndControlStateBlock _Nonnull)backgroundImageForStateBy;
#pragma mark —— UIButton.titleColor
-(JobsRetCorByNSUIntegerBlock _Nonnull)titleColorByState;
-(JobsRetCorByVoidBlock _Nonnull)titleColorByNormalState;
-(JobsRetCorByVoidBlock _Nonnull)titleColorByHighlightedState;
-(JobsRetCorByVoidBlock _Nonnull)titleColorByDisabledState;
-(JobsRetCorByVoidBlock _Nonnull)titleColorBySelectedState;
-(JobsRetCorByVoidBlock _Nonnull)titleColorByFocusedState API_AVAILABLE(ios(9.0));
-(JobsRetCorByVoidBlock _Nonnull)titleColorByApplicationState;
-(JobsRetCorByVoidBlock _Nonnull)titleColorByReservedState;
-(JobsRetBtnByCorBlock _Nonnull)normalStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)highlightedStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)disabledStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)selectedStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)focusedStateTitleColorBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByCorBlock _Nonnull)ApplicationStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)reservedStateTitleColorBy;
-(JobsRetBtnByCorAndControlStateBlock _Nonnull)titleColorForStateBy;
#pragma mark —— UIButton.titleShadowColor
-(JobsRetCorByNSUIntegerBlock _Nonnull)titleShadowColorByState;
-(JobsRetBtnByCorAndControlStateBlock _Nonnull)titleShadowColorForStateBy;
#pragma mark —— UIButton.subtitleColor
/// TODO
#pragma mark —— UIButton.title
-(JobsRetStrByUIntegerBlock _Nonnull)titleByState;
-(JobsRetStrByVoidBlock _Nonnull)titleByNormalState;
-(JobsRetStrByVoidBlock _Nonnull)titleByHighlightedState;
-(JobsRetStrByVoidBlock _Nonnull)titleByDisabledState;
-(JobsRetStrByVoidBlock _Nonnull)titleBySelectedState;
-(JobsRetStrByVoidBlock _Nonnull)titleByFocusedState API_AVAILABLE(ios(9.0));
-(JobsRetStrByVoidBlock _Nonnull)titleByApplicationState;
-(JobsRetStrByVoidBlock _Nonnull)titleByReservedState;
-(JobsRetBtnByStringBlock _Nonnull)normalStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)highlightedStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)disabledStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)selectedStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)focusedStateTitleBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByStringBlock _Nonnull)applicationStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)reservedStateTitleBy;
-(JobsRetBtnByStringAndControlStateBlock _Nonnull)titleForStateBy;
#pragma mark —— UIButton.subtitle
-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedSubtitle;
#pragma mark —— UIButton.attributedTitle
-(NSAttributedString *_Nullable)attributedTitle;
-(JobsRetAttributedStringByNSUIntegerBlock _Nonnull)attributedTitleByState;
-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByNormalState;
-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByHighlightedState;
-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByDisabledState;
-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleBySelectedState;
-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByFocusedState API_AVAILABLE(ios(9.0));
-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByApplicationState;
-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByReservedState;
-(JobsRetBtnByAttributedStringBlock _Nonnull)selectedAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)normalStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)highlightedStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)disabledStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)selectedStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)focusedStateAttributedTitleBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByAttributedStringBlock _Nonnull)applicationStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)reservedStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringAndControlStateBlock _Nonnull)attributedTitleForStateBy;
#pragma mark —— UIButton.attributedSubtitle
/// TODO
#pragma mark —— UIButton.preferredSymbolConfiguration
-(JobsRetSymbolConfigurationByControlStateBlock _Nonnull)preferredSymbolConfigurationByState API_AVAILABLE(ios(13.0));
-(JobsRetBtnBySymbolConfigurationAndControlStateBlock _Nonnull)preferredSymbolConfigurationForStateBy API_AVAILABLE(ios(13.0));
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTON_UICONTROLSTATE_FCD4543E26 */

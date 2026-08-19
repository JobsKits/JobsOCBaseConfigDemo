//
//  BaseButton.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEBUTTON_0F1DAAB0C1
#define JOBS_HEADER_GUARD_BASEBUTTON_0F1DAAB0C1

#pragma once

#import <UIKit/UIKit.h>
#import "UIButton+SimplyMake.h"
#import "JobsBaseProtocolHeader.h"
#import "JobsOCDSL.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 此类的意义：可以重新定义相关子控件的Frame
@interface BaseButton : UIButton
<
BaseProtocol,
RACProtocol,
UIViewModelProtocol,
BaseViewProtocol,
GestureProtocol,
BaseButtonProtocol,
UIMarkProtocol
>

-(JobsRetBaseButtonByIDBlock _Nonnull)byData;
-(JobsRetBaseButtonByNSIntegerBlock _Nonnull)byIndex;
-(JobsRetBaseButtonByCGRectBlock _Nonnull)byImageViewFrame;
-(JobsRetBaseButtonByCGRectBlock _Nonnull)byTextLabelFrame;
-(JobsRetBaseButtonByCGRectBlock _Nonnull)bySubTextLabelFrame;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN BaseButton
-(JobsRetBaseButtonByCGSizeBlock _Nonnull)bySizer;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END BaseButton
@end

NS_ASSUME_NONNULL_END

#ifndef JOBS_MAKE_BASE_BUTTON_INLINE
#define JOBS_MAKE_BASE_BUTTON_INLINE
NS_INLINE __kindof UIButton *_Nonnull jobsMakeBaseButton(jobsByBtnBlock _Nonnull block) {
    BaseButton *data = BaseButton.new;
    if (block) block(data);
    return data;
}
#endif /* JOBS_MAKE_BASE_BUTTON_INLINE */
#endif /* JOBS_HEADER_GUARD_BASEBUTTON_0F1DAAB0C1 */

//
//  BaseButton.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEBUTTON_B69866A3CA
#define JOBS_HEADER_GUARD_BASEBUTTON_B69866A3CA

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIButton *_Nonnull jobsMakeBaseButton(jobsByBtnBlock _Nonnull block) {
    BaseButton *data = BaseButton.new;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_BASEBUTTON_B69866A3CA */

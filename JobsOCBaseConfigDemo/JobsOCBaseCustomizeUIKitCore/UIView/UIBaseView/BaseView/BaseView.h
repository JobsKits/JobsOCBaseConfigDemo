//
//  BaseView.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEVIEW_698B004E00
#define JOBS_HEADER_GUARD_BASEVIEW_698B004E00

#pragma once

#import <UIKit/UIKit.h>

#import "JobsBaseProtocolHeader.h"

#import "JobsModelDSL.h"

#import "JobsAppToolsHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseView : UIView
<
UIViewModelProtocol,
BaseProtocol,
BaseViewProtocol,
AppToolsProtocol
>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIView *_Nonnull jobsMakeBaseView(jobsByBaseViewBlock _Nonnull block){
    BaseView *data = BaseView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_BASEVIEW_698B004E00 */

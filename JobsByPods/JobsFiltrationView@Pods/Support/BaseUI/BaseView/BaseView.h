//
//  BaseView.h
//  JobsFiltrationView
//
//  Created by Jobs on 2026年5月23日，星期六.
//

#ifndef JOBS_HEADER_GUARD_BASEVIEW_14BF0088DA
#define JOBS_HEADER_GUARD_BASEVIEW_14BF0088DA

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsAppTools/JobsAppTools.h>)
#import <JobsAppTools/JobsAppTools.h>
#else
#import "JobsAppTools.h"
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

@interface BaseView : UIView
<
UIViewModelProtocol,
BaseProtocol,
BaseViewProtocol,
AppToolsProtocol
>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIView *_Nonnull jobsMakeBaseView(jobsByBaseViewBlock _Nonnull block) {
    BaseView *data = BaseView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_BASEVIEW_14BF0088DA */

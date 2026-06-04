//
//  XProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XPROTOCOL_389E720B54
#define JOBS_HEADER_GUARD_XPROTOCOL_389E720B54

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCProtocols/BaseLayerProtocol.h>)
#import <JobsOCProtocols/BaseLayerProtocol.h>
#elif __has_include("XProtocol/BaseLayerProtocol.h")
#import "XProtocol/BaseLayerProtocol.h"
#else
#import "BaseLayerProtocol.h"
#endif
#if __has_include(<JobsOCProtocols/RACProtocol.h>)
#import <JobsOCProtocols/RACProtocol.h>
#elif __has_include("XProtocol/RACProtocol.h")
#import "XProtocol/RACProtocol.h"
#else
#import "RACProtocol.h"
#endif
#if __has_include(<JobsOCProtocols/UILocationProtocol.h>)
#import <JobsOCProtocols/UILocationProtocol.h>
#elif __has_include("XProtocol/UILocationProtocol.h")
#import "XProtocol/UILocationProtocol.h"
#else
#import "UILocationProtocol.h"
#endif
#if __has_include(<JobsOCProtocols/UIMarkProtocol.h>)
#import <JobsOCProtocols/UIMarkProtocol.h>
#elif __has_include("XProtocol/UIMarkProtocol.h")
#import "XProtocol/UIMarkProtocol.h"
#else
#import "UIMarkProtocol.h"
#endif
#if __has_include(<JobsOCProtocols/UIPictureAndBackGroundCorProtocol.h>)
#import <JobsOCProtocols/UIPictureAndBackGroundCorProtocol.h>
#elif __has_include("XProtocol/UIPictureAndBackGroundCorProtocol.h")
#import "XProtocol/UIPictureAndBackGroundCorProtocol.h"
#else
#import "UIPictureAndBackGroundCorProtocol.h"
#endif
#if __has_include(<JobsOCProtocols/UITextModelProtocol.h>)
#import <JobsOCProtocols/UITextModelProtocol.h>
#elif __has_include("../UIViewModelProtocols/BaseViewModelProtocol/UITextModelProtocol.h")
#import "../UIViewModelProtocols/BaseViewModelProtocol/UITextModelProtocol.h"
#else
#import "UITextModelProtocol.h"
#endif
#if __has_include(<JobsOCProtocols/UIViewModelOthersProtocol.h>)
#import <JobsOCProtocols/UIViewModelOthersProtocol.h>
#elif __has_include("../UIViewModelProtocols/BaseViewModelProtocol/UIViewModelOthersProtocol.h")
#import "../UIViewModelProtocols/BaseViewModelProtocol/UIViewModelOthersProtocol.h"
#else
#import "UIViewModelOthersProtocol.h"
#endif
#if __has_include(<JobsOCProtocols/BaseButtonProtocol.h>)
#import <JobsOCProtocols/BaseButtonProtocol.h>
#elif __has_include("../UIViewModelProtocols/BaseViewProtocols/BaseButtonProtocol.h")
#import "../UIViewModelProtocols/BaseViewProtocols/BaseButtonProtocol.h"
#else
#import "BaseButtonProtocol.h"
#endif
#if __has_include(<JobsOCProtocols/UITextFieldProtocol.h>)
#import <JobsOCProtocols/UITextFieldProtocol.h>
#elif __has_include("../UIViewModelProtocols/BaseViewProtocols/UITextFieldProtocol.h")
#import "../UIViewModelProtocols/BaseViewProtocols/UITextFieldProtocol.h"
#else
#import "UITextFieldProtocol.h"
#endif
#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@protocol XProtocol
<
NSObject,
BaseLayerProtocol, // <NSObject>：BaseLayerProtocol_synthesize、BaseLayerProtocol_dynamic
UILocationProtocol, // <NSObject>：UILocationProtocol_synthesize、UILocationProtocol_dynamic
UIMarkProtocol, // <NSObject>：UIMarkProtocol_synthesize、UIMarkProtocol_dynamic
UIPictureAndBackGroundCorProtocol, // <NSObject>： UIPictureAndBackGroundCorProtocol_synthesize、UIPictureAndBackGroundCorProtocol_dynamic
UITextModelProtocol, // <NSObject>：UITextModelProtocol_synthesize、UITextModelProtocol_dynamic
UIViewModelOthersProtocol, // <NSObject>：UIViewModelOthersProtocol_synthesize、UIViewModelOthersProtocol_dynamic
BaseButtonProtocol, // <NSObject>：
UITextFieldProtocol, // <NSObject>：
RACProtocol // <NSObject>：
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_XPROTOCOL_389E720B54 */

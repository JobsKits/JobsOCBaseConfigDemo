//
//  CasinoCustomerServiceView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CASINOCUSTOMERSERVICEVIEW_1ED9F7BA26
#define JOBS_HEADER_GUARD_CASINOCUSTOMERSERVICEVIEW_1ED9F7BA26

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

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

#if __has_include(<JobsHotLabel/JobsHotLabel.h>)
#import <JobsHotLabel/JobsHotLabel.h>
#else
#import "JobsHotLabel.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface CasinoCustomerServiceView : BaseView<AppToolsProtocol>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN CasinoCustomerServiceView
-(JobsRetCasinoCustomerServiceViewByNSMutableArrayUIViewModelBlock _Nonnull)byHotLabelDataMutArr;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END CasinoCustomerServiceView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASINOCUSTOMERSERVICEVIEW_1ED9F7BA26 */

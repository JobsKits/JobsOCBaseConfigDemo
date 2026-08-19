//
//  CasinoCustomerServiceView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CASINOCUSTOMERSERVICEVIEW_1ED9F7BA26

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JOBS_HEADER_GUARD_CASINOCUSTOMERSERVICEVIEW_1ED9F7BA26

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsAppDoorConfig.h"

#import "JobsBaseProtocolHeader.h"
#import "JobsHotLabel.h"
#import "JobsBaseUI.h"
#import "JobsLanMgr.h"
#import "JobsMakes.h"
#import "JobsByOCPods.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface CasinoCustomerServiceView : BaseView<AppToolsProtocol>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN CasinoCustomerServiceView
-(JobsRetCasinoCustomerServiceViewByNSMutableArrayUIViewModelBlock _Nonnull)byHotLabelDataMutArr;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END CasinoCustomerServiceView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASINOCUSTOMERSERVICEVIEW_1ED9F7BA26 */

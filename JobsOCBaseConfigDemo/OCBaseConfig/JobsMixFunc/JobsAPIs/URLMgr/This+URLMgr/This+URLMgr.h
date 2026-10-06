//
//  This+URLMgr.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_THIS_URLMGR_8F056E259C
#define JOBS_HEADER_GUARD_THIS_URLMGR_8F056E259C

#import <Foundation/Foundation.h>
#import "URLMgr.h"
#import "ThisHeader.h"
#import "NSString+URL.h"
#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

/// Debug 面板切换 API 域名；Release 保持既有生产配置。
FOUNDATION_EXPORT void JobsSetDebugBaseURL(NSString * _Nullable baseURL);

/// 域名列表
/// https://conf.betzz.cc/pages/viewpage.action?pageId=918653
@interface This (URLMgr)
#pragma mark —— BaseURL
+(NSString *)BaseUrl;
+(JobsRetStrByVoidBlock _Nonnull)jobsBaseUrl;
+(JobsRetStrByVoidBlock _Nonnull)BaseUrl_H5;
+(JobsRetStrByVoidBlock _Nonnull)jobsBaseUrl_Image;
#pragma mark —— App接口示例
+(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_appInterfaceTesting;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_THIS_URLMGR_8F056E259C */

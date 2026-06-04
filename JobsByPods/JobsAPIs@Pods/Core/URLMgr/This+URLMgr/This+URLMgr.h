//
//  This+URLMgr.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_THIS_URLMGR_8F056E259C
#define JOBS_HEADER_GUARD_THIS_URLMGR_8F056E259C

#import <Foundation/Foundation.h>
#import <JobsAPIs/URLMgr.h>

#if __has_include(<This/This.h>)
#import <This/This.h>
#else
#import "This.h"
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
/// 域名列表
/// https://conf.betzz.cc/pages/viewpage.action?pageId=918653
@interface This (URLMgr)
#pragma mark —— BaseURL
+(NSString *)BaseUrl;
+(NSString *)BaseUrl_H5;
+(NSString *)BaseUrl_Image;
#pragma mark —— App接口示例
+(URLManagerModel *)appInterfaceTesting;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_THIS_URLMGR_8F056E259C */

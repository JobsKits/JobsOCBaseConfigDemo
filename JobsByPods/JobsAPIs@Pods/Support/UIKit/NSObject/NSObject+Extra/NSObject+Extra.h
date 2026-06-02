//
//  NSObject+Extra.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_196AEB9AD4
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_196AEB9AD4

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extra)

-(URLManagerModel *_Nonnull)url:(NSString *_Nonnull)url funcName:(NSString *_Nonnull)funcName;
-(JobsRetDataByStrBlock _Nonnull)initByContentsOfFile;
-(JobsRetIDByDataBlock _Nonnull)JSONkNilOptions;
-(JobsRetIDByDataBlock _Nonnull)JSONReadingMutableContainers;
-(JobsRetDataByDicBlock _Nonnull)JSONWritingPrettyPrinted;
/// JSON对象转NSData
-(JobsRetDataByIDBlock _Nonnull)dataByJSONObject;
/// Tips封装
-(jobsByIDBlock _Nonnull)tipsByApi;
/// 打印请求体
-(JobsReturnURLRequestByURLSessionTaskBlock _Nullable)printURLSessionRequestMessage;
/// 打印URLRequest
-(JobsReturnMutableURLRequestByURLRequestBlock _Nullable)printRequestMessage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_196AEB9AD4 */

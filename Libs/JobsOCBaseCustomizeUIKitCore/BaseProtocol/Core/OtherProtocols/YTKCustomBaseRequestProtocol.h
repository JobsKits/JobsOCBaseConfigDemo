//
//  YTKCustomBaseRequestProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_YTKCUSTOMBASEREQUESTPROTOCOL_A2C74A62BB
#define JOBS_HEADER_GUARD_YTKCUSTOMBASEREQUESTPROTOCOL_A2C74A62BB

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YTKCustomBaseRequestProtocol <NSObject>
@optional
Prop_strong(nullable)id urlParameters;
Prop_strong(nullable)NSMutableDictionary *parameters;
Prop_strong(nullable)NSMutableDictionary *customHTTPHeader;

#pragma mark —— 加请求头参数
-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters;
#pragma mark —— 加Body参数
-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byBodyParameters;
#pragma mark —— 加URL参数
-(JobsRetYTKBaseRequestByIDBlock _Nonnull)byURLParameters;
#pragma mark —— 错误打印
-(JobsRetYTKBaseRequestByVoidBlock _Nonnull)handleErr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_YTKCUSTOMBASEREQUESTPROTOCOL_A2C74A62BB */

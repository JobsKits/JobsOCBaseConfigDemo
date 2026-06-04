//
//  YTKNetworkProtocols.h
//  YTKNetworkExtra
//
//  Created by Jobs on 2026/5/16.
//

#ifndef JOBS_HEADER_GUARD_YTKNETWORKPROTOCOLS_30DEE14285
#define JOBS_HEADER_GUARD_YTKNETWORKPROTOCOLS_30DEE14285

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCProtocols/YTKCustomBaseRequestProtocol.h>)
#import <JobsOCProtocols/YTKCustomBaseRequestProtocol.h>
#elif __has_include("YTKCustomBaseRequestProtocol.h")
#import "YTKCustomBaseRequestProtocol.h"
#else
#import "YTKCustomBaseRequestProtocol.h"
#endif

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
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

@protocol YTKNetworkProtocols <NSObject>
@optional
#pragma mark —— 一些公有设置
/// successData传nil：对总数据源进行标准格式解析后对外返回 JobsResponseModel
/// successData传JobsSolveData(AModel)：对总数据源进行标准格式解析以后，再进行一层关于AModel的解析后对外返回
-(void)request:(YTKBaseRequest *)request                               // 总数据源
   successData:(id _Nullable)successData                               // 本层对success的解析数据
   actionBlock:(jobsByResponseModelBlock _Nullable)actionBlock         // 本层对success的解析回调
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock        // 外层对success的解析回调
     failBlock:(jobsByVoidBlock _Nullable)failBlock;                   // 失败解析回调

-(void)request:(YTKBaseRequest <YTKCustomBaseRequestProtocol>*)request
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
///【请求已经成功，但是服务器抛异常】处理非HTTPResponseCodeSuccess 的 HTTPResponseCode
-(void)jobsHandelHTTPResponseCode:(HTTPResponseCode)responseCode
                      actionBlock:(jobsByNSIntegerBlock _Nullable)actionBlock;
///【请求失败】请求失败的处理
-(JobsRetYTKBaseRequestByYTKBaseRequestBlock _Nonnull)jobsHandelFailure;
/// 仅仅打印请求体：request.requestTask
-(jobsByYTKBaseRequestBlock _Nonnull)jobsHandelNoSuccess;
/// Tips封装
-(jobsByIDBlock _Nonnull)tipsByApi;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_YTKNETWORKPROTOCOLS_30DEE14285 */

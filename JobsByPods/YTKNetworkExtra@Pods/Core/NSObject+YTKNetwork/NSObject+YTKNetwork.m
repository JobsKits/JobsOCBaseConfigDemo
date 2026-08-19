//
//  NSObject+YTKNetwork.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+YTKNetwork.h"

#import <YTKNetworkExtra/NSData+Extra.h>
#import <YTKNetworkExtra/NSMutableDictionary+Extra.h>
#import <YTKNetworkExtra/NSObject+Extra.h>

@implementation NSObject (YTKNetwork)
#pragma mark —— 一些公有设置
/// successData传nil：对总数据源进行标准格式解析后对外返回 JobsResponseModel
/// successData传JobsSolveData(AModel)：对总数据源进行标准格式解析以后，再进行一层关于AModel的解析后对外返回
-(void)request:(YTKBaseRequest *)request                               // 总数据源
   successData:(id _Nullable)successData                               // 本层对success的解析数据
   actionBlock:(jobsByResponseModelBlock _Nullable)actionBlock         // 本层对success的解析回调
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock        // 外层对success的解析回调
     failBlock:(jobsByVoidBlock _Nullable)failBlock{                   // 失败解析回调
    /// 解析+处理HTTPResponseCode
    JobsResponseModel *responseModel = JobsMapResponseModelBy(request);
    /// 打印Body参数
    JobsLog(@"%@",request.parameters.jsonString());
    if(responseModel.code == HTTPResponseCodeSuccess){
        if(successBlock) successBlock(successData ? : responseModel);
        if(actionBlock) actionBlock(responseModel);
    }else{
        /// 仅仅打印请求体：request.requestTask
        self.jobsHandelNoSuccess(request);
        if(failBlock) failBlock();
    }
}

-(void)request:(YTKBaseRequest <YTKCustomBaseRequestProtocol>*)request
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock{
    [self request:request
      successData:nil
      actionBlock:nil
     successBlock:successBlock
        failBlock:nil];
}
///【请求已经成功，但是服务器抛异常】处理非HTTPResponseCodeSuccess 的 HTTPResponseCode
-(void)jobsHandelHTTPResponseCode:(HTTPResponseCode)responseCode
                      actionBlock:(jobsByNSIntegerBlock _Nullable)actionBlock{
    switch (responseCode) {
        /// 服务器异常
        case HTTPResponseCodeServeError:{
            JobsLog(@"服务器异常");
            toastBy(@"服务器异常".jobsTr());
        }break;
        /// 令牌不能为空
        case HTTPResponseCodeNoToken:{
//            self.toLogin();
            JobsLog(@"令牌不能为空");
            toastBy(@"令牌不能为空".jobsTr());
        }break;
        /// 登录失败：账密错误
        case HTTPResponseCodeLoginFailed:{
            JobsLog(@"登录失败：账密错误");
            toastBy(@"登录失败：账密错误".jobsTr());
        }break;
        /// 授权失败
        case HTTPResponseCodeAuthorizationFailure:{
            JobsLog(@"授权失败");
            toastBy(@"授权失败".jobsTr());
        }break;
        /// 限定时间内超过请求次数
        case HTTPResponseCodeLeakTime:{
            JobsLog(@"限定时间内超过请求次数");
            toastBy(@"限定时间内超过请求次数".jobsTr());
        }break;
        /// 风险操作
        case HTTPResponseCodeRiskOperation:{
            JobsLog(@"风险操作");
            toastBy(@"风险操作".jobsTr());
        }break;
        /// 未设置交易密码
        case HTTPResponseCodeNoSettingTransactionPassword:{
            JobsLog(@"未设置交易密码");
            toastBy(@"未设置交易密码".jobsTr());
        }break;
        /// 账号已在其他设备登录
        case HTTPResponseCodeOffline:{
            JobsLog(@"账号已在其他设备登录");
            toastBy(@"账号已在其他设备登录".jobsTr());
        }break;
        /// Token 过期：登录已过期，请重新登录
        case HTTPResponseCodeTokenExpire:{
            JobsLog(@"Token 过期");
//            self.tokenExpire();
            JobsLog(@"Token 过期");
            toastBy(@"Token 过期".jobsTr());
        }break;
        /// 手机号码不存在
        case HTTPResponseCodePhoneNumberNotExist:{
            JobsLog(@"手机号码不存在");
            toastBy(@"手机号码不存在".jobsTr());
        }break;
        case HTTPResponseCodeAccountLocked:{
            JobsLog(@"账户被锁");
            toastBy(@"账户被锁，请联系系统管理员".jobsTr());
        }break;
        /// 服务器返500可能会有很多其他的业务场景定义
        case HTTPResponseCodeNoOK:{
            if(actionBlock) actionBlock(responseCode);
        }break;
        default:
            break;
    }
}
///【请求失败】请求失败的处理
-(JobsRetYTKBaseRequestByYTKBaseRequestBlock _Nonnull)jobsHandelFailure{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(YTKBaseRequest *request){
        @jobs_strongify(self)
        /// 解析+处理HTTPResponseCode
        JobsResponseModel *responseModel = JobsMapResponseModelBy(request);
        /// 打印请求体
        self.printURLSessionRequestMessage(request.requestTask);
        JobsLog(@"error = %@",request.error);
        JobsLog(@"responseModel = %@",responseModel);
        return request;
    };
}
/// 仅仅打印请求体：request.requestTask
-(jobsByYTKBaseRequestBlock _Nonnull)jobsHandelNoSuccess{
    @jobs_weakify(self)
    return ^(__kindof YTKBaseRequest *_Nonnull request){
        @jobs_strongify(self)
        JobsLog(@"%@",request.parameters);
        /// 打印请求体
        self.printURLSessionRequestMessage(request.requestTask);
    };
}

@end

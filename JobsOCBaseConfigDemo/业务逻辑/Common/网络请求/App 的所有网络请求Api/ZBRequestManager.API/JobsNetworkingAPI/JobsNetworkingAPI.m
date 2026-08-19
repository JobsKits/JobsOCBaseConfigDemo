//
//  JobsNetworkingAPI.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsNetworkingHeader.h"
/*
 * 只定义successBlock处理我们想要的最正确的答案,并向外抛出
 * 错误在内部处理不向外抛出
 */
@implementation JobsNetworkingAPI
/// 【只有Body参数、不需要错误回调】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(jobsByIDBlock _Nullable)successBlock{
    JobsLog(@"接口名：%@，请求参数打印 %@",requestApi,parameters);
    [NSObject methodName:requestApi.add(@":successBlock:")
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        if (parameters) data.add(parameters);
        if (successBlock) data.add(successBlock);
    })];
}
///【只有Body参数、需要错误回调的】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    JobsLog(@"接口名：%@，请求参数打印 %@",requestApi,parameters);
    [NSObject methodName:requestApi.add(@":successBlock:failureBlock:")
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        if (parameters) data.add(parameters);
        if (successBlock) data.add(successBlock);
        if (failureBlock) data.add(failureBlock);
    })];
}
#pragma mark —— 特殊的上传文件的网络请求
/// 上传【图片】文件的网络请求 POST
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadImagesParamArr:(NSArray *_Nullable)uploadImagesParamArr
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    [NSObject methodName:requestApi.add(@":uploadImageDatas:successBlock:failureBlock:")
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        if(uploadImagesParamArr) [data addObjectsFromArray:uploadImagesParamArr];
        if (successBlock) data.add(successBlock);
        if (failureBlock) data.add(failureBlock);
    })];
}
/// 上传【视频】文件的网络请求 POST
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadVideosParamArr:(NSArray *_Nullable)uploadVideosParamArr
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    [NSObject methodName:requestApi.add(@":uploadVideo:successBlock:failureBlock:")
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        if(uploadVideosParamArr) [data addObjectsFromArray:uploadVideosParamArr];
        if (successBlock) data.add(successBlock);
        if (failureBlock) data.add(failureBlock);
    })];
}
/// 请求成功的处理代码
+(void)networkingSuccessHandleWithData:(JobsResponseModel *_Nullable)responseObject
                               request:(ZBURLRequest *_Nullable)request
                          successBlock:(jobsByIDBlock _Nullable)successBlock
                          failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    if ([responseObject isKindOfClass:JobsResponseModel.class]) {
        // 公共请求错误直接抛出
        if (responseObject.code == HTTPResponseCodeSuccess) {
            JobsLog(@"请求成功");
            if (successBlock) successBlock(responseObject);
        }else{// 请求成功但是因为未登录、被踢线下等涉及到用户token的原因导致的失败
            JobsNetworkingAPI.handleError(responseObject);
            if (failureBlock) failureBlock(responseObject);
        }
    }else JobsLog(@"responseObject 不是 JobsResponseModel类型");
}
#pragma mark —— 错误处理
+(jobsByIDBlock _Nonnull)handleError{
    return ^(id _Nullable error){
        if ([error isKindOfClass:NSError.class]) {
            NSError *err = (NSError *)error;
            JobsLog(@"%@",err.description);
            self.jobsToastErrMsg(err.description);
        }else if ([error isKindOfClass:JobsResponseModel.class]){
            JobsResponseModel *responseModel = (JobsResponseModel *)error;
            JobsLog(@"code = %lu",(unsigned long)responseModel.code);
            switch (responseModel.code) {
                /// 服务器异常
                case HTTPResponseCodeServeError:{
                    self.jobsToastErrMsg(@"服务器异常".jobsTr());
                }break;
                /// 令牌不能为空
                case HTTPResponseCodeNoToken:{
                    self.jobsToastErrMsg(@"令牌不能为空".jobsTr());
                }break;
                /// 登录失败：账密错误
                case HTTPResponseCodeLoginFailed:{
                    self.jobsToastErrMsg(@"登录失败：账密错误".jobsTr());
                }break;
                /// 登录已过期，请重新登录
                case HTTPResponseCodeTokenExpire:{
                    JobsPostNotification(退出登录成功,@(NO));
                    self.jobsToastErrMsg(@"登录已过期，请重新登录".jobsTr());
                }break;
                /// 授权失败
                case HTTPResponseCodeAuthorizationFailure:{
                    self.jobsToastErrMsg(@"授权失败".jobsTr());
                }break;
                /// 限定时间内超过请求次数
                case HTTPResponseCodeLeakTime:{
                    self.jobsToastErrMsg(@"限定时间内超过请求次数".jobsTr());
                }break;
                /// 风险操作
                case HTTPResponseCodeRiskOperation:{
                    self.jobsToastErrMsg(@"风险操作".jobsTr());
                }break;
                /// 未设置交易密码
                case HTTPResponseCodeNoSettingTransactionPassword:{
                    self.jobsToastErrMsg(@"未设置交易密码".jobsTr());
                }break;
                /// 账号已在其他设备登录
                case HTTPResponseCodeOffline:{
                    self.jobsToastErrMsg(@"账号已在其他设备登录t".jobsTr());
                }break;
                /// 未匹配已知分支时执行兜底处理
                default:{
                    if ([error isKindOfClass:JobsResponseModel.class]) {
                        JobsResponseModel *model = (JobsResponseModel *)error;
                        self.jobsToastErrMsg(model.msg);
                    }
                }break;
            }
        }else return;
    };
}

@end

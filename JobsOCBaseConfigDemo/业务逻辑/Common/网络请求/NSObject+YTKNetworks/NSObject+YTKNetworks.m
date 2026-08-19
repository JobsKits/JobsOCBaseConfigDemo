//
//  NSObject+YTKNetworks.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+YTKNetworks.h"

@implementation NSObject (YTKNetworks)
#pragma mark —— 示例代码
/// 普通的单个请求
/// 多请求の同步请求
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
#pragma mark —— YTKChainRequestDelegate
-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    ((((JobsYTKChainSuccessBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(chainRequestFinished)))(self, @selector(chainRequestFinished))))(chainRequest);
}
-(void)chainRequestFailed:(YTKChainRequest *)chainRequest
        failedBaseRequest:(YTKBaseRequest *)request{
    JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
    self.jobsHandelNoSuccess(request);
    JobsLog(@"请求失败");
}
#pragma mark —— 查询广告列表-支持游客：APP首页右下3Banner【GET】
#pragma mark —— 用户登出【POST】
#pragma mark —— 存款优惠活动信息【POST】
-(void)depositDiscountActivityRecordByURLParameters:(NSString *_Nullable)urlParameters
                                       successBlock:(jobsByYTKChainRequestBlock _Nullable)successBlock{
    FM_GetKYCInfo_api *api = FM_GetKYCInfo_api.new;
    api.byURLParameters(urlParameters);/// 添加URL参数
    api.byBodyParameters(nil); /// 添加Body参数
    api.byHeaderParameters(nil); /// 添加Header参数
    YTKChainRequest *chainReq = YTKChainRequest.new;
    [chainReq addRequest:api
                callback:^(YTKChainRequest *chainRequest,
                           YTKBaseRequest *baseRequest) {
        FM_GetKYCInfo_api *result = (FM_GetKYCInfo_api *)baseRequest;
        /// 在链式请求中，下一个请求的参数来源于上一个请求的结果
        [chainRequest addRequest:FM_getDepositDiscountActivityRecord_api.new.byURLParameters(@"?kyc=".add(result.kyc)).byBodyParameters(nil)
                        callback:nil];
    }];
    chainReq.byDelegate(self);
    if(successBlock) successBlock(chainReq);
    chainReq.start;// start to send request
}
/// 上传KYC的图片@POST
-(void)uploadKYCImage:(NSData *)image
         successBlock:(jobsByResponseModelBlock _Nullable)successBlock{
    @jobs_weakify(self)
    [FM_kyc_image_upload_api.new
        .initBy(jobsMakeFileModel(^(__kindof JobsFileModel * _Nullable model) {
            model.byFile(image);
        })).handleErr() startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            @jobs_strongify(self)
            JobsResponseModel *responseModel = JobsMapResponseModelBy(request);
            JobsLog(@"");
            if(successBlock) successBlock(responseModel);
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            @jobs_strongify(self)
            JobsLog(@"");
    }];
}

@end

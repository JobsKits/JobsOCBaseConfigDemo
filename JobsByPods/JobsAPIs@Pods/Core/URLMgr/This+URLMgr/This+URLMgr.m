//
//  This+URLMgr.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "This+URLMgr.h"
#import <JobsAPIs/NSString+URL.h>

@implementation This (URLMgr)
#pragma mark —— BaseURL
+(NSString *)BaseUrl{
    switch (NetworkingEnvir()) {
        /// 处理 JobsNetworkingEnvir_Dev 分支
        case JobsNetworkingEnvir_Dev:{
            /// 开发环境
            return @"www.sports5555.com".byHttps;
        }break;
        /// 处理 JobsNetworkingEnvir_Test 分支
        case JobsNetworkingEnvir_Test:{
            /// 测试环境
            return @"".byHttps;
        }break;
        /// 处理 JobsNetworkingEnvir_UAT 分支
        case JobsNetworkingEnvir_UAT:{
            /// UAT环境
            return @"bsports.net.ph".byHttps;
        }break;
        /// 处理 JobsNetworkingEnvir_Product 分支
        case JobsNetworkingEnvir_Product:{
            /// 生产环境
            return @"bsports.ph".byHttps;
        }break;
        /// 未匹配已知分支时执行兜底处理
        default:
            return @"".byHttps;
            break;
    }
}

+(NSString *)BaseUrl_Image{
    switch (NetworkingEnvir()) {
        /// 处理 JobsNetworkingEnvir_Dev 分支
        case JobsNetworkingEnvir_Dev:{
            /// 开发环境
            return @"img.sports5555.com".byHttps;
        }break;
        /// 处理 JobsNetworkingEnvir_Test 分支
        case JobsNetworkingEnvir_Test:{
            /// 测试环境
            return @"".urlProtect;
        }break;
        /// 处理 JobsNetworkingEnvir_UAT 分支
        case JobsNetworkingEnvir_UAT:{
            /// UAT环境
            return @"minio.bzpicx.com".byHttps;
        }break;
        /// 处理 JobsNetworkingEnvir_Product 分支
        case JobsNetworkingEnvir_Product:{
            /// 生产环境
            return @"p.bzpicx.com".byHttps;
        }break;
        /// 未匹配已知分支时执行兜底处理
        default:
            return @"p.bzpicx.com".byHttps;
            break;
    }
}

+(NSString *)BaseUrl_H5{
    switch (NetworkingEnvir()) {
        /// 处理 JobsNetworkingEnvir_Dev 分支
        case JobsNetworkingEnvir_Dev:{
            /// 开发环境
            return @"".byHttps;
        }break;
        /// 处理 JobsNetworkingEnvir_Test 分支
        case JobsNetworkingEnvir_Test:{
            /// 测试环境
            return @"".byHttps;
        }break;
        /// 处理 JobsNetworkingEnvir_UAT 分支
        case JobsNetworkingEnvir_UAT:{
            /// UAT环境
            return @"".byHttps;
        }break;
        /// 处理 JobsNetworkingEnvir_Product 分支
        case JobsNetworkingEnvir_Product:{
            /// 生产环境
            return @"".byHttps;
        }break;
        /// 未匹配已知分支时执行兜底处理
        default:
            return @"".byHttps;
            break;
    }
}
#pragma mark —— App接口示例
+(URLManagerModel *)appInterfaceTesting{
    return jobsMakeURLManagerModel(^(__kindof URLManagerModel * _Nullable data) {
        data.byUrl(@"http://172.24.135.14:8000/Downloads/CommentData.json") /// @"http://172.24.135.12/CommentData.json"
            .byFuncName(NSStringFromSelector(_cmd));
    });
}

@end

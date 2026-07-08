//
//  JobsDefineURLs.h
//  JobsOCDefs
//
//  Created by Jobs on 2026/5/16.
//

#ifndef JobsDefineURLs_h
#define JobsDefineURLs_h
/// 域名列表：
/// https://docs.google.com/spreadsheets/d/1Iijk6KwNVXMhuu5VeQXaWZhXogKnuj1Ms1V6dWmz_ik/edit?gid=0#gid=0
/// H5接口文档汇总：
/// https://docs.google.com/spreadsheets/d/19VaLjdQpYvGk_Gcfng5KhRXa9MxALuKGpNy9_3qGh4A/edit?gid=833582610#gid=833582610
/// 体育接口文档：
/// sports-fund:                 http://18.162.73.145:18193/doc.html ✅
/// sports-data-sync:        http://18.162.73.145:18200/api/data/sync/doc.html
/// sports-user:                 http://18.162.73.145:18093/doc.html ✅
/// sports-operation:         http://18.162.73.145:18099/doc.html ✅
/// sports-promotion:        http://18.162.73.145:18100/api/promotion/doc.html
/// sports-risk:                   http://18.162.73.145:19205/doc.html#/home ✅
/// sports-oms:                  http://18.162.73.145:19201/doc.html#/home ✅
/// sports-agent:                http://18.162.73.145:18400/api/agent/doc.html
/// sports-game:                http://18.162.73.145:18097/doc.html ✅

/// http://18.162.73.145:18093/doc.html#/default （URLManager@1）
/// http://18.162.73.145:18100/api/promotion/doc.html#/default （URLManager@2）
/// http://18.162.73.145:18097/doc.html （URLManager@3）
/// http://18.162.73.145:18099/doc.html#/default （URLManager@4）
/// http://18.162.73.145:18193/doc.html#/default/ （URLManager@5）
/// http://18.162.73.145:19201/doc.html#/home （URLManager@6）

/// 接口文档会因为后端开发而同步，使用时务必进行确认
NS_INLINE JobsNetworkingEnvir NetworkingEnvir(void) {
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_Dev;// 开发环境
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_Test;// 测试环境
    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_UAT;// UAT环境
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_Product;// 生产环境
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_Undefined;// 未定义的网络环境
    return _networkingEnvir;
}

NS_INLINE JobsNetworkingEnvir networkingEnvir(NSInteger data) {
    static JobsNetworkingEnvir _networkingEnvir = JobsNetworkingEnvir_Undefined; // 静态变量仅初始化一次
    switch (data) {
        case JobsNetworkingEnvir_Dev:
            _networkingEnvir = JobsNetworkingEnvir_Dev; // 开发环境
            break;
        case JobsNetworkingEnvir_Test:
            _networkingEnvir = JobsNetworkingEnvir_UAT; // 测试环境
            break;
        case JobsNetworkingEnvir_UAT:
            _networkingEnvir = JobsNetworkingEnvir_UAT; // UAT环境
            break;
        case JobsNetworkingEnvir_Product:
            _networkingEnvir = JobsNetworkingEnvir_Product; // 生产环境
            break;
        default:
            _networkingEnvir = JobsNetworkingEnvir_Undefined; // 未定义的网络环境
            break;
    };return _networkingEnvir;
}

#endif /* JobsDefineURLs_h */

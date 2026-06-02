//
//  FM_promotion_advertise_api.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FM_promotion_advertise_api.h"

@implementation FM_promotion_advertise_api
/// 请求的完整URL：查询广告列表-支持游客：APP首页右下3Banner【GET】
-(NSString *)requestUrl{
    return This.BaseUrl.add(self.get_promotion_advertise_infoP_list_appIndex.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

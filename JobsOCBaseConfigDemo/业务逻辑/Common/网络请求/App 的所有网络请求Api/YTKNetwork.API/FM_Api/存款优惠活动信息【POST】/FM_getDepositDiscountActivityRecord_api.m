//
//  FM_getDepositDiscountActivityRecord_api.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FM_getDepositDiscountActivityRecord_api.h"

@implementation FM_getDepositDiscountActivityRecord_api
/// 请求的完整URL：存款优惠活动信息【POST】
-(NSString *)requestUrl{
    return This.BaseUrl
        .add(self.post_promotion_api_client_activity_getDepositDiscountActivityRecord.url)
        .add(self.urlParameters);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end

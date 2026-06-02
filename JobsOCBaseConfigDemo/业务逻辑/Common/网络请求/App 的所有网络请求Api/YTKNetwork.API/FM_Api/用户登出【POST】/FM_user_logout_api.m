//
//  FM_user_logout_api.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FM_user_logout_api.h"

@implementation FM_user_logout_api
/// 请求的完整URL：用户登出【POST】
-(NSString *)requestUrl{
    return This.BaseUrl.add(self.post_user_auth_logout.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end

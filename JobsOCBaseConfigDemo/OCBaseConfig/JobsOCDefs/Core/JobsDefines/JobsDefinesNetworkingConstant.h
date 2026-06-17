//
//  JobsDefinesNetworkingConstant.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#ifndef JobsDefinesNetworkingConstant_h
#define JobsDefinesNetworkingConstant_h
/// 服务器相关
#ifndef NetworkingConstant_h
#define NetworkingConstant_h
/// http://
#ifndef HTTPHeader
#define HTTPHeader @"http://"
#endif
/// https://
#ifndef HTTPSHeader
#define HTTPSHeader @"https://"
#endif
/// BaseURL
#ifndef SERVER_URL
#define SERVER_URL NSObject.BaseUrl
#endif /* SERVER_URL */
/// Token
#ifndef HTTPRequestTokenKey
#define HTTPRequestTokenKey @"token"
#endif /* HTTPRequestTokenKey */
/// 签名：key
#ifndef HTTPServiceSignKey
#define HTTPServiceSignKey @"sign"
#endif /* HTTPServiceSignKey */
/// 私钥：key
#ifndef HTTPServiceKey
#define HTTPServiceKey @"privatekey"
#endif /* HTTPServiceKey */
/// 私钥：Value
#ifndef HTTPServiceKeyValue
#define HTTPServiceKeyValue @"/** 你的私钥 **/"
#endif /* HTTPServiceKeyValue */
/// 状态码：key
#ifndef HTTPServiceResponseCodeKey
#define HTTPServiceResponseCodeKey @"code"
#endif /* HTTPServiceResponseCodeKey */
/// 消息：key
#ifndef HTTPServiceResponseMsgKey
#define HTTPServiceResponseMsgKey @"msg"
#endif /* HTTPServiceResponseMsgKey */
/// 数据：data
#ifndef HTTPServiceResponseDataKey
#define HTTPServiceResponseDataKey @"data"
#endif /* HTTPServiceResponseDataKey */

#ifndef JobsResponseData
#define JobsResponseData JobsMapResponseModelBy(request).data
#endif /*JobsResponseData*/

#ifndef JobsSolveData
#define JobsSolveData(DATA) DATA.byData(JobsResponseData)
#endif /*JobsSolveData*/

#endif /* NetworkingConstant_h */
#endif /* JobsDefinesNetworkingConstant_h */

//
//  BaseRequest.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2022/7/10.
//

#import "JobsBlock.h"
#import "YTKCustomBaseRequestProtocol.h"
#import "JobsDefineConstString.h"
#import "NSMutableDictionary+Extra.h"
#import "YTKRequest+Extra.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

NS_ASSUME_NONNULL_BEGIN
@class BaseRequest;   // 🔴 关键：先声明有这个类
/// 用于普通数据的交互
@interface BaseRequest <__covariant T:BaseRequest *> : YTKRequest <YTKCustomBaseRequestProtocol>

+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByBodyParameters; // 直接调用，后面不能拼byURLParameters
+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByURLParameters;  // 直接调用，后面不能拼byBodyParameters
/// 添加URL参数
-(T (^)(id _Nullable))byURLParameters;
/// 添加Body参数
-(T (^)(NSDictionary * _Nullable))byBodyParameters;
/// 添加Header参数
-(T (^)(NSDictionary * _Nullable))byHeaderParameters;
-(T (^)(void))handleErr;

@end

NS_ASSUME_NONNULL_END

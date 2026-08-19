//
//  BaseRequest.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseRequest.h"

#import <YTKNetworkExtra/NSMutableDictionary+Extra.h>

@interface BaseRequest ()

@end

@implementation BaseRequest
YTKCustomBaseRequestProtocol_synthesize
/// 直接调用，后面不能拼byURLParameters
+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByBodyParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initByBodyParameters:data];
    };
}
/// 直接调用，后面不能拼byBodyParameters
+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByURLParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initByURLParameters:data];
    };
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wmismatched-return-types"
#pragma mark —— 加请求头参数
-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.customHTTPHeader.addByDic(data);
        JobsLog(@"请求头: %@", self.requestHeaderFieldValueDictionary);
        return self;
    };
}
#pragma mark —— 加Body参数
-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byBodyParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nonnull data){
        @jobs_strongify(self)
        if(data) self.parameters = data.mutableCopy;
        return self;
    };
}
#pragma mark —— 加URL参数
-(JobsRetYTKBaseRequestByIDBlock _Nonnull)byURLParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(id _Nullable data){
        @jobs_strongify(self)
        self.urlParameters = data;
        return self;
    };
}
#pragma mark —— 错误打印
-(JobsRetYTKBaseRequestByVoidBlock _Nonnull)handleErr{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(){
        @jobs_strongify(self)
        JobsLog(@"打印请求头: %@", self.requestHeaderFieldValueDictionary);
        if ([self loadCacheWithError:nil]) {
            NSDictionary *json = self.responseJSONObject;
//            JobsLog(@"可以 = %@", api.parameters);
//            JobsLog(@"打断点 = %@", [json decodeUnicodeLog]);
        };return self;
    };
}
#pragma clang diagnostic pop
#pragma mark —— 一些私有方法
-(instancetype _Nullable)initByBodyParameters:(NSDictionary *_Nonnull)bodyParameters{
    if (self = [super init]) {
        if(bodyParameters) self.parameters = bodyParameters.mutableCopy;
    };return self;
}

-(instancetype _Nullable)initByURLParameters:(id _Nullable)urlParameters{
    if (self = [super init]) {
        self.urlParameters = urlParameters;
    };return self;
}
/// Body 参数（GET 请求不可用）
-(id _Nullable)requestArgument{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseRequest.class, @selector(jobsRequestArgument)))(self, @selector(jobsRequestArgument));
    return action ? action() : nil;
}

-(JobsRetIDByVoidBlock _Nonnull)jobsRequestArgument{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.parameters;
    };
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    JobsRetYTKRequestMethodByVoidBlock action = ((JobsRetYTKRequestMethodByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseRequest.class, @selector(jobsRequestMethod)))(self, @selector(jobsRequestMethod));
    return action ? action() : (YTKRequestMethod){0};
}

-(JobsRetYTKRequestMethodByVoidBlock _Nonnull)jobsRequestMethod{
    @jobs_weakify(self)
    return ^YTKRequestMethod{
        @jobs_strongify(self)
        if (!self) return (YTKRequestMethod){0};
        return YTKRequestMethodPOST;
    };
}
/// 限定接收到的字段类型，如果不匹配则外层block走Failure
-(id)jsonValidator{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseRequest.class, @selector(jobsJsonValidator)))(self, @selector(jobsJsonValidator));
    return action ? action() : nil;
}

-(JobsRetIDByVoidBlock _Nonnull)jobsJsonValidator{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return nil;
    };
}

-(NSInteger)cacheTimeInSeconds{
    JobsRetNSIntegerByVoidBlock action = ((JobsRetNSIntegerByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseRequest.class, @selector(jobsCacheTimeInSeconds)))(self, @selector(jobsCacheTimeInSeconds));
    return action ? action() : (NSInteger){0};
}

-(JobsRetNSIntegerByVoidBlock _Nonnull)jobsCacheTimeInSeconds{
    @jobs_weakify(self)
    return ^NSInteger{
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 60 * 3;
    };
}

-(NSMutableDictionary *)customHTTPHeader{
    JobsRetMutableDicByVoidBlock action = ((JobsRetMutableDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseRequest.class, @selector(jobsCustomHTTPHeader)))(self, @selector(jobsCustomHTTPHeader));
    return action ? action() : nil;
}

-(JobsRetMutableDicByVoidBlock _Nonnull)jobsCustomHTTPHeader{
    @jobs_weakify(self)
    return ^NSMutableDictionary *{
        @jobs_strongify(self)
        if (!self) return nil;
        if(!_customHTTPHeader){
            /// 在这里添加你想要的 HTTP header
            @jobs_weakify(self)
            _customHTTPHeader = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable headers) {
                @jobs_strongify(self)
                /// 设置 Content-Type
                [headers setValue:APP_JSON
                           forKey:ContentType];
                /// 设置 Authorization
                id doorModel = nil;
                @try {
                    doorModel = [self valueForKey:@"doorModel"];
                } @catch (__unused NSException *exception) {}
                NSString *token = nil;
                if (doorModel) {
                    @try {
                        token = [doorModel valueForKey:@"token"];
                    } @catch (__unused NSException *exception) {}
                }
                if (token.length > 0) {
                    [headers setValue:token forKey:Authorization];
                }
                /// 请求的语言环境
        //        switch (self.currentLanguageType) {
        //            case HTTPRequestHeaderLanguageEn:{
        //                headers[@"language"] = @"en_US";
        //            }break;
        //            case HTTPRequestHeaderLanguageCN:{
        //                headers[@"language"] = @"zh_CN";
        //            }break;
        //            default:
        //                break;
        //        }
            });
        };return _customHTTPHeader;
    };
}
#pragma mark —— 在链式请求中，下一个请求的参数来源于上一个请求的结果
//-(NSString *_Nonnull)userId{
//    return [[self.responseJSONObject objectForKey:@"userId"] stringValue] ? : @"".jobsTr();
//}
#pragma mark —— 复写 YTKBaseRequest 方法
/// 设置自定义的 HTTP Header
-(NSMutableDictionary *)requestHeaderFieldValueDictionary{
    JobsRetMutableDicByVoidBlock action = ((JobsRetMutableDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseRequest.class, @selector(jobsRequestHeaderFieldValueDictionary)))(self, @selector(jobsRequestHeaderFieldValueDictionary));
    return action ? action() : nil;
}

-(JobsRetMutableDicByVoidBlock _Nonnull)jobsRequestHeaderFieldValueDictionary{
    @jobs_weakify(self)
    return ^NSMutableDictionary *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.customHTTPHeader;
    };
}
/// 具体子类实现请求Api
//-(NSString *)requestUrl{
//    return [This.BaseUrl stringByAppendingString:self.membersLoginPOST.url];
//}
///
//- (NSURLRequest *)buildCustomUrlRequest {
//    NSError *parseError = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.parameters
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&parseError];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.requestUrl.url
//                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
//                                                       timeoutInterval:30];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPMethod:@"POST"];//POST请求
//    [request setHTTPBody:jsonData];//body 数据
//    return request;
//}
/// 如果当前请求是GET，下列方法不可用
//- (NSURLRequest *)buildCustomUrlRequest{
//    if(self.requestMethod == YTKRequestMethodGET) return nil;
//    NSError *parseError = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.parameters
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&parseError];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.requestUrl.jobsURL()
//                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
//                                                       timeoutInterval:30];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPMethod:@"GET"];//GET请求
//    [request setHTTPBody:jsonData];//body 数据
//    self.printRequestMessage(request);
//    JobsLog(@"");
//    return request;
//}
#pragma mark —— LazyLoad
-(NSMutableDictionary *)parameters{
    JobsRetMutableDicByVoidBlock action = ((JobsRetMutableDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseRequest.class, @selector(jobsParameters)))(self, @selector(jobsParameters));
    return action ? action() : nil;
}

-(JobsRetMutableDicByVoidBlock _Nonnull)jobsParameters{
    @jobs_weakify(self)
    return ^NSMutableDictionary *{
        @jobs_strongify(self)
        if (!self) return nil;
        if(!_parameters){
            _parameters = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            });
        };return _parameters;
    };
}

@end

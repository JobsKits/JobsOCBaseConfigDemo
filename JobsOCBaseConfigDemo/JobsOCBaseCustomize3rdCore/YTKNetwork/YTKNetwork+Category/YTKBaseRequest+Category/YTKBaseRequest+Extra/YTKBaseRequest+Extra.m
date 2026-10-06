//
//  YTKBaseRequest+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "YTKBaseRequest+Extra.h"

#import "NSURL+Extra.h"
#import "NSObject+Extra.h"

static char JobsYTKResponseSourceKey;

@implementation YTKBaseRequest (Extra)
-(JobsRetNSMutableURLRequestByjobsByMutableURLRequestBlockBlock _Nonnull)jobsMakeRequestByBlock{
    @jobs_weakify(self)
    return ^NSMutableURLRequest *(jobsByMutableURLRequestBlock _Nullable block){
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.requestUrl.length < 1) return nil;
        NSURL *url = [NSURL URLWithString:[YTKNetworkAgent.sharedAgent buildRequestUrl:self]];
        if (!url) return nil;
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                          timeoutInterval:self.requestTimeoutInterval];
        request.allowsCellularAccess = self.allowsCellularAccess;
        if (block) block(request);
        return request;
    };
}
#pragma mark —— 加URL参数
+(JobsRetYTKBaseRequestByIDBlock _Nonnull)ByURLParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        YTKBaseRequest *instance = self.class.new;
        if ([instance respondsToSelector:@selector(byURLParameters)]) {
            instance.byURLParameters(data);
        };return instance;
    };
}

-(JobsRetYTKBaseRequestByIDBlock _Nonnull)byURLParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(id _Nullable data){
        @jobs_strongify(self)
        self.urlParameters = data;
        return self;
    };
}
#pragma mark —— 加Body参数
+(JobsRetYTKBaseRequestByIDBlock _Nonnull)ByBodyParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        YTKBaseRequest *instance = self.class.new;
        if ([instance respondsToSelector:@selector(byBodyParameters)]) {
            instance.byBodyParameters(data);
        };return instance;
    };
}

-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byBodyParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nonnull data){
        @jobs_strongify(self)
        if(data) self.parameters = data.mutableCopy;
        return self;
    };
}
#pragma mark —— 加请求头参数
+(JobsRetYTKBaseRequestByIDBlock _Nonnull)ByHeaderParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        YTKBaseRequest *instance = self.class.new;
        if ([instance respondsToSelector:@selector(byHeaderParameters)]) {
            instance.byHeaderParameters(data);
        };return instance;
    };
}

-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        if ([data isKindOfClass:NSDictionary.class]) {
            NSMutableDictionary *headers = self.customHTTPHeader ?: jobsMakeMutDic(nil);
            [headers addEntriesFromDictionary:data];
            self.customHTTPHeader = headers;
        }
        return self;
    };
}
#pragma mark —— Prop_strong()JobsResponseModel *responseModel;
JobsKey(_responseModel)
@dynamic responseModel;
-(JobsResponseModel *)responseModel{
    JobsResponseModel *ResponseModel = Jobs_getAssociatedObject(_responseModel);
    id response = self.responseObject;
    id previous = objc_getAssociatedObject(self, &JobsYTKResponseSourceKey);
    if (response != previous || (!ResponseModel && response)) {
        ResponseModel = response ? JobsResponseModel.byData(response) : nil;
            Jobs_setAssociatedRETAIN_NONATOMIC(_responseModel, ResponseModel);
        objc_setAssociatedObject(self, &JobsYTKResponseSourceKey, response, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return ResponseModel;
}

-(void)setResponseModel:(JobsResponseModel *)responseModel{
    Jobs_setAssociatedRETAIN_NONATOMIC(_responseModel, responseModel)
    objc_setAssociatedObject(self, &JobsYTKResponseSourceKey, self.responseObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark —— @property(nonatomic,strong,nullable)id urlParameters;
JobsKey(_urlParameters)
@dynamic urlParameters;
-(id)urlParameters{
    return Jobs_getAssociatedObject(_urlParameters);
}

-(void)setUrlParameters:(id)urlParameters{
    Jobs_setAssociatedRETAIN_NONATOMIC(_urlParameters, urlParameters)
}
#pragma mark —— @property(nonatomic,copy,nullable)NSMutableDictionary *parameters;
JobsKey(_parameters)
@dynamic parameters;
-(NSMutableDictionary *)parameters{
    return Jobs_getAssociatedObject(_parameters);
}

-(void)setParameters:(NSMutableDictionary *)parameters{
    Jobs_setAssociatedRETAIN_NONATOMIC(_parameters, parameters.mutableCopy)
}

#pragma mark —— @property(nonatomic,copy,nullable)NSMutableDictionary *customHTTPHeader;
JobsKey(_customHTTPHeader)
@dynamic customHTTPHeader;
-(NSMutableDictionary *)customHTTPHeader{
    return Jobs_getAssociatedObject(_customHTTPHeader);
}

-(void)setCustomHTTPHeader:(NSMutableDictionary *)customHTTPHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_customHTTPHeader, customHTTPHeader.mutableCopy)
}

@end

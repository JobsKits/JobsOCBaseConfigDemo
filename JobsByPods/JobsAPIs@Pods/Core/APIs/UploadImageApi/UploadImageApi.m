//
//  UploadImageApi.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UploadImageApi.h"

#import <JobsAPIs/NSString+Extra.h>
#import <JobsAPIs/NSMutableDictionary+Extra.h>

@interface UploadImageApi ()

Prop_strong()UIImage *image;

@end

@implementation UploadImageApi
+(JobsRetIDByImageBlock _Nonnull)initByImage{
    @jobs_weakify(self)
    return ^id(UIImage *_Nullable data){
        @jobs_strongify(self)
        UploadImageApi *api = [self.class new];
        return api.byImage(data);
    };
}

-(JobsRetIDByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^id(UIImage *image){
        @jobs_strongify(self)
        self.image = image;
        return self;
    };
}
/// 请求的完整URL：
-(NSString *)requestUrl {
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UploadImageApi.class, @selector(jobsRequestUrl)))(self, @selector(jobsRequestUrl));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsRequestUrl{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return This.jobsBaseUrl().add(@"/iphone/image/upload");
    };
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    JobsRetYTKRequestMethodByVoidBlock action = ((JobsRetYTKRequestMethodByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UploadImageApi.class, @selector(jobsRequestMethod)))(self, @selector(jobsRequestMethod));
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

-(AFConstructingBlock)constructingBodyBlock{
    @jobs_weakify(self)
    return ^(id<AFMultipartFormData> formData) {
        @jobs_strongify(self)
        NSData *data = UIImageJPEGRepresentation(self.image, 0.9);
        NSString *name = @"image";
        NSString *formKey = @"image";
        NSString *type = @"image/jpeg";
        [formData appendPartWithFileData:data
                                    name:formKey
                                fileName:name
                                mimeType:type];
    };
}

-(id)jsonValidator {
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UploadImageApi.class, @selector(jobsJsonValidator)))(self, @selector(jobsJsonValidator));
    return action ? action() : nil;
}

-(JobsRetIDByVoidBlock _Nonnull)jobsJsonValidator{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return @{@"imageId": NSString.class};
    };
}

-(JobsRetStrByVoidBlock _Nonnull)responseImageId {
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSDictionary *dict = self.responseJSONObject;
        return dict[@"imageId"];
    };
}

@end

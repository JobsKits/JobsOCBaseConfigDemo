//
//  BaseUploadFileRequest.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseUploadFileRequest.h"

@interface BaseUploadFileRequest ()

Prop_strong()JobsFileModel *fileModel;

@end

@implementation BaseUploadFileRequest
-(JobsRetRequestByFileModelBlock _Nonnull)initBy{
    @jobs_weakify(self)
    return ^__kindof BaseUploadFileRequest *_Nullable(__kindof JobsFileModel *_Nullable model){
        @jobs_strongify(self)
        self.fileModel = model;
        return self;
    };
}
/// 使用 HTTP 序列化方式
-(YTKRequestSerializerType)requestSerializerType{
    JobsRetYTKRequestSerializerTypeByVoidBlock action = ((JobsRetYTKRequestSerializerTypeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseUploadFileRequest.class, @selector(jobsRequestSerializerType)))(self, @selector(jobsRequestSerializerType));
    return action ? action() : (YTKRequestSerializerType){0};
}

-(JobsRetYTKRequestSerializerTypeByVoidBlock _Nonnull)jobsRequestSerializerType{
    @jobs_weakify(self)
    return ^YTKRequestSerializerType{
        @jobs_strongify(self)
        if (!self) return (YTKRequestSerializerType){0};
        return YTKRequestSerializerTypeHTTP;
    };
}

-(AFConstructingBlock)constructingBodyBlock {
    @jobs_weakify(self)
    return ^(id<AFMultipartFormData> formData) {
        @jobs_strongify(self)
        if (self.fileModel.file) {
            [formData appendPartWithFileData:self.fileModel.file
                                        name:@"file" /// 表单字段的名称，后端用来接收这个文件的参数名
                                    fileName:isValue(self.fileModel.fileName) ? self.fileModel.fileName : @"image.jpg" // 文件名
                                    mimeType:@"image/jpeg"]; // MIME 类型
        }
    };
}

@end

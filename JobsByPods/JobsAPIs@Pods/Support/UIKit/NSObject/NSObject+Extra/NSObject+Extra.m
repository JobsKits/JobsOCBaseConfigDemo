//
//  NSObject+Extra.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"
#import <JobsAPIs/NSURLRequest+Extra.h>
#import <JobsAPIs/NSData+Extra.h>
#import <JobsAPIs/JobsBaseApi.h>

@implementation NSObject (Extra)

-(URLManagerModel *_Nonnull)url:(NSString *_Nonnull)url funcName:(NSString *_Nonnull)funcName{
    return jobsMakeURLManagerModel(^(__kindof URLManagerModel * _Nullable data) {
        data.byUrl(url)
            .byFuncName(funcName);
    });
}

-(JobsRetDataByStrBlock _Nonnull)initByContentsOfFile{
    return ^NSData *_Nullable(__kindof NSString *_Nullable path){
        return NSData.dataByContentsOfFile(path);
    };
}

-(JobsRetIDByDataBlock _Nonnull)JSONkNilOptions{
    return ^id _Nullable(NSData *_Nullable data){
        if(data){
            NSError *error = nil;
            NSData *jsonData = [NSJSONSerialization JSONObjectWithData:data.copy
                                                               options:kNilOptions
                                                                 error:&error];
            if(error) JobsLog(@"%@",error.description);
            return jsonData;
        }else return nil;
    };
}

-(JobsRetIDByDataBlock _Nonnull)JSONReadingMutableContainers{
    return ^id _Nullable(NSData *_Nullable data){
        if(data){
            NSError *error = nil;
            NSData *jsonData = [NSJSONSerialization JSONObjectWithData:data.copy
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&error];
            if(error) JobsLog(@"%@",error.description);
            return jsonData;
        }else return nil;
    };
}

-(JobsRetDataByDicBlock _Nonnull)JSONWritingPrettyPrinted{
    return ^NSData *_Nullable(__kindof NSDictionary *_Nullable data){
        if(data){
            NSError *error = nil;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data.copy
                                                               options:NSJSONWritingPrettyPrinted
                                                                 error:&error];
            if(error) JobsLog(@"%@",error.description);
            return jsonData;
        }else return nil;
    };
}
/// JSON对象转NSData
-(JobsRetDataByIDBlock _Nonnull)dataByJSONObject{
    return ^NSData *_Nullable(id _Nullable data){
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        if(error) JobsLog(@"error = %@",error);
        return jsonData;
    };
}
/// Tips封装
-(jobsByIDBlock _Nonnull)tipsByApi{
    @jobs_weakify(self)
    return ^(JobsBaseApi *_Nullable api){
        @jobs_strongify(self)
        api.animatingText = @"正在加载".tr;
        if([self isKindOfClass:UIView.class]){
            UIView *view = (UIView *)self;
            api.animatingView = view;
        }
        if([self isKindOfClass:UIViewController.class]){
            UIViewController *vc = (UIViewController *)self;
            api.animatingView = vc.view;
        }
    };
}
#ifdef DEBUG
/// 打印请求体
-(JobsReturnURLRequestByURLSessionTaskBlock _Nullable)printURLSessionRequestMessage{
    return ^__kindof NSMutableURLRequest *_Nullable(__kindof NSURLSessionDataTask *_Nullable task) {
        if(!task){JobsLog(@"NSURLSessionDataTask *task 为空,请检查");return nil;}
        return task.originalRequest.print();
    };
}
/// 打印URLRequest
-(JobsReturnMutableURLRequestByURLRequestBlock _Nullable)printRequestMessage{
    return ^__kindof NSMutableURLRequest *_Nullable(__kindof NSURLRequest *_Nullable data) {
        if (!data) {JobsLog(@"NSURLRequest *data 为空,请检查");return nil;}
        return data.print();
    };
}
#endif

@end

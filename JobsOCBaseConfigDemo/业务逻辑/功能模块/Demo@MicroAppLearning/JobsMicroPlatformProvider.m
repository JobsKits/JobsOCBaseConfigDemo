//
//  JobsMicroPlatformProvider.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroPlatformProvider.h"

@implementation JobsMicroPlatformProvider

+(JobsRetNSArrayNSDictionaryNSStringIDByVoidBlock _Nonnull)localCatalog{
    return ^NSArray<NSDictionary<NSString *, id> *> *{
        return @[
            @{@"appId":@"learning.bridge", @"name":@"微应用与 Bridge", @"version":@"1.0"},
            @{@"appId":@"learning.sandbox", @"name":@"沙箱文件实验", @"version":@"1.0"},
            @{@"appId":@"learning.pwa", @"name":@"PWA 离线资源", @"version":@"1.0"}
        ];
    };
}

-(void)fetchCatalogFromURL:(NSURL *)URL completion:(jobsByIDBlock)completion{
    // 服务端优先，API 未部署 / 超时 / schema 错误则本地演示；后续刷新自动再次请求 API。
    NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:1.5];
    [[NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        id json = data ? [NSJSONSerialization JSONObjectWithData:data options:0 error:nil] : nil;
        NSArray *apps = [json isKindOfClass:NSDictionary.class] && [json[@"apps"] isKindOfClass:NSArray.class] ? json[@"apps"] : nil;
        BOOL valid = [response isKindOfClass:NSHTTPURLResponse.class] && ((NSHTTPURLResponse *)response).statusCode >= 200 && ((NSHTTPURLResponse *)response).statusCode < 300 && apps != nil;
        for (id app in apps) {
            if (![app isKindOfClass:NSDictionary.class] || ![app[@"appId"] isKindOfClass:NSString.class] || ![app[@"name"] isKindOfClass:NSString.class] || ![app[@"version"] isKindOfClass:NSString.class]) {
                valid = NO;
                break;
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(@{@"apps":valid ? apps : JobsMicroPlatformProvider.localCatalog(), @"source":valid ? @"服务端 API" : @"本地教学目录（API 未部署、超时或响应无效）"});
        });
    }] resume];
}

@end

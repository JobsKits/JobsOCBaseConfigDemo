//
//  WKWebsiteDataStore+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "WKWebsiteDataStore+Extra.h"

@implementation WKWebsiteDataStore (Extra)

- (jobsByVoidBlock)clean {
    return ^{
        // 标准写法：不依赖链式宏/JobsLog，保证 Pod 边界内可编译
        NSSet<NSString *> *types = [NSSet setWithObjects:
                                   WKWebsiteDataTypeDiskCache,
                                   WKWebsiteDataTypeMemoryCache,
                                   WKWebsiteDataTypeCookies,
                                   nil];
        [WKWebsiteDataStore.defaultDataStore removeDataOfTypes:types
                                                modifiedSince:NSDate.distantPast
                                            completionHandler:^{
            NSLog(@"[WKWebsiteDataStore+Extra] 清理完成");
        }];
    };
}

@end

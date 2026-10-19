//
//  JobsMicroPlatformProvider.h
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroLearningBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

/// 平台能力放在协议后面，VC 只依赖目录和路由；可替换为商用 mPaaS 适配器。
@protocol JobsMicroPlatformProviding <NSObject>

-(void)fetchCatalogFromURL:(NSURL *)URL completion:(jobsByIDBlock)completion;

@end

@interface JobsMicroPlatformProvider : NSObject <JobsMicroPlatformProviding>

+(JobsRetNSArrayNSDictionaryNSStringIDByVoidBlock _Nonnull)localCatalog;

@end

NS_ASSUME_NONNULL_END

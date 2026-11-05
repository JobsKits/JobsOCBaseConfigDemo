//
//  JobsMicroSandboxStore.h
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// OS 沙箱隔离 App；这里按 appID 再划分宿主内目录，是逻辑租户边界而非新进程安全沙箱。
@interface JobsMicroSandboxStore : NSObject

-(instancetype)initWithBaseDirectory:(NSURL *)baseDirectory;

-(nullable NSURL *)URLForApplication:(NSString *)appID fileName:(NSString *)fileName error:(NSError **)error;
-(BOOL)writeText:(NSString *)text application:(NSString *)appID fileName:(NSString *)fileName error:(NSError **)error;
-(nullable NSString *)readTextForApplication:(NSString *)appID fileName:(NSString *)fileName error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END

//
//  AppDelegate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"
#import "AppDelegate+TabBarCtr.h"
#import "AppDelegate+Func.h"
#import "AppDelegate+UIApplicationDelegate.h"
//#import "AppDelegate+UISceneSessionLifeCycle.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface AppDelegate ()

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN AppDelegate
@interface AppDelegate (JobsPropertyDSLSetterAutogen_e280067e5f)
-(void)setWindow:(UIWindow * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END AppDelegate

@implementation AppDelegate

static AppDelegate *AppDelegateInstance = nil;
static dispatch_once_t AppDelegateOnceToken;
-(JobsRetAppDelegateByWindowBlock _Nonnull)jobsSetWindow{
    @jobs_weakify(self)
    return ^AppDelegate *_Nullable(UIWindow *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.byWindow(data);
        return self;
    };
}

+(instancetype)sharedManager{
    JobsRetAppDelegateByVoidBlock action = ((JobsRetAppDelegateByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(AppDelegate.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetAppDelegateByVoidBlock _Nonnull)jobsSharedManager{
    return ^AppDelegate *{
        dispatch_once(&AppDelegateOnceToken, ^{
            AppDelegateInstance = [[super allocWithZone:NULL] init];
        });return AppDelegateInstance;
    };
}

+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(AppDelegate.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        AppDelegateInstance = nil;
        AppDelegateOnceToken = 0;
    };
}
/// 防止外部使用 alloc/init 等创建新实例
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return (((JobsRetAppDelegateByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(AppDelegate.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager)))();
}
/// 防止外部调用copy
- (instancetype)copyWithZone:(NSZone *)zone {
    return self;
}
/// 防止外部调用mutableCopy
- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
//        self.simulateUserData();
    };return self;
}
#pragma mark —— 一些私有方法
/// 模拟用户数据
-(jobsByVoidBlock _Nonnull)simulateUserData{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.saveUserInfo(jobsMakeUserModel(^(__kindof JobsUserModel<NSCoding> * _Nullable userModel) {
            userModel.byUserHeaderIMG(@"用户默认头像".img)
                     .byUserName(@"张三丰")
                     .byPhone(@"13487878787".encryptedChineseTele());
        }));
        id f = self.jobsCurrentUserInfo();
        JobsLog(@"");
    };
}
#pragma mark —— 一些公有方法
/// Core Data Saving support
- (jobsByVoidBlock _Nonnull)saveContext {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        // 后台只保存已启用的数据库，不触发懒加载创建持久化容器。
        NSManagedObjectContext *context = self->_persistentContainer.viewContext;
        if (!context || !context.persistentStoreCoordinator.persistentStores.count) {
            return;
        }
        [context performBlockAndWait:^{
            NSError *error = nil;
            if (context.hasChanges && ![context save:&error]) {
                JobsLog(@"Core Data save failed: %@, %@", error, error.userInfo);
            }
        }];
    };
}
#pragma mark —— lazyLoad
/// Core Data stack
@synthesize persistentContainer = _persistentContainer;
- (NSPersistentCloudKitContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            // 模型名固定匹配打包的 JobsOCBaseConfigDemo.momd，不使用可本地化的显示名。
            _persistentContainer = [NSPersistentCloudKitContainer.alloc initWithName:@"JobsOCBaseConfigDemo"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription,
                                                                              NSError *error) {
                if (error) {
                    JobsLog(@"Core Data load failed: %@, %@", error, error.userInfo);
                }
            }];
        }
    }
    return _persistentContainer;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN AppDelegate
-(JobsRetAppDelegateByWindowBlock _Nonnull)byWindow{
    @jobs_weakify(self)
    return ^__kindof AppDelegate * _Nullable(UIWindow * _Nullable data){
        @jobs_strongify(self)
        [self setWindow:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END AppDelegate

@end

#pragma clang diagnostic pop

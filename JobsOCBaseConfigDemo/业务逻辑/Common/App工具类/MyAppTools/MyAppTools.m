//
//  MyAppTools.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MyAppTools.h"

@interface MyAppTools ()

Prop_strong()UIWindow *appDelegateWindow;
Prop_strong()UIWindow *sceneDelegateWindow;

@end

@implementation MyAppTools
#pragma mark —— 初始化方法
static MyAppTools *MyAppToolsInstance = nil;
static dispatch_once_t MyAppToolsOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(MyAppTools.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&MyAppToolsOnceToken, ^{
            MyAppToolsInstance = [super allocWithZone:NULL].init;
        });return MyAppToolsInstance;
    };
}
/// 单例的销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(MyAppTools.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        MyAppToolsOnceToken = 0;
        MyAppToolsInstance = nil;
    };
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    return (((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(MyAppTools.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager)))();
}
/// 防止外部调用copy
-(instancetype)copyWithZone:(NSZone *)zone{
    return self;
}
/// 防止外部调用mutableCopy
-(instancetype)mutableCopyWithZone:(NSZone *)zone{
    return self;
}
#pragma mark —— 一些公共方法
-(JobsRetWindowByVoidBlock _Nonnull)makeAppDelegateWindow{
    @jobs_weakify(self)
    return ^UIWindow *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.appDelegateWindow;
    };
}

-(JobsRetWindowByVoidBlock _Nonnull)makeSceneDelegateWindow{
    @jobs_weakify(self)
    return ^UIWindow *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.sceneDelegateWindow;
    };
}

-(void)appDelegateWindowBlock:(jobsByWindowBlock _Nullable)appDelegateWindowBlock
     sceneDelegateWindowBlock:(jobsByWindowBlock _Nullable)sceneDelegateWindowBlock{
    if (appDelegateWindowBlock) appDelegateWindowBlock(self.appDelegateWindow);
    if (sceneDelegateWindowBlock) sceneDelegateWindowBlock(self.sceneDelegateWindow);
}
#pragma mark —— lazyLoad
/// 在使用sceneDelegate的情况下，仅仅为了iOS 13 版本向下兼容而存在
-(UIWindow *)appDelegateWindow{
    if(!_appDelegateWindow){
        @jobs_weakify(self)
        _appDelegateWindow = jobsMakeWindow(^(__kindof UIWindow * _Nullable data) {
            @jobs_strongify(self)
            data
                .byWindowFrame(UIScreen.mainScreen.bounds)
                .byRootViewController(RootViewController)
                .byMakeKeyAndVisible();
        });AppDelegate.tabBarVC.ppBadge(YES);
    };return _appDelegateWindow;
}

//-(UIWindow *)sceneDelegateWindow{
//    if(!_sceneDelegateWindow){
//        SceneDelegate *sceneDelegate = (SceneDelegate *)getSysSceneDelegate();
//        _sceneDelegateWindow = UIWindow.initByScene(sceneDelegate.windowScene);
//        _sceneDelegateWindow.frame = sceneDelegate.windowScene.coordinateSpace.bounds;
//        _sceneDelegateWindow.rootViewController = self.rootViewControllerBy(FMHomeVC.new);;
//        [_sceneDelegateWindow makeKeyAndVisible];
//    };return _sceneDelegateWindow;
//}

@end

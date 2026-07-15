//
//  BaseProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEPROTOCOL_8141C1533B
#define JOBS_HEADER_GUARD_BASEPROTOCOL_8141C1533B

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <os/lock.h> // 提供系统级高性能锁，如 os_unfair_lock，适合轻量级同步场景。
#import "RACProtocol.h"
#import "TimerProtocol.h"
#import "YTKNetworkProtocols.h"
#import "JobsDefines.h"
#import "JobsBlock.h"

@class JobsTimer;
NS_ASSUME_NONNULL_BEGIN

@protocol BaseProtocol <YTKChainRequestDelegate,RACProtocol,TimerProtocol>
@optional
#pragma mark —— 关于（二次封装）定时器
Prop_strong(nullable)JobsTimer *timer;
#pragma mark —— 锁🔐
Prop_strong(nullable)NSLock *lock;
                     // Foundation 框架提供的互斥锁。更灵活，性能比 @synchronized 高。需要手动管理加锁和解锁。
Prop_strong(nullable)NSRecursiveLock *recursiveLock;   // 递归锁，同一线程可以多次获得锁而不会导致死锁
Prop_assign(readonly)os_unfair_lock os_lock;
           // Apple 推荐的轻量级锁，性能极高。替代 OSSpinLock。不需要显式销毁
/// pthread_mutex_t是底层的非对象类型，不支持 ARC（自动引用计数）的内存管理规则。pthread_mutex_init(&_mutex, NULL);
Prop_assign(readonly)pthread_mutex_t mutex;
            // 初始化互斥锁
Prop_retain()dispatch_semaphore_t semaphore;
           // 也可以作为锁
#pragma mark —— 一些状态
Prop_assign()BOOL isLock;
Prop_assign()BOOL isRead;
Prop_assign()BOOL becomeFirstResponder;
Prop_assign()AppLanguage appLanguage;
Prop_assign()CGPoint lastContentOffset;
                // 主要用于记录与计算 UIScrollView 的滑动方向
#pragma mark —— JS
Prop_strong(nullable)WKUserContentController *userContentCtrl;
Prop_strong(nullable)WKScriptMessage *scriptMsg;
Prop_copy(nullable)NSString *handlerName;
Prop_copy(nullable)NSString *evaluateJavaScript;
Prop_copy(nullable)NSString *customUserAgent;
Prop_copy(nullable)jobsJSCompletionHandlerBlock completionHandlerBlock;
#pragma mark —— Data
Prop_copy(nullable)NSMutableArray <NSURL *>*urls;
Prop_strong(nullable)NSURL *url;
Prop_strong(nullable)NSURL *imageUrl;
Prop_copy(nullable)NSString *internationalizationKEY;  // 国际化的key
Prop_strong(nullable)NSMutableSet *jobsDataMutSet;       // 绑定的数据源，数据类型NSMutableSet
Prop_strong(nullable)NSMutableArray *jobsDataMutArr;     // 绑定的数据源，数据类型NSMutableArray
Prop_strong(nullable)NSMutableDictionary *jobsDataMutDic;// 绑定的数据源，数据类型NSMutableDictionary
Prop_strong(nullable)Class cls;/// 绑定的class
/**
 SEL：就是一个字符串（Char*类型），表示方法的名字
 IMP：就是指向方法实现首地址的指针
 Method：是一个结构体，包含一个SEL表示方法名、一个IMP指向函数的实现地址、一个Char*表示函数的类型（包括返回值和参数类型）
 SEL、IMP、Method之间的关系可以这么理解：
 一个类（Class）持有一系列的方法（Method），在load类时，runtime会将所有方法的选择器（SEL）hash后映射到一个集合（NSSet）中（NSSet里的元素不能重复）
 当需要发消息时，会根据选择器（SEL）去查找方法；找到之后，用Method结构体里的函数指针（IMP）去调用方法。这样在运行时查找selecter的速度就会非常快
 */
Prop_assign(nullable)SEL selector;
Prop_assign(nullable)IMP implementation;
Prop_strong(nullable)id target;
Prop_weak(nullable)id weak_target;
/// 强引用数据源
Prop_strong(nullable)id data;
                        //【强引用】绑定的数据源，数据类型id
Prop_strong(nullable)id requestParams;
               //【强引用】绑定的数据源，数据类型id
Prop_strong(nullable)id modelData;
                   // 挂载修饰的ViewModel/UIButtonModel/TextModel...
Prop_assign()CGFloat value_CGFloat;
Prop_assign()NSInteger value_NSInteger;
Prop_assign()NSUInteger value_NSUInteger;
/// 弱引用数据源
Prop_weak(nullable)id data_weak;
                    //【弱引用】绑定的数据源，数据类型id
Prop_weak(nullable)id requestParams_weak;
           //【弱引用】绑定的数据源，数据类型id
/// 更改UITabBarItem的标题
-(jobsByIndexPathBlock _Nonnull)changeTabBarItemTitleBy;
#pragma mark —— iOS 通知
///【监听所有通知】
///【监听所有通知】用 selector
-(void)monitorNotification:(NSString *_Nonnull)notificationName
              withSelector:(SEL _Nonnull)selector;
///【监听所有通知】用 Block
-(void)monitorNotification:(NSString * _Nonnull)notificationName
                 withBlock:(JobsRetIDByTwoIDBlock _Nonnull)actionBlock;
///【通知监听】国际化语言修改UI
/// @param target 需要铆定监听通知的对象
/// @param aSelector 相关逻辑
+(void)target:(id)target languageSwitchNotificationWithSelector:(SEL)aSelector;// NSObject (AppTools)
///【监听通知】设置App语言环境
-(void)monitorAppLanguage;// NSObject (Notification)
///【发通知】设置App语言环境
-(jobsByNSIntegerBlock _Nonnull)appLanguageAtAppLanguageBy;
/// 接收通知并相应的方法【在分类或者基类中实现会屏蔽具体子类的相关实现】
-(jobsByNotificationBlock _Nonnull)jobsLanguageSwitchNotification;// 在具体子类进行实现
#pragma mark —— 单例化和销毁
+(void)destroySingleton;
+(instancetype)sharedManager;
+(JobsRetIDByVoidBlock _Nonnull)SharedInstance;
+(jobsByVoidBlock _Nonnull)DestroySingleton;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASEPROTOCOL_8141C1533B */

//
//  NSObject+Extra.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN PHAssetCreationRequest
@interface PHAssetCreationRequest (JobsLocalPropertyDSLAutogen_a95b25592d)
-(JobsRetPHAssetCreationRequestByNSDateBlock _Nonnull)byCreationDate;
-(void)setCreationDate:(NSDate * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END PHAssetCreationRequest

@implementation NSObject (Extra)
/// UITextFieldProtocol
UITextFieldProtocol_dynamic
#pragma mark —— 系统类单例的二次封装
/// NSBundle
+(NSBundle *)mainBundle{
    return (((JobsRetNSBundleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(NSObject.class, @selector(jobsMainBundle)))(self, @selector(jobsMainBundle)))();
}

+(JobsRetNSBundleByVoidBlock _Nonnull)jobsMainBundle{
    return ^NSBundle *_Nullable{
        return NSBundle.mainBundle;
    };
}

-(NSBundle *)mainBundle{
    return (((JobsRetNSBundleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsMainBundle)))(self, @selector(jobsMainBundle)))();
}

-(JobsRetNSBundleByVoidBlock _Nonnull)jobsMainBundle{
    @jobs_weakify(self)
    return ^NSBundle *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSBundle.mainBundle;
    };
}
/// NSLocale
+(NSLocale *)currentLocale{
    return (((JobsRetNSLocaleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(NSObject.class, @selector(jobsCurrentLocale)))(self, @selector(jobsCurrentLocale)))();
}

+(JobsRetNSLocaleByVoidBlock _Nonnull)jobsCurrentLocale{
    return ^NSLocale *_Nullable{
        return NSLocale.currentLocale;
    };
}

-(NSLocale *)currentLocale{
    return (((JobsRetNSLocaleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsCurrentLocale)))(self, @selector(jobsCurrentLocale)))();
}

-(JobsRetNSLocaleByVoidBlock _Nonnull)jobsCurrentLocale{
    @jobs_weakify(self)
    return ^NSLocale *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSLocale.currentLocale;
    };
}

+(JobsRetNSLocaleByVoidBlock _Nonnull)systemLocale{
    return ^NSLocale *_Nullable{
        return NSLocale.systemLocale;
    };
}

-(JobsRetNSLocaleByVoidBlock _Nonnull)systemLocale{
    @jobs_weakify(self)
    return ^NSLocale *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSLocale.systemLocale;
    };
}

+(NSLocale *_Nullable)autoupdatingCurrentLocale API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0)) {
    return (((JobsRetNSLocaleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(NSObject.class, @selector(jobsAutoupdatingCurrentLocale)))(self, @selector(jobsAutoupdatingCurrentLocale)))();
}

+(JobsRetNSLocaleByVoidBlock _Nonnull)jobsAutoupdatingCurrentLocale API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0)) {
    return ^NSLocale *_Nullable{
        return NSLocale.autoupdatingCurrentLocale;
    };
}

-(NSLocale *_Nullable)autoupdatingCurrentLocale API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0)) {
    return (((JobsRetNSLocaleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsAutoupdatingCurrentLocale)))(self, @selector(jobsAutoupdatingCurrentLocale)))();
}

-(JobsRetNSLocaleByVoidBlock _Nonnull)jobsAutoupdatingCurrentLocale API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0)) {
    @jobs_weakify(self)
    return ^NSLocale *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSLocale.autoupdatingCurrentLocale;
    };
}
/// UIDevice
+(UIDevice *)currentDevice{
    return (((JobsRetUIDeviceByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(NSObject.class, @selector(jobsCurrentDevice)))(self, @selector(jobsCurrentDevice)))();
}

+(JobsRetUIDeviceByVoidBlock _Nonnull)jobsCurrentDevice{
    return ^UIDevice *_Nullable{
        return UIDevice.currentDevice;
    };
}

-(UIDevice *)currentDevice{
    return (((JobsRetUIDeviceByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsCurrentDevice)))(self, @selector(jobsCurrentDevice)))();
}

-(JobsRetUIDeviceByVoidBlock _Nonnull)jobsCurrentDevice{
    @jobs_weakify(self)
    return ^UIDevice *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return UIDevice.currentDevice;
    };
}
#pragma mark —— 宏
/// App 国际化相关系统宏二次封装 + 设置缺省值
+(JobsRetStrByStrBlock _Nonnull)localStringWithKey{
    return ^NSString *_Nullable(NSString * key){
        return NSLocalizedString(key, nil);
    };
}

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName{
    return NSLocalizedStringFromTable(key,
                                      tableName,
                                      nil);
}

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle{
    return NSLocalizedStringFromTableInBundle(key,
                                              tableName,
                                              bundle ? : NSBundle.mainBundle,
                                              nil);
}

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle
                         defaultValue:(nullable NSString *)defaultValue{
    return NSLocalizedStringWithDefaultValue(key,
                                             tableName,
                                             bundle ? : NSBundle.mainBundle,
                                             defaultValue,
                                             nil);
}
#pragma mark —— ViewController
/// 从一个视图（UIView）出发，获取它所在的视图控制器（UIViewController）
-(JobsRetVCByViewBlock _Nonnull)getViewControllerByView{
    return ^(UIView *_Nonnull view) {
        UIResponder *responder = view;
        while (responder) {
            if (KindOfVCCls(responder)) {
                return (UIViewController *)responder;
            }responder = responder.nextResponder;
        };return (UIViewController *)nil;
    };
}
/// 获得当前的控制器。对getCurrentViewController的再次封装
-(__kindof UIViewController *_Nullable)jobsGetCurrentViewControllerWithNavCtrl{
    JobsRetVCByVoidBlock action = ((JobsRetVCByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsGetCurrentViewControllerWithNavCtrlBlock)))(self, @selector(jobsGetCurrentViewControllerWithNavCtrlBlock));
    return action ? action() : nil;
}

-(JobsRetVCByVoidBlock _Nonnull)jobsGetCurrentViewControllerWithNavCtrlBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsNavCtrl(self.jobsGetCurrentViewControllerBlock());
    };
}
/// 获得当前的控制器。对getCurrentViewController的再次封装
-(__kindof UIViewController *_Nullable)jobsGetCurrentViewController{
    JobsRetVCByVoidBlock action = ((JobsRetVCByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsGetCurrentViewControllerBlock)))(self, @selector(jobsGetCurrentViewControllerBlock));
    return action ? action() : nil;
}

-(JobsRetVCByVoidBlock _Nonnull)jobsGetCurrentViewControllerBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return KindOfVCCls(self) ? (UIViewController *)self : self.getCurrentViewController;
    };
}
/// 获得当前的控制器
-(__kindof UIViewController *_Nullable)getCurrentViewController{
    return (((JobsRetVCByVCBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(getCurrentViewControllerByRootVC)))(self, @selector(getCurrentViewControllerByRootVC)))(jobsGetMainWindow().rootViewController);
}
/// 获得当前控制器的根控制器
-(JobsRetVCByVCBlock _Nonnull)getCurrentViewControllerByRootVC{
    @jobs_weakify(self)
    return ^(UIViewController *_Nonnull rootVC) {
        @jobs_strongify(self)
        UIViewController *currentVC;
        if (rootVC.presentedViewController) {
            /// 视图是被presented出来的
            currentVC = rootVC.presentedViewController;
        }
        if (KindOfTabBarCtrlCls(rootVC)) {
            /// 根视图为UITabBarController
            currentVC = self.getCurrentViewControllerByRootVC([(UITabBarController *)rootVC selectedViewController]);
        } else if (KindOfNavCtrlCls(rootVC)){
            /// 根视图为UINavigationController
            currentVC = self.getCurrentViewControllerByRootVC([(UINavigationController *)rootVC visibleViewController]);
        } else {
            /// 根视图为非导航类
            currentVC = rootVC;
        };return currentVC;
    };
}
/// 自定义 push/pop 控制器的方向
-(jobsByTransformLayerDirectionTypeBlock _Nonnull)jobsNavDirectionBy{
    @jobs_weakify(self)
    return ^(JobsDirectionType data){
        @jobs_strongify(self)
        if(self.jobsGetCurrentViewControllerBlock().navigationController) self.jobsGetCurrentViewControllerBlock().navigationController.navDirectionBy(data);
    };
}
/// 设置控制器的转场方向（及对应手势）
-(__kindof UIViewController *_Nullable)viewController:(__kindof UIViewController *_Nonnull)viewController
                                  transitionDirection:(JobsDirectionType)transitionDirection{
    if(!viewController && viewController.isKindOfClass(UIViewController.class)) return nil;
    /// 自定义 push/pop 控制器的动画方向
    self.jobsNavDirectionBy(transitionDirection);
    /// 自定义 push/pop 控制器的手势方向
    [JobsNavigationTransitionMgr attachToViewController:viewController animationDirection:transitionDirection];
    return viewController;
}
/// 强制以Push的方式展现页面
/// @param toPushVC 需要进行展现的页面
/// @param requestParams 正向推页面传递的参数
/// 如果想用AppDelegate的自定义TabbarVC：(UIViewController *)((AppDelegate *)AppDelegate.jobsSharedManager()).tabBarVC;
-(void)forceComingToPushVC:(UIViewController *_Nonnull)toPushVC
             requestParams:(id _Nullable)requestParams{
    UIViewController *viewController = self.jobsGetCurrentViewControllerBlock();
    if (viewController) {
        viewController.comingToPushVCByRequestParams(toPushVC,requestParams);
    }else{
        JobsLog(@"%@强制展现页面%@失败,携带的参数%@",viewController,toPushVC,requestParams);
        self.jobsToastErrMsg(@"强制展现页面失败,请检查控制台".jobsTr());
    }
}
/// 强制以Present的方式展现页面
/// @param toPresentVC 需要进行展现的页面
/// @param requestParams 正向推页面传递的参数
/// @param completion 完成Present动作以后得动作
-(void)forceComingToPresentVC:(UIViewController *_Nonnull)toPresentVC
                requestParams:(id _Nullable)requestParams
                   completion:(jobsByVoidBlock _Nonnull)completion{
    UIViewController *viewController = KindOfVCCls(self) ? (UIViewController *)self : self.jobsGetCurrentViewControllerBlock();
    [viewController presentViewController:toPresentVC
                                 animated:YES
                               completion:completion];
}
/// 获取Storyboard里面的单独控制器
-(UIViewController *_Nullable)vcByStoryboardWithName:(NSString *_Nonnull)storyboardWithName
                                    storyboardBundle:(NSBundle *_Nullable)storyboardBundle
                                          identifier:(NSString *_Nonnull)identifier{
    return [storyboardWithName.sbByBundle(storyboardBundle) instantiateViewControllerWithIdentifier:identifier];
}

-(UIViewController *_Nullable)vcByStoryboardWithName:(NSString *_Nonnull)storyboardWithName
                                    storyboardBundle:(NSBundle *_Nullable)storyboardBundle{
    return storyboardWithName.sbByBundle(nil).instantiateInitialViewController;
}
#pragma mark —— KVO
/**
 
     在 self里面实现下列方法：实现监听
     -(void)observeValueForKeyPath:(NSString *)keyPath
     ofObject:(id)object
     change:(NSDictionary*)change
     context:(void *)context{
     if ([object isKindOfClass:UIScrollView.class]) {
         UIScrollView *scrollView = (UIScrollView *)object;
         CGPoint point = [((NSValue *)[scrollView valueForKey:@"contentOffset"]) CGPointValue];
         JobsLog(@"point.x = %f,point.y = %f",point.x,point.y);
       }
     }
 */
/// 添加监听【针对UIScrollView 的 ContentOffset 属性】
-(jobsByScrollViewBlock _Nonnull)monitorContentOffsetScrollView{
    @jobs_weakify(self)
    return ^(UIScrollView *_Nonnull scrollView){
        @jobs_strongify(self)
        if (!self) return;
        [scrollView addObserver:self
                     forKeyPath:@"contentOffset"
                        options:NSKeyValueObservingOptionNew
                        context:nil];
    };
}
#pragma mark —— 单例相关
+(JobsRetIDByVoidBlock _Nonnull)SharedInstance{
    @jobs_weakify(self)
    return ^JobsNavBarConfig *(){
        @jobs_strongify(self)
        return [self.class sharedManager];
    };
}

+(jobsByVoidBlock _Nonnull)DestroySingleton{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.class destroySingleton];
    };
}
#pragma mark —— 功能性的
/// 刷新控件的头部数据
-(MJRefreshConfigModel *_Nullable)mjHeaderDefaultConfig{
    JobsRetMJRefreshConfigModelByVoidBlock action = ((JobsRetMJRefreshConfigModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsMjHeaderDefaultConfig)))(self, @selector(jobsMjHeaderDefaultConfig));
    return action ? action() : nil;
}

-(JobsRetMJRefreshConfigModelByVoidBlock _Nonnull)jobsMjHeaderDefaultConfig{
    @jobs_weakify(self)
    return ^MJRefreshConfigModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
            data.byStateIdleTitle(@"下拉可以刷新".jobsTr())
                .byPullingTitle(@"下拉可以刷新".jobsTr())
                .byRefreshingTitle(@"松开立即刷新".jobsTr())
                .byWillRefreshTitle(@"刷新数据中".jobsTr())
                .byNoMoreDataTitle(@"下拉可以刷新".jobsTr())
                .byAutomaticallyChangeAlpha(YES);/// 根据拖拽比例自动切换透明度
        });
    };
}

-(JobsRetMJRefreshConfigModelByRetIDByIDBlocks _Nonnull)refreshHeaderDataBy{
    @jobs_weakify(self)
    return ^MJRefreshConfigModel *_Nonnull(JobsRetIDByIDBlock _Nonnull loadBlock){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.jobsMjHeaderDefaultConfig().byLoadBlock(loadBlock);
    };
}
/// 刷新控件的尾部数据
-(MJRefreshConfigModel *_Nullable)mjFooterDefaultConfig{
    JobsRetMJRefreshConfigModelByVoidBlock action = ((JobsRetMJRefreshConfigModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsMjFooterDefaultConfig)))(self, @selector(jobsMjFooterDefaultConfig));
    return action ? action() : nil;
}

-(JobsRetMJRefreshConfigModelByVoidBlock _Nonnull)jobsMjFooterDefaultConfig{
    @jobs_weakify(self)
    return ^MJRefreshConfigModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
            data.byStateIdleTitle(@"".jobsTr())
                .byPullingTitle(@"".jobsTr())
                .byRefreshingTitle(@"".jobsTr())
                .byWillRefreshTitle(@"".jobsTr())
                .byNoMoreDataTitle(@"".jobsTr())
                .byAutomaticallyChangeAlpha(YES);/// 根据拖拽比例自动切换透明度
        });
    };
}

-(JobsRetMJRefreshConfigModelByRetIDByIDBlocks _Nonnull)refreshFooterDataBy{
    @jobs_weakify(self)
    return ^MJRefreshConfigModel *_Nonnull(JobsRetIDByIDBlock _Nonnull loadBlock){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.jobsMjFooterDefaultConfig().byLoadBlock(loadBlock);
    };
}
/// 切换到主VC
-(jobsByVCBlock _Nonnull)switchToMainVC{
    return ^(__kindof UIViewController *_Nullable mainVC){
        UIWindow *window = jobsGetMainWindow();
        [UIView transitionWithView:window
                          duration:0.5
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            window.byRootViewController(mainVC);
                        }
                        completion:nil];
    };
}
/// 销毁视图
-(jobsByViewBlock _Nonnull)removeView{
    return ^(__kindof UIView *_Nullable view){
        if (view && view.isKindOfClass(UIView.class)) {
            [view removeFromSuperview];
            view = nil;
        }
    };
}
/// NSTimer定时器的销毁
-(jobsByTimerBlock _Nonnull)destroyNSTimer{
    return ^(NSTimer *_Nullable timer){
        if (timer) {
            timer.invalidate;
            timer = nil;
        }
    };
}
/// runtime方法交换
+(void)exchangeMethodForClass:(NSString *_Nonnull)className
                  originalSel:(SEL _Nonnull)originalSelector
                  swizzledSel:(SEL _Nonnull)swizzledSelector{
    Class cls = objc_getClass(className.UTF8String);
    if (!cls) {
        JobsLog(@"交换失败：未找到类 %@", className);
        return;
    }
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    if (!originalMethod || !swizzledMethod) {
        JobsLog(@"交换失败：类 %@ 中的方法 %@ 或 %@ 未找到", className, NSStringFromSelector(originalSelector), NSStringFromSelector(swizzledSelector));
        return;
    }method_exchangeImplementations(originalMethod, swizzledMethod);
}
/// UIAlertController + UIAlertAction
/// UIAlertController 的标题和消息属性仅支持简单的字符串 (NSString) 类型，而不直接支持富文本 (NSAttributedString)
-(JobsRetAlertControllerByAlertModelBlock _Nonnull)makeAlertControllerByAlertModel{
    return ^__kindof UIAlertController *_Nullable(JobsAlertModel *_Nullable model){
        UIAlertController *alertVC = JobsMakeAlertControllerBy(jobsMakeAlertModel(^(JobsAlertModel * _Nullable data) {
            data.byAlertControllerTitle(model.alertControllerTitle)
                .byMessage(model.message)
                .byPreferredStyle(model.preferredStyle);
        }));
        alertVC.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *_Nullable data) {
            data.byAlertActionTitle(model.alertActionTitle)
                .byAlertActionStyle(model.alertActionStyle)
                .byAlertActionBlock(model.alertActionBlock);
        })));
        alertVC.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *_Nullable data) {
            data.byAlertActionTitle(model.cancelAlertActionTitle)
                .byAlertActionStyle(model.cancelAlertActionStyle)
                .byAlertActionBlock(model.cancelAlertActionBlock);
        })));return alertVC;
    };
}
/// 启用 WebKit 的日志功能。此选项通常用于调试 WebKit 的问题，例如性能、加载时间或 JavaScript 执行等。
-(jobsByVoidBlock _Nonnull)debugWebKit{
    return ^(){
        @"WebKitLoggingEnabled".userDefaultsByBOOL(YES);
    };
}
/// 将 NSDate  *转换输出成人类可读的（年\月\日）时间（字符串）
-(JobsRetStrByDateBlock _Nonnull)toReadableDayTimeByDate{
    return ^__kindof NSString *_Nullable(NSDate *_Nullable date){
        return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
            dateFormatter
                .byTimeZone(timeZone(TimeZoneTypeCSTChina))
                .byDateFormat(@"yyyy-MM-dd");
        }).stringByDate(date);
    };
}
/// 将 NSDate  *转换输出成人类可读的（年\月\日\时\分\秒）时间（字符串）
-(JobsRetStrByDateBlock _Nonnull)toReadableTimeByDate{
    return ^__kindof NSString *_Nullable(NSDate *_Nullable date){
        return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
            dateFormatter
                .byTimeZone(timeZone(TimeZoneTypeCSTChina))
                .byDateFormat(@"yyyy-MM-dd HH:mm:ss");
        }).stringByDate(date);
    };
}
/// 将 NSTimeInterval 按照 NSDateFormatter 转换输出成人类可读的时间
-(JobsRetStringByTimeModelBlock _Nonnull)toReadableTimeBy{
    return ^__kindof NSString *_Nullable(JobsTimeModel *_Nullable dateModel){
        if(dateModel.date){
            return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
                dateFormatter.byTimeZone(timeZone(TimeZoneTypeCSTChina));
                dateFormatter.dateFormat = @"yyyy-MM-dd"; /// 格式化为日期字符串
            }).stringByDate(dateModel.date);
        }else return dateModel.dateFormatter.stringByDate(NSDate.initDateBy(dateModel.timeInterval));
    };
}
/// baseURL：指定 HTML 内容的基本 URL，可以用于解析相对路径
/// data：包含 HTML 内容的字符串
-(JobsRetWKWebViewByStrBlock _Nonnull)makeWebViewByString{
    return ^__kindof WKWebView *_Nullable(NSString *_Nullable data){
        return jobsMakeWKWebView(^(__kindof WKWebView * _Nullable webView) {
            [webView loadHTMLString:data baseURL:nil];
        });
    };
}
/// 解析网络URL数据
-(JobsRetWKWebViewByURLBlock _Nonnull)makeWebViewByURL{
    return ^__kindof WKWebView *_Nullable(NSURL *_Nullable URL){
        return jobsMakeWKWebView(^(__kindof WKWebView * _Nullable webView) {
            [webView loadRequest:URL.jobsURLRequest()];
        });
    };
}
/// 在导航栏堆栈里面，是否存在同样类型的控制器
-(JobsRetBOOLByVCBlock _Nonnull)isSameVCBy{
    @jobs_weakify(self)
    return ^BOOL(UIViewController *_Nullable viewController){
        @jobs_strongify(self)
        BOOL OK = NO;
        for (__kindof UIViewController *vc in self.jobsGetCurrentViewControllerBlock().navigationController.viewControllers) {
            OK = vc.class == viewController.class;
        };return OK;
    };
}
/// 可以组合使用
-(SDWebImageOptions)makeSDWebImageOptions{
    JobsRetSDWebImageOptionsByVoidBlock action = ((JobsRetSDWebImageOptionsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsMakeSDWebImageOptions)))(self, @selector(jobsMakeSDWebImageOptions));
    return action ? action() : (SDWebImageOptions){0};
}

-(JobsRetSDWebImageOptionsByVoidBlock _Nonnull)jobsMakeSDWebImageOptions{
    @jobs_weakify(self)
    return ^SDWebImageOptions{
        @jobs_strongify(self)
        if (!self) return (SDWebImageOptions){0};
        return
        /// 这个选项通常用于网络请求失败时重试加载图片。如果希望在网络不稳定或其他情况下自动重试图片加载，这是一个常用的选项。
        SDWebImageRetryFailed |
        /// 如果希望在图片还没有完全下载完成时逐步显示，类似于浏览器加载图片的效果，这个选项会很有帮助。适用于大图片或需要快速反馈的场景。
        SDWebImageProgressiveLoad |
        /// 当同一个 URL 的图片内容会发生变化时（例如用户的头像 URL），可以使用这个选项来强制刷新缓存，重新加载最新的图片。
        SDWebImageRefreshCached |
        /// 用于优先加载重要的图片，常用于需要立即显示的关键图片，如封面图或焦点图。
        SDWebImageHighPriority |
        /// 如果处理的图片可能非常大，而设备内存有限，使用这个选项可以缩小图片尺寸以节省内存。
        SDWebImageScaleDownLargeImages |
        ///在应用进入后台时继续下载图片，尤其是在需要确保图片下载任务不会被中断的情况下使用。
        SDWebImageContinueInBackground
        /// 当想手动控制图片的显示（例如先对图片进行某些处理后再显示）时，这个选项允许你在下载完成后手动设置图片。
        // SDWebImageAvoidAutoSetImage |
        /// 在滚动视图（如 UITableView 或 UICollectionView）中延迟加载图片，确保滑动流畅。这个选项比较常见于列表视图中的图片加载场景。
        //SDWebImageLowPriority |
        ;
    };
}

-(URLManagerModel *_Nonnull)url:(NSString *_Nonnull)url funcName:(NSString *_Nonnull)funcName{
    return jobsMakeURLManagerModel(^(__kindof URLManagerModel * _Nullable data) {
        data.byUrl(url)
            .byFuncName(funcName);
    });
}
/// 获取m文件的属性
-(JobsRetIDByStrBlock _Nonnull)getObjByName{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        const char *name = @"_".add(data).UTF8String;// 必须是下划线接属性
        Ivar ivar = class_getInstanceVariable(self.class, name);
        id obj = object_getIvar(self, ivar);
        return obj;
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

-(JobsRetDataByStrBlock _Nonnull)initByContentsOfFile{
    return ^NSData *_Nullable(__kindof NSString *_Nullable path){
        return NSData.dataByContentsOfFile(path);
    };
}

-(JobsRetBOOLByIDBlock _Nonnull)isEqual{
    @jobs_weakify(self)
    return ^BOOL(id _Nullable data){
        @jobs_strongify(self)
        return [self isEqual:data];
    };
}

-(JobsRetIDByStrBlock _Nonnull)dataByKey{
    return ^JobsKeyValueModel *_Nullable(NSString *_Nullable key){
        @jobs_weakify(self)
        return jobsMakeKeyValueModel(^(JobsKeyValueModel * _Nullable model) {
            @jobs_strongify(self)
            model
                .byValue(self)
                .byKey(key);
        });
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
/// 使用指定的图像（UIImage）作为颜色的填充图案。
/// 这个方法的作用是生成一个基于图像的颜色，这个颜色在视图或图层上会以平铺的方式重复显示指定的图像。
-(JobsRetCorByImageBlock _Nonnull)byPatternImage{
    return ^UIColor *_Nullable(UIImage *_Nonnull image){
        return [UIColor colorWithPatternImage:image];
    };
}
/// present
#ifndef JobsPresentationStyle
#define JobsPresentationStyle (UIDevice.currentDevice.systemVersion.doubleValue >= 13.0 ? UIModalPresentationAutomatic : UIModalPresentationFullScreen)
#endif
/// 简洁版强制present展现一个控制器页面【不需要正向传参】
-(jobsByVCBlock _Nonnull)comingToPresentVC{
    @jobs_weakify(self)
    return ^(__kindof UIViewController *_Nonnull viewController) {
        @jobs_strongify(self)
        [UIViewController comingFromVC:self.jobsGetCurrentViewControllerBlock()
                                  toVC:viewController
                           comingStyle:ComingStyle_PRESENT
                     presentationStyle:JobsPresentationStyle
                         requestParams:nil
              hidesBottomBarWhenPushed:YES
                              animated:YES
                               success:nil];
    };
}
/// 简洁版强制present展现一个控制器页面【需要正向传参】
-(jobsByVCAndDataBlock _Nonnull)comingToPresentVCByRequestParams{
    @jobs_weakify(self)
    return ^(__kindof UIViewController * _Nullable viewController,id _Nullable requestParams) {
        @jobs_strongify(self)
        [UIViewController comingFromVC:self.jobsGetCurrentViewControllerBlock()
                                  toVC:viewController
                           comingStyle:ComingStyle_PRESENT
                     presentationStyle:JobsPresentationStyle
                         requestParams:requestParams
              hidesBottomBarWhenPushed:YES
                              animated:YES
                               success:nil];
    };
}
#pragma mark —— pop
/// pop到根控制器
-(jobsByBOOLBlock _Nonnull)popToRootVCBy{
    @jobs_weakify(self)
    return ^(BOOL data){
        @jobs_strongify(self)
        [self.jobsGetCurrentViewControllerBlock().navigationController popToRootViewControllerAnimated:data];
    };
}
/// pop到上一个控制器
-(jobsByBOOLBlock _Nonnull)popToPreviousVCBy{
    @jobs_weakify(self)
    return ^(BOOL data){
        @jobs_strongify(self)
        [self.jobsGetCurrentViewControllerBlock().navigationController popViewControllerAnimated:data];
    };
}
#pragma mark —— push
/// 简洁版强制push展现一个控制器页面【不需要正向传参】
/// self.jobsNavDirectionBy(JobsTransitionDirectionLeft);
-(jobsByVCBlock _Nonnull)comingToPushVC{
    @jobs_weakify(self)
    return ^(__kindof UIViewController *_Nonnull viewController) {
        @jobs_strongify(self)
        /// 防止多次推同一个控制器
        if(self.isSameVCBy(viewController)) return;
        /// 正式推控制器
        [UIViewController comingFromVC:self.jobsGetCurrentViewControllerBlock()
                                  toVC:viewController
                           comingStyle:ComingStyle_PUSH
                     presentationStyle:JobsPresentationStyle
                         requestParams:nil
              hidesBottomBarWhenPushed:YES
                              animated:YES
                               success:nil];
    };
}
/// 简洁版强制push展现一个控制器页面【需要正向传参】
-(jobsByVCAndDataBlock _Nonnull)comingToPushVCByRequestParams{
    @jobs_weakify(self)
    return ^(__kindof UIViewController * _Nullable viewController,
             id _Nullable requestParams) {
        @jobs_strongify(self)
        /// 防止多次推同一个控制器
        if(self.isSameVCBy(viewController)) return;
        /// 正式推控制器
        [UIViewController comingFromVC:self.jobsGetCurrentViewControllerBlock()
                                  toVC:viewController
                           comingStyle:ComingStyle_PUSH
                     presentationStyle:JobsPresentationStyle
                         requestParams:requestParams
              hidesBottomBarWhenPushed:YES
                              animated:YES
                               success:nil];
    };
}
/// 代理检测和回调
-(jobsDelegateBlocks _Nonnull)jobsDelegate{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data,jobsByVoidBlock block) {
        @jobs_strongify(self)
        if ([self respondsToSelector:NSSelectorFromString(data)]) {
            if(block) block();
        }
    };
}
/// GKNavigationBar 返回按钮点击方法
///【子类需要覆写 】创建返回键的点击事件
-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent{
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable sender) {
        @jobs_strongify(self)
        if (self.jobsBackBlock) self.jobsBackBlock(sender);
        UIViewController *vc = nil;
        if (KindOfVCCls(self)) {
            vc = (UIViewController *)self;
        }else if (KindOfViewCls(self)){
            UIView *view = (UIView *)self;
            vc = self.getViewControllerByView(view);
        }else return;
        self.backViewControllerCore(vc);
    };
}
/// 返回控制器的核心逻辑
-(jobsByVCBlock _Nonnull)backViewControllerCore{
    @jobs_weakify(self)
    return ^(__kindof UIViewController *_Nullable vc){
        @jobs_strongify(self)
        switch (self.pushOrPresent) {
            /// 处理 ComingStyle_PRESENT 分支
            case ComingStyle_PRESENT:{
                [vc dismissViewControllerAnimated:YES completion:nil];
            }break;
            /// 处理 ComingStyle_PUSH 分支
            case ComingStyle_PUSH:{
                vc.navigationController ? [vc.navigationController popViewControllerAnimated:YES] : [vc dismissViewControllerAnimated:YES completion:nil];
            }break;
            /// 未匹配已知分支时执行兜底处理
            default:
                break;
        }
    };
}
/// 打印YTKBaseRequest
-(jobsByYTKBaseRequestBlock _Nonnull)checkRequest{
    return ^(YTKBaseRequest *_Nonnull request) {
        JobsLog(@"request.error = %@\n",request.error);
        JobsLog(@"request.requestArgument = %@\n",request.requestArgument);
        JobsLog(@"request.requestUrl = %@\n",request.requestUrl);
        JobsLog(@"request.baseUrl = %@\n",request.baseUrl);
    };
}
/// 此功能的必要性：如果外界传入的数组是空，那么拿到的count是0，做-1操作就是-1，直接用for循环就会进入死循环
-(void)jobsSafetyCycleFunc:(int)ceiling
                cycleBlock:(jobsByIntBlock _Nullable)cycleBlock{
    if (ceiling > 0) {
        for (int i = 0 ; i < ceiling; i++) {
            JobsLog(@"Jobs_%d",i);
            if (cycleBlock) cycleBlock(i);
        }
    }
}

-(JobsRetNSMutableArrayJobsImageModelByNSDataBlock _Nonnull)changeGifToImage{
    @jobs_weakify(self)
    return ^NSMutableArray <JobsImageModel *>*_Nonnull(NSData *_Nonnull gifData){
        @jobs_strongify(self)
        if (!self) return nil;
        /// 通过文件的url来将gif文件读取为图片数据引用
        CFDataRef my_cfdata = CFBridgingRetain(gifData);
        CGImageSourceRef source = CGImageSourceCreateWithData(my_cfdata, NULL);
        /// 获取gif文件里图片的个数
        size_t count = CGImageSourceGetCount(source);
        return jobsMakeMutArr(^(__kindof NSMutableArray <JobsImageModel *>*_Nullable data) {
            for (size_t i = 0; i < count; i++) {
                data.add(jobsMakeImageModel(^(__kindof JobsImageModel * _Nullable imageModel) {
                    CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
                    imageModel.byImage(UIImage.imageWithCGImage(image));
                    CGImageRelease(image);
                    //获取图片信息
                    imageModel.byInfo((__bridge NSDictionary*)CGImageSourceCopyPropertiesAtIndex(source, i, NULL))
                              .byTimeDic([imageModel.info objectForKey:(__bridge NSString *)kCGImagePropertyGIFDictionary]);
                }));
            }
        });
    };
}
/**
 
     NSMutableArray <UIViewModel *>*dataMutArr = popupView.valueForKey(@"dataMutArr");
     [dataMutArr removeAllObjects];
     [dataMutArr addObjectsFromArray:self.createDataMutArr2];

     // dataMutArr = self.createDataMutArr2; 这一段无效
 */
- (JobsRetIDByIDBlock _Nonnull)valueForKey{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *key) {
        @jobs_strongify(self)
        id value = nil;
        if ([key isKindOfClass:NSString.class] &&
            [self respondsToSelector:NSSelectorFromString(key)]) {
            @try {
                value = [self valueForKey:key];
            }
            @catch (NSException *exception) {
                JobsLog(@"Exception: %@", exception);
                value = @"nil"; // or handle the exception as needed
            }
        };return value;
    };
}
/// KVC 的二次封装
-(jobsByKey_ValueBlock _Nonnull)jobsKVC{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull key,id _Nullable value) {
        @jobs_strongify(self)
        [self setValue:value forKey:key];
    };
}

-(jobsByKeyValueModelBlock _Nonnull)jobsKVCBy{
    @jobs_weakify(self)
    return ^(JobsKeyValueModel *_Nullable data){
        @jobs_strongify(self)
        if(data && isValue(data.key)) [self setValue:data.value forKey:data.key];
    };
}

-(void)addCheckerByName:(NSString *_Nonnull)notificationName
          selectorBlock:(jobsByTwoIDBlock _Nullable)selectorBlock{
    [JobsNotificationCenter addObserver:self
                               selector:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                     id _Nullable arg) {
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            JobsLog(@"SSS = %d",b.boolValue);
        }if (selectorBlock) selectorBlock(weakSelf,arg);
        return nil;
    }, MethodName(self), self) name:notificationName object:nil];
}

+(JobsRetIDByStrBlock _Nonnull)initByReuseId{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initWithReuseIdentifier:data];
    };
}
/// 不能用于UITableViewHeaderFooterView initByReuseIdentifier
+(JobsRetIDBySaltStrBlock _Nonnull)jobsInitWithReuseIdentifier{
    @jobs_weakify(self)
    return ^id _Nonnull(NSString * _Nullable salt) {
        @jobs_strongify(self)
        return self.initByReuseId(NSStringFromClass(self.class).add(salt));
    };
}
/// 不能用于UITableViewHeaderFooterView
-(JobsRetIDByClsAndSaltStrBlock _Nonnull)jobsInitWithReuseIdentifierClass{
    return ^id _Nonnull(Class _Nonnull cls,NSString * _Nullable salt) {
        return [cls.alloc initWithReuseIdentifier:NSStringFromClass(cls).add(salt)];
    };
}
/// 索取对象obj里面属性名为propertyName的值，如果没有这个属性则查找返回nil
/// @param obj 索取对象
/// @param propertyName 需要查找的属性值
-(id _Nullable)checkTargetObj:(NSObject *_Nullable)obj
                 propertyName:(NSString *_Nullable)propertyName{
    if ([obj.propertyList() containsObject:propertyName]) {
        return obj.valueForKey(propertyName);
    };return nil;
}
/// 版本号比较 版本号的格式：数字中间由点隔开
/// @param versionNumber1 版本号1
/// @param versionNumber2 版本号2
-(CompareRes)versionNumber1:(NSString *_Nonnull)versionNumber1
             versionNumber2:(NSString *_Nonnull)versionNumber2{
    NSString *v1 = versionNumber1.jobsRemoveDecimalPoint();
    NSString *v2 = versionNumber2.jobsRemoveDecimalPoint();
    if (v1.isPureInt() && v2.isPureInt()) {
        if (v1.integerValue > v2.integerValue) {
            return CompareRes_MoreThan;
        }else if (v1.integerValue < v2.integerValue){
            return CompareRes_LessThan;
        }else{
            return CompareRes_Equal;
        }
    }else{
        JobsLog(@"数据异常，请检查：versionNumber1 = %@,versionNumber2 = %@",versionNumber1,versionNumber2);
        return CompareRes_Error;
    }
}
/// 给定一个数据源（数组）和 每行需要展示的元素个数，计算行数
-(JobsRetByNSIntegerBlock _Nonnull)lineNumBy{
    @jobs_weakify(self)
    /// @param num 每行需要展示的元素个数
    return ^NSInteger(NSInteger num){
        @jobs_strongify(self)
        if ([self isKindOfClass:NSArray.class] || [self isKindOfClass:NSMutableArray.class]) {
            NSArray *arr = (NSArray *)self;
            return [self count:arr.count num:num];
        }else return 0;
    };
}
/**
 ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️
 -(ScrollDirection)judgementScrollDirectionByPoint:(CGPoint)point;
 和
 -(CGFloat)scrollOffsetByDirectionXPoint:(CGPoint)point；
 -(CGFloat)scrollOffsetByDirectionYPoint:(CGPoint)point;
 互斥
 * 因为 全局是用唯一变量lastPoint进行保存和判定
 * 而不断地滚动会不断地对lastPoint这个值进行冲刷
 * 而这两个方法都会依赖同一个lastPoint，所以会出现偏差
 ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️
 */
/// X 轴方向的偏移量
-(JobsRetByCGPointBlock _Nonnull)scrollOffsetByDirectionXPoint{
    @jobs_weakify(self)
    return ^CGFloat(CGPoint point){
        @jobs_strongify(self)
        CGFloat f = self.lastPoint.x - point.x;
        self.byLastPoint(point);
        return f;
    };
}
/// Y 轴方向的偏移量
-(JobsRetByCGPointBlock _Nonnull)scrollOffsetByDirectionYPoint{
    @jobs_weakify(self)
    return ^CGFloat(CGPoint point){
        @jobs_strongify(self)
        CGFloat f = self.lastPoint.y - point.y;
        self.byLastPoint(point);
        return f;
    };
}
/// 依据不断地传入的CGPoint *point，系统通过lastPoint来记录上一次的数据，两者进行比较，以此判断滑动的方向
-(JobsRetNSIntegerByPointBlock _Nonnull)judgementScrollDirectionByPoint{
    @jobs_weakify(self)
    /// @param point 最新的point
    return ^NSInteger(CGPoint point){
        @jobs_strongify(self)
        ScrollDirection direction = ScrollDirectionNone;
        if (self.lastPoint.x > point.x &&
            self.lastPoint.y == point.y) {
            JobsLog(@"👉🏻");
            direction = ScrollDirectionRight;
        }else if (self.lastPoint.x < point.x &&
                  self.lastPoint.y == point.y){
            JobsLog(@"👈🏻");
            direction = ScrollDirectionLeft;
        }else if (self.lastPoint.x == point.x &&
                  self.lastPoint.y > point.y){
            JobsLog(@"👇🏻");
            direction = ScrollDirectionDown;
        }else if (self.lastPoint.x == point.x &&
                  self.lastPoint.y < point.y){
            JobsLog(@"👆🏻");
            direction = ScrollDirectionUp;
        }else if (self.lastPoint.x > point.x &&
                  self.lastPoint.y < point.y){
            JobsLog(@"👉🏻👆🏻");
            direction = ScrollDirectionRight_UP;
        }else if (self.lastPoint.x < point.x &&
                  self.lastPoint.y < point.y){
            JobsLog(@"👈🏻👆🏻");
            direction = ScrollDirectionLeft_UP;
        }else if (self.lastPoint.x > point.x &&
                  self.lastPoint.y > point.y){
            JobsLog(@"👉🏻👇🏻");
            direction = ScrollDirectionRight_Down;
        }else if (self.lastPoint.x < point.x &&
                  self.lastPoint.y > point.y){
            JobsLog(@"👈🏻👇🏻");
            direction = ScrollDirectionLeft_Down;
        }
        self.byLastPoint(point);
        return direction;
    };
}
/// 创建IndexPath坐标
-(JobsRetIndexPathByXYBlock _Nonnull)indexPathBy{
    return ^NSIndexPath *_Nonnull(CGFloat x,CGFloat y){
        if (JobsAvailableSysVersion(6.0)) {
            return JobsIndexPathForItem(x, y);
        }else return JobsIndexPathForRow(x, y);
    };
}

-(JobsRetNSIndexPathByJobsIndexPathBlock _Nonnull)myIndexPath{
    @jobs_weakify(self)
    return ^NSIndexPath *_Nonnull(JobsIndexPath indexPath){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.indexPathBy(indexPath.section,indexPath.rowOrItem);
    };
}
/// iOS 获取任意控件在屏幕中的坐标
-(JobsRetFrameByViewBlock _Nonnull)getWindowFrameByView{
    return ^CGRect(__kindof UIView *_Nonnull view){
        // 将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
        return [view convertRect:view.bounds toView:jobsGetMainWindow()];
        /**
         类似的：
         // 将像素point由point所在视图转换到目标视图view中，返回在目标视图view中的像素值
         - (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view;
         // 将像素point从view中转换到当前视图中，返回在当前视图中的像素值
         - (CGPoint)convertPoint:(CGPoint)point fromView:(UIView *)view;
         // 将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
         - (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;
         // 将rect从view中转换到当前视图中，返回在当前视图中的rect
         - (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view;
         */
    };
}
/// 依据View上铆定的internationalizationKEY来全局更改文字以适配国际化
-(jobsByVoidBlock _Nonnull)languageSwitch{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIView *v = self.jobsGetView();
        if (v) {
            for (UIView *view in v.subviews) {
                if (isValue(view.internationalizationKEY)) {
                    if ([view isKindOfClass:UILabel.class]) {
                        UILabel *lab = (UILabel *)view;
                        lab.byText(view.internationalizationKEY.jobsTr());
                    }else if ([view isKindOfClass:UIButton.class]){
                        UIButton *btn = (UIButton *)view;
                        btn.jobsResetBtnTitle(view.internationalizationKEY.jobsTr());
                    }else{}
                }
            }
        }
    };
}
/// 判断是否是此版本App的首次启动
-(JobsRetBOOLByVoidBlock _Nonnull)isAppFirstLaunch{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        BOOL isFirstLaunch = JobsGetUserDefaultBoolForKey(APP安装以后首次启动);
        if (!isFirstLaunch) {
            JobsSetUserBoolKeyWithBool(APP安装以后首次启动, YES);
            JobsUserDefaultSynchronize;
        };return !isFirstLaunch;
    };
}
/// 判断是否是App今日的首次启动
-(JobsRetBOOLByVoidBlock _Nonnull)isTodayAppFirstLaunch{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSString *recordToday = JobsUserDefaults.valueForKey(@"APP今日首次启动");
        JobsTimeModel *timeModel = JobsTimeModel.new;
        NSString *today = toStringByLong(timeModel.currentEra).add(@"-")
                                                              .add(toStringByLong(timeModel.currentYear))
                                                              .add(@"-")
                                                              .add(toStringByLong(timeModel.currentMonth))
                                                              .add(@"-")
                                                              .add(toStringByLong(timeModel.currentDay))
                                                              .add(@"-");
        if (recordToday.isEqualToString(today)) {
            JobsLog(@"今天已经启动过");
        }else{
            JobsLog(@"今天第一次启动");
            JobsSetUserDefaultKeyWithValue(@"APP今日首次启动", today);
            JobsUserDefaultSynchronize;//
        };return !recordToday.isEqualToString(today);
    };
}
/// 震动特效反馈
+(jobsByViewBlock _Nonnull)feedbackGenerator{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable view) {
        @jobs_strongify(self)
        if(!view && [self isKindOfClass:UIView.class]) view = (UIView *)self;
        if(!view && [self isKindOfClass:UIViewController.class]) {
            UIViewController *vc = (UIViewController *)self;
            view = vc.view;
        }
        if (@available(iOS 17.5, *)) {
            /// iOS 17.5 及以上使用新的 API
            UIImpactFeedbackGenerator *generator = UIImpactFeedbackGenerator.initMediumStyleBy(view);
            [generator impactOccurred];
        } else if (@available(iOS 10.0, *)) {
            /// iOS 10.0 - 17.4 使用旧的初始化方法
            UIImpactFeedbackGenerator *generator = UIImpactFeedbackGenerator.initByMediumStyle;
            generator.prepare;
            [generator impactOccurred];
        } else {
            /// iOS 10.0 以下，使用系统音效反馈
            AudioServicesPlaySystemSound(1520);
        }
    };
}
/// 检测用户是否锁屏：根据屏幕光线来进行判定，而不是系统通知
-(JobsRetBOOLByVoidBlock _Nonnull)didUserPressLockButton{
    return ^BOOL() {
        /// 获取屏幕亮度
        CGFloat oldBrightness = UIScreen.mainScreen.brightness;
        /// 以较小的数量改变屏幕亮度
        UIScreen.mainScreen.byBrightness(oldBrightness + (oldBrightness <= 0.01 ? (0.01) : (-0.01)));
        CGFloat newBrightness = UIScreen.mainScreen.brightness;
        /// 恢复屏幕亮度
        UIScreen.mainScreen.byBrightness(oldBrightness);
        /// 判断屏幕亮度是否能够被改变
        return oldBrightness != newBrightness;
    };
}
/// iOS 限制自动锁屏 lockSwitch:YES(关闭自动锁屏)
-(jobsByBOOLBlock _Nonnull)autoLockedScreen{
    return ^(BOOL lockSwitch) {
        UIApplication.sharedApplication.byIdleTimerDisabled(lockSwitch);
    };
}

-(jobsByGKPhotoBrowserBlock _Nonnull)savePic{
    @jobs_weakify(self)
    return ^(GKPhotoBrowser *_Nonnull browser) {
        @jobs_strongify(self)
        if (browser) {
            GKPhoto *photo = browser.photos[browser.currentIndex];
            NSData *imageData = nil;
            if ([photo.image isKindOfClass:SDAnimatedImage.class]) {
                imageData = [(SDAnimatedImage *)photo.image animatedImageData];
            }else if ([photo.image isKindOfClass:YYImage.class]) {
                imageData = [(YYImage *)photo.image animatedImageData];
            }else {
                imageData = photo.image.sd_imageData;
            }
            if (!imageData) return;
            self.saveImageData(imageData);
        }else JobsLog(@"GKPhotoBrowser * 为空");
    };
}

-(jobsByDataBlock _Nonnull)saveImageData{
    return ^(NSData *_Nullable imageData) {
        /// OC 是强类型、弱语法的语言，所以这里需要进行过滤判定保证安全性
        if ([imageData isKindOfClass:UIImage.class]){
            imageData = UIImagePNGRepresentation((UIImage *)imageData);
        }
        if ([imageData isKindOfClass:NSData.class]) {
            [PHPhotoLibrary.sharedPhotoLibrary performChanges:^{
                if (@available(iOS 9, *)) {
                    PHAssetCreationRequest *request = PHAssetCreationRequest.creationRequestForAsset;
                    [request addResourceWithType:PHAssetResourceTypePhoto
                                            data:imageData
                                         options:nil];
                    request.byCreationDate(NSDate.date);
                }
            } completionHandler:^(BOOL success,NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (success) {
                        JobsLog(@"保存照片成功");
                        toastBy(@"图片保存成功".jobsTr());
                    } else if (error) {
                        JobsLog(@"保存照片出错:%@",error.localizedDescription);
                        toastErr(@"保存保存失败".jobsTr());
                    }
                });
            }];
        }else return;
    };
}
/// 将基本数据类型（先统一默认视作浮点数）转化为图片进行显示。使用前提，图片的名字命令为0~9，方便进行映射
/// @param inputData 需要进行转换映射的基本数据类型数据
/// @param bitNum 如果操作对象是浮点数，那么小数点后需要保留的位数
-(nonnull NSMutableArray <UIImage *>*)translateToArr:(CGFloat)inputData
                                   saveBitAfterPoint:(NSInteger)bitNum{
    if (self.isFloat(inputData) && !bitNum) bitNum = 2;/// 默认保存小数点后2位
    NSString *format = @"%.".add(JobsFormattedString(@"%ldf",bitNum));
    NSString *str = JobsFormattedString(format,inputData);
    return jobsMakeMutArr(^(__kindof NSMutableArray <UIImage *>*_Nullable data) {
        NSUInteger len = str.length;
        unichar buffer[len + 1];
        [str getCharacters:buffer range:NSMakeRange(0, len)];
        for(int i = 0; i < len; i++) {
            NSString *temp = JobsFormattedString(@"%C",buffer[i]);
            /// 数字映射图片
            if (temp.isEqualToString(@".")) temp = @"小数点";
            data.add(temp.img);
        }
    });
}
/// 读取本地的plist文件到内存  【 plist ——> NSDictionary * 】
-(JobsRetDicByStringBlock _Nonnull)readLocalPlistWithFileName{
    /// fileName Plist文件名
    return ^__kindof NSDictionary *_Nullable(NSString * _Nullable fileName) {
        NSString *filePath = JobsBundleResourcePath(nil,
                                                 fileName,
                                                 nil,
                                                 @"plist");
        if (FileFolderHandleTool.isExistsAtPath(filePath)) {
            return NSDictionary.initByContentsOfFile(filePath);
        };return (NSDictionary *)nil;
    };
}
/// 监听程序被杀死前的时刻，进行一些需要异步的操作：磁盘读写、网络请求...
-(jobsByjobsByIDBlockBlock _Nonnull)terminalCheck{
    @jobs_weakify(self)
    return ^(jobsByIDBlock _Nullable checkBlock){
        @jobs_strongify(self)
        if (!self) return;
        [self addNotificationName:@"UIApplicationWillTerminateNotification"
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                JobsLog(@"我只执行一次");
                /// 在这里写遗言：最后希望去完成的事情
                if (checkBlock) checkBlock(@1);
                [NSThread sleepForTimeInterval:60];
                JobsLog(@"程序被杀死");
            });
        }];
    };
}
/// Object转换为NSData
-(JobsRetDataByIDBlock _Nonnull)transformToData{
    @jobs_weakify(self)
    return ^NSData *_Nullable(id _Nullable object){
        @jobs_strongify(self)
        if (!self) return nil;
        if ([object isKindOfClass:NSString.class]) {
            NSString *string = (NSString *)object;
            return string.jobsUTF8Encoding();
        }else if ([object isKindOfClass:NSArray.class]){
            NSArray *array = (NSArray *)object;
            /*
             *  object 要归档的对象图的根
             *  requiresSecureCoding 一个布尔值，指示是否所有编码对象都必须符合 NSSecureCoding
             *  error 返回时，是编码时发生的错误，或者nil没有发生错误
             */
            if (@available(iOS 11.0, *)) {
                return NSKeyedArchiver.archivedDataByRootObject_YES(array);
            }else{
                SuppressWdeprecatedDeclarationsWarning(return NSKeyedArchiver.initByObject(array));
            }
        }else if ([object isKindOfClass:NSDictionary.class]){
            return self.dataByJSONObject(object);
        }else return nil;
    };
}
/// 获取当前设备可用内存
-(JobsRetDoubleByVoidBlock _Nonnull)availableMemory{
    @jobs_weakify(self)
    return ^double{
        @jobs_strongify(self)
        if (!self) return (double){0};
        vm_statistics_data_t vmStats;
        mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
        kern_return_t kernReturn = host_statistics(mach_host_self(),
                                                   HOST_VM_INFO,
                                                   (host_info_t)&vmStats,
                                                   &infoCount);
        if (kernReturn != KERN_SUCCESS) {
            return NSNotFound;
        };return ((vm_page_size * vmStats.free_count)/1024.0)/1024.0;
    };
}
/// 获取当前任务所占用内存
-(JobsRetDoubleByVoidBlock _Nonnull)usedMemory{
    @jobs_weakify(self)
    return ^double{
        @jobs_strongify(self)
        if (!self) return (double){0};
        task_basic_info_data_t taskInfo;
        mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
        kern_return_t kernReturn = task_info(mach_task_self(),
                                             TASK_BASIC_INFO,
                                             (task_info_t)&taskInfo,
                                             &infoCount);
        if (kernReturn != KERN_SUCCESS) {
            return NSNotFound;
        };return taskInfo.resident_size/1024.0/1024.0;
    };
}
#pragma mark —— 尺寸
/*
    参考资料：https://blog.csdn.net/www9500net_/article/details/52437987
 */
/// TableViewCell 相对于此TableView的frame【用indexPath】
/// @param tableView 此TableView
/// @param indexPath 用indexPath定位📌TableViewCell
-(CGRect)tbvCellRectInTableView:(UITableView *_Nonnull)tableView
                    atIndexPath:(NSIndexPath *_Nonnull)indexPath{
    return [tableView rectForRowAtIndexPath:indexPath];
}
/// TableViewCell 相对于此TableView的frame【用TableViewCell】❤️
-(CGRect)tableViewCell:(UITableViewCell *_Nonnull)tableViewCell
      frameInTableView:(UITableView *_Nonnull)tableView{
    NSIndexPath *indexPath = [tableView indexPathForCell:tableViewCell];
    return [tableView rectForRowAtIndexPath:indexPath];
}
/// TableViewCell 相对于承接此tableView的父视图的frame【用indexPath】
/// @param tableView 此TableView
/// @param tbvSuperview 承接这个TableView的父容器View
/// @param indexPath 用indexPath定位📌TableViewCell
-(CGRect)tableView:(__kindof UITableView *_Nonnull)tableView
      tbvSuperview:(__kindof UIView *_Nonnull)tbvSuperview
   cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath{
    CGRect rectInTableView = [self tbvCellRectInTableView:tableView atIndexPath:indexPath];
    return [tableView convertRect:rectInTableView toView:tbvSuperview];
}
/// TableViewCell 相对于承接此tableView的父视图的frame【用TableViewCell】❤️
-(CGRect)tableView:(__kindof UITableView *_Nonnull)tableView
      tbvSuperview:(__kindof UIView *_Nonnull)tbvSuperview
     tableViewCell:(__kindof UITableViewCell *_Nonnull)tableViewCell{
    CGRect rectInTableView = [self tableViewCell:tableViewCell frameInTableView:tableView];
    return [tableView convertRect:rectInTableView toView:tbvSuperview];
}
/// 获取CollectionViewCell在当前collection的位置【用indexPath】
/// @param collectionView 此CollectionView
/// @param indexPath 用indexPath定位📌CollectionViewCell
-(CGRect)frameInCollectionView:(__kindof UICollectionView *_Nonnull)collectionView
               cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    return [collectionView convertRect:cell.frame toView:collectionView];
}
/// 获取CollectionViewCell在当前collection的位置【用collectionViewCell】❤️
-(CGRect)collectionViewCell:(__kindof UICollectionViewCell *_Nonnull)collectionViewCell
      frameInCollectionView:(__kindof UICollectionView *_Nonnull)collectionView{
    return [collectionView convertRect:collectionViewCell.frame toView:collectionView];
}
/// 获取CollectionViewCell在当前屏幕的位置【用indexPath】
/// @param cvSuperview 承接这个CollectionView的父容器View
/// @param collectionView  此CollectionView
/// @param indexPath 用indexPath定位📌CollectionViewCell
-(CGRect)frameInCVSuperview:(__kindof UIView *_Nonnull)cvSuperview
             collectionView:(__kindof UICollectionView *_Nonnull)collectionView
            cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath{
    CGRect cellInCollection = [self frameInCollectionView:collectionView
                                          cellAtIndexPath:indexPath];
    return [collectionView convertRect:cellInCollection toView:cvSuperview];
}
/// 获取CollectionViewCell在当前屏幕的位置【用collectionViewCell】❤️
-(CGRect)frameInCVSuperview:(__kindof UIView *_Nonnull)cvSuperview
             collectionView:(__kindof UICollectionView *_Nonnull)collectionView
         collectionViewCell:(__kindof UICollectionViewCell *_Nonnull)collectionViewCell{
    CGRect cellInCollection = [self collectionViewCell:collectionViewCell frameInCollectionView:collectionView];
    return [collectionView convertRect:cellInCollection toView:cvSuperview];
}
#pragma mark —— 利用数组和NSValue，存取结构体
/// CGPoint
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                       addCGPoint:(CGPoint)point{
    return (NSMutableArray <NSValue *>*)mutArr.add(NSValue.byPoint(point));
}

-(JobsRetCGPointByNSValueBlock _Nonnull)jobsGetPoint{
    @jobs_weakify(self)
    return ^CGPoint(NSValue *_Nullable value){
        @jobs_strongify(self)
        if (!self) return (CGPoint){0};
        return value.CGPointValue;
    };
}
/// CGVector
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                      addCGVector:(CGVector)vector{
    return (NSMutableArray <NSValue *>*)mutArr.add(NSValue.byVector(vector));
}

-(JobsRetCGVectorByNSValueBlock _Nonnull)jobsGetVector{
    @jobs_weakify(self)
    return ^CGVector(NSValue *_Nullable value){
        @jobs_strongify(self)
        if (!self) return (CGVector){0};
        return value.CGVectorValue;
    };
}
/// CGSize
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                        addCGSize:(CGSize)size{
    return (NSMutableArray <NSValue *>*)mutArr.add(NSValue.bySize(size));
}

-(JobsRetCGSizeByNSValueBlock _Nonnull)jobsGetSize{
    @jobs_weakify(self)
    return ^CGSize(NSValue *_Nullable value){
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return value.CGSizeValue;
    };
}
/// CGRect
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                        addCGRect:(CGRect)frame{
    return (NSMutableArray <NSValue *>*)mutArr.add(NSValue.byRect(frame));
}

-(JobsRetCGRectByNSValueBlock _Nonnull)jobsGetFrame{
    @jobs_weakify(self)
    return ^CGRect(NSValue *_Nullable value){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        return value.CGRectValue;
    };
}
/// CGAffineTransform
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                             addCGAffineTransform:(CGAffineTransform)affineTransform{
    return (NSMutableArray <NSValue *>*)mutArr.add(NSValue.byAffineTransform(affineTransform));
}

-(JobsRetCGAffineTransformByNSValueBlock _Nonnull)jobsGetCGAffineTransform{
    @jobs_weakify(self)
    return ^CGAffineTransform(NSValue *_Nullable value){
        @jobs_strongify(self)
        if (!self) return (CGAffineTransform){0};
        return value.CGAffineTransformValue;
    };
}
/// UIEdgeInsets
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                  addUIEdgeInsets:(UIEdgeInsets)edgeInsets{
    return (NSMutableArray <NSValue *>*)mutArr.add(NSValue.byEdgeInsets(edgeInsets));
}

-(JobsRetUIEdgeInsetsByNSValueBlock _Nonnull)jobsGetUIEdgeInsets{
    @jobs_weakify(self)
    return ^UIEdgeInsets(NSValue *_Nullable value){
        @jobs_strongify(self)
        if (!self) return (UIEdgeInsets){0};
        return value.UIEdgeInsetsValue;
    };
}
/// NSDirectionalEdgeInsets
-(NSMutableArray <NSValue *>*)jobsMutArr:(NSMutableArray <NSValue *>*)mutArr
              addNSDirectionalEdgeInsets:(NSDirectionalEdgeInsets)directionalEdgeInsets{
    return (NSMutableArray <NSValue *>*)mutArr.add(NSValue.byDirectionalEdgeInsets(directionalEdgeInsets));
}

-(JobsRetNSDirectionalEdgeInsetsByNSValueBlock _Nonnull)jobsGetNSDirectionalEdgeInsets{
    @jobs_weakify(self)
    return ^NSDirectionalEdgeInsets(NSValue *_Nullable value){
        @jobs_strongify(self)
        if (!self) return (NSDirectionalEdgeInsets){0};
        return value.directionalEdgeInsetsValue;
    };
}
/// UIOffset
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                      addUIOffset:(UIOffset)offset{
    return (NSMutableArray <NSValue *>*)mutArr.add(NSValue.byOffset(offset));
}

-(JobsRetUIOffsetByNSValueBlock _Nonnull)jobsGetValueWithUIOffset{
    @jobs_weakify(self)
    return ^UIOffset(NSValue *_Nullable value){
        @jobs_strongify(self)
        if (!self) return (UIOffset){0};
        return value.UIOffsetValue;
    };
}
#pragma mark —— 数字
/// 获取任意数字最高位数字
-(JobsRetByNSIntegerBlock _Nonnull)topDigit{
    @jobs_weakify(self)
    return ^NSInteger(NSInteger number){
        @jobs_strongify(self)
        number = labs(number);// abs()
        if (number < 10){
            return number;
        };return self.topDigit(((number - (number % 10)) / 10));
    };
}
#pragma mark —— 检测当前设备屏幕方向
//https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md
-(JobsRetCGFloatByVoidBlock _Nonnull)jobsMainScreen_HEIGHT{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? JobsMainScreen_WIDTH() : JobsMainScreen_HEIGHT();
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)jobsMainScreen_WIDTH{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? JobsMainScreen_HEIGHT() : JobsMainScreen_WIDTH();
    };
}

-(__kindof UIView *_Nullable)getView{
    JobsRetViewByVoidBlock action = ((JobsRetViewByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsGetView)))(self, @selector(jobsGetView));
    return action ? action() : nil;
}

-(JobsRetViewByVoidBlock _Nonnull)jobsGetView{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        UIView *view = nil;
        if ([self isKindOfClass:UIView.class]) {
            view = (UIView *)self;
        }else if ([self isKindOfClass:UIViewController.class]){
            UIViewController *vc = (UIViewController *)self;
            view = vc.view;
        };return view;
    };
}

-(JobsRetIDByJobsRetIDByComponentTypeAndUIViewBlockBlock _Nonnull)getViewByBlock{
    @jobs_weakify(self)
    return ^id _Nullable(JobsRetIDByComponentTypeAndUIViewBlock _Nullable block){
        @jobs_strongify(self)
        if (!self) return nil;
        UIView *view = nil;
        if ([self isKindOfClass:UIView.class]) {
            view = (UIView *)self;
            if(block) return block(ComponentTypeView,view);
        }else if ([self isKindOfClass:UIViewController.class]){
            UIViewController *vc = (UIViewController *)self;
            view = vc.view;
            if(block) return block(ComponentTypeViewController,view);
        }else if(block) return block(ComponentTypeUnknown,nil);
        return nil;
    };
}
/// UIInterfaceOrientationMask 检测屏幕方向
-(JobsRetCGSizeByJobsRetSizeByUIntegerBlockBlock _Nonnull)checkScreenOrientation_UIInterfaceOrientationMask{
    @jobs_weakify(self)
    return ^CGSize(JobsRetSizeByUIntegerBlock _Nullable interfaceOrientationMaskBlock){
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        if (interfaceOrientationMaskBlock){
            return interfaceOrientationMaskBlock( JobsAppTool.currentInterfaceOrientationMask);
        }else return CGSizeZero;
    };
}
/// UIInterfaceOrientation 检测屏幕方向
-(UIInterfaceOrientation)getInterfaceOrientation{
    JobsRetUIInterfaceOrientationByVoidBlock action = ((JobsRetUIInterfaceOrientationByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsGetInterfaceOrientation)))(self, @selector(jobsGetInterfaceOrientation));
    return action ? action() : (UIInterfaceOrientation){0};
}

-(JobsRetUIInterfaceOrientationByVoidBlock _Nonnull)jobsGetInterfaceOrientation{
    @jobs_weakify(self)
    return ^UIInterfaceOrientation{
        @jobs_strongify(self)
        if (!self) return (UIInterfaceOrientation){0};
        UIInterfaceOrientation __block currentOrientation = UIInterfaceOrientationUnknown;
        if (@available(iOS 13.0, *)) {
            self.getViewByBlock(^id _Nullable(ComponentType componentType,
                                               UIView * _Nullable data) {
                /// 获取当前窗口场景的界面方向
                currentOrientation = data.window.windowScene.interfaceOrientation;
                return nil;
            });
        } else {
            SuppressWdeprecatedDeclarationsWarning(currentOrientation = UIApplication.sharedApplication.statusBarOrientation;);
        };return currentOrientation;
    };
}
/// UIInterfaceOrientation 检测屏幕方向
-(JobsRetCGSizeByJobsRetSizeByNSIntegerBlockBlock _Nonnull)checkScreenOrientation_UIInterfaceOrientation{
    @jobs_weakify(self)
    return ^CGSize(JobsRetSizeByNSIntegerBlock _Nullable interfaceOrientationBlock){
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        if(self.getInterfaceOrientation == UIInterfaceOrientationUnknown) return CGSizeZero;
        if (interfaceOrientationBlock) return interfaceOrientationBlock(self.jobsGetInterfaceOrientation());
        return CGSizeZero;
    };
}
/// DeviceOrientation 检测屏幕方向
-(JobsRetDeviceOrientationByVoidBlock _Nonnull)jobsGetDeviceOrientation{
    @jobs_weakify(self)
    return ^DeviceOrientation{
        @jobs_strongify(self)
        if (!self) return (DeviceOrientation){0};
        UIView *view = self.jobsGetView();
        return view ? (view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact ? DeviceOrientationLandscape : DeviceOrientationPortrait)
        :DeviceOrientationUnknown;
    };
}
/// 横屏通知的监听
-(void)横屏通知的监听:(JobsSelectorBlock1 _Nullable)block{
    [self addNotificationName:UIDeviceOrientationDidChangeNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        switch (UIDevice.currentDevice.orientation) {
            /// 处理 UIDeviceOrientationFaceUp 分支
            case UIDeviceOrientationFaceUp:
                JobsLog(@"屏幕朝上平躺");
                break;
            /// 处理 UIDeviceOrientationFaceDown 分支
            case UIDeviceOrientationFaceDown:
                JobsLog(@"屏幕朝下平躺");
                break;
            /// 处理 UIDeviceOrientationUnknown 分支
            case UIDeviceOrientationUnknown:
                JobsLog(@"屏幕未知方向");
                break;
            /// 处理 UIDeviceOrientationLandscapeLeft 分支
            case UIDeviceOrientationLandscapeLeft:
                JobsLog(@"屏幕向左横置");
                 JobsAppTool.byCurrentInterfaceOrientation(UIInterfaceOrientationLandscapeRight);
                 JobsAppTool.byCurrentInterfaceOrientationMask(UIInterfaceOrientationMaskLandscapeRight);
                 JobsAppTool.byJobsDeviceOrientation(DeviceOrientationLandscape);
                break;
            /// 处理 UIDeviceOrientationLandscapeRight 分支
            case UIDeviceOrientationLandscapeRight:
                JobsLog(@"屏幕向右橫置");
                 JobsAppTool.byCurrentInterfaceOrientation(UIInterfaceOrientationLandscapeLeft);
                 JobsAppTool.byCurrentInterfaceOrientationMask(UIInterfaceOrientationMaskLandscapeLeft);
                 JobsAppTool.byJobsDeviceOrientation(DeviceOrientationLandscape);
                break;
            /// 处理 UIDeviceOrientationPortrait 分支
            case UIDeviceOrientationPortrait:
                JobsLog(@"屏幕直立");
                 JobsAppTool.byCurrentInterfaceOrientation(UIInterfaceOrientationPortrait);
                 JobsAppTool.byCurrentInterfaceOrientationMask(UIInterfaceOrientationMaskPortrait);
                 JobsAppTool.byJobsDeviceOrientation(DeviceOrientationPortrait);
                break;
            /// 处理 UIDeviceOrientationPortraitUpsideDown 分支
            case UIDeviceOrientationPortraitUpsideDown:
                JobsLog(@"屏幕直立，上下顛倒");
                 JobsAppTool.byCurrentInterfaceOrientation(UIInterfaceOrientationPortraitUpsideDown);
                 JobsAppTool.byCurrentInterfaceOrientationMask(UIInterfaceOrientationMaskPortraitUpsideDown);
                 JobsAppTool.byJobsDeviceOrientation(DeviceOrientationPortrait);
                break;
            /// 未匹配已知分支时执行兜底处理
            default:
                JobsLog(@"屏幕方向无法辨识");
                break;
            }
        if(block)block(weakSelf,arg,@( JobsAppTool.jobsDeviceOrientation));
    }];
}
#pragma mark —— 键盘⌨️
/**
 使用方法：
 IQKeyboardManager.sharedManager.enable = NO;
 [self keyboardByUpBlock:^(NSNotificationKeyboardModel * _Nullable data) {
     JobsLog(@"");
 } downBlock:^(NSNotificationKeyboardModel * _Nullable data) {
     JobsLog(@"");
 }];
 [self actionNotificationBlock:^id(NSNotificationKeyboardModel *data) {
     @jobs_strongify(self)
     JobsLog(@"userInfo = %@",data.userInfo);
     JobsLog(@"beginFrame = %@",NSStringFromCGRect(data.beginFrame));
     JobsLog(@"endFrame = %@",NSStringFromCGRect(data.endFrame));
     JobsLog(@"keyboardOffsetY = %f",data.keyboardOffsetY);
     JobsLog(@"notificationName = %@",data.notificationName);
     if (data.notificationName.isEqualToString(@"UIKeyboardWillChangeFrameNotification")) {

         if (data.keyboardOffsetY >= 0) {
             [self.collectionView setContentOffset:CGPointMake(0,self.collectionView.contentOffset.y + data.keyboardOffsetY)
                                          animated:YES];
         }else if(data.keyboardOffsetY < 0){
             [self.collectionView setContentOffset:CGPointMake(0,0)
                                          animated:YES];
         }
         
     }else if (data.notificationName.isEqualToString(@"UIKeyboardDidChangeFrameNotification")){
         JobsLog(@"");
     }else{}
     
     return nil;
 }];
 */
/// 加入键盘通知的监听者
-(void)keyboardByUpBlock:(jobsByNSNotificationKeyboardModelBlock _Nullable)upBlock
               downBlock:(jobsByNSNotificationKeyboardModelBlock _Nullable)downBlock{
    [self addNotificationName:UIKeyboardWillChangeFrameNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        NSNotification *notification = (NSNotification *)arg;
        JobsLog(@"通知传递过来的 = %@",notification.object);
        NSNotificationKeyboardModel *model = jobsMakeNotificationKeyboardModel(^(NSNotificationKeyboardModel * _Nullable data) {
            data.byUserInfo(notification.userInfo)
                .byBeginFrame([notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue])
                .byEndFrame([notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue])
                .byKeyboardOffsetY(data.beginFrame.origin.y - data.endFrame.origin.y)// 正则抬起 ，负值下降
                .byNotificationName(UIKeyboardWillChangeFrameNotification);
        });
        JobsLog(@"KeyboardOffsetY = %f", model.keyboardOffsetY);
        if (model.keyboardOffsetY > 0) {
            JobsLog(@"键盘抬起");
            if (upBlock) upBlock(model);
        }else if(model.keyboardOffsetY < 0){
            JobsLog(@"键盘收回");
            if (downBlock) downBlock(model);
        }else{
            JobsLog(@"键盘");
        }
    }];
}
/// Prop_weak(nullable)id weak_target;/// 描述方法实现的位置
JobsKey(_weak_target)
@dynamic weak_target;
-(id)weak_target{
    id weakTarget = Jobs_getAssociatedObject(_weak_target);
    if (!weakTarget) {
        @jobs_weakify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_weak_target, weak_self)
    };return weakTarget;
}

-(void)setWeak_target:(id)weak_target{
    Jobs_setAssociatedRETAIN_NONATOMIC(_weak_target, weak_target)
}
/// Prop_assign()CGPoint lastPoint;
PROP_CGPOINT(lastPoint, LastPoint)
-(JobsRetIDByCGPointBlock _Nonnull)byLastPoint{
    @jobs_weakify(self)
    return ^id(CGPoint lastPoint){
        @jobs_strongify(self)
        [self setLastPoint:lastPoint];
        return self;
    };
}

-(JobsRetIDByCGPointBlock _Nonnull)byJobsPoint{
    @jobs_weakify(self)
    return ^id _Nullable(CGPoint point){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setJobsPoint:point];
        return self;
    };
}

-(JobsRetIDByCGSizeBlock _Nonnull)byThisViewSize{
    @jobs_weakify(self)
    return ^id _Nullable(CGSize size){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setThisViewSize:size];
        return self;
    };
}

-(JobsRetIDByImageBlock _Nonnull)byBgImage{
    @jobs_weakify(self)
    return ^id _Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setBgImage:image];
        return self;
    };
}
#pragma mark —— Prop_strong()NSIndexPath *indexPath;
PROP_STRONG_OBJECT_TYPE(NSIndexPath, indexPath, IndexPath)
/// Prop_assign()NSInteger currentPage;
JobsKey(_currentPage)
@dynamic currentPage;
-(NSNumber *)currentPage{
    NSNumber *currentPage = Jobs_getAssociatedObject(_currentPage);
    if (!currentPage) {
        currentPage = @(1);
        Jobs_setAssociatedRETAIN_NONATOMIC(_currentPage, currentPage)
    };return currentPage;
}

-(void)setCurrentPage:(NSNumber *)currentPage{
    Jobs_setAssociatedRETAIN_NONATOMIC(_currentPage, currentPage)
}

-(JobsRetIDByIDBlock _Nonnull)byCurrentPage{
    @jobs_weakify(self)
    return ^id(NSNumber *_Nullable currentPage){
        @jobs_strongify(self)
        [self setCurrentPage:currentPage];
        return self;
    };
}
#pragma mark —— Prop_assign()NSInteger pageSize;
JobsKey(_pageSize)
@dynamic pageSize;
-(NSInteger)pageSize{
    NSInteger PageSize = [Jobs_getAssociatedObject(_pageSize) integerValue];
    if (PageSize == 0) {
        PageSize = 10;
        Jobs_setAssociatedRETAIN_NONATOMIC(_pageSize, @(PageSize))
    };return PageSize;
}

-(void)setPageSize:(NSInteger)pageSize{
    Jobs_setAssociatedRETAIN_NONATOMIC(_pageSize, @(pageSize))
}
/// Prop_assign()NSInteger index;
PROP_NSInteger(index, Index)
/// Prop_strong()UIViewModel *viewModel;
PROP_STRONG_OBJECT_Default_TYPE(UIViewModel, viewModel, ViewModel)

-(JobsRetIDByIDBlock _Nonnull)byViewModel{
    return ^id(UIViewModel *_Nullable viewModel){
        [self setViewModel:viewModel];
        return self;
    };
}
/// Prop_copy()NSString *internationalizationKEY;/// 国际化的key
PROP_COPY_OBJECT_TYPE(NSString, internationalizationKEY, InternationalizationKEY)

@end

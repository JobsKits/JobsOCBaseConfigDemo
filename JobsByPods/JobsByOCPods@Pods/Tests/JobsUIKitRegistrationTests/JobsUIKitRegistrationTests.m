//
//  JobsUIKitRegistrationTests.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsUIKitRegistrationTests.h"
#import <JobsByOCPods/NSObject+Extra.h>
#import <JobsByOCPods/NSObject+Notification.h>
#import <JobsLanMgr/JobsLanMgr.h>
#import <JobsOCDSL/UIView+Gesture.h>
#import <JobsOCDSL/UIGestureRecognizer+Extra.h>
#import <JobsOCRuntimeKits/NSObject+DynamicInvoke.h>
#import <JobsOCRuntimeKits/JobsSEL_IMP.h>
#import <dlfcn.h>

// 静态 framework 会链接进宿主；用真实保存回调与 handler 区分 native / RAC getter。
static IMP JobsNativeGestureCallbackGetter(SEL selector) {
    SEL handler = NSSelectorFromString(@"jobs_ocdsl_handleGestureAction:");
    Method handlerMethod = class_getInstanceMethod(UIGestureRecognizer.class, handler);
    if (!handlerMethod) {
        return NULL;
    }
    unsigned int count = 0;
    Method *methods = class_copyMethodList(UIGestureRecognizer.class, &count);
    IMP result = NULL;
    NSUInteger candidates = 0;
    for (unsigned int index = 0; index < count; index++) {
        if (method_getName(methods[index]) != selector) {
            continue;
        }
        candidates += 1;
        IMP implementation = method_getImplementation(methods[index]);
        __block NSUInteger callbacks = 0;
        @autoreleasepool {
            UITapGestureRecognizer *probe = UITapGestureRecognizer.new;
            if (selector == @selector(GestureActionBy)) {
                JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock install =
                    ((JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock (*)(id, SEL))implementation)(probe, selector);
                install(^(UIGestureRecognizer *gesture) {
                    callbacks += 1;
                });
            }else {
                JobsRetUIGestureRecognizerByjobsByVoidBlockBlock install =
                    ((JobsRetUIGestureRecognizerByjobsByVoidBlockBlock (*)(id, SEL))implementation)(probe, selector);
                install(^{
                    callbacks += 1;
                });
            }
            IMP callback = [probe methodForSelector:handler];
            ((void (*)(id, SEL, id))callback)(probe, handler, probe);
        }
        Dl_info getterImage = {0};
        Dl_info handlerImage = {0};
        dladdr((const void *)implementation, &getterImage);
        dladdr((const void *)method_getImplementation(handlerMethod), &handlerImage);
        NSLog(@"Jobs UIKit native callback candidate: selector=%@ getterIMP=%p getterImage=%s handlerIMP=%p handlerImage=%s candidate=%lu classMethodCount=%u callbacks=%lu",
              NSStringFromSelector(selector), (void *)implementation,
              getterImage.dli_fname ?: "unknown",
              (void *)method_getImplementation(handlerMethod),
              handlerImage.dli_fname ?: "unknown",
              (unsigned long)candidates, count, (unsigned long)callbacks);
        if (callbacks == 1) {
            result = implementation;
            break;
        }
    }
    NSLog(@"Jobs UIKit native callback proof: selector=%@ selectedIMP=%p candidates=%lu classMethodCount=%u",
          NSStringFromSelector(selector), (void *)result, (unsigned long)candidates, count);
    free(methods);
    return result;
}

@interface JobsUIKitRegistrationTests ()
@property(nonatomic,copy)NSString *acceptanceCellIdentifier;
@property(nonatomic,strong)UICollectionReusableView *acceptanceSupplementary;
@end

@implementation JobsUIKitRegistrationTests

-(jobsByVoidBlock)logOut {
    __weak typeof(self) weakSelf = self;
    return ^{
        __strong typeof(weakSelf) self = weakSelf;
        self.logoutRequests += 1;
    };
}

-(jobsByStrBlock)jobsToastSuccessMsg {
    __weak typeof(self) weakSelf = self;
    return ^(NSString *message) {
        __strong typeof(weakSelf) self = weakSelf;
        self.logoutToastRequests += 1;
    };
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    self.lastCell = [collectionView dequeueReusableCellWithReuseIdentifier:self.acceptanceCellIdentifier ?: @"UICollectionViewCell" forIndexPath:indexPath];
    return self.lastCell;
}

-(void)testClassAndNibRegistrationAndNilReset {
    UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)
                                              collectionViewLayout:UICollectionViewFlowLayout.new];
    [view registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"class-cell"];
    XCTAssertTrue(view.isRegisteredForReuseIdentifier(@"class-cell"));
    [view registerClass:Nil forCellWithReuseIdentifier:@"class-cell"];
    XCTAssertFalse(view.isRegisteredForReuseIdentifier(@"class-cell"));
    UINib *nib = [UINib nibWithNibName:@"JobsRegistrationFixtureCell" bundle:[NSBundle bundleForClass:self.class]];
    [view registerNib:nib forCellWithReuseIdentifier:@"UICollectionViewCell"];
    XCTAssertTrue(view.isRegisteredForReuseIdentifier(@"UICollectionViewCell"));
    view.dataSource = self;
    [view reloadData];
    [view layoutIfNeeded];
    XCTAssertNotNil(self.lastCell);
    CGFloat red = 0, green = 0, blue = 0, alpha = 0;
    XCTAssertTrue([self.lastCell.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha]);
    XCTAssertEqualWithAccuracy(red, 1, 0.001);
    XCTAssertEqualWithAccuracy(green, 0, 0.001);
    XCTAssertEqualWithAccuracy(blue, 0, 0.001);
    [view registerNib:nil forCellWithReuseIdentifier:@"UICollectionViewCell"];
    XCTAssertFalse(view.isRegisteredForReuseIdentifier(@"UICollectionViewCell"));
}

-(void)testPopToRootHandlesAnimatedAndEmptyStacks {
    void (^onMain)(dispatch_block_t) = ^(dispatch_block_t action) {
        if (NSThread.isMainThread) {
            action();
        }else {
            dispatch_sync(dispatch_get_main_queue(), action);
        }
    };
    __block UIWindow *window = nil;
    __block UIWindow *previousKeyWindow = nil;
    __block UIViewController *root = nil;
    __block UINavigationController *navigation = nil;
    __block XCTestExpectation *shown = nil;
    @try {
        onMain(^{
            UIWindowScene *windowScene = nil;
            for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
                if ([scene isKindOfClass:UIWindowScene.class] &&
                    scene.activationState == UISceneActivationStateForegroundActive) {
                    windowScene = (UIWindowScene *)scene;
                    break;
                }
            }
            for (UIWindow *candidate in windowScene.windows) {
                if (candidate.isKeyWindow) {
                    previousKeyWindow = candidate;
                    break;
                }
            }
            window = windowScene ? [[UIWindow alloc] initWithWindowScene:windowScene] :
                [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
            root = UIViewController.new;
            UIViewController *detail = UIViewController.new;
            navigation = [[UINavigationController alloc] initWithRootViewController:root];
            [navigation setViewControllers:@[root, detail] animated:NO];
            navigation.delegate = self;
            self.expectedShownViewController = detail;
            shown = self.navigationShownExpectation = [self expectationWithDescription:@"Initial navigation is visible"];
            window.rootViewController = navigation;
            [window makeKeyAndVisible];
            [window layoutIfNeeded];
        });
        XCTWaiterResult initialResult = [XCTWaiter waitForExpectations:@[shown] timeout:5];
        XCTAssertEqual(initialResult, XCTWaiterResultCompleted);
        if (initialResult != XCTWaiterResultCompleted) {
            return;
        }
        onMain(^{
            XCTAssertEqual(navigation.view.window, window);
            XCTAssertEqual(navigation.visibleViewController, navigation.viewControllers.lastObject);
            self.expectedShownViewController = root;
            shown = self.navigationShownExpectation = [self expectationWithDescription:@"Animated pop finishes at root"];
            navigation.ty_popToRootViewControllerBySetControllersAnimated(YES);
        });
        XCTWaiterResult animatedResult = [XCTWaiter waitForExpectations:@[shown] timeout:5];
        XCTAssertEqual(animatedResult, XCTWaiterResultCompleted);
        if (animatedResult != XCTWaiterResultCompleted) {
            return;
        }
        onMain(^{
            XCTAssertTrue(self.lastNavigationWasAnimated);
            XCTAssertEqualObjects(navigation.viewControllers, @[root]);
            XCTAssertEqual(navigation.topViewController, root);
            XCTAssertEqual(navigation.visibleViewController, root);
            XCTAssertFalse(navigation.viewTransitionInProgress);
            UIViewController *detail = UIViewController.new;
            self.expectedShownViewController = detail;
            shown = self.navigationShownExpectation = [self expectationWithDescription:@"Second navigation stack is visible"];
            [navigation setViewControllers:@[root, detail] animated:NO];
        });
        XCTWaiterResult rebuiltResult = [XCTWaiter waitForExpectations:@[shown] timeout:5];
        XCTAssertEqual(rebuiltResult, XCTWaiterResultCompleted);
        if (rebuiltResult != XCTWaiterResultCompleted) {
            return;
        }
        onMain(^{
            self.expectedShownViewController = root;
            shown = self.navigationShownExpectation = [self expectationWithDescription:@"Nonanimated pop finishes at root"];
            navigation.ty_popToRootViewControllerBySetControllersAnimated(NO);
        });
        XCTAssertEqual([XCTWaiter waitForExpectations:@[shown] timeout:5], XCTWaiterResultCompleted);
        onMain(^{
            XCTAssertFalse(self.lastNavigationWasAnimated);
            XCTAssertEqualObjects(navigation.viewControllers, @[root]);
            XCTAssertEqual(navigation.topViewController, root);
            XCTAssertEqual(navigation.visibleViewController, root);
            XCTAssertFalse(navigation.viewTransitionInProgress);
            XCTAssertNoThrow(navigation.ty_popToRootViewControllerBySetControllersAnimated(YES));
            XCTAssertEqualObjects(navigation.viewControllers, @[root]);
            UINavigationController *emptyNavigation = UINavigationController.new;
            XCTAssertNoThrow(emptyNavigation.ty_popToRootViewControllerBySetControllersAnimated(YES));
            XCTAssertNoThrow(emptyNavigation.ty_popToRootViewControllerBySetControllersAnimated(NO));
            XCTAssertEqual(emptyNavigation.viewControllers.count, 0u);
        });
    }@finally {
        onMain(^{
            navigation.delegate = nil;
            self.expectedShownViewController = nil;
            self.navigationShownExpectation = nil;
            window.hidden = YES;
            window.rootViewController = nil;
            [previousKeyWindow makeKeyWindow];
        });
    }
}

-(void)navigationController:(UINavigationController *)navigationController
     didShowViewController:(UIViewController *)viewController
                  animated:(BOOL)animated {
    if (viewController == self.expectedShownViewController && self.navigationShownExpectation) {
        self.lastNavigationWasAnimated = animated;
        XCTestExpectation *shown = self.navigationShownExpectation;
        self.navigationShownExpectation = nil;
        [shown fulfill];
    }
}

-(void)testLogoutPopupFirstAccessReuseAndConfirmedNotification {
    void (^scenario)(void) = ^{
        JobsBasePopupView *popupView = self.logOutPopupView;
        XCTAssertNotNil(popupView);
        XCTAssertEqual(popupView, self.logOutPopupView);
        jobsByIDBlock callback = popupView.objBlock;
        XCTAssertNotNil(callback);
        if (!callback) {
            return;
        }
        __block NSUInteger notifications = 0;
        __block id notificationObject = nil;
        id observer = [NSNotificationCenter.defaultCenter addObserverForName:退出登录成功
                                                                     object:nil
                                                                      queue:nil
                                                                 usingBlock:^(NSNotification *notification) {
            notifications += 1;
            notificationObject = notification.object;
        }];
        @try {
            UIButton *button = UIButton.new;
            button.tag = 666;
            callback(button);
            XCTAssertEqual(self.logoutRequests, 0u);
            XCTAssertEqual(self.logoutToastRequests, 0u);
            XCTAssertEqual(notifications, 0u);
            button.tag = 999;
            callback(button);
            XCTAssertEqual(self.logoutRequests, 1u);
            XCTAssertEqual(self.logoutToastRequests, 1u);
            XCTAssertEqual(notifications, 1u);
            XCTAssertEqualObjects(notificationObject, @(NO));
        }@finally {
            [NSNotificationCenter.defaultCenter removeObserver:observer];
        }
    };
    if (NSThread.isMainThread) {
        scenario();
    }else {
        dispatch_sync(dispatch_get_main_queue(), scenario);
    }
}

-(void)testReleasedLogoutOwnerMakesCallbackInert {
    void (^scenario)(void) = ^{
        __weak NSObject *weakOwner = nil;
        jobsByIDBlock callback = nil;
        JobsBasePopupView *popupView = nil;
        @autoreleasepool {
            NSObject *owner = NSObject.new;
            weakOwner = owner;
            popupView = owner.logOutPopupView;
            callback = popupView.objBlock;
            XCTAssertNotNil(popupView);
            XCTAssertNotNil(callback);
        }
        XCTAssertNil(weakOwner);
        if (!callback) {
            return;
        }
        __block NSUInteger notifications = 0;
        id observer = [NSNotificationCenter.defaultCenter addObserverForName:退出登录成功
                                                                     object:nil
                                                                      queue:nil
                                                                 usingBlock:^(NSNotification *notification) {
            notifications += 1;
        }];
        @try {
            UIButton *button = UIButton.new;
            button.tag = 999;
            XCTAssertNoThrow(callback(button));
            XCTAssertEqual(notifications, 0u);
            // 保活弹窗，使此断言确实覆盖 owner 已释放、view 仍存活的终态。
            XCTAssertNotNil(popupView);
        }@finally {
            [NSNotificationCenter.defaultCenter removeObserver:observer];
        }
    };
    if (NSThread.isMainThread) {
        scenario();
    }else {
        dispatch_sync(dispatch_get_main_queue(), scenario);
    }
}

-(void)testPlistReadRejectsInvalidNamesAndLoadsExistingBundleDictionary {
    JobsRetDicByStringBlock readPlist = self.readLocalPlistWithFileName;
    XCTAssertNotNil(readPlist);
    if (!readPlist) {
        return;
    }
    XCTAssertNil(readPlist(nil));
    XCTAssertNil(readPlist(@""));
    XCTAssertNil(readPlist((id)NSNull.null));
    NSString *missingName = [@"JobsMissingPlist-" stringByAppendingString:NSUUID.UUID.UUIDString];
    XCTAssertNil(readPlist(missingName));
    // 复用运行 bundle 自带的 Info.plist，先确认合法文件确实存在。
    NSString *filePath = JobsBundleResourcePath(nil, @"Info", nil, @"plist");
    XCTAssertGreaterThan(filePath.length, 0u);
    NSDictionary *expected = filePath.length ? [NSDictionary dictionaryWithContentsOfFile:filePath] : nil;
    XCTAssertNotNil(expected);
    XCTAssertGreaterThan(expected.count, 0u);
    XCTAssertEqualObjects(readPlist(@"Info"), expected);
}

-(void)testLanguageChangeFromBackgroundDeliversTheRealUINotificationOnMain {
    AppLanguage originalLanguage = LanMgr.language;
    id originalStoredValue = [NSUserDefaults.standardUserDefaults objectForKey:JobsLanguageKey];
    XCTestExpectation *received = [self expectationWithDescription:@"language UI notification on main"];
    __block BOOL fulfilled = NO;
    id observer = [NSNotificationCenter.defaultCenter addObserverForName:语言切换
                                                                 object:nil
                                                                  queue:nil
                                                             usingBlock:^(NSNotification *notification) {
        XCTAssertTrue(NSThread.isMainThread);
        XCTAssertEqualObjects(notification.object, @(AppLanguageEnglish));
        if (!fulfilled) {
            fulfilled = YES;
            [received fulfill];
        }
    }];
    @try {
        NSObject *owner = NSObject.new;
        jobsByNSIntegerBlock changeLanguage = owner.appLanguageAtAppLanguageBy;
        XCTAssertNotNil(changeLanguage);
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            XCTAssertFalse(NSThread.isMainThread);
            changeLanguage(AppLanguageEnglish);
        });
        XCTAssertEqual([XCTWaiter waitForExpectations:@[received] timeout:5], XCTWaiterResultCompleted);
        XCTAssertEqual(LanMgr.language, AppLanguageEnglish);
        XCTAssertNotNil(LanMgr.bundle());
    }@finally {
        [NSNotificationCenter.defaultCenter removeObserver:observer];
        LanMgr.language = originalLanguage;
        if (originalStoredValue) {
            [NSUserDefaults.standardUserDefaults setObject:originalStoredValue forKey:JobsLanguageKey];
        }else {
            [NSUserDefaults.standardUserDefaults removeObjectForKey:JobsLanguageKey];
        }
    }
}

-(void)testRealLanguageManagerAllowsConcurrentFoundationReadsAndWrites {
    AppLanguage originalLanguage = LanMgr.language;
    id originalStoredValue = [NSUserDefaults.standardUserDefaults objectForKey:JobsLanguageKey];
    NSString *missingKey = [@"JobsMissingTranslation-" stringByAppendingString:NSUUID.UUID.UUIDString];
    XCTestExpectation *finished = [self expectationWithDescription:@"concurrent production language access finishes"];
    dispatch_group_t readersAndWriters = dispatch_group_create();
    @try {
        for (NSUInteger worker = 0; worker < 4; worker++) {
            dispatch_group_async(readersAndWriters, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                @autoreleasepool {
                    for (NSUInteger iteration = 0; iteration < 25; iteration++) {
                        LanMgr.language = (AppLanguage)((worker + iteration) % 5);
                        // 两个 getter 各自返回受保护快照，不能把两个独立读取误当原子成对接口。
                        AppLanguage language = LanMgr.language;
                        NSBundle *resolved = LanMgr.bundle();
                        XCTAssertGreaterThanOrEqual(language, AppLanguageBySys);
                        XCTAssertLessThanOrEqual(language, AppLanguageTagalog);
                        XCTAssertNotNil(resolved);
                        XCTAssertGreaterThan(resolved.bundlePath.length, 0u);
                        XCTAssertEqualObjects(LanMgr.localStringByKey(missingKey), missingKey);
                    }
                }
            });
        }
        dispatch_group_notify(readersAndWriters, dispatch_get_main_queue(), ^{
            [finished fulfill];
        });
        XCTAssertEqual([XCTWaiter waitForExpectations:@[finished] timeout:10], XCTWaiterResultCompleted);
    }@finally {
        LanMgr.language = originalLanguage;
        if (originalStoredValue) {
            [NSUserDefaults.standardUserDefaults setObject:originalStoredValue forKey:JobsLanguageKey];
        }else {
            [NSUserDefaults.standardUserDefaults removeObjectForKey:JobsLanguageKey];
        }
    }
}

-(void)testLanguageBundleMatchesRealHostLocalizationsAndMissingKeyFallsBack {
    AppLanguage originalLanguage = LanMgr.language;
    id originalStoredValue = [NSUserDefaults.standardUserDefaults objectForKey:JobsLanguageKey];
    NSString *missingKey = [@"JobsMissingTranslation-" stringByAppendingString:NSUUID.UUID.UUIDString];
    @try {
        for (AppLanguage language = AppLanguageBySys; language <= AppLanguageTagalog; language++) {
            LanMgr.language = language;
            NSString *requested = LanMgr.languageCodeByAppLanguage(language);
            NSArray *preferences = requested.length ? @[requested] : NSLocale.preferredLanguages;
            NSString *matched = [NSBundle preferredLocalizationsFromArray:NSBundle.mainBundle.localizations
                                                           forPreferences:preferences].firstObject;
            NSString *path = [NSBundle.mainBundle pathForResource:matched ofType:@"lproj"];
            NSBundle *expected = path.length ? [NSBundle bundleWithPath:path] : NSBundle.mainBundle;
            expected = expected ?: NSBundle.mainBundle;
            XCTAssertEqualObjects(LanMgr.bundle().bundlePath, expected.bundlePath);
            XCTAssertEqualObjects(LanMgr.localStringByKey(missingKey), missingKey);
        }
    }@finally {
        LanMgr.language = originalLanguage;
        if (originalStoredValue) {
            [NSUserDefaults.standardUserDefaults setObject:originalStoredValue forKey:JobsLanguageKey];
        }else {
            [NSUserDefaults.standardUserDefaults removeObjectForKey:JobsLanguageKey];
        }
    }
}

-(void)testWeakTargetZeroesAndDoesNotRetainSelf {
    NSObject *owner = NSObject.new;
    __weak NSObject *weakTarget = nil;
    @autoreleasepool {
        NSObject *target = NSObject.new;
        weakTarget = target;
        XCTAssertEqual(owner.byWeak_target(target), owner);
        XCTAssertEqual(owner.weak_target, target);
    }
    XCTAssertNil(weakTarget);
    XCTAssertNil(owner.weak_target);
    owner.byWeak_target(nil);
    XCTAssertNil(owner.weak_target);

    __weak NSObject *weakOwner = nil;
    @autoreleasepool {
        NSObject *selfTarget = NSObject.new;
        weakOwner = selfTarget;
        selfTarget.byWeak_target(selfTarget);
        XCTAssertEqual(selfTarget.weak_target, selfTarget);
    }
    XCTAssertNil(weakOwner);

    void (^gestureScenario)(void) = ^{
        __weak UIView *weakView = nil;
        UITapGestureRecognizer *retainedTap = nil;
        __block NSUInteger actionCalls = 0;
        @autoreleasepool {
            UIView *view = UIView.new;
            weakView = view;
            SEL action = view.jobsSelectorBlock(^id _Nullable(id _Nullable target, id _Nullable gesture) {
                actionCalls += 1;
                return nil;
            });
            XCTAssertNotEqual(action, NULL);
            view.tapGR_SelImp.selector = action;
            retainedTap = view.tapGR;
            XCTAssertNotNil(retainedTap);
            XCTAssertEqual(retainedTap.delegate, view);
            XCTAssertNil(view.weak_target);
            XCTAssertNil(retainedTap.target);
            if (action) {
                IMP callback = [view methodForSelector:action];
                ((void (*)(id, SEL, id))callback)(view, action, retainedTap);
                XCTAssertEqual(actionCalls, 1u);
            }
        }
        // 保留原生手势后，默认自身目标仍应释放。
        XCTAssertNil(weakView);
        XCTAssertNil(retainedTap.delegate);

        UIView *customView = UIView.new;
        NSObject *customTarget = NSObject.new;
        customView.byWeak_target(customTarget);
        UITapGestureRecognizer *customTap = customView.tapGR;
        XCTAssertEqual(customTap.delegate, customTarget);
        XCTAssertNil(customTap.target);
        // 显式 metadata 仍由独立的泛用手势 API 配置。
        UITapGestureRecognizer *explicitTap = UITapGestureRecognizer.new;
        explicitTap.byTarget(customTarget);
        XCTAssertEqual(explicitTap.target, customTarget);
    };
    if (NSThread.isMainThread) {
        gestureScenario();
    }else {
        dispatch_sync(dispatch_get_main_queue(), gestureScenario);
    }
}

-(void)testExternalWeakTargetsDoNotRetainTheirControllerOwnedViews {
    void (^scenario)(void) = ^{
        IMP nativeGestureGetter = JobsNativeGestureCallbackGetter(@selector(GestureActionBy));
        IMP nativeVoidGetter = JobsNativeGestureCallbackGetter(@selector(gestureActionBy));
        XCTAssertNotEqual(nativeGestureGetter, NULL);
        XCTAssertNotEqual(nativeVoidGetter, NULL);
        if (!nativeGestureGetter || !nativeVoidGetter) {
            return;
        }
        SEL handler = NSSelectorFromString(@"jobs_ocdsl_handleGestureAction:");
        for (NSUInteger iteration = 0; iteration < 100; iteration++) {
            __weak UIViewController *weakController = nil;
            __weak UIView *weakOwnedView = nil;
            __weak UITapGestureRecognizer *weakTap = nil;
            __weak UIPanGestureRecognizer *weakPan = nil;
            UITapGestureRecognizer *retainedTap = nil;
            UIPanGestureRecognizer *retainedPan = nil;
            jobsByGestureRecognizerBlock lateGestureAction = nil;
            jobsByVoidBlock lateVoidAction = nil;
            __block NSUInteger actionCalls = 0;
            __block NSUInteger gestureCalls = 0;
            __block NSUInteger voidCalls = 0;
            @autoreleasepool {
                UIViewController *controller = UIViewController.new;
                controller.view = UIView.new;
                UIView *view = controller.view;
                weakController = controller;
                weakOwnedView = view;
                view.byWeak_target(controller);
                SEL action = controller.jobsSelectorBlock(^id _Nullable(id _Nullable target,
                                                                        id _Nullable gesture) {
                    actionCalls += 1;
                    return nil;
                });
                XCTAssertNotEqual(action, NULL);
                view.tapGR_SelImp.selector = action;
                view.panGR_SelImp.selector = action;
                retainedTap = view.tapGR;
                retainedPan = view.panGR;
                weakTap = retainedTap;
                weakPan = retainedPan;
                XCTAssertNotNil(retainedTap);
                XCTAssertNotNil(retainedPan);
                XCTAssertEqual(view.weak_target, controller);
                XCTAssertEqual(retainedTap.delegate, controller);
                XCTAssertEqual(retainedPan.delegate, controller);
                XCTAssertNil(retainedTap.target);
                XCTAssertNil(retainedPan.target);
                XCTAssertTrue([view.gestureRecognizers containsObject:retainedTap]);
                XCTAssertTrue([view.gestureRecognizers containsObject:retainedPan]);
                if (action) {
                    IMP callback = [controller methodForSelector:action];
                    ((void (*)(id, SEL, id))callback)(controller, action, retainedTap);
                    ((void (*)(id, SEL, id))callback)(controller, action, retainedPan);
                    XCTAssertEqual(actionCalls, 2u);
                }
                __weak UIViewController *callbackOwner = controller;
                lateGestureAction = ^(UIGestureRecognizer *gesture) {
                    if (!callbackOwner) {
                        return;
                    }
                    gestureCalls += 1;
                };
                lateVoidAction = ^{
                    if (!callbackOwner) {
                        return;
                    }
                    voidCalls += 1;
                };
                // 先走当前真实公共 getter；再验证已编译的 native provider，覆盖两类 callback。
                XCTAssertEqual(retainedTap.GestureActionBy(lateGestureAction), retainedTap);
                XCTAssertEqual(retainedPan.GestureActionBy(lateGestureAction), retainedPan);
                for (UIGestureRecognizer *gesture in @[retainedTap, retainedPan]) {
                    JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock installGesture =
                        ((JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock (*)(id, SEL))nativeGestureGetter)(gesture, @selector(GestureActionBy));
                    JobsRetUIGestureRecognizerByjobsByVoidBlockBlock installVoid =
                        ((JobsRetUIGestureRecognizerByjobsByVoidBlockBlock (*)(id, SEL))nativeVoidGetter)(gesture, @selector(gestureActionBy));
                    XCTAssertEqual(installGesture(lateGestureAction), gesture);
                    XCTAssertEqual(installVoid(lateVoidAction), gesture);
                    XCTAssertNil(gesture.target);
                    IMP callback = [gesture methodForSelector:handler];
                    XCTAssertNotEqual(callback, NULL);
                    if (callback) {
                        ((void (*)(id, SEL, id))callback)(gesture, handler, gesture);
                    }
                }
                XCTAssertEqual(gestureCalls, 2u);
                XCTAssertEqual(voidCalls, 2u);
            }
            // 原生手势与真实安装的回调仍存活时，控制器及 view 必须已释放。
            @autoreleasepool {
                XCTAssertNil(weakController);
                XCTAssertNil(weakOwnedView);
                XCTAssertNil(retainedTap.delegate);
                XCTAssertNil(retainedPan.delegate);
                for (UIGestureRecognizer *gesture in @[retainedTap, retainedPan]) {
                    IMP callback = [gesture methodForSelector:handler];
                    ((void (*)(id, SEL, id))callback)(gesture, handler, gesture);
                }
                lateGestureAction(retainedTap);
                lateVoidAction();
                XCTAssertEqual(gestureCalls, 2u);
                XCTAssertEqual(voidCalls, 2u);
                XCTAssertEqual(actionCalls, 2u);
                retainedTap.enabled = NO;
                retainedPan.enabled = NO;
                retainedTap = nil;
                retainedPan = nil;
                lateGestureAction = nil;
                lateVoidAction = nil;
            }
            XCTAssertNil(weakTap);
            XCTAssertNil(weakPan);
        }
    };
    if (NSThread.isMainThread) {
        scenario();
    }else {
        dispatch_sync(dispatch_get_main_queue(), scenario);
    }
}

-(void)testSavedGestureFactoryActionsReturnNilAfterTheirViewReleases {
    void (^scenario)(void) = ^{
        JobsRetViewByGestureRecognizer add = nil;
        JobsRetViewByTapGestureRecognizerActionBlock tap = nil;
        JobsRetViewByTapGestureRecognizerActionBlock doubleTap = nil;
        JobsRetViewByLongPressGestureRecognizerActionBlock longPress = nil;
        JobsRetViewBySwipeGestureRecognizerActionBlock swipe = nil;
        JobsRetViewByPanGestureRecognizerActionBlock pan = nil;
        JobsRetViewByPinchGestureRecognizerActionBlock pinch = nil;
        JobsRetViewByRotationGestureRecognizerActionBlock rotation = nil;
        JobsRetViewByScreenEdgePanGestureRecognizerActionBlock screenEdge = nil;
        __weak UIView *weakView = nil;
        __block NSUInteger callbacks = 0;
        @autoreleasepool {
            UIView *view = UIView.new;
            weakView = view;
            add = view.addGR;
            tap = view.addTapGR;
            doubleTap = view.addDoubleTapGR;
            longPress = view.addLongPressGR;
            swipe = view.addSwipeGR;
            pan = view.addPanGR;
            pinch = view.addPinchGR;
            rotation = view.addRotationGR;
            screenEdge = view.addScreenEdgePanGR;
            XCTAssertNotNil(add);
            XCTAssertNotNil(tap);
            XCTAssertNotNil(doubleTap);
            XCTAssertNotNil(longPress);
            XCTAssertNotNil(swipe);
            XCTAssertNotNil(pan);
            XCTAssertNotNil(pinch);
            XCTAssertNotNil(rotation);
            XCTAssertNotNil(screenEdge);
        }
        XCTAssertNil(weakView);
        XCTAssertNil(add(UITapGestureRecognizer.new));
        XCTAssertNil(tap(^(UITapGestureRecognizer *gesture) {
            callbacks += 1;
        }));
        XCTAssertNil(doubleTap(^(UITapGestureRecognizer *gesture) {
            callbacks += 1;
        }));
        XCTAssertNil(longPress(^(UILongPressGestureRecognizer *gesture) {
            callbacks += 1;
        }));
        XCTAssertNil(swipe(^(UISwipeGestureRecognizer *gesture) {
            callbacks += 1;
        }));
        XCTAssertNil(pan(^(UIPanGestureRecognizer *gesture) {
            callbacks += 1;
        }));
        XCTAssertNil(pinch(^(UIPinchGestureRecognizer *gesture) {
            callbacks += 1;
        }));
        XCTAssertNil(rotation(^(UIRotationGestureRecognizer *gesture) {
            callbacks += 1;
        }));
        XCTAssertNil(screenEdge(^(UIScreenEdgePanGestureRecognizer *gesture) {
            callbacks += 1;
        }));
        XCTAssertEqual(callbacks, 0u);
    };
    if (NSThread.isMainThread) {
        scenario();
    }else {
        dispatch_sync(dispatch_get_main_queue(), scenario);
    }
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    self.acceptanceSupplementary = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                    withReuseIdentifier:@"jobs-supplementary"
                                                                           forIndexPath:indexPath];
    return self.acceptanceSupplementary;
}

-(void)testArbitraryNibAndSupplementaryRegistrationPreserveUIKitViews {
    dispatch_block_t action = ^{
        UICollectionViewFlowLayout *layout = UICollectionViewFlowLayout.new;
        layout.headerReferenceSize = CGSizeMake(320, 40);
        UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)
                                                  collectionViewLayout:layout];
        UINib *nib = [UINib nibWithNibName:@"JobsRegistrationFixtureCell" bundle:[NSBundle bundleForClass:self.class]];
        self.acceptanceCellIdentifier = @"profile-card";
        @try {
            [view registerNib:nib forCellWithReuseIdentifier:self.acceptanceCellIdentifier];
            [view registerClass:UICollectionReusableView.class
    forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
           withReuseIdentifier:@"jobs-supplementary"];
            XCTAssertTrue(view.isRegisteredForReuseIdentifier(self.acceptanceCellIdentifier));
            XCTAssertTrue(view.isRegisteredForReuseIdentifier(@"jobs-supplementary"));
            view.dataSource = self;
            [view reloadData];
            [view layoutIfNeeded];
            CGFloat red = 0, green = 0, blue = 0, alpha = 0;
            XCTAssertTrue([self.lastCell.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha]);
            XCTAssertEqualWithAccuracy(red, 1, 0.001);
            XCTAssertEqualWithAccuracy(green, 0, 0.001);
            XCTAssertEqualWithAccuracy(blue, 0, 0.001);
            XCTAssertEqual(self.acceptanceSupplementary.class, UICollectionReusableView.class);

            [view registerClass:Nil forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
            withReuseIdentifier:@"jobs-supplementary"];
            XCTAssertFalse(view.isRegisteredForReuseIdentifier(@"jobs-supplementary"));
            // 注册源切换不承担清空原生复用池；新实例单独验证 nib 来源。
            view.dataSource = nil;
            UICollectionViewFlowLayout *nibLayout = UICollectionViewFlowLayout.new;
            nibLayout.headerReferenceSize = layout.headerReferenceSize;
            view = [[UICollectionView alloc] initWithFrame:view.frame collectionViewLayout:nibLayout];
            [view registerNib:nib forCellWithReuseIdentifier:self.acceptanceCellIdentifier];
            view.dataSource = self;
            [view registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
          withReuseIdentifier:@"jobs-supplementary"];
            XCTAssertTrue(view.isRegisteredForReuseIdentifier(@"jobs-supplementary"));
            self.acceptanceSupplementary = nil;
            [view reloadData];
            [view layoutIfNeeded];
            XCTAssertNotNil(self.acceptanceSupplementary);
            XCTAssertTrue([self.acceptanceSupplementary.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha]);
            XCTAssertEqualWithAccuracy(red, 1, 0.001);
            XCTAssertEqualWithAccuracy(green, 0, 0.001);
            XCTAssertEqualWithAccuracy(blue, 0, 0.001);
            [view registerNib:nil forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
          withReuseIdentifier:@"jobs-supplementary"];
            XCTAssertFalse(view.isRegisteredForReuseIdentifier(@"jobs-supplementary"));
            XCTAssertTrue(view.isRegisteredForReuseIdentifier(self.acceptanceCellIdentifier));
        } @finally {
            view.dataSource = nil;
            self.acceptanceCellIdentifier = nil;
            self.acceptanceSupplementary = nil;
        }
    };
    if (NSThread.isMainThread) {
        action();
    }else {
        dispatch_sync(dispatch_get_main_queue(), action);
    }
}
@end

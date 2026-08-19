//
//  VoidByCertainParametersBlock.h
//  JobsBlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>               // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。
#import <WebKit/WebKit.h>                       // 提供 WKWebView、WKWebViewConfiguration 和 WKNavigation*Policy 类型。
#import <UserNotifications/UserNotifications.h> // 提供本地通知和远程通知处理能力，是现代通知框架的统一入口。
#import <JavaScriptCore/JavaScriptCore.h>       // 提供 Objective-C / Swift 与 JavaScript 交互能力，可执行脚本并进行对象桥接。
#import <NetworkExtension/NetworkExtension.h>   // 用于访问系统级网络扩展能力：VPN 配置、网络代理、DNS 代理、内容过滤、热点辅助等（部分能力需要 Apple 对应 entitlement 授权，否则即使编译通过也无法正常使用。）
#import "JobsBlockDef.h"
#import "JobsBlockHeader.h"
///【 确定入参个数 并且 没有返回值的Block定义】
#ifndef VoidByCertainParameters_h
#define VoidByCertainParameters_h
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
typedef void(^jobsByVoidBlock)(void);
typedef void(^jobsByGKPhotoBrowserConfigureBlock)(__kindof GKPhotoBrowserConfigure *_Nullable data);
typedef jobsByVoidBlock JobsViewPushCompletionBlock;
typedef jobsByVoidBlock JobsOCRefreshActionBlock;
typedef void(^jobsByIDBlock)(id _Nullable data);
typedef void(^jobsBySELBlock)(SEL _Nullable data);
typedef void(^jobsByClsBlock)(Class _Nonnull cls);
#pragma mark —— 关于错误
typedef void(^jobsByErrBlock)(NSError *_Nullable error);
typedef void(^JobsOCSplashMediaCacheCompletion)(NSURL *_Nullable fileURL, NSError *_Nullable error);
#pragma mark —— 关于 UIControl
typedef void(^jobsByCtrlBlock)(__kindof UIControl *_Nullable ctrl);
#pragma mark —— 关于CALayer
typedef void(^jobsByCAShapeLayerBlock)(__kindof CAShapeLayer *_Nullable layer);
typedef void(^jobsByCALayerBlock)(__kindof CALayer *_Nullable layer);
typedef void(^jobsByCATransitionBlock)(__kindof CATransition *_Nullable transition);
typedef void(^JobsByCAPropertyAnimationBlock)(__kindof CAPropertyAnimation *_Nullable animation);
#pragma mark —— 关于 Animation
typedef void(^jobsByCAKeyframeAnimationBlock)(__kindof CAKeyframeAnimation *_Nullable animation);
typedef void(^jobsByCAGradientLayerBlock)(__kindof CAGradientLayer *_Nullable layer);
typedef void(^jobsByCABasicAnimationBlock)(__kindof CABasicAnimation *_Nullable animation);
#pragma mark —— 关于 WKWebView.JS配置
typedef void(^jobsByUserContentControllerBlock)(__kindof WKUserContentController *_Nullable data);
typedef void(^jobsByWKWebViewConfigBlock)(__kindof WKWebViewConfiguration *_Nullable config);
typedef void(^jobsByWKWebpagePreferencesBlock)(WKWebpagePreferences *_Nullable data);
typedef void(^WKNavigationDelegateBlock1)(WKNavigationResponsePolicy policy);
typedef void(^WKNavigationDelegateBlock2)(WKNavigationActionPolicy policy);
#pragma mark —— 关于 JavaScript
typedef void(^jobsByJSValueBlock)(JSValue *_Nullable value);
#pragma mark —— 关于View
typedef void(^jobsByViewBlock)(__kindof UIView *_Nullable view);
typedef void(^jobsByJobsSideDrawerBlock)(JobsSideDrawer *_Nullable sideDrawer);
typedef void(^jobsByPageControlBlock)(__kindof UIPageControl *_Nullable pageControl);
typedef void(^jobsByScrollViewBlock)(__kindof UIScrollView *_Nullable scrollView);
typedef void(^jobsByBtnBlock)(__kindof UIButton *_Nullable btn);
typedef void(^jobsByWindowBlock)(__kindof UIWindow *_Nullable window);
typedef void(^jobsByLabelBlock)(__kindof UILabel *_Nullable label);
typedef void(^jobsByUISearchBarBlock)(__kindof UISearchBar *_Nullable searchBar);
typedef void(^jobsByNavigationBarAppearanceBlock)(__kindof UINavigationBarAppearance *_Nullable appearance);
typedef void(^jobsByTabBarAppearanceBlock)(__kindof UITabBarAppearance *_Nullable appearance);
typedef void(^jobsByUIActionBlock)(__kindof UIAction *_Nullable action) API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos);
typedef void(^jobsByUIMenuBlock)(__kindof UIMenu *_Nullable menu) API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos);
typedef void(^jobsByContextMenuConfigurationBlock)(__kindof UIContextMenuConfiguration *_Nullable config) API_AVAILABLE(ios(13.0), tvos(17.0)) API_UNAVAILABLE(watchos);
typedef void(^jobsByNibBlock)(__kindof UINib *_Nullable nib) API_AVAILABLE(ios(4.0)) API_UNAVAILABLE(watchos);
typedef void(^jobsByBarButtonItemBlock)(__kindof UIBarButtonItem *_Nullable barButtonItem) API_AVAILABLE(ios(2.0)) API_UNAVAILABLE(watchos);
typedef void(^jobsByNavigationBarBlock)(__kindof UINavigationBar *_Nullable bar);
typedef void(^jobsByRefreshCtrlBlock)(__kindof UIRefreshControl *_Nullable refreshCtrl);
typedef void(^jobsByPDFViewBlock)(__kindof PDFView *_Nullable view);
typedef void(^jobsByTabBarItemBlock)(__kindof UITabBarItem *_Nullable tabBarItem);
typedef void(^jobsByNavigationItemBlock)(__kindof UINavigationItem *_Nullable navigationItem);
typedef void(^JobsOCCommentRefreshActionBlock)(__kindof JobsOCCommentView *_Nullable commentView);
typedef void(^jobsByWKWebViewBlock)(__kindof WKWebView *_Nullable webView);
typedef void(^jobsByJSContextBlock)(__kindof JSContext *_Nullable context);
typedef void(^jobsByProgressViewBlock)(__kindof UIProgressView *_Nullable progressView);
typedef void(^jobsBySliderBlock)(__kindof UISlider *_Nullable slider);
typedef void(^jobsBySwitchBlock)(__kindof UISwitch *_Nullable Switch);
typedef void(^jobsBySegmentedControlBlock)(__kindof UISegmentedControl *_Nullable segmentedControl);
typedef void(^jobsByTableViewBlock)(__kindof UITableView *_Nullable tableView);
typedef void(^jobsByTableViewCellBlock)(__kindof UITableViewCell *_Nullable tableView);
typedef void(^jobsByCollectionViewBlock)(__kindof UICollectionView *_Nullable collectionView);
typedef void(^jobsByCollectionViewCellBlock)(__kindof UICollectionViewCell *_Nullable collectionView);
typedef void(^jobsByTextFieldBlock)(__kindof UITextField *_Nullable textField);
typedef void(^jobsByTextViewBlock)(__kindof UITextView *_Nullable textView);
typedef void(^jobsByImageViewBlock)(__kindof UIImageView *_Nullable imageView);
typedef void(^jobsByStackViewBlock)(__kindof UIStackView *_Nullable stackView);
typedef void(^jobsByCAEmitterCellBlock)(__kindof CAEmitterCell *_Nullable cell);
typedef void(^jobsByCAEmitterLayerBlock)(__kindof CAEmitterLayer *_Nullable layer);
typedef void(^jobsByButtonConfigurationBlock)(__kindof UIButtonConfiguration *_Nullable config);
/// 按钮配置
typedef void(^jobsByBtnConfigBlock)(__kindof UIButtonConfiguration * _Nullable config) API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
typedef void(^jobsByBackgroundConfigBlock)(__kindof UIBackgroundConfiguration * _Nullable config) API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
/// UICollectionView配置
typedef void(^jobsByCollectionViewFlowLayoutBlock)(__kindof UICollectionViewFlowLayout *_Nullable layout);
typedef void(^jobsCollectionViewDidSelectItemAtBlock)(Jobs_CollectionView_Target_CollectionView_IndexPath_Arguments);
/// UITableView配置
typedef void(^jobsTableViewDidSelectRowAtBlock)(Jobs_TableView_Target_TableView_IndexPath_Arguments);
/// 多参数
typedef void(^jobsByViewAndAnimatedBlock)(Jobs_ReturnViewNavigatorByViewAndAnimatedBlock_Arguments);
typedef void(^jobsByViewAndDataBlock)(Jobs_ByViewAndDataBlock_Arguments);
typedef void(^jobsByView2Block)(Jobs_ByView2Block_Arguments);
#pragma mark —— 关于 控制器
typedef void(^jobsByVCBlock)(__kindof UIViewController *_Nullable viewCtrl);
@class JobsOCSplashVC;
typedef void(^JobsOCSplashActionBlock)(__kindof JobsOCSplashVC *_Nullable splashVC);
typedef jobsByVCBlock JobsOCSplashSkipBlock;
typedef void(^jobsByMenuCtrlBlock)(__kindof UIMenuController *_Nullable menuCtrl);
typedef void(^jobsByMenuItemBlock)(__kindof UIMenuItem *_Nullable menuItem);
typedef void(^jobsByImagePickerCtrlBlock)(__kindof UIImagePickerController *_Nullable imagePickerController);
#pragma mark —— 关于数据容器
typedef void(^jobsByArrBlock)(__kindof NSArray <NSObject *>*_Nullable data);
typedef void(^jobsByMutArrBlock)(__kindof NSMutableArray <NSObject *>*_Nullable arr);
typedef void(^jobsBySetBlock)(__kindof NSSet *_Nullable set);
typedef void(^jobsByMutableSetBlock)(__kindof NSMutableSet <NSObject *>*_Nullable set);
typedef void(^jobsByMutableIndexSetBlock)(__kindof NSMutableIndexSet *_Nullable indexSet);
typedef void(^jobsByDicBlock)(__kindof NSDictionary *_Nullable dic);
typedef void(^jobsByMutableDictBlock)(__kindof NSMutableDictionary *_Nullable dic);
#pragma mark —— 关于（富）文本
typedef void(^jobsByTextAlignmentBlock)(NSTextAlignment alignment);
typedef void(^jobsByStrBlock)(__kindof NSString *_Nullable string);
typedef void(^jobsByOCCountryCodeBlock)(__kindof NSString *_Nullable countryName,
                                      __kindof NSString *_Nullable code);
typedef void(^jobsByAttributedStrBlock)(__kindof NSAttributedString *_Nullable aString);
typedef void(^jobsByMutableParagraphStyleBlock)(NSMutableParagraphStyle *_Nullable style);
typedef void(^jobsByTextAttachmentBlock)(NSTextAttachment *_Nullable attachment);
#pragma mark —— 关于UI表现力
typedef void(^jobsByLayoutAttributeBlock)(NSLayoutAttribute data);
typedef void(^jobsByImageBlock)(UIImage *_Nullable image);
typedef void(^jobsByCorBlock)(UIColor *_Nullable cor);
typedef void(^jobsByFontBlock)(UIFont *_Nullable font);
#pragma mark —— URL
typedef void(^jobsByURLBlock)(NSURL *_Nullable url);
typedef void(^jobsByURLRequestBlock)(__kindof NSURLRequest *_Nullable request);
typedef __kindof NSMutableURLRequest *_Nullable(^JobsRetMutableURLRequestByURLRequestBlock)(__kindof NSURLRequest *_Nullable request);
typedef void(^jobsByMutableURLRequestBlock)(__kindof NSMutableURLRequest *_Nullable request);
typedef void(^jobsByURLSessionTaskBlock)(__kindof NSURLSessionTask *_Nullable SessionTask);
typedef __kindof NSMutableURLRequest *_Nullable(^JobsRetURLRequestByURLSessionTaskBlock)(__kindof NSURLSessionTask *_Nullable SessionTask);
#pragma mark —— 关于 UIViewController
typedef void(^jobsByVCAndDataBlock)(Jobs_ByVCAndDataBlock_Arguments);
#pragma mark —— 关于手势
typedef void(^jobsByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable gesture);
typedef void(^jobsByPanGestureRecognizerBlock)(__kindof UIPanGestureRecognizer *_Nullable gesture);
typedef void(^jobsByTapGestureRecognizerBlock)(__kindof UITapGestureRecognizer *_Nullable gesture);
typedef void(^jobsByLongPressGestureRecognizerBlock)(__kindof UILongPressGestureRecognizer *_Nullable gesture);
typedef void(^jobsBySwipeGestureRecognizerBlock)(__kindof UISwipeGestureRecognizer *_Nullable gesture);
typedef void(^jobsByPinchGestureRecognizerBlock)(__kindof UIPinchGestureRecognizer *_Nullable gesture);
typedef void(^jobsByRotationGestureRecognizerBlock)(__kindof UIRotationGestureRecognizer *_Nullable gesture);
typedef void(^jobsByScreenEdgePanGestureRecognizerBlock)(__kindof UIScreenEdgePanGestureRecognizer *_Nullable gesture);
#pragma mark —— 关于方位
typedef void(^jobsByFrameBlock)(CGRect frame);
typedef void(^jobsByPointBlock)(CGPoint point);
typedef void(^jobsBySizeBlock)(CGSize size);
typedef void(^jobsByEdgeInsetBlock)(UIEdgeInsets insets);
typedef void(^jobsByIndexPathBlock)(NSIndexPath *_Nullable indexPath);
#pragma mark —— 关于数据类型
typedef void(^jobsByBOOLBlock)(BOOL data);
typedef void(^jobsByIntBlock)(int data);
typedef void(^jobsByUnsignedIntBlock)(unsigned int data);
typedef void(^jobsByFloatBlock)(float data);
typedef void(^jobsByDoubleBlock)(double data);
typedef void(^jobsByCharBlock)(char data);
typedef void(^jobsByUnsignedCharBlock)(unsigned char data);
typedef void(^jobsByShortBlock)(short data);
typedef void(^jobsByUnsignedShortBlock)(unsigned short data);
typedef void(^jobsByLongBlock)(long data);
typedef void(^jobsByUnsignedLongBlock)(unsigned long data);
typedef void(^jobsByUnsignedLongLongBlock)(unsigned long long data);
typedef void(^jobsByNSIntegerBlock)(NSInteger data);
typedef jobsByNSIntegerBlock jobsByAppLanguageBlock;
typedef jobsByNSIntegerBlock jobsByJobsOCDemoListCellTextDisplayStrategyBlock;
typedef void(^jobsByNSUIntegerBlock)(NSUInteger data);
typedef void(^jobsByUInt64_tBlock)(uint64_t data);
typedef void(^jobsByCGFloatBlock)(CGFloat data);
typedef void(^jobsByUNNotificationPresentationOptionsBlock)(UNNotificationPresentationOptions options);
#pragma mark —— 关于 UIView 动画
typedef void(^jobsByUIViewAnimationBlock)(NSTimeInterval duration,
                                          jobsByVoidBlock _Nonnull animations);
typedef void(^jobsByUIViewAnimationCompletionBlock)(NSTimeInterval duration,
                                                    jobsByVoidBlock _Nonnull animations,
                                                    jobsByBOOLBlock _Nullable completion);
typedef void(^jobsByUIViewAnimationOptionsBlock)(NSTimeInterval duration,
                                                 NSTimeInterval delay,
                                                 UIViewAnimationOptions options,
                                                 jobsByVoidBlock _Nonnull animations,
                                                 jobsByBOOLBlock _Nullable completion);
typedef void(^jobsByUIViewSpringAnimationBlock)(NSTimeInterval duration,
                                                NSTimeInterval delay,
                                                CGFloat dampingRatio,
                                                CGFloat initialVelocity,
                                                UIViewAnimationOptions options,
                                                jobsByVoidBlock _Nonnull animations,
                                                jobsByBOOLBlock _Nullable completion);
typedef void(^jobsByUIViewTransitionBlock)(__kindof UIView *_Nonnull view,
                                           NSTimeInterval duration,
                                           UIViewAnimationOptions options,
                                           jobsByVoidBlock _Nullable animations,
                                           jobsByBOOLBlock _Nullable completion);
typedef void(^jobsByUIViewFromToTransitionBlock)(__kindof UIView *_Nonnull fromView,
                                                 __kindof UIView *_Nonnull toView,
                                                 NSTimeInterval duration,
                                                 UIViewAnimationOptions options,
                                                 jobsByBOOLBlock _Nullable completion);
#pragma mark —— 关于时间
typedef void(^jobsByTimeIntervalBlock)(NSTimeInterval data);
typedef void(^jobsByDateBlock)(NSDate *_Nullable date);
typedef void(^jobsByDateComponentsBlock)(NSDateComponents *_Nullable dateComponents);
typedef void(^jobsByTimerBlock)(NSTimer *_Nullable timer);
typedef void(^jobsByDateFormatterBlock)(__kindof NSDateFormatter *_Nullable dateFormatter);
typedef void(^jobsByNotificationResponseBlock)(UNNotificationResponse *_Nullable response);
#pragma mark —— 关于 Jobs 配置对象
typedef void(^jobsByOCRefreshConfigBlock)(__kindof JobsOCRefreshConfig *_Nullable config);
#pragma mark —— 关于Texture
typedef void(^jobsByButtonNodeBlock)(__kindof ASButtonNode *_Nullable node);
typedef void(^jobsByButtonNodeLongPressBlock)(Jobs_ButtonNode_LongPress_Arguments);
typedef void(^jobsByDrawingNodeBlock)(__kindof TDDrawingNode *_Nullable node);
typedef void(^jobsByEditableTextNodeBlock)(__kindof ASEditableTextNode *_Nullable node);
typedef void(^JobsEditableTextEventBlock)(Jobs_EditableTextEvent_Arguments);
typedef void(^jobsByCollectionNodeBlock)(__kindof ASCollectionNode *_Nullable node);
typedef void(^jobsByDisplayNodeBlock)(__kindof ASDisplayNode *_Nullable node);
typedef void(^jobsByImageNodeBlock)(__kindof ASImageNode *_Nullable node);
typedef void(^jobsByMapNodeBlock)(__kindof ASMapNode *_Nullable node);
typedef void(^jobsByNetworkImageNodeBlock)(__kindof ASNetworkImageNode *_Nullable node);
typedef void(^jobsByTextNodeBlock)(__kindof ASTextNode *_Nullable node);
typedef void(^jobsByVideoNodeBlock)(__kindof ASVideoNode *_Nullable node);
typedef void(^jobsByTableNodeBlock)(__kindof ASTableNode *_Nullable node);
typedef void(^jobsByScrollNodeBlock)(__kindof ASScrollNode *_Nullable node);
typedef void(^jobsByCellNodeBlock)(__kindof ASCellNode *_Nullable node);
typedef void(^jobsByStackLayoutSpecBlock)(__kindof ASStackLayoutSpec *_Nullable layout);
#pragma mark —— ReactiveObjC / RAC
typedef void(^jobsByRACSignalBlock)(__kindof RACSignal *_Nullable signal);
typedef void(^jobsByRACSchedulerRecursiveBlock)(jobsByVoidBlock _Nonnull reschedule);
#pragma mark —— 其他
typedef void(^jobsByDataBlock)(NSData *_Nullable data);
typedef void(^jobsByLockBlock)(NSLock *_Nullable lock);
typedef void(^jobsByRunLoopBlock)(NSRunLoop *_Nullable runLoop);
typedef void(^jobsByPHFetchOptionsBlock)(PHFetchOptions *_Nullable options);
typedef void(^jobsByPHImageManagerBlock)(PHImageManager *_Nullable imageManager);
typedef void(^jobsByPHVideoRequestOptionsBlock)(PHVideoRequestOptions *_Nullable options);
typedef void(^jobsByPHImageRequestOptionsBlock)(PHImageRequestOptions *_Nullable options);
typedef void(^jobsByShadowBlock)(__kindof NSShadow *_Nullable shadow);
typedef void(^jobsByMutableDataBlock)(__kindof NSMutableData *_Nullable data);
typedef void(^jobsByMutableStringBlock)(__kindof NSMutableString *_Nullable data);
typedef void(^jobsByBezierPathBlock)(__kindof UIBezierPath *_Nullable data);
typedef void(^jobsByNotificationBlock)(NSNotification *_Nullable notification);
typedef void(^jobsByAlertActionBlock)(__kindof UIAlertAction *_Nullable action);
typedef void(^jobsByPasteboardBlock)(__kindof UIPasteboard *_Nullable pasteboard);
typedef void(^jobsByUNUserNotificationCenterBlock)(__kindof UNUserNotificationCenter *_Nullable center);
typedef void(^jobsByUNMutableNotificationContentBlock)(__kindof UNMutableNotificationContent *_Nullable content);
typedef void(^jobsByNEVPNManagerBlock)(__kindof NEVPNManager *_Nullable VPNManager);
typedef void(^jobsByNEVPNProtocolIKEv2Block)(__kindof NEVPNProtocolIKEv2 *_Nullable VPNProtocolIKEv2);
/// 多参数
typedef void(^jobsByClassAndSaltBlock)(Jobs_ByClassAndSaltBlock_Arguments);
typedef void(^jobsKeyValueBlock)(Jobs_KeyValueBlock_Arguments);
typedef void(^jobsByKey_ValueBlock)(Jobs_Key_ValueBlock_Arguments);
typedef void(^jobsBySelectorBlock) (Jobs_2_Arguments);
typedef void(^jobsJSCompletionHandlerBlock)(Jobs_JSCompletionHandlerBlock_Arguments);
typedef void(^WKNavigationDelegateBlock3) (Jobs_WKNavigationDelegate_Arguments);
typedef void(^jobsByViewArrayRowsColumnsBlock)(Jobs_ViewArrayRowsColumnsBlock_Arguments);
typedef void(^jobsByClassAndSaltStrBlock)(Jobs_UITableViewHeaderFooterViewBlock_Arguments);
typedef void(^jobsByColor_FloatBlock)(Jobs_ReturnButtonByColor_FloatBlock_Arguments);
/// weakSelf 方便使用，用来打破循环引用。使用时需要改成实际类型，否则没有代码提示
/// selector 实际调用的方法
/// arg 事件默认传递的对象，比如`NSNotification`，`UIButton`
typedef void(^jobsByTwoIDBlock) (Jobs_2_Arguments);// weakSelf、arg
typedef void(^JobsSelectorBlock1) (Jobs_3_Arguments);// weakSelf、arg、data
#pragma clang diagnostic pop
// JOBS_INLINE_BLOCK_VOID_TYPEDEF_AUTOGEN_BEGIN
// JOBS_INLINE_BLOCK_VOID_TYPEDEF_AUTOGEN_END

// JOBS_FUNCTIONAL_BLOCK_TYPEDEF_AUTOGEN_BEGIN

#pragma mark —— Generated Functional Void Blocks
typedef void(^jobsByCADisplayLinkBlock)(CADisplayLink *);
typedef void(^jobsByCBCentralManagerBlock)(CBCentralManager *);
typedef void(^jobsByCGContextRefBlock)(CGContextRef);
typedef void(^jobsByCMAccelerationBlock)(CMAcceleration);
typedef void(^jobsByCMFormatDescriptionRefBlock)(CMFormatDescriptionRef);
typedef void(^jobsByCMSampleBufferRefBlock)(CMSampleBufferRef);
typedef void(^jobsByCMTimeBlock)(CMTime);
typedef void(^jobsByFetchNotifiViewBlockBlock)(FetchNotifiViewBlock);
typedef void(^jobsByGXCardCellSwipeDirectionBlock)(GXCardCellSwipeDirection);
typedef void(^jobsByIDJobsRefreshAnimatorProtocolBlock)(id<JobsRefreshAnimatorProtocol>);
typedef void(^jobsByIDUIContentContainerBlock)(id<UIContentContainer>);
typedef void(^jobsByIDUIViewControllerContextTransitioningBlock)(id<UIViewControllerContextTransitioning>);
typedef void(^jobsByJXCategoryBaseCellModelBlock)(JXCategoryBaseCellModel *);
typedef void(^jobsByJobsAppDoorInputViewBaseStyleBlock)(JobsAppDoorInputViewBaseStyle *);
typedef void(^jobsByJobsGestureLockValidationResultBlock)(JobsGestureLockValidationResult);
typedef void(^jobsByJobsLabelScrollConfigurationBlock)(JobsLabelScrollConfiguration *);
typedef void(^jobsByJobsLocalNotificationModelBlock)(JobsLocalNotificationModel *);
typedef void(^jobsByJobsOCAudioRecorderEngineBlock)(JobsOCAudioRecorderEngine *);
typedef void(^jobsByJobsOCCalendarBlock)(JobsOCCalendar *);
typedef void(^jobsByJobsOCCalendarAppearanceBlock)(JobsOCCalendarAppearance *);
typedef void(^jobsByJobsOCCalendarDayCellBlock)(JobsOCCalendarDayCell *);
typedef void(^jobsByJobsOCCommentConfigBlock)(JobsOCCommentConfig *);
typedef void(^jobsByJobsOCCommentModeBlock)(JobsOCCommentMode);
typedef void(^jobsByJobsOCCommentModelBlock)(JobsOCCommentModel *);
typedef void(^jobsByJobsOCCommentViewBlock)(JobsOCCommentView *);
typedef void(^jobsByJobsOCMarkdownDocumentBlock)(JobsOCMarkdownDocument *);
typedef void(^jobsByJobsOCMarkdownViewBlock)(JobsOCMarkdownView *);
typedef void(^jobsByJobsOCOpenConfigurationBlock)(JobsOCOpenConfiguration *);
typedef void(^jobsByJobsOCRefreshPositionBlock)(JobsOCRefreshPosition);
typedef void(^jobsByJobsOCRefreshStateBlock)(JobsOCRefreshState);
typedef void(^jobsByJobsOCSearcherConfigBlock)(JobsOCSearcherConfig *);
typedef void(^jobsByJobsOCSkeletonConfigBlock)(JobsOCSkeletonConfig *);
typedef void(^jobsByJobsOCSkeletonUserBlock)(JobsOCSkeletonUser *);
typedef void(^jobsByJobsOCSplashContentTypeBlock)(JobsOCSplashContentType);
typedef void(^jobsByJobsOCVideoRecorderRecordButtonBlock)(JobsOCVideoRecorderRecordButton *);
typedef void(^jobsByJobsOCVideoRecorderWriterFinishBlockBlock)(JobsOCVideoRecorderWriterFinishBlock);
typedef void(^jobsByJobsRetBOOLByBOOLBlockBlock)(JobsRetBOOLByBOOLBlock _Nullable);
typedef void(^jobsByJobsRetBOOLByIDBlockBlock)(JobsRetBOOLByIDBlock _Nullable);
typedef void(^jobsByJobsRetBOOLByNSUIntegerBlockBlock)(JobsRetBOOLByNSUIntegerBlock _Nullable);
typedef void(^jobsByJobsRetByCharBlockBlock)(JobsRetByCharBlock _Nullable);
typedef void(^jobsByJobsRetByDoubleBlockBlock)(JobsRetByDoubleBlock _Nullable);
typedef void(^jobsByJobsRetByFloatBlockBlock)(JobsRetByFloatBlock _Nullable);
typedef void(^jobsByJobsRetByLongBlockBlock)(JobsRetByLongBlock _Nullable);
typedef void(^jobsByJobsRetByNSIntegerBlockBlock)(JobsRetByNSIntegerBlock _Nullable);
typedef void(^jobsByJobsRetByNSUIntegerBlockBlock)(JobsRetByNSUIntegerBlock _Nullable);
typedef void(^jobsByJobsRetByShortBlockBlock)(JobsRetByShortBlock _Nullable);
typedef void(^jobsByJobsRetByUnsignedCharBlockBlock)(JobsRetByUnsignedCharBlock _Nullable);
typedef void(^jobsByJobsRetByUnsignedIntBlockBlock)(JobsRetByUnsignedIntBlock _Nullable);
typedef void(^jobsByJobsRetByUnsignedLongBlockBlock)(JobsRetByUnsignedLongBlock _Nullable);
typedef void(^jobsByJobsRetByUnsignedLongLongBlockBlock)(JobsRetByUnsignedLongLongBlock _Nullable);
typedef void(^jobsByJobsRetByUnsignedShortBlockBlock)(JobsRetByUnsignedShortBlock _Nullable);
typedef void(^jobsByJobsRetCGFloatByCGFloatBlockBlock)(JobsRetCGFloatByCGFloatBlock _Nullable);
typedef void(^jobsByJobsRetCGFloatByIDBlockBlock)(JobsRetCGFloatByIDBlock _Nullable);
typedef void(^jobsByJobsRetCharByIDBlockBlock)(JobsRetCharByIDBlock _Nullable);
typedef void(^jobsByJobsRetDoubleByIDBlockBlock)(JobsRetDoubleByIDBlock _Nullable);
typedef void(^jobsByJobsRetFloatByIDBlockBlock)(JobsRetFloatByIDBlock _Nullable);
typedef void(^jobsByJobsRetIDByGestureBlockBlock)(JobsRetIDByGestureBlock _Nullable);
typedef void(^jobsByJobsRetIDBySELBlockBlock)(JobsRetIDBySELBlock _Nullable);
typedef void(^jobsByJobsRetIDByStrBlockBlock)(JobsRetIDByStrBlock _Nullable);
typedef void(^jobsByJobsRetIDByTwoIDBlockBlock)(JobsRetIDByTwoIDBlock _Nullable);
typedef void(^jobsByJobsRetIDByVoidBlockBlock)(JobsRetIDByVoidBlock _Nullable);
typedef void(^jobsByJobsRetIntByIDBlockBlock)(JobsRetIntByIDBlock _Nullable);
typedef void(^jobsByJobsRetIntByIntBlockBlock)(JobsRetIntByIntBlock _Nullable);
typedef void(^jobsByJobsRetLongByIDBlockBlock)(JobsRetLongByIDBlock _Nullable);
typedef void(^jobsByJobsRetNSIntegerByIDBlockBlock)(JobsRetNSIntegerByIDBlock _Nullable);
typedef void(^jobsByJobsRetNSUIntegerByIDBlockBlock)(JobsRetNSUIntegerByIDBlock _Nullable);
typedef void(^jobsByJobsRetShortByIDBlockBlock)(JobsRetShortByIDBlock _Nullable);
typedef void(^jobsByJobsRetUnsignedCharByIDBlockBlock)(JobsRetUnsignedCharByIDBlock _Nullable);
typedef void(^jobsByJobsRetUnsignedIntByIDBlockBlock)(JobsRetUnsignedIntByIDBlock _Nullable);
typedef void(^jobsByJobsRetUnsignedLongByIDBlockBlock)(JobsRetUnsignedLongByIDBlock _Nullable);
typedef void(^jobsByJobsRetUnsignedLongLongByIDBlockBlock)(JobsRetUnsignedLongLongByIDBlock _Nullable);
typedef void(^jobsByJobsRetUnsignedShortByIDBlockBlock)(JobsRetUnsignedShortByIDBlock _Nullable);
typedef void(^jobsByJobsUserModelBlock)(JobsUserModel * _Nullable);
typedef void(^jobsByJobsViewPushCompletionBlockBlock)(JobsViewPushCompletionBlock);
typedef void(^jobsByJobsWalletCardModelBlock)(JobsWalletCardModel *);
typedef void(^jobsByMGSwipeTableCellBlock)(MGSwipeTableCell * _Nonnull);
typedef void(^jobsByMJRefreshStateBlock)(MJRefreshState);
typedef void(^jobsByNSArrayBlock)(NSArray *);
typedef void(^jobsByNSArrayHXPhotoModelBlock)(NSArray <HXPhotoModel *>*);
typedef void(^jobsByNSArrayIDBlock)(NSArray<id> *);
typedef void(^jobsByNSArrayJobsAppDoorInputViewBaseStyleBlock)(NSArray<JobsAppDoorInputViewBaseStyle *> *);
typedef void(^jobsByNSArrayJobsOCCommentModelBlock)(NSArray<JobsOCCommentModel *> *);
typedef void(^jobsByNSArrayJobsWalletCardModelBlock)(NSArray<JobsWalletCardModel *> *);
typedef void(^jobsByNSArrayNSArrayNSDictionaryNSStringNSNumberBlock)(NSArray <NSArray <NSDictionary <NSString *, NSNumber *>*>*>*);
typedef void(^jobsByNSArrayNSDictionaryBlock)(NSArray <NSDictionary *>* _Nullable);
typedef void(^jobsByNSArrayNSStringBlock)(NSArray <NSString *>*);
typedef void(^jobsByNSArrayUIButtonBlock)(NSArray<UIButton *> *);
typedef void(^jobsByNSArrayUITextFieldBlock)(NSArray <__kindof UITextField *>*);
typedef void(^jobsByNSArrayUIViewBlock)(NSArray<__kindof UIView *> *);
typedef void(^jobsByNSArrayUIViewControllerBlock)(NSArray<__kindof UIViewController *> *);
typedef void(^jobsByNSArrayUser_RealmBlock)(NSArray <User_Realm *>* _Nullable);
typedef void(^jobsByNSCoderBlock)(NSCoder *);
typedef void(^jobsByNSAttributedStringBlock)(NSAttributedString *_Nullable);
typedef void(^jobsByNSIndexSetBlock)(NSIndexSet *);
typedef void(^jobsByNSInvocationBlock)(NSInvocation *);
typedef void(^jobsByNSManagedObjectBlock)(NSManagedObject *);
typedef void(^jobsByNSMutableArrayBlock)(NSMutableArray *);
typedef void(^jobsByNSMutableArrayJobsOCDemoSectionModelBlock)(NSMutableArray <JobsOCDemoSectionModel *>*);
typedef void(^jobsByNSMutableAttributedStringBlock)(NSMutableAttributedString *);
typedef void(^jobsByNSMutableSetBlock)(NSMutableSet *);
typedef void(^jobsByNSObjectFlutterPluginRegistrarBlock)(NSObject<FlutterPluginRegistrar>*);
typedef void(^jobsByNSSetUISceneSessionBlock)(NSSet<UISceneSession *> *);
typedef void(^jobsByNSUUIDBlock)(NSUUID *);
typedef void(^jobsByNSUserActivityBlock)(NSUserActivity *);
typedef void(^jobsBySDWebImageNoParamsBlockBlock)(SDWebImageNoParamsBlock _Nullable);
typedef void(^jobsBySRWebSocketBlock)(SRWebSocket *);
typedef void(^jobsByUIApplicationBlock)(UIApplication *);
typedef void(^jobsByUICollectionViewLayoutAttributesBlock)(UICollectionViewLayoutAttributes *);
typedef void(^jobsByUIControlEventsBlock)(UIControlEvents);
typedef void(^jobsByUIDeviceOrientationBlock)(UIDeviceOrientation);
typedef void(^jobsByUIAlertControllerBlock)(UIAlertController *_Nullable);
typedef void(^jobsByUINavigationControllerBlock)(UINavigationController *);
typedef void(^jobsByUISceneBlock)(UIScene *);
typedef void(^jobsByUISceneSessionBlock)(UISceneSession *);
typedef void(^jobsByUISearchControllerBlock)(UISearchController *);
typedef void(^jobsByUITouchBlock)(UITouch *);
typedef void(^jobsByUITraitCollectionBlock)(UITraitCollection *);
typedef void(^jobsByUser_RealmBlock)(User_Realm *);
typedef void(^jobsByZFPlayerGestureControlBlock)(ZFPlayerGestureControl *);
typedef void(^jobsByZMJTipViewBlock)(ZMJTipView *);
typedef void(^jobsBydispatch_block_tBlock)(dispatch_block_t);
typedef void(^jobsByjobsByBOOLBlockBlock)(jobsByBOOLBlock _Nullable);
typedef void(^jobsByjobsByCharBlockBlock)(jobsByCharBlock _Nullable);
typedef void(^jobsByjobsByDoubleBlockBlock)(jobsByDoubleBlock _Nullable);
typedef void(^jobsByjobsByFloatBlockBlock)(jobsByFloatBlock _Nullable);
typedef void(^jobsByjobsByGestureRecognizerBlockBlock)(jobsByGestureRecognizerBlock _Nullable);
typedef void(^jobsByjobsByIDBlockBlock)(jobsByIDBlock _Nullable);
typedef void(^jobsByjobsByIPApiModelBlockBlock)(jobsByIPApiModelBlock _Nullable);
typedef void(^jobsByjobsByIntBlockBlock)(jobsByIntBlock _Nullable);
typedef void(^jobsByjobsByIpifyModelBlockBlock)(jobsByIpifyModelBlock _Nullable);
typedef void(^jobsByjobsByIpinfoModelBlockBlock)(jobsByIpinfoModelBlock _Nullable);
typedef void(^jobsByjobsByLongBlockBlock)(jobsByLongBlock _Nullable);
typedef void(^jobsByjobsByNSIntegerBlockBlock)(jobsByNSIntegerBlock _Nullable);
typedef void(^jobsByjobsByNSUIntegerBlockBlock)(jobsByNSUIntegerBlock _Nullable);
typedef void(^jobsByjobsByResponseModelBlockBlock)(jobsByResponseModelBlock _Nullable);
typedef void(^jobsByjobsBySELBlockBlock)(jobsBySELBlock _Nullable);
typedef void(^jobsByjobsByShortBlockBlock)(jobsByShortBlock _Nullable);
typedef void(^jobsByjobsByStrBlockBlock)(jobsByStrBlock _Nullable);
typedef void(^jobsByjobsByTwoIDBlockBlock)(jobsByTwoIDBlock _Nullable);
typedef void(^jobsByjobsByUnsignedCharBlockBlock)(jobsByUnsignedCharBlock _Nullable);
typedef void(^jobsByjobsByUnsignedIntBlockBlock)(jobsByUnsignedIntBlock _Nullable);
typedef void(^jobsByjobsByUnsignedLongBlockBlock)(jobsByUnsignedLongBlock _Nullable);
typedef void(^jobsByjobsByUnsignedLongLongBlockBlock)(jobsByUnsignedLongLongBlock _Nullable);
typedef void(^jobsByjobsByUnsignedShortBlockBlock)(jobsByUnsignedShortBlock _Nullable);
typedef void(^jobsByjobsByYTKBatchRequestBlockBlock)(jobsByYTKBatchRequestBlock _Nullable);
typedef void(^jobsByjobsByYTKChainRequestBlockBlock)(jobsByYTKChainRequestBlock _Nullable);
typedef void(^jobsByunusedNSTimerBlock)(__unused NSTimer *);
typedef void(^jobsByvoidBOOLBlock)(void (^)(BOOL));
typedef void(^jobsByvoidBOOLNSErrorBlock)(void(^)(BOOL success, NSError *error));
typedef void(^jobsByvoidNotifiViewBlock)(void (^ _Nonnull )(NotifiView * ));
// JOBS_FUNCTIONAL_BLOCK_TYPEDEF_AUTOGEN_END

#endif /* VoidByCertainParameters_h */

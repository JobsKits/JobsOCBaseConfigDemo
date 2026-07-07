//
//  JobsBlock.h
//  JobsBlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

/// 全局的Block块定义
/// 基本数据类型尽量的用NSNumber进行二次封装成对象对外输出
#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <MessageUI/MessageUI.h>
#import "JobsBlockDef.h"
#import "JobsBlockHeader.h" // 类型的向前申明
#import "JobsBizBlock.h"    // 关于业务（不与JobsOCBaseConfigDemo同步）
#import "ReturnByCertainParametersBlock.h"
#import "VoidByCertainParametersBlock.h"
#import "ReturnByUnCertainParameters.h"
#import "VoidByUnCertainParameters.h"

typedef id _Nullable(^JobsRetIDByRetIDVoidBlocks)(JobsRetIDByVoidBlock _Nullable block);
typedef id _Nullable(^JobsRetIDByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByIDBlocks)(jobsByIDBlock _Nullable block);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByIDBlocks)(jobsByIDBlock _Nullable data);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByRetIDByVoidBlocks)(JobsRetIDByVoidBlock _Nullable block);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);

#import "NSObject+CallBackInfoByBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif
/**
     Block 的三种类型
     在 Objective-C 中，block 有三种存储类型：
     1、Stack Block（栈区 block）：
     默认创建的 block 存储在栈中。
     生命周期与作用域绑定，当作用域结束时，栈上的 block 会被销毁。
     2、Malloc Block（堆区 block）：
     通过 copy 操作将栈上的 block 拷贝到堆中，拥有更长的生命周期，直到引用计数为 0。
     3、Global Block（全局 block）：
     不捕获任何外部变量的 block，存储在全局内存区，不需要 copy。
     ❤️assign 是一种非强引用的修饰符，直接指向内存地址，并不会增加 block 的引用计数。
     如果 block 是存储在栈上的（即 Stack Block），在作用域结束时，block 会被销毁，指针指向的内存随之变为野指针，从而导致程序崩溃。❤️
 */
#ifndef JobsBlock_h
#define JobsBlock_h
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
#pragma mark —— 涉及到自定义类的Block定义
typedef ComponentType(^JobsRetComponentTypeByVoidBlock)(void);
typedef DeviceOrientation(^JobsRetDeviceOrientationByVoidBlock)(void);
typedef AppLanguage(^JobsRetAppLanguageByVoidBlock)(void);
typedef DeviceOrientation(^JobsRetDeviceOrientationByViewBlock)(__kindof UIView *_Nullable data);

typedef void(^jobsByJobsTextViewBlock)(__kindof JobsTextView *_Nullable textView);
typedef void(^jobsByZFAVPlayerManagerBlock)(__kindof ZFAVPlayerManager *_Nullable manager);
typedef void(^jobsByZFIJKPlayerManagerBlock)(__kindof ZFIJKPlayerManager *_Nullable manager);
typedef void(^jobsByZFDouYinControlViewBlock)(__kindof ZFDouYinControlView *_Nullable controlView);
typedef void(^jobsByZFCustomControlViewBlock)(__kindof ZFCustomControlView *_Nullable controlView);
typedef void(^jobsByCustomZFPlayerControlViewBlock)(__kindof CustomZFPlayerControlView *_Nullable controlView);
typedef void(^jobsByRightBtnsViewBlock)(__kindof JobsRightBtnsView *_Nullable view);
typedef void(^jobsByBaseViewBlock)(__kindof BaseView *_Nullable view);
typedef void(^jobsByTabBarVCBlock)(__kindof JobsTabBarVC *_Nullable vc);
typedef void(^jobsByCustomTabBarVCBlock)(__kindof JobsCustomTabBarVC *_Nullable vc);
typedef void(^jobsByCustomTabBarConfigBlock)(__kindof JobsCustomTabBarConfig *_Nullable config);
typedef void(^jobsByMGSwipeButtonModelBlock)(__kindof MGSwipeButtonModel *_Nullable model);
typedef void(^jobsByMFMessageComposeVCBlock)(MFMessageComposeViewController *_Nullable vc);
typedef void(^jobsByMFMailComposeVCBlock)(MFMailComposeViewController *_Nullable vc);
typedef void(^jobsByOCKeyboardConfigBlock)(__kindof JobsOCKeyboardConfig *_Nullable config);
typedef void(^jobsByOCKeyboardResultBlock)(__kindof JobsOCKeyboardResult *_Nullable result);
typedef void(^jobsByRichTextConfigBlock)(__kindof JobsRichTextConfig *_Nullable config);
typedef void(^jobsBySDWebImageModelBlock)(__kindof SDWebImageModel *_Nullable model);
typedef void(^jobsByURLManagerModelBlock)(__kindof URLManagerModel *_Nullable model);
typedef void(^jobsByViewModelAndBOOLBlock)(Jobs_ViewModelAndBOOLBlock_Arguments);
typedef void(^jobsByViewModelBlock)(__kindof UIViewModel *_Nullable model);
typedef void(^jobsByHeaderFooterViewModelBlock)(__kindof JobsHeaderFooterViewModel *_Nullable model);
typedef void(^jobsByArrWithViewModelBlock)(__kindof NSArray <__kindof UIViewModel *>*_Nullable models);
typedef void(^jobsByBaseTableViewBlock)(__kindof BaseTableView *_Nullable tableView);
typedef void(^jobsByOCSearcherBarBlock)(__kindof JobsOCSearcherBar *_Nullable searchBar);
typedef void(^jobsByAppDoorModelBlock)(__kindof JobsAppDoorModel *_Nullable model);
typedef void(^jobsByUNNotificationRequestModelBlock)(UNNotificationRequestModel *_Nullable model);
typedef void(^jobsByAlertModelBlock)(JobsAlertModel *_Nullable model);
typedef void(^jobsByTextModelBlock)(__kindof UITextModel *_Nullable model);
typedef void(^jobsByMagicTextFieldBlock)(__kindof JobsMagicTextField *_Nullable textField);
typedef void(^jobsByRACModelBlock)(RACModel *_Nullable model);
typedef void(^jobsByGestureModelBlock)(JobsGestureModel *_Nullable model);
typedef void(^jobsByIMChatInfoModelBlock)(JobsIMChatInfoModel *_Nullable model);
typedef void(^jobsByAppDoorInputViewBaseStyleModelBlock)(JobsAppDoorInputViewBaseStyleModel *_Nullable model);
typedef void(^jobsByLuckyWheelViewBlock)(__kindof LuckyWheelView *_Nullable view);
typedef void (^jobsByLuckyWheelSegmentBlock)(LuckyWheelSegment *_Nullable segment);
typedef void (^jobsByLuckyWheelSegmentAndLPGesturerBlock)(Jobs_LuckyWheelSegment_LPGestureRecognizer_Arguments);
typedef void(^jobsByCorModelBlock)(JobsCorModel *_Nullable data);
typedef void(^jobsByControlTargeBlock)(JobsControlTarget *_Nullable data);
typedef void(^jobsByMenuViewBlock)(__kindof JobsMenuView *_Nullable view);
typedef void(^jobsByViewNavigatorBlock)(__kindof JobsViewNavigator *_Nullable navigator);
typedef void(^jobsByBaseNavigationBarBlock)(__kindof BaseNavigationBar *_Nullable navBar);
typedef void(^jobsByMasonryModelBlock)(__kindof MasonryModel *_Nullable model);
typedef void(^jobsByLZTabBarBlock)(__kindof LZTabBar *_Nullable tabBar);
typedef void(^jobsByLZTabBarItemBlock)(__kindof LZTabBarItem *_Nullable item);
typedef void(^jobsByTextFieldModelBlock)(__kindof UITextFieldModel *_Nullable model);
typedef void(^jobsByImageModelBlock)(__kindof JobsImageModel *_Nullable model);
typedef void(^jobsByPointLabBaseViewBlock)(__kindof PointLabBaseView *_Nullable view);
typedef void(^jobsByTabBarBlock)(JobsTabBar *_Nullable tabBar);
typedef void(^jobsByFileFolderHandleModelBlock)(__kindof FileFolderHandleModel *_Nullable model);
typedef void(^jobsByNavBarConfigBlock)(__kindof JobsNavBarConfig *_Nullable config);
typedef void(^jobsByNavBarBlock)(__kindof JobsNavBar *_Nullable data);
typedef void(^jobsByJobsTextFieldBlock)(__kindof JobsTextField *_Nullable data);
typedef void(^jobsByHQTextFieldBlock)(__kindof HQTextField *_Nullable textField);
typedef void(^jobsByCJTextField)(CJTextField *_Nullable textField);
typedef void(^jobsByZYTextFieldBlock)(ZYTextField *_Nullable textField);
typedef void(^jobsByStepViewBlock)(__kindof JobsStepView *_Nullable stepView);
typedef void(^jobsByBaseLabelBlock)(__kindof BaseLabel *_Nullable label);
typedef void(^jobsByBaseTextViewBlock)(__kindof BaseTextView *_Nullable textView);
typedef void(^jobsByToggleBaseViewBlock)(JobsToggleBaseView *_Nullable toggleBaseView);
typedef void(^jobsByHotLabelBlock)(__kindof JobsHotLabelBySingleLine *_Nullable view);
typedef void(^jobsBySlideToUnlockViewBlock)(__kindof SlideToUnlockView *_Nullable view);
typedef void(^jobsByJobsTabBarCtrlBlock)(__kindof JobsTabBarCtrl *_Nullable view);
typedef void(^jobsByUserModelBlock)(__kindof JobsUserModel <NSCoding>*_Nullable model);
typedef void(^jobsByUserDefaultModelBlock)(UserDefaultModel *_Nonnull data);
typedef void(^jobsByTabBarItemConfigBlock)(__kindof JobsTabBarItemConfig *_Nullable config);
typedef void(^jobsByLZTabBarConfigBlock)(__kindof LZTabBarConfig *_Nullable config);
typedef void(^jobsByHXPhotoPickerModelBlock)(__kindof HXPhotoPickerModel *_Nullable model);
typedef void(^jobsByParagraphStyleModelBlock)(__kindof JobsParagraphStyleModel *_Nullable model);
typedef void(^jobsByLocationModelBlock)(__kindof JobsLocationModel *_Nullable model);
typedef void(^jobsByGTCaptcha4ModelBlock)(__kindof GTCaptcha4Model *_Nullable model);
typedef void(^jobsByDoorModelBlock)(__kindof FMDoorModel *_Nullable model);
typedef void(^jobsByNameModelBlock)(__kindof FMNameModel *_Nullable model);
typedef void(^jobsByWithDrawModelBlock)(__kindof FMWithDrawModel *_Nullable model);
typedef void(^jobsByTimeModelBlock)(__kindof JobsTimeModel *_Nullable model);
typedef void(^jobsByVideoModelCoreBlock)(__kindof VideoModel_Core *_Nullable model);
typedef void(^jobsByNotificationModelBlock)(NotificationModel *_Nullable model);
typedef void(^jobsByNSNotificationKeyboardModelBlock)(NSNotificationKeyboardModel *_Nullable model);
typedef void(^jobsByExcelConfigureViewModelBlock)(JobsExcelConfigureViewModel *_Nullable model);
typedef void(^jobsByPopListBaseViewBlock)(PopListBaseView *_Nullable data);
typedef void(^jobsByExcelViewBlock)(__kindof JobsExcelView *_Nullable view);
typedef void(^jobsByExcelContentViewBlock)(__kindof JobsExcelContentView *_Nullable contentView);
typedef void(^jobsByExcelTopHeadViewBlock)(__kindof JobsExcelTopHeadView *_Nullable topHeadView);
typedef void(^jobsByExcelLeftListViewBlock)(__kindof JobsExcelLeftListView *_Nullable leftListView);
typedef void(^jobsByUserHeaderDataViewTBVCellBlock)(JobsUserHeaderDataViewTBVCell *_Nullable cell);
typedef void(^jobsByKeyValueModelBlock)(JobsKeyValueModel *_Nullable data);
typedef void(^jobsBySPAlertControllerConfigBlock)(__kindof SPAlertControllerConfig *_Nullable config);
typedef void(^jobsByToggleNavViewBlock)(__kindof JobsToggleNavView *_Nullable taggedNavView);
typedef void(^jobsByCustomTabBarBlock)(__kindof JobsCustomTabBar *_Nullable customTabBar);
typedef void(^jobsByIQKeyboardManagerBlock)(__kindof IQKeyboardManager *_Nullable manager);
typedef void(^JobsByCJTextFieldBlock)(CJTextField *_Nullable data);
typedef void(^jobsByNavigationTransitionManagerBlock)(__kindof JobsNavigationTransitionMgr *_Nullable manager);
typedef void(^jobsByPresentTransitionManagerBlock)(__kindof JobsPresentTransitionMgr *_Nullable manager);
typedef void(^JobsTimerBlock)(JobsTimer<TimerProtocol> *_Nullable timer);
typedef void(^JobsTimerMgrBuildBlock)(JobsTimer *_Nullable timer);
typedef void(^jobsByCGFloatBlocks)(jobsByCGFloatBlock _Nullable timer);
typedef void(^jobsByBRPickerStyleBlock)(__kindof BRPickerStyle *_Nullable pickerStyle);
typedef void(^jobsByBRDatePickerViewBlock)(__kindof BRDatePickerView *_Nullable datePickerView);
typedef void (^BRDateResultBlock)(BRDateResult_Arguments);
typedef void(^jobsByBRStringPickerViewModelBlock)(__kindof BRStringPickerViewModel *_Nullable model);
typedef void (^BRPickerViewExtraPickerStyleConfigBlock)(__kindof BRPickerStyle *_Nullable pickerStyle);
typedef void (^BRPickerViewExtraTextPickerModelBlock)(__kindof BRStringPickerViewModel *_Nullable model);
typedef void(^jobsByBRAddressPickerViewBlock)(__kindof BRAddressPickerView *_Nullable addressPickerView);
typedef void (^BRPickerViewExtraTextPickerViewConfigBlock)(__kindof BRTextPickerView *_Nullable textPickerView);
typedef void (^BRPickerViewExtraDatePickerViewConfigBlock)(__kindof BRDatePickerView *_Nullable datePickerView);
typedef void (^BRDateResultRangeBlock)(BRDateResultRange_Arguments);
typedef void(^jobsByIpifyModelBlock)(IpifyModel *_Nullable model);
typedef void(^jobsByIPApiModelBlock)(IPApiModel *_Nullable model);
typedef void(^jobsByIpinfoModelBlock)(IpinfoModel *_Nullable model);
typedef void(^jobsByRequestToolBlock)(RequestTool *_Nullable tool);
typedef void(^jobsByBaseModelBlock)(__kindof BaseModel *_Nullable model);
typedef void(^jobsByBaseModelAndIndexBlock)(Jobs_BaseModel_Index_Arguments);
typedef void(^jobsByDecorationModelBlock)(__kindof JobsDecorationModel *_Nullable model);
typedef void(^jobsByMASConstraintMakerBlock)(MASConstraintMaker *_Nonnull make);
typedef void(^jobsByIDAndKeyBlock)(Jobs_UserModel_Key_Arguments);
typedef void(^jobsByCategoryTitleViewBlock)(__kindof JXCategoryTitleView *_Nullable view);
typedef void(^jobsByCategoryImageViewBlock)(__kindof JXCategoryImageView *_Nullable view);
typedef void(^jobsByCategoryDotViewBlock)(__kindof JXCategoryDotView *_Nullable view);
typedef void(^jobsByCategoryNumberViewBlock)(__kindof JXCategoryNumberView *_Nullable view);
typedef void(^jobsByCategoryIndicatorBackgroundViewBlock)(__kindof JXCategoryIndicatorBackgroundView *_Nullable bgView);
typedef void(^jobsCategoryIndicatorLineViewBlock)(__kindof JXCategoryIndicatorLineView *_Nullable indicator);
typedef void(^jobsByFileModelBlock)(__kindof JobsFileModel *_Nullable model);
typedef void(^jobsByButtonModelBlock)(__kindof UIButtonModel *_Nullable model);
typedef void(^jobsByButtonModelAndBOOLBlock)(Jobs_ByButtonModelAndBOOLBlock_Arguments);
typedef void(^jobsByNetworkSourceBlock)(__kindof JobsNetworkSource *_Nullable source);
typedef void(^jobsByGDFadeViewBlock)(__kindof GDFadeView *_Nullable view);
typedef void(^jobsByCFGradientLabelBlock)(__kindof CFGradientLabel *_Nullable label);
typedef void(^jobsByWGradientProgressModelBlock)(__kindof WGradientProgressModel *_Nullable model);
typedef void(^jobsByFSCalendarBlock)(__kindof FSCalendar *_Nullable calendar);
typedef void(^jobsByFSCalendarAppearanceBlock)(__kindof FSCalendarAppearance *_Nullable appearance);
typedef void(^jobsByFSCalendarHeaderViewBlock)(__kindof FSCalendarHeaderView *_Nullable headerView);
typedef void(^jobsByFSCalendarSwipeToChooseGestureBlock)(__kindof UILongPressGestureRecognizer *_Nullable gesture);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByFSCalendarAppearanceBlockBlock)(jobsByFSCalendarAppearanceBlock _Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByFSCalendarHeaderViewBlockBlock)(jobsByFSCalendarHeaderViewBlock _Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByFSCalendarSwipeToChooseGestureBlockBlock)(jobsByFSCalendarSwipeToChooseGestureBlock _Nullable data);
typedef void(^jobsByGKPhotoBlock)(GKPhoto *_Nonnull data);
typedef void(^jobsBySZTextViewBlock)(SZTextView *_Nonnull textView);
typedef void(^jobsByXZMRefreshNormalHeaderBlock)(__kindof XZMRefreshNormalHeader *_Nonnull data);
typedef void(^jobsByYTKNetworkConfigBlock)(__kindof YTKNetworkConfig *_Nullable data);
typedef void(^jobsByYTKRequestBlock)(__kindof YTKRequest *_Nullable request);
typedef void(^jobsByYTKChainRequestBlock)(YTKChainRequest *_Nullable chainRequest);
typedef void(^jobsByYTKBatchRequestBlock)(__kindof YTKBatchRequest *_Nullable data);
typedef void(^jobsByYTKBaseRequestBlock)(YTKBaseRequest *_Nonnull request);
typedef void(^JobsHandelNoSuccessBlock)(__kindof YTKBaseRequest *_Nonnull request);
typedef void(^jobsByHXPhotoManagerBlock)(__kindof HXPhotoManager *_Nullable manager);
typedef void(^jobsByHXPhotoConfigurationBlock)(__kindof HXPhotoConfiguration *_Nullable config);
typedef void(^jobsByMJRefreshStateHeaderBlock)(__kindof MJRefreshStateHeader *_Nullable view);
typedef void(^jobsByMJRefreshNormalHeaderBlock)(__kindof MJRefreshNormalHeader *_Nullable view);
typedef void(^jobsByMJRefreshHeaderBlock)(__kindof MJRefreshHeader *_Nullable view);
typedef void(^jobsByMJRefreshGifHeaderBlock)(__kindof MJRefreshGifHeader *_Nullable view);
typedef void(^jobsByResponseModelBlock)(JobsResponseModel *_Nullable model);
typedef void(^jobsByMJRefreshFooterBlock)(__kindof MJRefreshFooter *_Nullable view);
typedef void(^jobsByMJRefreshAutoGifFooterBlock)(__kindof MJRefreshAutoGifFooter *_Nullable view);
typedef void(^jobsByMJRefreshBackNormalFooterBlock)(__kindof MJRefreshBackNormalFooter *_Nullable view);
typedef void(^jobsByMJRefreshAutoNormalFooterBlock)(__kindof MJRefreshAutoNormalFooter *_Nullable view);
typedef void(^jobsByMJRefreshAutoStateFooterBlock)(__kindof MJRefreshAutoStateFooter *_Nullable view);
typedef void(^jobsByMJRefreshAutoFooterBlock)(__kindof MJRefreshAutoFooter *_Nullable view);
typedef void(^jobsByMJRefreshBackGifFooterBlock)(__kindof MJRefreshBackGifFooter *_Nullable view);
typedef void(^jobsByMJRefreshBackStateFooterBlock)(__kindof MJRefreshBackStateFooter *_Nullable view);
typedef void(^jobsByMJRefreshBackFooterBlock)(__kindof MJRefreshBackFooter *_Nullable view);
typedef void(^jobsByLOTAnimationMJRefreshHeaderBlock)(LOTAnimationMJRefreshHeader *_Nullable view);
typedef void(^jobsByRACDisposableBlock)(RACDisposable *_Nullable disposable);
typedef void(^jobsByGKPhotoBrowserBlock)(GKPhotoBrowser *_Nonnull browser);
typedef void(^jobsByRefreshConfigModelBlock)(__kindof MJRefreshConfigModel *_Nullable model);
typedef void(^jobsByErrBlocks)(jobsByErrBlock _Nullable block);
typedef void(^jobsByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);
typedef void(^jobsByTransformLayerDirectionTypeBlock)(JobsDirectionType data);
typedef void(^jobsByJobsBasePopupTextViewBlock)(__kindof JobsBasePopupTextView *_Nullable textView);
typedef void(^JobsEKEventStoreRequestAccessCompletionHandler)(Jobs_EKEventStoreRequestAccessCompletionHandler_Arguments);
typedef void(^jobsDelegateBlocks)(Jobs_DelegateBlocks_Arguments);
typedef void(^JobsNetworkUpdateBlock)(Jobs_NetworkUpdate_Arguments);
typedef void(^TKPermissionBlock)(BOOL isAuth);
typedef void(^TKPermissionCustomMsgBlock)(TKPermissionCustomMsg_Arguments);// block自定义提示消息
#pragma mark —— 关于 NSObject CallBackBlock DSL
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByVoidBlock)(jobsByVoidBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByIDBlock)(jobsByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByGestureRecognizerBlock)(jobsByGestureRecognizerBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsBySELBlock)(jobsBySELBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByStrBlock)(jobsByStrBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByNSIntegerBlock)(jobsByNSIntegerBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByNSUIntegerBlock)(jobsByNSUIntegerBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByCGFloatBlock)(jobsByCGFloatBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByBOOLBlock)(jobsByBOOLBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByIntBlock)(jobsByIntBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByUnsignedIntBlock)(jobsByUnsignedIntBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByFloatBlock)(jobsByFloatBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByDoubleBlock)(jobsByDoubleBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByCharBlock)(jobsByCharBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByUnsignedCharBlock)(jobsByUnsignedCharBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByShortBlock)(jobsByShortBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByUnsignedShortBlock)(jobsByUnsignedShortBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByLongBlock)(jobsByLongBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByUnsignedLongBlock)(jobsByUnsignedLongBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByUnsignedLongLongBlock)(jobsByUnsignedLongLongBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsByTwoIDBlock)(jobsByTwoIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetIDByVoidBlock)(JobsRetIDByVoidBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetIDByGestureBlock)(JobsRetIDByGestureBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetIDBySELBlock)(JobsRetIDBySELBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetIDByStrBlock)(JobsRetIDByStrBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetNSIntegerByIDBlock)(JobsRetNSIntegerByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetNSUIntegerByIDBlock)(JobsRetNSUIntegerByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetCGFloatByIDBlock)(JobsRetCGFloatByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetBOOLByIDBlock)(JobsRetBOOLByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetIntByIDBlock)(JobsRetIntByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetUnsignedIntByIDBlock)(JobsRetUnsignedIntByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetFloatByIDBlock)(JobsRetFloatByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetDoubleByIDBlock)(JobsRetDoubleByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetCharByIDBlock)(JobsRetCharByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetUnsignedCharByIDBlock)(JobsRetUnsignedCharByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetShortByIDBlock)(JobsRetShortByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetUnsignedShortByIDBlock)(JobsRetUnsignedShortByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetLongByIDBlock)(JobsRetLongByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetUnsignedLongByIDBlock)(JobsRetUnsignedLongByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetUnsignedLongLongByIDBlock)(JobsRetUnsignedLongLongByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetIDByIDBlock)(JobsRetIDByIDBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByNSIntegerBlock)(JobsRetByNSIntegerBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByNSUIntegerBlock)(JobsRetByNSUIntegerBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetCGFloatByCGFloatBlock)(JobsRetCGFloatByCGFloatBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetBOOLByBOOLBlock)(JobsRetBOOLByBOOLBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetBOOLByNSUIntegerBlock)(JobsRetBOOLByNSUIntegerBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetIntByIntBlock)(JobsRetIntByIntBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByUnsignedIntBlock)(JobsRetByUnsignedIntBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByFloatBlock)(JobsRetByFloatBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByDoubleBlock)(JobsRetByDoubleBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByCharBlock)(JobsRetByCharBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByUnsignedCharBlock)(JobsRetByUnsignedCharBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByShortBlock)(JobsRetByShortBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByUnsignedShortBlock)(JobsRetByUnsignedShortBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByLongBlock)(JobsRetByLongBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByUnsignedLongBlock)(JobsRetByUnsignedLongBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetByUnsignedLongLongBlock)(JobsRetByUnsignedLongLongBlock _Nullable block);
typedef __kindof NSObject *_Nullable(^JobsRetNSObjectByJobsRetIDByTwoIDBlock)(JobsRetIDByTwoIDBlock _Nullable block);

typedef id _Nullable(^JobsRetIDByAppLanguageBlock)(AppLanguage data);
typedef id _Nullable(^JobsRetIDByMasonryModelBlock)(__kindof MasonryModel *_Nullable model);
typedef id _Nullable(^JobsRetIDByResponseModelBlock)(__kindof JobsResponseModel *_Nullable model);
typedef id _Nullable(^JobsRetIDByComponentTypeAndUIViewBlock)(Jobs_ReturnIDByComponentTypeAndUIViewBlock_Arguments);
/// UIView
typedef __kindof UIView *_Nullable(^JobsRetViewByTextModelBlock)(UITextModel *_Nullable model);
typedef __kindof UIView *_Nullable(^JobsRetViewByLocationModelBlock)(__kindof JobsLocationModel *_Nullable model);
typedef __kindof UIView *_Nullable(^JobsRetViewByButtonModelArrayBlock)(__kindof NSArray <UIButtonModel *>*_Nullable models);
typedef __kindof UIView *_Nullable(^JobsRetViewByButtonModelBlock)(UIButtonModel *_Nullable model);
typedef __kindof UIView <MJRefreshProtocol>*_Nullable(^JobsRetMJRefreshViewByStringBlock)(__kindof NSString *_Nullable string);
typedef __kindof UIView <MJRefreshProtocol>*_Nullable(^JobsRetMJRefreshViewByArrayBlock)(__kindof NSArray <NSObject *>*_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewBySuperviewMasonryBlock)(Jobs_ReturnViewByViewAndMasonryConstraintsBlocks_Arguments);
typedef __kindof UIView *_Nullable(^JobsRetViewByMasonryConstraintsBlock)(jobsByMASConstraintMakerBlock _Nullable block);
/// UIButton
typedef __kindof UIButton *_Nullable(^JobsRetButtonByViewModelAndBOOLBlock)(Jobs_ViewModelAndBOOLBlock_Arguments);
typedef __kindof UIButton *_Nullable(^JobsRetButtonByViewModelBlock)(__kindof UIViewModel *_Nullable model);
typedef __kindof UIButton *_Nullable(^JobsRetButtonByTextModelBlock)(UITextModel *_Nullable model);
typedef __kindof UIButton *_Nullable(^JobsRetButtonByButtonModelBlock)(__kindof UIButtonModel *_Nullable model);
typedef __kindof UIButton *_Nullable(^JobsRetButtonByButtonModelAndBOOLBlock)(Jobs_ByButtonModelAndBOOLBlock_Arguments);
typedef __kindof UIAlertController *_Nullable(^JobsRetAlertControllerByAlertModelBlock)(JobsAlertModel *_Nullable model);
typedef __kindof UNNotificationRequest *_Nullable(^JobsRetUNNotificationRequestByModelBlock)(UNNotificationRequestModel *_Nullable model);
/// NSArray
typedef __kindof NSArray <UIViewModel *>*_Nullable(^JobsRetViewModelInArrByArrBlock)(__kindof NSArray *_Nullable arr);
typedef __kindof NSArray *_Nullable(^JobsRetArrByMasonryModelBlock)(__kindof MasonryModel *_Nullable model);
/// NSMutableArray
typedef __kindof NSMutableArray <UIButtonModel *>*_Nullable(^JobsRetButtonModelArrByArrBlock)(__kindof NSArray *_Nullable arr);

typedef NSTimeZone *_Nullable(^JobsRetTimeZoneByTypeBlock)(TimeZoneType timeZoneType);
typedef NSMutableAttributedString *_Nullable(^JobsRetAttributedStringByRichTextConfigArrayBlock)(NSArray <JobsRichTextConfig *>*_Nullable configs);
/// JobsViewNavigator
typedef JobsViewNavigator *_Nonnull(^JobsRetViewNavigatorByViewAndAnimatedBlock)(Jobs_ReturnViewNavigatorByViewAndAnimatedBlock_Arguments);
typedef JobsViewNavigator *_Nonnull(^JobsRetViewNavigatorByBOOLBlock)(BOOL data);

typedef BOOL(^JobsRetBOOLByButtonModelBlock)(UIButtonModel *_Nullable data);
typedef BOOL(^JobsRetBOOLByAppDoorModelBlock)(__kindof JobsAppDoorModel *_Nullable model);
typedef CGSize(^JobsRetCGSizeByViewModelBlock)(__kindof UIViewModel *_Nullable model);
typedef CGRect(^JobsRetCGRectByViewModelBlock)(__kindof UIViewModel *_Nullable model);
typedef CGFloat(^JobsRetCGFloatByViewModelBlock)(__kindof UIViewModel *_Nullable model);

typedef JobsAppDoorInputViewBaseStyle *_Nullable(^JobsRetAppDoorInputViewBaseStyleByClassBlock)(Class _Nonnull cls);
#pragma mark —— 关于 LuckyWheelView
typedef __kindof LuckyWheelView *_Nullable (^JobsRetLuckyWheelViewByPointerDirectionBlock)(JobsDirectionType direction);
typedef __kindof LuckyWheelView *_Nullable (^JobsRetLuckyWheelViewBySegmentsBlock)(NSArray<LuckyWheelSegment *> *_Nullable segments);
typedef __kindof LuckyWheelView *_Nullable (^JobsRetLuckyWheelViewByColorsBlock)(NSArray<UIColor *> *_Nullable colors);
typedef __kindof LuckyWheelView *_Nullable (^JobsRetLuckyWheelViewByTimeIntervalBlock)(NSTimeInterval duration);
typedef __kindof LuckyWheelView *_Nullable (^JobsRetLuckyWheelViewByNumberBlock)(NSNumber *_Nullable value);
typedef __kindof LuckyWheelView *_Nullable (^JobsRetLuckyWheelViewByBOOLBlock)(BOOL flag);
typedef __kindof LuckyWheelView *_Nullable(^JobsRetLuckyWheelViewBySegmentTapDSLBlock)(jobsByLuckyWheelSegmentBlock _Nullable handler);
typedef __kindof LuckyWheelView *_Nullable(^JobsRetLuckyWheelViewBySegmentLongPressDSLBlock)(jobsByLuckyWheelSegmentAndLPGesturerBlock _Nullable handler);
/// JobsNavBarConfig
typedef JobsNavBarConfig *_Nullable(^JobsRetNavBarConfigByStringBlock)(NSString *_Nullable string);
typedef JobsNavBarConfig *_Nullable(^JobsRetNavBarConfigByStringsBlock)(Jobs_NSStringBlock_3_Arguments);
typedef JobsNavBarConfig *_Nullable(^JobsRetNavBarConfigByAttributedStringBlock)(NSAttributedString *_Nullable aString);
typedef JobsNavBarConfig *_Nullable(^JobsRetNavBarConfigByStringAndActionBlock)(Jobs_NavBarConfig_Title_Action_Arguments);
typedef JobsNavBarConfig *_Nullable(^JobsRetNavBarConfigByStringsAndActionBlock)(Jobs_NavBarConfig_Titles_Action_Arguments);
typedef JobsNavBarConfig *_Nullable(^JobsRetNavBarConfigByButtonModelBlock)(Jobs_NavBarConfig_BackBtnModel_CloseBtnModel_Arguments);
/// JobsOCKeyboardConfig
typedef __kindof JobsOCKeyboardConfig *_Nullable(^JobsRetJobsOCKeyboardConfigByIDBlock)(id _Nullable data);
typedef __kindof JobsOCKeyboardConfig *_Nullable(^JobsRetJobsOCKeyboardConfigByViewBlock)(__kindof UIView *_Nullable data);
typedef __kindof JobsOCKeyboardConfig *_Nullable(^JobsRetJobsOCKeyboardConfigByArrBlock)(__kindof NSArray <__kindof UIView *>*_Nullable data);
typedef __kindof JobsOCKeyboardConfig *_Nullable(^JobsRetJobsOCKeyboardConfigByCGFloatBlock)(CGFloat data);
typedef __kindof JobsOCKeyboardConfig *_Nullable(^JobsRetJobsOCKeyboardConfigByBOOLBlock)(BOOL data);
typedef __kindof JobsOCKeyboardConfig *_Nullable(^JobsRetJobsOCKeyboardConfigByApplyModeBlock)(JobsOCKeyboardApplyMode data);
typedef __kindof JobsOCKeyboardConfig *_Nullable(^JobsRetJobsOCKeyboardConfigByAccessoryPolicyBlock)(JobsOCKeyboardAccessoryPolicy data);
typedef __kindof JobsOCKeyboardConfig *_Nullable(^JobsRetJobsOCKeyboardConfigByResultBlock)(jobsByOCKeyboardResultBlock _Nullable data);
/// JobsOCKeyboardMgr
typedef __kindof JobsOCKeyboardMgr *_Nullable(^JobsRetJobsOCKeyboardMgrByVoidBlock)(void);
typedef __kindof JobsOCKeyboardMgr *_Nullable(^JobsRetJobsOCKeyboardMgrByConfigBlock)(__kindof JobsOCKeyboardConfig *_Nullable data);
/// JobsTextField
typedef __kindof JobsTextField *_Nonnull(^JobsRetJobsTextFieldByCGFloatBlock)(CGFloat data);
typedef __kindof JobsTextField *_Nonnull(^JobsRetJobsTextFieldByBOOLBlock)(BOOL data);
typedef __kindof JobsTextField *_Nonnull(^JobsRetJobsTextFieldByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable gesture);
typedef __kindof JobsTextField *_Nonnull(^JobsRetJobsTextFieldByCorBlock)(UIColor *_Nullable cor);
typedef __kindof JobsTextField *_Nonnull(^JobsRetJobsTextFieldByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof JobsTextField *_Nullable(^JobsRetJobsTextFieldByModeBlock)(UITextFieldViewMode mode);
typedef __kindof JobsTextField *_Nonnull(^JobsRetJobsTextFieldByUITextFieldBlock)(__kindof UITextField *_Nullable textField);
typedef __kindof JobsTextField *_Nonnull(^JobsRetJobsTextFieldByTextFieldConfigBlock)(jobsByTextFieldBlock _Nullable config);
/// CJTextField
typedef __kindof CJTextField *_Nullable(^JobsRetCJTextFieldByDeleteDelegateBlock)(id<CJTextFieldDeleteDelegate> _Nullable delegate);
/// HQTextField
typedef __kindof HQTextField *_Nullable(^JobsRetHQTextFieldByVoidBlock)(void);
/// ZYTextField
typedef __kindof ZYTextField *_Nullable(^JobsRetZYTextFieldByCGFloatBlock)(CGFloat data);
typedef __kindof ZYTextField *_Nullable(^JobsRetZYTextFieldByBOOLBlock)(BOOL data);
typedef __kindof ZYTextField *_Nullable(^JobsRetZYTextFieldByCorBlock)(UIColor *_Nullable cor);
typedef __kindof ZYTextField *_Nullable(^JobsRetZYTextFieldByFontBlock)(UIFont *_Nullable font);
typedef __kindof ZYTextField *_Nullable(^JobsRetZYTextFieldByCGRectBlock)(CGRect data);
typedef __kindof ZYTextField *_Nullable(^JobsRetZYTextFieldByNSIntegerBlock)(NSInteger data);
/// JobsMagicTextField
typedef __kindof JobsMagicTextField *_Nullable(^JobsRetMagicTextFieldByBOOLBlock)(BOOL data);
typedef __kindof JobsMagicTextField *_Nullable(^JobsRetMagicTextFieldByCorBlock)(UIColor *_Nullable cor);
typedef __kindof JobsMagicTextField *_Nullable(^JobsRetMagicTextFieldByFontBlock)(UIFont *_Nullable font);
typedef __kindof JobsMagicTextField *_Nullable(^JobsRetMagicTextFieldByCGFloatBlock)(CGFloat data);
typedef __kindof JobsMagicTextField *_Nullable(^JobsRetMagicTextFieldByTimeIntervalBlock)(NSTimeInterval data);
/// JobsStepView
typedef __kindof JobsStepView *_Nullable(^JobsRetStepViewByCGFloatBlock)(CGFloat data);
typedef __kindof JobsStepView *_Nullable(^JobsRetStepViewByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsStepView *_Nullable(^JobsRetStepViewByColorBlock)(UIColor *_Nullable cor);
/// JobsTabBarCtrl
typedef __kindof JobsTabBarCtrl *_Nullable(^JobsRetTabBarCtrlByBOOLBlock)(BOOL data);
typedef __kindof JobsTabBarCtrl *_Nullable(^JobsRetTabBarCtrlByColorBlock)(UIColor *_Nullable color);
typedef __kindof JobsTabBarCtrl *_Nullable(^JobsRetTabBarCtrlByNumberBlock)(NSNumber *_Nullable number);
typedef __kindof JobsTabBarCtrl *_Nullable(^JobsRetTabBarCtrlByCGFloatBlock)(CGFloat data);
typedef __kindof JobsTabBarCtrl *_Nullable(^JobsRetTabBarCtrlByImageBlock)(UIImage *_Nullable image);
typedef __kindof JobsTabBarCtrl *_Nullable(^JobsRetTabBarCtrlByInsetsBlock)(UIEdgeInsets insets);
typedef __kindof JobsTabBarCtrl *_Nullable(^JobsRetTabBarCtrlByArrBlocks)(jobsByArrBlock _Nullable block);

typedef NSString *_Nullable(^JobsRetStringByTimeModelBlock)(__kindof JobsTimeModel *_Nullable model);
typedef __kindof NSMutableAttributedString *_Nullable(^JobsRetMutAttributedStringByParagraphStyleModelBlock)(__kindof JobsParagraphStyleModel *_Nullable model);
typedef __kindof UITabBarItem *_Nullable(^JobsRetTabBarItemByConfigBlock)(__kindof JobsTabBarItemConfig *_Nullable config);
typedef NSMutableDictionary *_Nonnull(^JobsRetMutableDicByKeyValueModelBlock)(JobsKeyValueModel *_Nullable model);
typedef __kindof NSDictionary *_Nullable(^JobsRetDicByGTCaptcha4ModelBlock)(__kindof GTCaptcha4Model *_Nullable model);

typedef PopListBaseView *_Nonnull(^JobsRetPopListBaseViewByID)(id _Nullable data);
typedef JobsCustomTabBar *_Nullable(^JobsRetCustomTabBarByViewBlock)(__kindof UIView *_Nullable view);
/// https://github.com/MortimerGoro/MGSwipeTableCell
typedef __kindof MGSwipeTableCell *_Nullable(^JobsRetMGSwipeTableCellByBOOLBlock)(BOOL data);
typedef __kindof MGSwipeTableCell *_Nonnull(^JobsRetMGSwipeTableCellByDelegateBlock)(id<MGSwipeTableCellDelegate> _Nullable delegate);
/// https://github.com/QuintGao/GKNavigationBar
typedef __kindof GKCustomNavigationBar *_Nullable(^JobsRetGKNavBarByButtonModelBlock)(__kindof UIButtonModel *_Nullable model);
#if __has_include(<GKNavigationBar/GKNavigationBar.h>) || __has_include("GKNavigationBar.h")
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByConfigureBlock)(void (^ _Nullable block)(GKNavigationBarConfigure *configure));
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByColorBlock)(UIColor *_Nullable data);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByImageBlock)(UIImage *_Nullable data);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByBOOLBlock)(BOOL data);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByFontBlock)(UIFont *_Nullable data);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByBackStyleBlock)(GKNavigationBarBackStyle data);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByCGFloatBlock)(CGFloat data);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByStatusBarStyleBlock)(UIStatusBarStyle data);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByTitleBlock)(UIColor *_Nullable color, UIFont *_Nullable font);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByLineBlock)(UIImage *_Nullable image, UIImage *_Nullable darkImage, UIColor *_Nullable color, NSNumber *_Nullable hidden);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByBackImagesBlock)(UIImage *_Nullable blackImage, UIImage *_Nullable whiteImage);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByBackPresetBlock)(UIImage *_Nullable image, UIImage *_Nullable darkImage, UIImage *_Nullable blackImage, UIImage *_Nullable whiteImage, NSNumber *_Nullable style);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByFixSpaceBlock)(NSNumber *_Nullable disable, NSNumber *_Nullable openSystemFixSpace, NSNumber *_Nullable left, NSNumber *_Nullable right);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByNavItemSpacingBlock)(NSNumber *_Nullable left, NSNumber *_Nullable right);
typedef __kindof GKNavigationBarConfigure *_Nullable(^JobsRetGKNavConfigureByPresetBlock)(UIColor *_Nullable backgroundColor, UIImage *_Nullable backgroundImage, UIImage *_Nullable darkBackgroundImage, UIColor *_Nullable titleColor, UIFont *_Nullable titleFont, NSNumber *_Nullable backStyle);
#endif
#if __has_include(<GKNavigationBar/GKGestureHandleConfigure.h>) || __has_include("GKGestureHandleConfigure.h")
typedef __kindof GKGestureHandleConfigure *_Nullable(^JobsRetGKGestureConfigureByConfigureBlock)(void (^ _Nullable block)(GKGestureHandleConfigure *configure));
typedef __kindof GKGestureHandleConfigure *_Nullable(^JobsRetGKGestureConfigureByCGFloatBlock)(CGFloat data);
typedef __kindof GKGestureHandleConfigure *_Nullable(^JobsRetGKGestureConfigureByBOOLBlock)(BOOL data);
typedef __kindof GKGestureHandleConfigure *_Nullable(^JobsRetGKGestureConfigureByArrayBlock)(NSArray *_Nullable data);
typedef __kindof GKGestureHandleConfigure *_Nullable(^JobsRetGKGestureConfigureByCriticalBlock)(NSNumber *_Nullable push, NSNumber *_Nullable pop);
typedef __kindof GKGestureHandleConfigure *_Nullable(^JobsRetGKGestureConfigureByScaleBlock)(NSNumber *_Nullable x, NSNumber *_Nullable y);
#endif

typedef JhtBannerScrollView *_Nullable(^JobsRetJhtBannerScrollViewByFrameBlock)(CGRect frame);
typedef JhtBannerCardView *_Nullable(^JobsRetJhtBannerCardViewByFrameBlock)(CGRect frame);
typedef CGSize(^JobsRetCGSizeByJhtBannerScrollViewBlock)(JhtBannerScrollView *_Nullable view);
typedef NSInteger(^JobsRetNSIntegerByJhtBannerScrollViewBlock)(JhtBannerScrollView *_Nullable view);
/// https://github.com/nolanw/HTMLReader
typedef HTMLDocument *_Nullable(^JobsRetHTMLDocumentByStringBlock)(__kindof NSString *_Nullable string);
typedef __kindof HXPhotoManager *_Nonnull(^JobsRetHXPhotoManagerByNSUIntegerBlock)(NSUInteger type);
/// https://github.com/SilenceLove/HXPhotoPickerObjC
/// HXPhotoView
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByDelegateBlock)(id<HXPhotoViewDelegate> _Nullable data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByPhotoMgrBlock)(__kindof HXPhotoManager *_Nullable data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByCollectionViewBlock)(__kindof HXCollectionView *_Nullable data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByCellCustomProtocolBlock)(id<HXPhotoViewCellCustomProtocol> _Nullable data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByBOOLBlock)(BOOL data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByScrollDirectionBlock)(UICollectionViewScrollDirection data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByNSIntegerBlock)(NSInteger data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByCGFloatBlock)(CGFloat data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByStringBlock)(NSString *_Nullable data);
typedef __kindof HXPhotoView *_Nullable(^JobsRetHXPhotoViewByIndexPathBlock)(NSIndexPath *_Nullable data);
/// HXPhotoManager
typedef __kindof HXPhotoManager *_Nullable(^JobsRetHXPhotoManagerByConfigurationBlock)(jobsByHXPhotoConfigurationBlock _Nullable block);
/// HXPhotoConfiguration
typedef __kindof HXPhotoConfiguration *_Nullable(^JobsRetHXPhotoConfigurationByBOOLBlock)(BOOL data);
typedef __kindof HXPhotoConfiguration *_Nullable(^JobsRetHXPhotoConfigurationByStringBlock)(NSString *_Nullable data);
typedef __kindof HXPhotoConfiguration *_Nullable(^JobsRetHXPhotoConfigurationByNSUIntegerBlock)(NSUInteger data);
typedef __kindof HXPhotoConfiguration *_Nullable(^JobsRetHXPhotoConfigurationByNSIntegerBlock)(NSInteger data);
/// https://github.com/91renb/BRPickerView
typedef BRDatePickerView *_Nonnull(^JobsRetBRDatePickerViewByPickerStyleBlock)(__kindof BRPickerStyle *_Nullable style);
typedef BRDatePickerView *_Nonnull (^BRPickerViewExtraRetDatePickerViewByPickerStyleBlock)(BRPickerStyle *_Nullable pickerStyle);
typedef BRTextPickerView *_Nonnull(^JobsRetBRTextPickerViewByPickerModeBlock)(NSInteger mode);
typedef BRTextPickerView *_Nonnull (^BRPickerViewExtraRetTextPickerViewByPickerModeBlock)(BRTextPickerMode mode);
typedef BRTextPickerView *_Nonnull (^BRPickerViewExtraRetTextPickerViewByPickerStyleBlock)(BRPickerStyle *_Nullable pickerStyle);
typedef BRAddressPickerView *_Nonnull(^JobsRetBRAddressPickerViewByPickerStyleBlock)(__kindof BRPickerStyle *_Nullable style);
typedef BRStringPickerView *_Nonnull(^JobsRetBRStringPickerViewByPickerModeBlock)(NSInteger mode);
/// https://github.com/AFNetworking/AFNetworking
typedef AFSecurityPolicy *_Nonnull(^JobsRetAFSecurityPolicyByAFSSLPinningModeBlock)(NSUInteger data);
/// JobsTimer
typedef __kindof JobsTimer *_Nullable(^JobsRetJTimerByJTimerBlock)(__kindof JobsTimer *_Nullable timer);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByCGFloatBlock)(CGFloat time);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByDoubleBlock)(double time);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByStringBlock)(NSString *_Nullable mode);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByUserInfo)(id _Nullable userInfo);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByQueue)(dispatch_queue_t _Nullable queue);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByNSUInteger)(NSUInteger state);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByCGFloatBlocks)(jobsByCGFloatBlock _Nullable block);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByJTimerBlocks)(JobsTimerBlock _Nullable block);
/// _JobsTimerMgrEntry
typedef __kindof _JobsTimerMgrEntry *_Nullable(^JobsRetJobsTimerMgrEntryByJobsTimerBlock)(JobsTimer<TimerProtocol> *_Nullable timer);
typedef __kindof _JobsTimerMgrEntry *_Nullable(^JobsRetJobsTimerMgrEntryByNSUIntegerBlock)(NSUInteger data);
typedef __kindof _JobsTimerMgrEntry *_Nullable(^JobsRetJobsTimerMgrEntryByJobsByCGFloatBlockBlock)(jobsByCGFloatBlock _Nullable block);
typedef __kindof _JobsTimerMgrEntry *_Nullable(^JobsRetJobsTimerMgrEntryByJobsTimerBlockBlock)(JobsTimerBlock _Nullable block);
/// JobsOCTimerMgr
typedef __kindof JobsTimerMgr *_Nullable(^JobsRetJobsTimerMgrByStringBlock)(NSString *_Nullable data);
typedef __kindof JobsTimerMgr *_Nullable(^JobsRetJobsTimerMgrByVoidBlock)(void);
typedef __kindof JobsTimerMgr *_Nullable(^JobsRetJobsTimerMgrByStringAndJobsByCGFloatBlockBlock)(NSString *_Nullable identifier, jobsByCGFloatBlock _Nullable block);
typedef __kindof JobsTimerMgr *_Nullable(^JobsRetJobsTimerMgrByStringAndJobsTimerBlockBlock)(NSString *_Nullable identifier, JobsTimerBlock _Nullable block);
typedef __kindof JobsTimerMgr *_Nullable(^JobsRetJobsTimerMgrByStringAndJobsByVoidBlockBlock)(NSString *_Nullable identifier, jobsByVoidBlock _Nullable block);
typedef __kindof JobsTimerMgr *_Nullable(^JobsRetJobsTimerMgrByUpsertTimerBlock)(NSString *_Nullable identifier,
                                                                                 JobsTimerType timerType,
                                                                                 NSUInteger policy,
                                                                                 BOOL startImmediately,
                                                                                 JobsTimerMgrBuildBlock _Nullable build,
                                                                                 jobsByVoidBlock _Nullable handler);
/// JobsNetworkTrafficMonitor
typedef __kindof JobsNetworkTrafficMonitor *_Nullable(^JobsRetTNetworkTrafficMonitorByUpdateBlock)(JobsNetworkUpdateBlock _Nullable block);
/// JobsTransitionAnimator
typedef __kindof JobsTransitionAnimator *_Nullable(^JobsRetAnimatorByTransDirectionBlock)(JobsTransitionDirection direction);
/// https://github.com/wwmz/WMZBanner
typedef WMZBannerView *_Nonnull(^JobsRetWMZBannerViewByBannerParamBlock)(WMZBannerParam *_Nonnull bannerParam);
/// https://github.com/SnapKit/Masonry
typedef void(^jobsByMasonryBlock)(jobsByMASConstraintMakerBlock _Nonnull block);
typedef jobsByMASConstraintMakerBlock _Nonnull(^JobsRetMASConstraintMakerByBOOLBlock)(BOOL data);
typedef __kindof NSArray *_Nullable(^JobsRetArrByMASConstraintMakerBlock)(MASConstraintMaker *_Nonnull data);
typedef __kindof NSArray *_Nullable(^JobsRetArrByMasonryBlocks)(jobsByMASConstraintMakerBlock _Nonnull block);

typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByMJRefreshHeaderBlock)(__kindof MJRefreshHeader *_Nullable header);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByMJRefreshHeaderBlock)(__kindof MJRefreshHeader *_Nullable header);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByMJRefreshHeaderBlock)(__kindof MJRefreshHeader *_Nullable header);
typedef __kindof MJRefreshStateHeader *_Nullable(^JobsRetMJRefreshStateHeaderByMJRefreshConfigModelBlock)(MJRefreshConfigModel *_Nullable config);
typedef __kindof MJRefreshNormalHeader *_Nonnull(^JobsRetMJRefreshNormalHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshStateHeader *_Nonnull(^JobsRetMJRefreshStateHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshHeader *_Nonnull(^JobsRetMJRefreshHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshGifHeader *_Nonnull(^JobsRetMJRefreshGifHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
/// MJRefreshFooter
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByMJRefreshFooterBlock)(__kindof MJRefreshFooter *_Nullable footer);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByMJRefreshFooterBlock)(__kindof MJRefreshFooter *_Nullable footer);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByMJRefreshFooterBlock)(__kindof MJRefreshFooter *_Nullable footer);
typedef __kindof MJRefreshFooter *_Nonnull(^JobsRetMJRefreshFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshAutoGifFooter *_Nonnull(^JobsRetMJRefreshAutoGifFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshBackNormalFooter *_Nonnull(^JobsRetMJRefreshBackNormalFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshAutoNormalFooter *_Nonnull(^JobsRetMJRefreshAutoNormalFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshAutoStateFooter *_Nonnull(^JobsRetMJRefreshAutoStateFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshAutoFooter *_Nonnull(^JobsRetMJRefreshAutoFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshBackGifFooter *_Nonnull(^JobsRetMJRefreshBackGifFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshBackStateFooter *_Nonnull(^JobsRetMJRefreshBackStateFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef __kindof MJRefreshBackFooter *_Nonnull(^JobsRetMJRefreshBackFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);

typedef LOTAnimationMJRefreshHeader *_Nonnull(^JobsRetLOTAnimationMJRefreshHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef LOTAnimationMJRefreshHeader *_Nonnull(^JobsRetLOTAnimationMJRefreshHeaderBySizeBlock)(CGSize size);
/// https://github.com/facebookincubator/SocketRocket
typedef SRWebSocket *_Nonnull(^JobsRetSRWebSocketByNSURLRequestBlock)(NSURLRequest *_Nullable request);
/// https://github.com/ReactiveCocoa/ReactiveObjC
typedef RACDisposable *_Nonnull(^JobsRetRACDisposableByTimeIntervalBlock)(NSTimeInterval data);
typedef RACDisposable *_Nonnull(^JobsRetRACDisposableByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);
typedef NSArray<RACSignal *>*_Nonnull(^JobsRetRACSignalArrByVoidBlock)(void);
/// https://github.com/QuintGao/GKPhotoBrowser
typedef GKPhotoBrowser *_Nullable(^JobsRetGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock)(Jobs_ReturnGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock_Arguments);
/// https://github.com/renzifeng/ZFPlayer
#if __has_include(<ZFPlayer/ZFPlayer.h>) || __has_include("ZFPlayer.h")
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByViewBlock)(__kindof UIView *_Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByManagerBlock)(id<ZFPlayerMediaPlayback> _Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByControlViewBlock)(__kindof UIView<ZFPlayerMediaControl> *_Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByURLBlock)(NSURL *_Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByURLsBlock)(NSArray<NSURL *> *_Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByNSIntegerBlock)(NSInteger data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByFloatBlock)(float data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByCGFloatBlock)(CGFloat data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByBOOLBlock)(BOOL data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByTimeCompletionBlock)(NSTimeInterval time, void (^ _Nullable completion)(BOOL finished));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByOrientationBlock)(UIInterfaceOrientation orientation, BOOL animated);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByFullScreenBlock)(BOOL fullScreen, BOOL animated);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByDisableGestureBlock)(ZFPlayerDisableGestureTypes data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByDisablePanBlock)(ZFPlayerDisablePanMovingDirection data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByPlaybackStateBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByLoadStateBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByPlayTimeBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByMediaURLBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByMediaBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByMediaErrorBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByOrientationChangeBlock)(void (^ _Nullable data)(ZFPlayerController *player, BOOL isFullScreen));
#endif
#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>) || __has_include("ZFAVPlayerManager.h")
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByDictionaryBlock)(NSDictionary *_Nullable data);
#endif
/// https://github.com/yuantiku/YTKNetwork
typedef __kindof YTKBatchRequest *_Nullable(^JobsRetBatchRequestByArrBlock)(__kindof NSArray <YTKRequest *>*_Nullable requests);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsRetYTKBaseRequestByVoidBlock)(void);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsRetYTKBaseRequestByYTKBaseRequestBlock)(YTKBaseRequest *_Nonnull request);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsRetYTKRequestByDictionaryBlock)(NSDictionary *_Nullable dic);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsRetYTKBaseRequestByIDBlock)(id _Nullable data);
#if defined(_YTKNETWORK_)
typedef void(^JobsYTKChainSuccessBlock)(__kindof YTKChainRequest *_Nonnull chainRequest);
typedef void(^JobsYTKChainFailureBlock)(__kindof YTKChainRequest *_Nonnull chainRequest, __kindof YTKBaseRequest *_Nonnull failedRequest);

typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByNSIntegerBlock)(NSInteger data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByDictionaryBlock)(NSDictionary *_Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByDelegateBlock)(id<YTKRequestDelegate> _Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByPriorityBlock)(YTKRequestPriority data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByStringBlock)(NSString *_Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByProgressBlock)(AFURLSessionTaskProgressBlock _Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByConstructingBlock)(AFConstructingBlock _Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByCompletionBlock)(YTKRequestCompletionBlock _Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByCompletionBlocks)(YTKRequestCompletionBlock _Nullable success, YTKRequestCompletionBlock _Nullable failure);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByAccessoryBlock)(id<YTKRequestAccessory> _Nullable data);

typedef __kindof YTKBatchRequest *_Nullable(^JobsRetYTKBatchRequestByNSIntegerBlock)(NSInteger data);
typedef __kindof YTKBatchRequest *_Nullable(^JobsRetYTKBatchRequestByDelegateBlock)(id<YTKBatchRequestDelegate> _Nullable data);
typedef __kindof YTKBatchRequest *_Nullable(^JobsRetYTKBatchRequestByAccessoryBlock)(id<YTKRequestAccessory> _Nullable data);
typedef __kindof YTKBatchRequest *_Nullable(^JobsRetYTKBatchRequestByAccessoriesBlock)(NSArray<id<YTKRequestAccessory>> *_Nullable data);
typedef __kindof YTKBatchRequest *_Nullable(^JobsRetYTKBatchRequestBySuccessBlock)(void (^ _Nullable data)(YTKBatchRequest *batchRequest));
typedef __kindof YTKBatchRequest *_Nullable(^JobsRetYTKBatchRequestByCompletionBlocks)(void (^ _Nullable success)(YTKBatchRequest *batchRequest), void (^ _Nullable failure)(YTKBatchRequest *batchRequest));

typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByDelegateBlock)(id<YTKChainRequestDelegate> _Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByAccessoryBlock)(id<YTKRequestAccessory> _Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByAccessoriesBlock)(NSArray<id<YTKRequestAccessory>> *_Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByRequestCallbackBlock)(__kindof YTKBaseRequest *_Nonnull request, YTKChainCallback _Nullable callback);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByRequestsBlock)(NSArray<__kindof YTKBaseRequest *> *_Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestBySuccessBlock)(JobsYTKChainSuccessBlock _Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByFailureBlock)(JobsYTKChainFailureBlock _Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByCompletionBlocks)(JobsYTKChainSuccessBlock _Nullable success, JobsYTKChainFailureBlock _Nullable failure);
#endif
/// https://github.com/pujiaxin33/JXCategoryView
/// JXCategoryBaseView
typedef __kindof JXCategoryBaseView *_Nullable(^JobsRetCategoryBaseViewByVoidBlock)(void);
typedef __kindof JXCategoryBaseView *_Nullable(^JobsRetCategoryBaseViewByDelegateBlock)(id<JXCategoryViewDelegate> _Nullable delegate);
typedef __kindof JXCategoryBaseView *_Nullable(^JobsRetCategoryBaseViewByListContainerBlock)(id<JXCategoryViewListContainer> _Nullable listContainer);
typedef __kindof JXCategoryBaseView *_Nullable(^JobsRetCategoryBaseViewByCGFloatBlock)(CGFloat data);
typedef __kindof JXCategoryBaseView *_Nullable(^JobsRetCategoryBaseViewByViewBlock)(__kindof UIView *_Nullable view);
/// JXCategoryTitleView
typedef __kindof JXCategoryTitleView *_Nullable(^JobsRetCategoryTitleViewByCorBlock)(__kindof UIColor *_Nullable cor);
typedef __kindof JXCategoryTitleView *_Nullable(^JobsRetCategoryTitleViewByFontBlock)(UIFont *_Nullable font);
typedef __kindof JXCategoryTitleView *_Nullable(^JobsRetCategoryTitleViewByStringsBlock)(__kindof NSArray <__kindof NSString *>*_Nullable strings);
typedef __kindof JXCategoryTitleView *_Nullable(^JobsRetCategoryTitleViewByNSIntegerBlock)(NSInteger data);
typedef __kindof JXCategoryTitleView *_Nullable(^JobsRetCategoryTitleViewByBOOLBlock)(BOOL data);
/// JXCategoryImageView
typedef __kindof JXCategoryImageView *_Nullable(^JobsRetCategoryImageViewByStringsBlock)(__kindof NSArray <__kindof NSString *>*_Nullable strings);
typedef __kindof JXCategoryImageView *_Nullable(^JobsRetCategoryImageViewBySizeBlock)(CGSize size);
typedef __kindof JXCategoryImageView *_Nullable(^JobsRetCategoryImageViewByCGFloatBlock)(CGFloat data);
typedef __kindof JXCategoryImageView *_Nullable(^JobsRetCategoryImageViewByBOOLBlock)(BOOL data);
typedef __kindof JXCategoryImageView *_Nullable(^JobsRetCategoryImageViewByNSIntegerBlock)(NSInteger data);
typedef __kindof JXCategoryImageView *_Nullable(^JobsRetCategoryImageViewByIndicatorLineViewsBlock)(__kindof NSArray <__kindof JXCategoryIndicatorLineView *>*_Nullable indicatorLineViews);
/// JXCategoryDotView
typedef __kindof JXCategoryDotView *_Nullable(^JobsRetCategoryDotViewByRelativePositionBlock)(NSUInteger relativePosition);// JXCategoryDotRelativePosition
typedef __kindof JXCategoryDotView *_Nullable(^JobsRetCategoryDotViewByCGFloatBlock)(CGFloat data);
typedef __kindof JXCategoryDotView *_Nullable(^JobsRetCategoryDotViewBySizeBlock)(CGSize size);
typedef __kindof JXCategoryDotView *_Nullable(^JobsRetCategoryDotViewByPointBlock)(CGPoint point);
typedef __kindof JXCategoryDotView *_Nullable(^JobsRetCategoryDotViewByCorBlock)(__kindof UIColor *_Nullable cor);
typedef __kindof JXCategoryDotView *_Nullable(^JobsRetCategoryDotViewByNumbersBlock)(__kindof NSArray <__kindof NSNumber *>*_Nullable numbers);
/// JXCategoryNumberView
typedef __kindof JXCategoryNumberView *_Nullable(^JobsRetCategoryNumberViewByNumbersBlock)(__kindof NSArray <__kindof NSNumber *>*_Nullable numbers);
typedef __kindof JXCategoryNumberView *_Nullable(^JobsRetCategoryNumberViewByCGPointBlock)(CGPoint point);
typedef __kindof JXCategoryNumberView *_Nullable(^JobsRetCategoryNumberViewByRetStringByIntegerBlocks)(JobsRetStrByIntegerBlock _Nullable block);
/// JXCategoryListContainerView
typedef __kindof JXCategoryListContainerView *_Nullable(^JobsRetCategoryListContainerViewByNSIntegerBlock)(NSInteger data);
/// JXCategoryIndicatorView
typedef __kindof JXCategoryIndicatorView *_Nullable(^JobsRetCategoryIndicatorViewByViewsBlock)(__kindof NSArray <__kindof UIView <JXCategoryIndicatorProtocol>*>*_Nullable views);
#pragma mark —— 复合型Block
typedef id _Nullable(^JobsRetIDByVoidBlocks)(jobsByVoidBlock _Nullable block);
typedef id _Nullable(^JobsRetIDByVoidIDBlocks)(jobsByIDBlock _Nullable block);

typedef __kindof UIView *_Nullable(^JobsRetViewByVoidBlocks)(jobsByVoidBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByRetIDBlocks)(JobsRetIDByVoidBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByMasonryConstraintsBlocks)(jobsByMASConstraintMakerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByViewAndMasonryConstraintsBlocks)(Jobs_ReturnViewByViewAndMasonryConstraintsBlocks_Arguments);
typedef __kindof UIButton *_Nullable(^JobsRetButtonByButtonModel2Blocks)(jobsByButtonModelBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsRetButtonByClickBlocks)(jobsByBtnBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsRetButtonByIDBlocks)(jobsByIDBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByCGFloatBlocks)(jobsByCGFloatBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByJTimerBlocks)(JobsTimerBlock _Nullable block);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByBlock1)(jobsByIDBlock _Nullable block);
typedef __kindof JobsNavBar *_Nullable(^JobsRetNavBarByVoidBtnBlocks)(jobsByBtnBlock _Nullable block);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByVoidBlocks)(jobsByVoidBlock _Nullable block);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByMasonryConstraintsBlocks)(jobsByMASConstraintMakerBlock _Nullable block);
#pragma mark —— JobsModel
/// UIViewModel
typedef __kindof UIViewModel *_Nullable(^JobsRetViewModelByVoidBlock)(void);
typedef __kindof UIViewModel *_Nullable(^JobsRetViewModelByStringBlock)(NSString *_Nullable string);
typedef __kindof UIViewModel *_Nullable(^JobsRetViewModelByDecorationModelBlock)(JobsDecorationModel *_Nullable model);
typedef __kindof UIViewModel *_Nullable(^jobsByGetDepositDiscountActivityRecordModelBlock)(__kindof GetDepositDiscountActivityRecordModel *_Nullable model);
/// UIButtonModel
typedef __kindof UIButtonModel *_Nullable(^JobsRetButtonModelByString)(__kindof NSString *_Nullable string);
typedef __kindof UIButtonModel *_Nullable(^JobsRetButtonModelByAttributedString)(__kindof NSAttributedString *_Nullable aString);
/// JobsTimeModel
typedef __kindof JobsTimeModel *_Nullable(^JobsRetTimeModelByIntegerBlock)(NSInteger timeSec);
typedef __kindof JobsTimeModel *_Nullable(^JobsRetTimeModelByStringBlock)(NSString *_Nullable dateFormat);
/// JobsCorModel
typedef __kindof JobsCorModel *_Nonnull(^JobsRetCorModelByVoidBlock)(void);
typedef __kindof JobsCorModel *_Nonnull(^JobsRetCorModelByCorBlock)(__kindof UIColor *_Nullable data);
/// FMDoorModel
typedef __kindof FMDoorModel *_Nullable(^JobsDoorModelBlock)(__kindof FMDoorModel *_Nullable model);
typedef __kindof FMDoorModel *_Nullable(^JobsRetDoorModelByGTCaptcha4ModelBlock)(__kindof GTCaptcha4Model *_Nullable model);
/// JobsDecorationModel
typedef __kindof JobsDecorationModel *_Nullable(^JobsRetDecorationModelByClsBlock)(Class _Nullable cls);
typedef __kindof JobsDecorationModel *_Nullable(^JobsRetDecorationModelByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof JobsDecorationModel *_Nullable(^JobsRetDecorationModelByIDBlock)(id _Nullable data);
/// JobsUserModel
typedef __kindof JobsUserModel<NSCoding> *_Nullable(^JobsRetUserModelByVoidBlock)(void);
typedef __kindof JobsUserModel<NSCoding> *_Nullable(^JobsRetUserModelByKeyBlock)(NSString *_Nullable key);

typedef __kindof UITextFieldModel *_Nullable(^JobsRetTextFieldModelByStr)(__kindof NSString *_Nullable data);
typedef __kindof URLManagerModel *_Nullable(^JobsRetURLManagerModelByStrBlock)(NSString *_Nullable data);
typedef __kindof BaseUploadFileRequest *_Nullable(^JobsRetRequestByFileModelBlock)(__kindof JobsFileModel *_Nullable model);
typedef __kindof MJRefreshConfigModel *_Nullable(^JobsRetMJRefreshConfigModelByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);
/// BRStringPickerViewModel
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByBOOLBlock)(BOOL data);
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByBRPickerStylePointerBlock)(BRPickerStyle *_Nullable data);
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByBRTextPickerModeBlock)(BRTextPickerMode data);
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByNSArrayNSNumberPointerPointerBlock)(NSArray <NSNumber *> *_Nullable data);
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByNSArrayNSStringPointerPointerBlock)(NSArray <NSString *> *_Nullable data);
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByNSArrayPointerBlock)(NSArray *_Nullable data);
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByNSIntegerBlock)(NSInteger data);
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByStrBlock)(NSString *_Nullable data);
typedef __kindof BRStringPickerViewModel *_Nullable(^JobsRetBRStringPickerViewModelByUIViewPointerBlock)(UIView *_Nullable data);
/// BRTextModel
typedef __kindof BRTextModel *_Nullable(^JobsRetBRTextModelByArrBlock)(NSArray <BRTextModel *> *_Nullable data);
typedef __kindof BRTextModel *_Nullable(^JobsRetBRTextModelByIDBlock)(id _Nullable data);
typedef __kindof BRTextModel *_Nullable(^JobsRetBRTextModelByNSIntegerBlock)(NSInteger data);
typedef __kindof BRTextModel *_Nullable(^JobsRetBRTextModelByStrBlock)(NSString *_Nullable data);
/// CasinoCustomerContactElementModel
typedef __kindof CasinoCustomerContactElementModel *_Nullable(^JobsRetCasinoCustomerContactElementModelByJobsCustomerContactStyleBlock)(JobsCustomerContactStyle data);
typedef __kindof CasinoCustomerContactElementModel *_Nullable(^JobsRetCasinoCustomerContactElementModelByJobsSwitchTypeBlock)(JobsSwitchType data);
typedef __kindof CasinoCustomerContactElementModel *_Nullable(^JobsRetCasinoCustomerContactElementModelByStrBlock)(NSString *_Nullable data);
typedef __kindof CasinoCustomerContactModel *_Nullable(^JobsRetCasinoCustomerContactModelByCasinoCustomerContactElementModelPointerBlock)(CasinoCustomerContactElementModel *_Nullable data);
typedef __kindof CasinoCustomerContactModel *_Nullable(^JobsRetCasinoCustomerContactModelByMutableArrayBlock)(NSMutableArray <CasinoCustomerContactElementModel *> *_Nullable data);
/// CasinoGetiOSNewestVersionModel
typedef __kindof CasinoGetiOSNewestVersionModel *_Nullable(^JobsRetCasinoGetiOSNewestVersionModelByJobsOperationTypeBlock)(JobsOperationType data);
typedef __kindof CasinoGetiOSNewestVersionModel *_Nullable(^JobsRetCasinoGetiOSNewestVersionModelByJobsUpdateTypeBlock)(JobsUpdateType data);
typedef __kindof CasinoGetiOSNewestVersionModel *_Nullable(^JobsRetCasinoGetiOSNewestVersionModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof CasinoGetiOSNewestVersionModel *_Nullable(^JobsRetCasinoGetiOSNewestVersionModelByStrBlock)(NSString *_Nullable data);
/// FMBannerAdsModel
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByBOOLBlock)(BOOL data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByCGFloatBlock)(CGFloat data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByCGPointBlock)(CGPoint data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByCGSizeBlock)(CGSize data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByComingStyleBlock)(ComingStyle data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByFMAccTypeBlock)(FMAccType data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByFMAdsTypeBlock)(FMAdsType data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByFMJumpTypeBlock)(FMJumpType data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByFrameBlock)(CGRect data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByJobsByBtnBlockBlock)(jobsByBtnBlock _Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByJobsByMASConstraintMakerBlockBlock)(jobsByMASConstraintMakerBlock _Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByJobsRetIDByIDBlockBlock)(JobsRetIDByIDBlock _Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByJobsSwitchType2Block)(JobsSwitchType2 data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByKindofUIViewPointerBlock)(__kindof UIView *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByMutableArrayBlock)(NSMutableArray <JobsRetIDByIDBlock> *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByMutableDicBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByNSAttributedStringPointerBlock)(NSAttributedString *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByNSDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByNSDirectionalRectEdgeBlock)(NSDirectionalRectEdge data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByNSIndexPathPointerBlock)(NSIndexPath *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByNSIntegerBlock)(NSInteger data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByNSLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByNSTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByStrBlock)(NSString *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIActionPointerBlock)(UIAction *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIBackgroundConfigurationPointerBlock)(UIBackgroundConfiguration *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIButtonConfigurationTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIControlContentHorizontalAlignmentBlock)(UIControlContentHorizontalAlignment data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIControlContentVerticalAlignmentBlock)(UIControlContentVerticalAlignment data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIImageViewPointerBlock)(UIImageView *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUILabelShowingTypeBlock)(UILabelShowingType data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUILayoutConstraintAxisBlock)(UILayoutConstraintAxis data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIStackViewAlignmentBlock)(UIStackViewAlignment data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIStackViewDistributionBlock)(UIStackViewDistribution data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUITextFieldViewModeBlock)(UITextFieldViewMode data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByUIViewPointerBlock)(UIView *_Nullable data);
typedef __kindof FMBannerAdsModel *_Nullable(^JobsRetFMBannerAdsModelByURLBlock)(NSURL *_Nullable data);
/// FMDoorModel
typedef __kindof FMDoorModel *_Nullable(^JobsRetFMDoorModelByBOOLBlock)(BOOL data);
typedef __kindof FMDoorModel *_Nullable(^JobsRetFMDoorModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof FMDoorModel *_Nullable(^JobsRetFMDoorModelByLoginTypeBlock)(LoginType data);
typedef __kindof FMDoorModel *_Nullable(^JobsRetFMDoorModelByNSIntegerBlock)(NSInteger data);
typedef __kindof FMDoorModel *_Nullable(^JobsRetFMDoorModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof FMDoorModel *_Nullable(^JobsRetFMDoorModelByStrBlock)(NSString *_Nullable data);
typedef __kindof FMNameModel *_Nullable(^JobsRetFMNameModelByStrBlock)(NSString *_Nullable data);
typedef __kindof FMNameModel *_Nullable(^JobsRetFMNameModelByUITextFieldPointerBlock)(__kindof UITextField *_Nullable data);
/// FileFolderHandleModel
typedef __kindof FileFolderHandleModel *_Nullable(^JobsRetFileFolderHandleModelByAVAssetPointerBlock)(AVAsset *_Nullable data);
typedef __kindof FileFolderHandleModel *_Nullable(^JobsRetFileFolderHandleModelByAVAudioMixPointerBlock)(AVAudioMix *_Nullable data);
typedef __kindof FileFolderHandleModel *_Nullable(^JobsRetFileFolderHandleModelByDataBlock)(NSData *_Nullable data);
typedef __kindof FileFolderHandleModel *_Nullable(^JobsRetFileFolderHandleModelByDicBlock)(NSDictionary *_Nullable data);
typedef __kindof FileFolderHandleModel *_Nullable(^JobsRetFileFolderHandleModelByImageBlock)(UIImage *_Nullable data);
/// GTCaptcha4Model
typedef __kindof GTCaptcha4Model *_Nullable(^JobsRetGTCaptcha4ModelByGTC4ErrorPointerBlock)(GTC4Error *_Nullable data);
typedef __kindof GTCaptcha4Model *_Nullable(^JobsRetGTCaptcha4ModelByGTCaptcha4ResultModelPointerBlock)(GTCaptcha4ResultModel *_Nullable data);
typedef __kindof GTCaptcha4Model *_Nullable(^JobsRetGTCaptcha4ModelByGTCaptcha4SessionPointerBlock)(GTCaptcha4Session *_Nullable data);
typedef __kindof GTCaptcha4Model *_Nullable(^JobsRetGTCaptcha4ModelByStrBlock)(NSString *_Nullable data);
typedef __kindof GTCaptcha4Model *_Nullable(^JobsRetGTCaptcha4ModelByUIViewPointerBlock)(__kindof UIView *_Nullable data);
/// GTCaptcha4ResultModel
typedef __kindof GTCaptcha4ResultModel *_Nullable(^JobsRetGTCaptcha4ResultModelByNSIntegerBlock)(NSInteger data);
typedef __kindof GTCaptcha4ResultModel *_Nullable(^JobsRetGTCaptcha4ResultModelByStrBlock)(NSString *_Nullable data);
/// HXPhotoPickerModel
typedef __kindof HXPhotoPickerModel *_Nullable(^JobsRetHXPhotoPickerModelByArrBlock)(NSArray <HXPhotoModel *> *_Nullable data);
typedef __kindof HXPhotoPickerModel *_Nullable(^JobsRetHXPhotoPickerModelByBOOLBlock)(BOOL data);
typedef __kindof HXPhotoPickerModel *_Nullable(^JobsRetHXPhotoPickerModelByHXCustomCameraViewControllerPointerBlock)(HXCustomCameraViewController *_Nullable data);
typedef __kindof HXPhotoPickerModel *_Nullable(^JobsRetHXPhotoPickerModelByHXPhotoManagerPointerBlock)(HXPhotoManager *_Nullable data);
typedef __kindof HXPhotoPickerModel *_Nullable(^JobsRetHXPhotoPickerModelByHXPhotoModelPointerBlock)(HXPhotoModel *_Nullable data);
typedef __kindof HXPhotoPickerModel *_Nullable(^JobsRetHXPhotoPickerModelByUIViewControllerPointerBlock)(__kindof UIViewController *_Nullable data);
// JobsAlertModel
typedef __kindof JobsAlertModel *_Nullable(^JobsRetJobsAlertModelByJobsByAlertActionBlockBlock)(jobsByAlertActionBlock _Nullable data);
typedef __kindof JobsAlertModel *_Nullable(^JobsRetJobsAlertModelByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsAlertModel *_Nullable(^JobsRetJobsAlertModelByUIAlertActionStyleBlock)(UIAlertActionStyle data);
typedef __kindof JobsAlertModel *_Nullable(^JobsRetJobsAlertModelByUIAlertControllerStyleBlock)(UIAlertControllerStyle data);
/// JobsAppDoorInputViewBaseStyleModel
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByAppLanguageBlock)(AppLanguage data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock)(BOOL data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByCADisplayLinkPointerBlock)(CADisplayLink *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock)(CGFloat data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByCGPointBlock)(CGPoint data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock)(CGSize data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByCJTextFieldPointerBlock)(__kindof CJTextField *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByClsBlock)(Class _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByComingStyleBlock)(ComingStyle data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByDateBlock)(NSDate *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByDispatch_queue_tBlock)(dispatch_queue_t _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByDispatch_semaphore_tBlock)(dispatch_semaphore_t _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByDispatch_source_tBlock)(dispatch_source_t _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock)(CGRect data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByHQTextFieldPointerBlock)(__kindof HQTextField *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByIDBlock)(id _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByIMPBlock)(IMP _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByBtnBlockBlock)(jobsByBtnBlock _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByCGFloatBlockBlock)(jobsByCGFloatBlock _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByMASConstraintMakerBlockBlock)(jobsByMASConstraintMakerBlock _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsHeaderFooterViewStyleBlock)(JobsHeaderFooterViewStyle data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsJSCompletionHandlerBlockBlock)(jobsJSCompletionHandlerBlock _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsMagicTextFieldPointerBlock)(__kindof JobsMagicTextField *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsRetIDByIDBlockBlock)(JobsRetIDByIDBlock _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTextFieldPointerBlock)(__kindof JobsTextField *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTextViewPointerBlock)(__kindof JobsTextView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerBlockBlock)(JobsTimerBlock _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerPointerBlock)(JobsTimer *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerStateBlock)(JobsTimerState data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerStyleBlock)(JobsTimerStyle data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerTypeBlock)(JobsTimerType data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByKindofUIImageViewPointerBlock)(__kindof UIImageView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByKindofUIViewPointerBlock)(__kindof UIView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByMutableSetBlock)(NSMutableSet *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSAttributedStringPointerBlock)(NSAttributedString *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSDirectionalRectEdgeBlock)(NSDirectionalRectEdge data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSIndexPathPointerBlock)(NSIndexPath *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSInvocationPointerBlock)(NSInvocation *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSLockPointerBlock)(NSLock *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock)(NSMutableArray <JobsRetIDByIDBlock> *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock)(NSMutableArray <JobsRichTextConfig *> *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayKindofUIButtonModelPointerPointerBlock)(NSMutableArray <__kindof UIButtonModel *> *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayKindofUIViewModelPointerPointerBlock)(NSMutableArray <__kindof UIViewModel *> *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayMASConstraintPointerPointerBlock)(NSMutableArray <MASConstraint *> *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayNSURLPointerPointerBlock)(NSMutableArray <NSURL *> *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayPointerBlock)(NSMutableArray *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableDictionaryPointerBlock)(NSMutableDictionary *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSRecursiveLockPointerBlock)(NSRecursiveLock *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSRunLoopModeBlock)(NSRunLoopMode data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSTimerPointerBlock)(NSTimer *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByPDFViewPointerBlock)(__kindof PDFView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelBySELBlock)(SEL _Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelBySZTextViewPointerBlock)(__kindof SZTextView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByShowTimeTypeBlock)(ShowTimeType data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIActionPointerBlock)(UIAction *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIActivityIndicatorViewPointerBlock)(__kindof UIActivityIndicatorView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIBackgroundConfigurationPointerBlock)(UIBackgroundConfiguration *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonConfigurationTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonModelPointerBlock)(UIButtonModel *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonPointerBlock)(__kindof UIButton *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUICollectionViewPointerBlock)(__kindof UICollectionView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIControlContentHorizontalAlignmentBlock)(UIControlContentHorizontalAlignment data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIControlContentVerticalAlignmentBlock)(UIControlContentVerticalAlignment data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIImageViewPointerBlock)(UIImageView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUILabelPointerBlock)(__kindof UILabel *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUILabelShowingTypeBlock)(UILabelShowingType data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUILayoutConstraintAxisBlock)(UILayoutConstraintAxis data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIScrollViewPointerBlock)(__kindof UIScrollView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIStackViewAlignmentBlock)(UIStackViewAlignment data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIStackViewDistributionBlock)(UIStackViewDistribution data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIStackViewPointerBlock)(__kindof UIStackView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUITableViewPointerBlock)(__kindof UITableView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUITextFieldPointerBlock)(__kindof UITextField *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUITextFieldViewModeBlock)(UITextFieldViewMode data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUITextModelPointerBlock)(UITextModel *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUITextViewPointerBlock)(__kindof UITextView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIViewModelPointerBlock)(UIViewModel *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByUIViewPointerBlock)(UIView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByURLBlock)(NSURL *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByWKScriptMessagePointerBlock)(WKScriptMessage *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByWKUserContentControllerPointerBlock)(WKUserContentController *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByWKWebViewPointerBlock)(__kindof WKWebView *_Nullable data);
typedef __kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(^JobsRetJobsAppDoorInputViewBaseStyleModelByZYTextFieldPointerBlock)(__kindof ZYTextField *_Nullable data);
/// JobsAppDoorModel
typedef __kindof JobsAppDoorModel *_Nullable(^JobsRetJobsAppDoorModelByStrBlock)(NSString *_Nullable data);
/// FileNameModel
typedef __kindof FileNameModel *_Nullable(^JobsRetFileNameModelByStrBlock)(NSString *_Nullable data);
/// IncomeSourceModel
typedef __kindof IncomeSourceModel *_Nullable(^JobsRetIncomeSourceModelByStrBlock)(NSString *_Nullable data);
/// JobsBaseModel
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByAppLanguageBlock)(AppLanguage data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByBOOLBlock)(BOOL data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByCADisplayLinkPointerBlock)(CADisplayLink *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByCGFloatBlock)(CGFloat data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByCGPointBlock)(CGPoint data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByCGSizeBlock)(CGSize data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByCJTextFieldPointerBlock)(__kindof CJTextField *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByClsBlock)(Class _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByComingStyleBlock)(ComingStyle data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByDateBlock)(NSDate *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByDispatch_queue_tBlock)(dispatch_queue_t _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByDispatch_semaphore_tBlock)(dispatch_semaphore_t _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByDispatch_source_tBlock)(dispatch_source_t _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByFrameBlock)(CGRect data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByHQTextFieldPointerBlock)(__kindof HQTextField *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByIDBlock)(id _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByIMPBlock)(IMP _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsByBtnBlockBlock)(jobsByBtnBlock _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsByCGFloatBlockBlock)(jobsByCGFloatBlock _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsByMASConstraintMakerBlockBlock)(jobsByMASConstraintMakerBlock _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsHeaderFooterViewStyleBlock)(JobsHeaderFooterViewStyle data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsJSCompletionHandlerBlockBlock)(jobsJSCompletionHandlerBlock _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsMagicTextFieldPointerBlock)(__kindof JobsMagicTextField *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsRetIDByIDBlockBlock)(JobsRetIDByIDBlock _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsTextFieldPointerBlock)(__kindof JobsTextField *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsTextViewPointerBlock)(__kindof JobsTextView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsTimerBlockBlock)(JobsTimerBlock _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsTimerPointerBlock)(JobsTimer *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsTimerStateBlock)(JobsTimerState data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsTimerStyleBlock)(JobsTimerStyle data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByJobsTimerTypeBlock)(JobsTimerType data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByKindofUIImageViewPointerBlock)(__kindof UIImageView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByKindofUIViewPointerBlock)(__kindof UIView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByMutableSetBlock)(NSMutableSet *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSAttributedStringPointerBlock)(NSAttributedString *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSDirectionalRectEdgeBlock)(NSDirectionalRectEdge data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSIndexPathPointerBlock)(NSIndexPath *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSInvocationPointerBlock)(NSInvocation *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSLockPointerBlock)(NSLock *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock)(NSMutableArray <JobsRetIDByIDBlock> *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock)(NSMutableArray <JobsRichTextConfig *> *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSMutableArrayKindofUIButtonModelPointerPointerBlock)(NSMutableArray <__kindof UIButtonModel *> *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSMutableArrayKindofUIViewModelPointerPointerBlock)(NSMutableArray <__kindof UIViewModel *> *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSMutableArrayMASConstraintPointerPointerBlock)(NSMutableArray <MASConstraint *> *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSMutableArrayNSURLPointerPointerBlock)(NSMutableArray <NSURL *> *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSMutableArrayPointerBlock)(NSMutableArray *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSMutableDictionaryPointerBlock)(NSMutableDictionary *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSRecursiveLockPointerBlock)(NSRecursiveLock *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSRunLoopModeBlock)(NSRunLoopMode data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSTimerPointerBlock)(NSTimer *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByPDFViewPointerBlock)(__kindof PDFView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelBySELBlock)(SEL _Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelBySZTextViewPointerBlock)(__kindof SZTextView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByShowTimeTypeBlock)(ShowTimeType data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIActionPointerBlock)(UIAction *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIActivityIndicatorViewPointerBlock)(__kindof UIActivityIndicatorView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIBackgroundConfigurationPointerBlock)(UIBackgroundConfiguration *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIButtonConfigurationTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIButtonModelPointerBlock)(UIButtonModel *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIButtonPointerBlock)(__kindof UIButton *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUICollectionViewPointerBlock)(__kindof UICollectionView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIControlContentHorizontalAlignmentBlock)(UIControlContentHorizontalAlignment data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIControlContentVerticalAlignmentBlock)(UIControlContentVerticalAlignment data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIImageViewPointerBlock)(UIImageView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUILabelPointerBlock)(__kindof UILabel *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUILabelShowingTypeBlock)(UILabelShowingType data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUILayoutConstraintAxisBlock)(UILayoutConstraintAxis data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIScrollViewPointerBlock)(__kindof UIScrollView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIStackViewAlignmentBlock)(UIStackViewAlignment data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIStackViewDistributionBlock)(UIStackViewDistribution data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIStackViewPointerBlock)(__kindof UIStackView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUITableViewPointerBlock)(__kindof UITableView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUITextFieldPointerBlock)(__kindof UITextField *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUITextFieldViewModeBlock)(UITextFieldViewMode data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUITextModelPointerBlock)(UITextModel *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUITextViewPointerBlock)(__kindof UITextView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIViewModelPointerBlock)(UIViewModel *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByUIViewPointerBlock)(UIView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByURLBlock)(NSURL *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByWKScriptMessagePointerBlock)(WKScriptMessage *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByWKUserContentControllerPointerBlock)(WKUserContentController *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByWKWebViewPointerBlock)(__kindof WKWebView *_Nullable data);
typedef __kindof JobsBaseModel *_Nullable(^JobsRetJobsBaseModelByZYTextFieldPointerBlock)(__kindof ZYTextField *_Nullable data);
typedef __kindof JobsCorModel *_Nullable(^JobsRetJobsCorModelByCGFloatBlock)(CGFloat data);
typedef __kindof JobsCorModel *_Nullable(^JobsRetJobsCorModelByStrBlock)(NSString *_Nullable data);
/// JobsCountriesModel
typedef __kindof JobsCountriesModel *_Nullable(^JobsRetJobsCountriesModelByStrBlock)(NSString *_Nullable data);
/// JobsDecorationModel
typedef __kindof JobsDecorationModel *_Nullable(^JobsRetJobsDecorationModelByClsBlock)(Class _Nullable data);
typedef __kindof JobsDecorationModel *_Nullable(^JobsRetJobsDecorationModelByIDBlock)(id _Nullable data);
typedef __kindof JobsDecorationModel *_Nullable(^JobsRetJobsDecorationModelByStrBlock)(NSString *_Nullable data);
/// JobsFileModel
typedef __kindof JobsFileModel *_Nullable(^JobsRetJobsFileModelByDataBlock)(NSData *_Nullable data);
typedef __kindof JobsFileModel *_Nullable(^JobsRetJobsFileModelByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsFileModel *_Nullable(^JobsRetJobsFileModelByStrBlock)(NSString *_Nullable data);
/// JobsGestureModel
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByAppLanguageBlock)(AppLanguage data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByBOOLBlock)(BOOL data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByCADisplayLinkPointerBlock)(CADisplayLink *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByCGFloatBlock)(CGFloat data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByCGPointBlock)(CGPoint data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByClsBlock)(Class _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByDateBlock)(NSDate *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByDispatch_queue_tBlock)(dispatch_queue_t _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByDispatch_semaphore_tBlock)(dispatch_semaphore_t _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByDispatch_source_tBlock)(dispatch_source_t _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByIDBlock)(id _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByIMPBlock)(IMP _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsByCGFloatBlockBlock)(jobsByCGFloatBlock _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsJSCompletionHandlerBlockBlock)(jobsJSCompletionHandlerBlock _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsSEL_IMPPointerBlock)(JobsSEL_IMP *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsTimerBlockBlock)(JobsTimerBlock _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsTimerPointerBlock)(JobsTimer *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsTimerStateBlock)(JobsTimerState data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsTimerStyleBlock)(JobsTimerStyle data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByJobsTimerTypeBlock)(JobsTimerType data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByMutableSetBlock)(NSMutableSet *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSInvocationPointerBlock)(NSInvocation *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSLockPointerBlock)(NSLock *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSMutableArrayNSURLPointerPointerBlock)(NSMutableArray <NSURL *> *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSMutableArrayPointerBlock)(NSMutableArray *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSMutableDictionaryPointerBlock)(NSMutableDictionary *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSRecursiveLockPointerBlock)(NSRecursiveLock *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSRunLoopModeBlock)(NSRunLoopMode data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSTimerPointerBlock)(NSTimer *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelBySELBlock)(SEL _Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByShowTimeTypeBlock)(ShowTimeType data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByUILongPressGestureRecognizerPointerBlock)(UILongPressGestureRecognizer *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByUIPanGestureRecognizerPointerBlock)(UIPanGestureRecognizer *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByUIPinchGestureRecognizerPointerBlock)(UIPinchGestureRecognizer *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByUIRotationGestureRecognizerPointerBlock)(UIRotationGestureRecognizer *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByUIScreenEdgePanGestureRecognizerPointerBlock)(UIScreenEdgePanGestureRecognizer *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByUIScrollTypeMaskBlock)(UIScrollTypeMask data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByUISwipeGestureRecognizerDirectionBlock)(UISwipeGestureRecognizerDirection data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByUISwipeGestureRecognizerPointerBlock)(UISwipeGestureRecognizer *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByUITapGestureRecognizerPointerBlock)(UITapGestureRecognizer *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByURLBlock)(NSURL *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByWKScriptMessagePointerBlock)(WKScriptMessage *_Nullable data);
typedef __kindof JobsGestureModel *_Nullable(^JobsRetJobsGestureModelByWKUserContentControllerPointerBlock)(WKUserContentController *_Nullable data);
/// JobsHeaderFooterViewModel
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByAppLanguageBlock)(AppLanguage data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByBOOLBlock)(BOOL data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByCADisplayLinkPointerBlock)(CADisplayLink *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByCGFloatBlock)(CGFloat data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByCGPointBlock)(CGPoint data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByCGSizeBlock)(CGSize data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByCJTextFieldPointerBlock)(__kindof CJTextField *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByClsBlock)(Class _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByComingStyleBlock)(ComingStyle data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByDateBlock)(NSDate *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByDispatch_queue_tBlock)(dispatch_queue_t _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByDispatch_semaphore_tBlock)(dispatch_semaphore_t _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByDispatch_source_tBlock)(dispatch_source_t _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByFrameBlock)(CGRect data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByHQTextFieldPointerBlock)(__kindof HQTextField *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByIDBlock)(id _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByIMPBlock)(IMP _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsByBtnBlockBlock)(jobsByBtnBlock _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsByCGFloatBlockBlock)(jobsByCGFloatBlock _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsByMASConstraintMakerBlockBlock)(jobsByMASConstraintMakerBlock _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsHeaderFooterViewStyleBlock)(JobsHeaderFooterViewStyle data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsJSCompletionHandlerBlockBlock)(jobsJSCompletionHandlerBlock _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsMagicTextFieldPointerBlock)(__kindof JobsMagicTextField *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsRetIDByIDBlockBlock)(JobsRetIDByIDBlock _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsTextFieldPointerBlock)(__kindof JobsTextField *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsTextViewPointerBlock)(__kindof JobsTextView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsTimerBlockBlock)(JobsTimerBlock _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsTimerPointerBlock)(JobsTimer *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsTimerStateBlock)(JobsTimerState data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsTimerStyleBlock)(JobsTimerStyle data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByJobsTimerTypeBlock)(JobsTimerType data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByKindofUIImageViewPointerBlock)(__kindof UIImageView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByKindofUIViewPointerBlock)(__kindof UIView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByMutableSetBlock)(NSMutableSet *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSAttributedStringPointerBlock)(NSAttributedString *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSDirectionalRectEdgeBlock)(NSDirectionalRectEdge data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSIndexPathPointerBlock)(NSIndexPath *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSInvocationPointerBlock)(NSInvocation *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSLockPointerBlock)(NSLock *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock)(NSMutableArray <JobsRetIDByIDBlock> *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock)(NSMutableArray <JobsRichTextConfig *> *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSMutableArrayKindofUIButtonModelPointerPointerBlock)(NSMutableArray <__kindof UIButtonModel *> *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSMutableArrayKindofUIViewModelPointerPointerBlock)(NSMutableArray <__kindof UIViewModel *> *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSMutableArrayMASConstraintPointerPointerBlock)(NSMutableArray <MASConstraint *> *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSMutableArrayNSURLPointerPointerBlock)(NSMutableArray <NSURL *> *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSMutableArrayPointerBlock)(NSMutableArray *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSMutableDictionaryPointerBlock)(NSMutableDictionary *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSRecursiveLockPointerBlock)(NSRecursiveLock *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSRunLoopModeBlock)(NSRunLoopMode data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSTimerPointerBlock)(NSTimer *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByPDFViewPointerBlock)(__kindof PDFView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelBySELBlock)(SEL _Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelBySZTextViewPointerBlock)(__kindof SZTextView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByShowTimeTypeBlock)(ShowTimeType data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIActionPointerBlock)(UIAction *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIActivityIndicatorViewPointerBlock)(__kindof UIActivityIndicatorView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIBackgroundConfigurationPointerBlock)(UIBackgroundConfiguration *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIButtonConfigurationTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIButtonModelPointerBlock)(UIButtonModel *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIButtonPointerBlock)(__kindof UIButton *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUICollectionViewPointerBlock)(__kindof UICollectionView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIControlContentHorizontalAlignmentBlock)(UIControlContentHorizontalAlignment data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIControlContentVerticalAlignmentBlock)(UIControlContentVerticalAlignment data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIImageViewPointerBlock)(UIImageView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUILabelPointerBlock)(__kindof UILabel *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUILabelShowingTypeBlock)(UILabelShowingType data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUILayoutConstraintAxisBlock)(UILayoutConstraintAxis data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIScrollViewPointerBlock)(__kindof UIScrollView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIStackViewAlignmentBlock)(UIStackViewAlignment data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIStackViewDistributionBlock)(UIStackViewDistribution data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIStackViewPointerBlock)(__kindof UIStackView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUITableViewPointerBlock)(__kindof UITableView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUITextFieldPointerBlock)(__kindof UITextField *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUITextFieldViewModeBlock)(UITextFieldViewMode data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUITextModelPointerBlock)(UITextModel *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUITextViewPointerBlock)(__kindof UITextView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIViewModelPointerBlock)(UIViewModel *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByUIViewPointerBlock)(UIView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByURLBlock)(NSURL *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByWKScriptMessagePointerBlock)(WKScriptMessage *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByWKUserContentControllerPointerBlock)(WKUserContentController *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByWKWebViewPointerBlock)(__kindof WKWebView *_Nullable data);
typedef __kindof JobsHeaderFooterViewModel *_Nullable(^JobsRetJobsHeaderFooterViewModelByZYTextFieldPointerBlock)(__kindof ZYTextField *_Nullable data);
/// JobsImageModel
typedef __kindof JobsImageModel *_Nullable(^JobsRetJobsImageModelByDicBlock)(NSDictionary *_Nullable data);
typedef __kindof JobsImageModel *_Nullable(^JobsRetJobsImageModelByImageBlock)(UIImage *_Nullable data);
/// JobsLocalNotificationModel
typedef __kindof JobsLocalNotificationModel *_Nullable(^JobsRetJobsLocalNotificationModelByBOOLBlock)(BOOL data);
typedef __kindof JobsLocalNotificationModel *_Nullable(^JobsRetJobsLocalNotificationModelByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsLocalNotificationModel *_Nullable(^JobsRetJobsLocalNotificationModelByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof JobsLocalNotificationModel *_Nullable(^JobsRetJobsLocalNotificationModelByUNNotificationSoundPointerBlock)(UNNotificationSound *_Nullable data);
/// JobsLocationModel
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByBOOLBlock)(BOOL data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByCGFloatBlock)(CGFloat data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByCGPointBlock)(CGPoint data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByCGSizeBlock)(CGSize data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByCJTextFieldPointerBlock)(__kindof CJTextField *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByComingStyleBlock)(ComingStyle data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByFrameBlock)(CGRect data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByHQTextFieldPointerBlock)(__kindof HQTextField *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByJobsByBtnBlockBlock)(jobsByBtnBlock _Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByJobsByMASConstraintMakerBlockBlock)(jobsByMASConstraintMakerBlock _Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByJobsHeaderFooterViewStyleBlock)(JobsHeaderFooterViewStyle data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByJobsMagicTextFieldPointerBlock)(__kindof JobsMagicTextField *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByJobsRetIDByIDBlockBlock)(JobsRetIDByIDBlock _Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByJobsTextFieldPointerBlock)(__kindof JobsTextField *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByJobsTextViewPointerBlock)(__kindof JobsTextView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByKindofUIImageViewPointerBlock)(__kindof UIImageView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByKindofUIViewPointerBlock)(__kindof UIView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByMutableDicBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSAttributedStringPointerBlock)(NSAttributedString *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSDirectionalRectEdgeBlock)(NSDirectionalRectEdge data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSIndexPathPointerBlock)(NSIndexPath *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock)(NSMutableArray <JobsRetIDByIDBlock> *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSMutableArrayMASConstraintPointerPointerBlock)(NSMutableArray <MASConstraint *> *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByPDFViewPointerBlock)(__kindof PDFView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelBySZTextViewPointerBlock)(__kindof SZTextView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIActionPointerBlock)(UIAction *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIActivityIndicatorViewPointerBlock)(__kindof UIActivityIndicatorView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIBackgroundConfigurationPointerBlock)(UIBackgroundConfiguration *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIButtonConfigurationTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIButtonPointerBlock)(__kindof UIButton *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUICollectionViewPointerBlock)(__kindof UICollectionView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIControlContentHorizontalAlignmentBlock)(UIControlContentHorizontalAlignment data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIControlContentVerticalAlignmentBlock)(UIControlContentVerticalAlignment data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIImageViewPointerBlock)(UIImageView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUILabelPointerBlock)(__kindof UILabel *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUILabelShowingTypeBlock)(UILabelShowingType data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUILayoutConstraintAxisBlock)(UILayoutConstraintAxis data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIScrollViewPointerBlock)(__kindof UIScrollView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIStackViewAlignmentBlock)(UIStackViewAlignment data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIStackViewDistributionBlock)(UIStackViewDistribution data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIStackViewPointerBlock)(__kindof UIStackView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUITableViewPointerBlock)(__kindof UITableView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUITextFieldPointerBlock)(__kindof UITextField *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUITextFieldViewModeBlock)(UITextFieldViewMode data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUITextViewPointerBlock)(__kindof UITextView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByUIViewPointerBlock)(UIView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByURLBlock)(NSURL *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByWKWebViewPointerBlock)(__kindof WKWebView *_Nullable data);
typedef __kindof JobsLocationModel *_Nullable(^JobsRetJobsLocationModelByZYTextFieldPointerBlock)(__kindof ZYTextField *_Nullable data);
/// JobsNetworkSource
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByAppLanguageBlock)(AppLanguage data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByBOOLBlock)(BOOL data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByCADisplayLinkPointerBlock)(CADisplayLink *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByCGFloatBlock)(CGFloat data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByCGPointBlock)(CGPoint data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByClsBlock)(Class _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByDateBlock)(NSDate *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByDispatch_queue_tBlock)(dispatch_queue_t _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByDispatch_semaphore_tBlock)(dispatch_semaphore_t _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByDispatch_source_tBlock)(dispatch_source_t _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByIDBlock)(id _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByIMPBlock)(IMP _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsByCGFloatBlockBlock)(jobsByCGFloatBlock _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsJSCompletionHandlerBlockBlock)(jobsJSCompletionHandlerBlock _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsNetworkSourceTypeBlock)(JobsNetworkSourceType data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsTimerBlockBlock)(JobsTimerBlock _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsTimerPointerBlock)(JobsTimer *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsTimerStateBlock)(JobsTimerState data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsTimerStyleBlock)(JobsTimerStyle data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByJobsTimerTypeBlock)(JobsTimerType data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByMutableSetBlock)(NSMutableSet *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSInvocationPointerBlock)(NSInvocation *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSLockPointerBlock)(NSLock *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSMutableArrayNSURLPointerPointerBlock)(NSMutableArray <NSURL *> *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSMutableArrayPointerBlock)(NSMutableArray *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSMutableDictionaryPointerBlock)(NSMutableDictionary *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSRecursiveLockPointerBlock)(NSRecursiveLock *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSRunLoopModeBlock)(NSRunLoopMode data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSTimerPointerBlock)(NSTimer *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByNSUIntegerBlock)(NSUInteger data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceBySELBlock)(SEL _Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByShowTimeTypeBlock)(ShowTimeType data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByURLBlock)(NSURL *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByWKScriptMessagePointerBlock)(WKScriptMessage *_Nullable data);
typedef __kindof JobsNetworkSource *_Nullable(^JobsRetJobsNetworkSourceByWKUserContentControllerPointerBlock)(WKUserContentController *_Nullable data);
/// JobsParagraphStyleModel
typedef __kindof JobsParagraphStyleModel *_Nullable(^JobsRetJobsParagraphStyleModelByIDBlock)(id _Nullable data);
typedef __kindof JobsParagraphStyleModel *_Nullable(^JobsRetJobsParagraphStyleModelByNSRangeBlock)(NSRange data);
/// JobsResponseModel
typedef __kindof JobsResponseModel *_Nullable(^JobsRetJobsResponseModelByHTTPResponseCodeBlock)(HTTPResponseCode data);
typedef __kindof JobsResponseModel *_Nullable(^JobsRetJobsResponseModelByIDBlock)(id _Nullable data);
typedef __kindof JobsResponseModel *_Nullable(^JobsRetJobsResponseModelByStrBlock)(NSString *_Nullable data);
/// JobsRichTextConfig
typedef __kindof JobsRichTextConfig *_Nullable(^JobsRetJobsRichTextConfigByCorBlock)(UIColor *_Nullable data);
typedef __kindof JobsRichTextConfig *_Nullable(^JobsRetJobsRichTextConfigByFontBlock)(UIFont *_Nullable data);
typedef __kindof JobsRichTextConfig *_Nullable(^JobsRetJobsRichTextConfigByNSMutableParagraphStylePointerBlock)(NSMutableParagraphStyle *_Nullable data);
typedef __kindof JobsRichTextConfig *_Nullable(^JobsRetJobsRichTextConfigByNSRangeBlock)(NSRange data);
typedef __kindof JobsRichTextConfig *_Nullable(^JobsRetJobsRichTextConfigByNSUnderlineStyleBlock)(NSUnderlineStyle data);
typedef __kindof JobsRichTextConfig *_Nullable(^JobsRetJobsRichTextConfigByStrBlock)(NSString *_Nullable data);
/// JobsTimeModel
typedef __kindof JobsTimeModel *_Nullable(^JobsRetJobsTimeModelByCGFloatBlock)(CGFloat data);
typedef __kindof JobsTimeModel *_Nullable(^JobsRetJobsTimeModelByDateBlock)(NSDate *_Nullable data);
typedef __kindof JobsTimeModel *_Nullable(^JobsRetJobsTimeModelByNSDateFormatterPointerBlock)(NSDateFormatter *_Nullable data);
typedef __kindof JobsTimeModel *_Nullable(^JobsRetJobsTimeModelByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsTimeModel *_Nullable(^JobsRetJobsTimeModelByNSTimeZonePointerBlock)(NSTimeZone *_Nullable data);
typedef __kindof JobsTimeModel *_Nullable(^JobsRetJobsTimeModelByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsTimeModel *_Nullable(^JobsRetJobsTimeModelByTimeIntervalBlock)(NSTimeInterval data);
/// JobsUserModel
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByAppLanguageBlock)(AppLanguage data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByBOOLBlock)(BOOL data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByCADisplayLinkPointerBlock)(CADisplayLink *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByCGFloatBlock)(CGFloat data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByCGPointBlock)(CGPoint data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByClsBlock)(Class _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByDateBlock)(NSDate *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByDispatch_queue_tBlock)(dispatch_queue_t _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByDispatch_semaphore_tBlock)(dispatch_semaphore_t _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByDispatch_source_tBlock)(dispatch_source_t _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByIDBlock)(id _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByIMPBlock)(IMP _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByJobsByCGFloatBlockBlock)(jobsByCGFloatBlock _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByJobsJSCompletionHandlerBlockBlock)(jobsJSCompletionHandlerBlock _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByJobsTimerBlockBlock)(JobsTimerBlock _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByJobsTimerPointerBlock)(JobsTimer *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByJobsTimerStateBlock)(JobsTimerState data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByJobsTimerStyleBlock)(JobsTimerStyle data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByJobsTimerTypeBlock)(JobsTimerType data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByMutableSetBlock)(NSMutableSet *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSInvocationPointerBlock)(NSInvocation *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSLockPointerBlock)(NSLock *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSMutableArrayNSURLPointerPointerBlock)(NSMutableArray <NSURL *> *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSMutableArrayPointerBlock)(NSMutableArray *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSMutableDictionaryPointerBlock)(NSMutableDictionary *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSRecursiveLockPointerBlock)(NSRecursiveLock *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSRunLoopModeBlock)(NSRunLoopMode data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSTimerPointerBlock)(NSTimer *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelBySELBlock)(SEL _Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByShowTimeTypeBlock)(ShowTimeType data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByStrBlock)(NSString *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByURLBlock)(NSURL *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByWKScriptMessagePointerBlock)(WKScriptMessage *_Nullable data);
typedef __kindof JobsUserModel *_Nullable(^JobsRetJobsUserModelByWKUserContentControllerPointerBlock)(WKUserContentController *_Nullable data);
/// MJRefreshConfigModel
typedef __kindof MJRefreshConfigModel *_Nullable(^JobsRetMJRefreshConfigModelByBOOLBlock)(BOOL data);
typedef __kindof MJRefreshConfigModel *_Nullable(^JobsRetMJRefreshConfigModelByCGFloatBlock)(CGFloat data);
typedef __kindof MJRefreshConfigModel *_Nullable(^JobsRetMJRefreshConfigModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof MJRefreshConfigModel *_Nullable(^JobsRetMJRefreshConfigModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof MJRefreshConfigModel *_Nullable(^JobsRetMJRefreshConfigModelByJobsRetIDByIDBlockBlock)(JobsRetIDByIDBlock _Nullable data);
typedef __kindof MJRefreshConfigModel *_Nullable(^JobsRetMJRefreshConfigModelByMutableArrayBlock)(NSMutableArray <UIImage *> *_Nullable data);
typedef __kindof MJRefreshConfigModel *_Nullable(^JobsRetMJRefreshConfigModelByStrBlock)(NSString *_Nullable data);
/// MasonryModel
typedef __kindof MasonryModel *_Nullable(^JobsRetMasonryModelByBOOLBlock)(BOOL data);
typedef __kindof MasonryModel *_Nullable(^JobsRetMasonryModelByCGFloatBlock)(CGFloat data);
typedef __kindof MasonryModel *_Nullable(^JobsRetMasonryModelByUIViewPointerBlock)(__kindof UIView *_Nullable data);
/// NSNotificationKeyboardModel
typedef __kindof NSNotificationKeyboardModel *_Nullable(^JobsRetNSNotificationKeyboardModelByCGFloatBlock)(CGFloat data);
typedef __kindof NSNotificationKeyboardModel *_Nullable(^JobsRetNSNotificationKeyboardModelByDicBlock)(NSDictionary *_Nullable data);
typedef __kindof NSNotificationKeyboardModel *_Nullable(^JobsRetNSNotificationKeyboardModelByFrameBlock)(CGRect data);
typedef __kindof NSNotificationKeyboardModel *_Nullable(^JobsRetNSNotificationKeyboardModelByIDBlock)(id _Nullable data);
typedef __kindof NSNotificationKeyboardModel *_Nullable(^JobsRetNSNotificationKeyboardModelByStrBlock)(NSString *_Nullable data);
/// NotificationModel
typedef __kindof NotificationModel *_Nullable(^JobsRetNotificationModelByDicBlock)(NSDictionary *_Nullable data);
typedef __kindof NotificationModel *_Nullable(^JobsRetNotificationModelByIDBlock)(id _Nullable data);
typedef __kindof NotificationModel *_Nullable(^JobsRetNotificationModelByStrBlock)(NSString *_Nullable data);
/// PhilippinesIDTypeModel
typedef __kindof PhilippinesIDTypeModel *_Nullable(^JobsRetPhilippinesIDTypeModelByNSIntegerBlock)(NSInteger data);
typedef __kindof PhilippinesIDTypeModel *_Nullable(^JobsRetPhilippinesIDTypeModelByStrBlock)(NSString *_Nullable data);
/// PhilippinesModel
typedef __kindof PhilippinesModel *_Nullable(^JobsRetPhilippinesModelByNSIntegerBlock)(NSInteger data);
typedef __kindof PhilippinesModel *_Nullable(^JobsRetPhilippinesModelByStrBlock)(NSString *_Nullable data);
/// RACModel
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByMutableDicBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof RACModel *_Nullable(^JobsRetRACModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
/// SDWebImageModel
typedef __kindof SDWebImageModel *_Nullable(^JobsRetSDWebImageModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof SDWebImageModel *_Nullable(^JobsRetSDWebImageModelByURLBlock)(NSURL *_Nullable data);
/// SPAlertControllerConfig
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByBOOLBlock)(BOOL data);
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByIDBlock)(id _Nullable data);
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByNSArrayNSMutableArrayPointerPointerBlock)(NSArray <NSMutableArray *> *_Nullable data);
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByNSArrayNSNumberPointerPointerBlock)(NSArray <NSNumber *> *_Nullable data);
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByNSArrayNSStringPointerPointerBlock)(NSArray <NSString *> *_Nullable data);
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByNSObject_SPAlertControllerInitTypeBlock)(NSObject_SPAlertControllerInitType data);
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByNSIntegerBlock)(NSInteger data);
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByStrBlock)(NSString *_Nullable data);
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
typedef __kindof SPAlertControllerConfig *_Nullable(^JobsRetSPAlertControllerConfigByUIViewPointerBlock)(UIView *_Nullable data);
typedef __kindof SYSAlertControllerConfig *_Nullable(^JobsRetSYSAlertControllerConfigByBOOLBlock)(BOOL data);
typedef __kindof SYSAlertControllerConfig *_Nullable(^JobsRetSYSAlertControllerConfigByIDBlock)(id _Nullable data);
typedef __kindof SYSAlertControllerConfig *_Nullable(^JobsRetSYSAlertControllerConfigByNSArrayNSStringPointerPointerBlock)(NSArray <NSString *> *_Nullable data);
typedef __kindof SYSAlertControllerConfig *_Nullable(^JobsRetSYSAlertControllerConfigByNSArrayPointerBlock)(NSArray *_Nullable data);
typedef __kindof SYSAlertControllerConfig *_Nullable(^JobsRetSYSAlertControllerConfigByStrBlock)(NSString *_Nullable data);
typedef __kindof SYSAlertControllerConfig *_Nullable(^JobsRetSYSAlertControllerConfigByUIControlPointerBlock)(UIControl *_Nullable data);
typedef __kindof SYSAlertControllerConfig *_Nullable(^JobsRetSYSAlertControllerConfigByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
/// UIButtonModel
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByAppLanguageBlock)(AppLanguage data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByBOOLBlock)(BOOL data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByCADisplayLinkPointerBlock)(CADisplayLink *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByCGFloatBlock)(CGFloat data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByCGPointBlock)(CGPoint data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByCGSizeBlock)(CGSize data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByClsBlock)(Class _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByComingStyleBlock)(ComingStyle data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByDateBlock)(NSDate *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByDispatch_queue_tBlock)(dispatch_queue_t _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByDispatch_semaphore_tBlock)(dispatch_semaphore_t _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByDispatch_source_tBlock)(dispatch_source_t _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByFrameBlock)(CGRect data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByIDBlock)(id _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByIMPBlock)(IMP _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsByBtnBlockBlock)(jobsByBtnBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsByCGFloatBlockBlock)(jobsByCGFloatBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsByMASConstraintMakerBlockBlock)(jobsByMASConstraintMakerBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsJSCompletionHandlerBlockBlock)(jobsJSCompletionHandlerBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsRetIDByIDBlockBlock)(JobsRetIDByIDBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsRetRACDisposableByRetIDByIDBlocksBlock)(JobsRetRACDisposableByRetIDByIDBlocks data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsTimerBlockBlock)(JobsTimerBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsTimerPointerBlock)(JobsTimer *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsTimerStateBlock)(JobsTimerState data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsTimerStyleBlock)(JobsTimerStyle data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsTimerTypeBlock)(JobsTimerType data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByKindofUIViewPointerBlock)(__kindof UIView *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByMutableSetBlock)(NSMutableSet *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSArrayNSAttributedStringPointerPointerBlock)(NSArray <NSAttributedString *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSArrayNSNumberPointerPointerBlock)(NSArray <NSNumber *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSArrayNSStringPointerPointerBlock)(NSArray <NSString *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSArrayUIColorPointerPointerBlock)(NSArray <UIColor *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSArrayUIFontPointerPointerBlock)(NSArray <UIFont *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSArrayUIImagePointerPointerBlock)(NSArray <UIImage *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSAttributedStringPointerBlock)(NSAttributedString *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSDirectionalRectEdgeBlock)(NSDirectionalRectEdge data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSIndexPathPointerBlock)(NSIndexPath *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSIntegerBlock)(NSInteger data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSInvocationPointerBlock)(NSInvocation *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSLockPointerBlock)(NSLock *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock)(NSMutableArray <JobsRetIDByIDBlock> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock)(NSMutableArray <JobsRichTextConfig *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSMutableArrayKindofUIButtonModelPointerPointerBlock)(NSMutableArray <__kindof UIButtonModel *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSMutableArrayKindofUIViewModelPointerPointerBlock)(NSMutableArray <__kindof UIViewModel *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSMutableArrayNSURLPointerPointerBlock)(NSMutableArray <NSURL *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSMutableArrayPointerBlock)(NSMutableArray *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSMutableDictionaryPointerBlock)(NSMutableDictionary *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSRecursiveLockPointerBlock)(NSRecursiveLock *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSRunLoopModeBlock)(NSRunLoopMode data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSTimerPointerBlock)(NSTimer *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelBySELBlock)(SEL _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByShowTimeTypeBlock)(ShowTimeType data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByStrBlock)(NSString *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIActionPointerBlock)(UIAction *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIBackgroundConfigurationPointerBlock)(UIBackgroundConfiguration *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIButtonConfigurationTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsByButtonModelBlockBlock)(jobsByButtonModelBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsByTextModelBlockBlock)(jobsByTextModelBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByJobsByViewModelBlockBlock)(jobsByViewModelBlock _Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIButtonModelPointerBlock)(UIButtonModel *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIButtonPointerBlock)(__kindof UIButton *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIControlContentHorizontalAlignmentBlock)(UIControlContentHorizontalAlignment data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIControlContentVerticalAlignmentBlock)(UIControlContentVerticalAlignment data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIImageViewPointerBlock)(UIImageView *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUILabelShowingTypeBlock)(UILabelShowingType data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUILayoutConstraintAxisBlock)(UILayoutConstraintAxis data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIStackViewAlignmentBlock)(UIStackViewAlignment data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIStackViewDistributionBlock)(UIStackViewDistribution data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUITextFieldViewModeBlock)(UITextFieldViewMode data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUITextModelPointerBlock)(UITextModel *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIViewModelPointerBlock)(UIViewModel *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByUIViewPointerBlock)(UIView *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByURLBlock)(NSURL *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByWKScriptMessagePointerBlock)(WKScriptMessage *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsRetUIButtonModelByWKUserContentControllerPointerBlock)(WKUserContentController *_Nullable data);
/// UITextFieldModel
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByBOOLBlock)(BOOL data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByCGFloatBlock)(CGFloat data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByFrameBlock)(CGRect data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByNSAttributedStringPointerBlock)(NSAttributedString *_Nullable data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByNSTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByStrBlock)(NSString *_Nullable data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByUIKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByUIKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByUIReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByUITextFieldViewModeBlock)(UITextFieldViewMode data);
typedef __kindof UITextFieldModel *_Nullable(^JobsRetUITextFieldModelByUIViewPointerBlock)(__kindof UIView *_Nullable data);
/// UITextModel
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByBOOLBlock)(BOOL data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByComingStyleBlock)(ComingStyle data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByCGFloatBlock)(CGFloat data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByCGPointBlock)(CGPoint data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByCGSizeBlock)(CGSize data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByFrameBlock)(CGRect data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByJobsByBtnBlockBlock)(jobsByBtnBlock _Nullable data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByJobsRetIDByIDBlockBlock)(JobsRetIDByIDBlock _Nullable data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByNSAttributedStringPointerBlock)(NSAttributedString *_Nullable data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByNSDirectionalRectEdgeBlock)(NSDirectionalRectEdge data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByNSIntegerBlock)(NSInteger data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByNSLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByNSTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByStrBlock)(NSString *_Nullable data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByUIActionPointerBlock)(UIAction *_Nullable data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByUILabelShowingTypeBlock)(UILabelShowingType data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByUILayoutConstraintAxisBlock)(UILayoutConstraintAxis data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByUIStackViewAlignmentBlock)(UIStackViewAlignment data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByUIStackViewDistributionBlock)(UIStackViewDistribution data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
typedef __kindof UITextModel *_Nullable(^JobsRetUITextModelByUIViewPointerBlock)(UIView *_Nullable data);
/// UIViewModel
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByAppLanguageBlock)(AppLanguage data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByComingStyleBlock)(ComingStyle data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsTimerStateBlock)(JobsTimerState data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsTimerStyleBlock)(JobsTimerStyle data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsTimerTypeBlock)(JobsTimerType data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByShowTimeTypeBlock)(ShowTimeType data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsHeaderFooterViewStyleBlock)(JobsHeaderFooterViewStyle data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUILabelShowingTypeBlock)(UILabelShowingType data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByBOOLBlock)(BOOL data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSIntegerBlock)(NSInteger data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUITextFieldViewModeBlock)(UITextFieldViewMode data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByCGFloatBlock)(CGFloat data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByCGPointBlock)(CGPoint data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByCGSizeBlock)(CGSize data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByFrameBlock)(CGRect data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSRunLoopModeBlock)(NSRunLoopMode data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUILayoutConstraintAxisBlock)(UILayoutConstraintAxis data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIButtonConfigurationTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIControlContentHorizontalAlignmentBlock)(UIControlContentHorizontalAlignment data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIControlContentVerticalAlignmentBlock)(UIControlContentVerticalAlignment data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSDirectionalRectEdgeBlock)(NSDirectionalRectEdge data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByDispatch_queue_tBlock)(dispatch_queue_t _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByDispatch_semaphore_tBlock)(dispatch_semaphore_t _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByDispatch_source_tBlock)(dispatch_source_t _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByClsBlock)(Class _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByIMPBlock)(IMP _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelBySELBlock)(SEL _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByIDBlock)(id _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByFontBlock)(UIFont *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByImageBlock)(UIImage *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByCorBlock)(UIColor *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByDateBlock)(NSDate *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByCADisplayLinkPointerBlock)(CADisplayLink *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByMutableSetBlock)(NSMutableSet *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSAttributedStringPointerBlock)(NSAttributedString *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSIndexPathPointerBlock)(NSIndexPath *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSInvocationPointerBlock)(NSInvocation *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSLockPointerBlock)(NSLock *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSMutableArrayPointerBlock)(NSMutableArray *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock)(NSMutableArray <JobsRetIDByIDBlock> *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock)(NSMutableArray <JobsRichTextConfig *> *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSMutableArrayKindofUIButtonModelPointerPointerBlock)(NSMutableArray <__kindof UIButtonModel *> *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSMutableArrayKindofUIViewModelPointerPointerBlock)(NSMutableArray <__kindof UIViewModel *> *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSMutableArrayMASConstraintPointerPointerBlock)(NSMutableArray <MASConstraint *> *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSMutableArrayNSURLPointerPointerBlock)(NSMutableArray <NSURL *> *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSMutableDictionaryPointerBlock)(NSMutableDictionary *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSRecursiveLockPointerBlock)(NSRecursiveLock *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNSTimerPointerBlock)(NSTimer *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsTimerPointerBlock)(JobsTimer *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByPDFViewPointerBlock)(__kindof PDFView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByRACCommandPointerBlock)(RACCommand *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByRACDisposablePointerBlock)(RACDisposable *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByRACMulticastConnectionPointerBlock)(RACMulticastConnection *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByRACSchedulerPointerBlock)(RACScheduler *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByRACSequencePointerBlock)(RACSequence *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByRACSignalPointerBlock)(RACSignal *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByRACSubjectPointerBlock)(RACSubject *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByRACTuplePointerBlock)(RACTuple *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsMagicTextFieldPointerBlock)(__kindof JobsMagicTextField *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsTextFieldPointerBlock)(__kindof JobsTextField *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsTextViewPointerBlock)(__kindof JobsTextView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelBySZTextViewPointerBlock)(__kindof SZTextView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByHQTextFieldPointerBlock)(__kindof HQTextField *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByCJTextFieldPointerBlock)(__kindof CJTextField *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByZYTextFieldPointerBlock)(__kindof ZYTextField *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByStrBlock)(NSString *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIActionPointerBlock)(UIAction *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIActivityIndicatorViewPointerBlock)(__kindof UIActivityIndicatorView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIBackgroundConfigurationPointerBlock)(UIBackgroundConfiguration *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetViewModelByViewBlock)(__kindof UIView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByKindofUIImageViewPointerBlock)(__kindof UIImageView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIButtonPointerBlock)(__kindof UIButton *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUICollectionViewPointerBlock)(__kindof UICollectionView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIImageViewPointerBlock)(UIImageView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUILabelPointerBlock)(__kindof UILabel *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIScrollViewPointerBlock)(__kindof UIScrollView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIStackViewAlignmentBlock)(UIStackViewAlignment data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIStackViewDistributionBlock)(UIStackViewDistribution data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIStackViewPointerBlock)(__kindof UIStackView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUITableViewPointerBlock)(__kindof UITableView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUITextFieldPointerBlock)(__kindof UITextField *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUITextViewPointerBlock)(__kindof UITextView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIViewControllerPointerBlock)(UIViewController *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByURLBlock)(NSURL *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByWKScriptMessagePointerBlock)(WKScriptMessage *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByWKUserContentControllerPointerBlock)(WKUserContentController *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByWKWebViewPointerBlock)(__kindof WKWebView *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIViewModelPointerBlock)(UIViewModel *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUIButtonModelPointerBlock)(UIButtonModel *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByUITextModelPointerBlock)(UITextModel *_Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsByBtnBlockBlock)(jobsByBtnBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsByCGFloatBlockBlock)(jobsByCGFloatBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsTimerBlockBlock)(JobsTimerBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsByIDBlockBlock)(jobsByIDBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsByMASConstraintMakerBlockBlock)(jobsByMASConstraintMakerBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsByVoidBlockBlock)(jobsByVoidBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsJSCompletionHandlerBlockBlock)(jobsJSCompletionHandlerBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsRetIDByIDBlockBlock)(JobsRetIDByIDBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsByButtonModelBlockBlock)(jobsByButtonModelBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsByTextModelBlockBlock)(jobsByTextModelBlock _Nullable data);
typedef __kindof UIViewModel *_Nullable(^JobsRetUIViewModelByJobsByViewModelBlockBlock)(jobsByViewModelBlock _Nullable data);
/// UserDefaultModel
typedef __kindof UserDefaultModel *_Nullable(^JobsRetUserDefaultModelByBOOLBlock)(BOOL data);
typedef __kindof UserDefaultModel *_Nullable(^JobsRetUserDefaultModelByCGFloatBlock)(CGFloat data);
typedef __kindof UserDefaultModel *_Nullable(^JobsRetUserDefaultModelByFloatBlock)(float data);
typedef __kindof UserDefaultModel *_Nullable(^JobsRetUserDefaultModelByIntBlock)(int data);
typedef __kindof UserDefaultModel *_Nullable(^JobsRetUserDefaultModelByNSIntegerBlock)(NSInteger data);
typedef __kindof UserDefaultModel *_Nullable(^JobsRetUserDefaultModelByNSObjectPointerBlock)(__kindof NSObject <NSCoding> *_Nullable data);
typedef __kindof UserDefaultModel *_Nullable(^JobsRetUserDefaultModelByStrBlock)(NSString *_Nullable data);
/// UNNotificationRequestModel
typedef __kindof UNNotificationRequestModel *_Nullable(^JobsRetUNNotificationRequestModelByStrBlock)(NSString *_Nullable data);
typedef __kindof UNNotificationRequestModel *_Nullable(^JobsRetUNNotificationRequestModelByUNNotificationContentPointerBlock)(UNNotificationContent *_Nullable data);
typedef __kindof UNNotificationRequestModel *_Nullable(^JobsRetUNNotificationRequestModelByUNNotificationTriggerPointerBlock)(UNNotificationTrigger *_Nullable data);
/// URLManagerModel
typedef __kindof URLManagerModel *_Nullable(^JobsRetURLManagerModelByStrBlock)(NSString *_Nullable data);
#endif /* JobsBlock_h */
/*
    不定参数Block【 使用示例】
    [self GettingPicBlock:^(id firstArg, ...)NS_REQUIRES_NIL_TERMINATION{
        @jobs_strongify(self)
        if (firstArg) {
            // 取出第一个参数
            JobsLog(@"%@", firstArg);
            // 定义一个指向个数可变的参数列表指针；
            va_list args;
            // 用于存放取出的参数
            id arg = nil;
            // 初始化变量刚定义的va_list变量，这个宏的第二个参数是第一个可变参数的前一个参数，是一个固定的参数
            va_start(args, firstArg);
            // 遍历全部参数 va_arg返回可变的参数(a_arg的第二个参数是你要返回的参数的类型)
            if ([firstArg isKindOfClass:NSNumber.class]) {
                NSNumber *num = (NSNumber *)firstArg;
                for (int i = 0; i < num.intValue; i++) {
                    arg = va_arg(args, id);
    //                    JobsLog(@"KKK = %@", arg);
                    if ([arg isKindOfClass:UIImage.class]) {
                        JobsLog(@"");
                    }else if ([arg isKindOfClass:PHAsset.class]){
                        JobsLog(@"");
                    }else if ([arg isKindOfClass:NSString.class]){
                        JobsLog(@"");
                    }else if ([arg isKindOfClass:NSArray.class]){
                        JobsLog(@"");
                    }else{
                        JobsLog(@"");
                    }
                }
            }else{
                JobsLog(@"");
            }
            // 清空参数列表，并置参数指针args无效
            va_end(args);
        }
    }];
*/

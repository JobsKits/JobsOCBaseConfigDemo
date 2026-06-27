//
//  ReturnByCertainParametersBlock.h
//  JobsBlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>               // 提供 Core Animation / CALayer / CAMetalLayer 等 DSL block 类型。
#import <Photos/Photos.h>                       // 提供系统相册访问能力，可读取和管理照片、视频等媒体资源。
#import <UserNotifications/UserNotifications.h> // 提供本地通知和远程通知处理能力，是现代通知框架的统一入口。
#import <PDFKit/PDFKit.h>                       // 提供 PDF 文档的读取、渲染、标注和交互能力。
#import <JavaScriptCore/JavaScriptCore.h>       // 提供 Objective-C / Swift 与 JavaScript 交互能力，可执行脚本并进行对象桥接。
#import <JobsBlock/JobsBlockDef.h>
#import <JobsBlock/JobsBlockHeader.h>
#import <JobsBlock/VoidByCertainParametersBlock.h>

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#ifndef ReturnByCertainParameters_h
#define ReturnByCertainParameters_h
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
///【 确定入参个数 并且 有返回值的Block定义】
#pragma mark —— 关于数据类型
/// NSInteger
typedef NSInteger(^JobsRetNSIntegerByVoidBlock)(void);
typedef NSInteger(^JobsRetByNSIntegerBlock)(NSInteger data);
typedef NSInteger(^JobsRetNSIntegerByIDBlock)(id _Nullable data);
typedef NSInteger(^JobsRetNSIntegerByStrBlock)(NSString *_Nullable data);
typedef NSInteger(^JobsRetNSIntegerByPointBlock)(CGPoint data);
typedef NSInteger(^JobsRetIntegerByDateBlock)(NSDate *_Nullable data);
typedef NSInteger(^JobsRetFSCalendarCalculatorByMonthPositionForIndexPathBlock)(NSIndexPath *_Nullable data);
typedef NSInteger(^jobsCollectionViewNumberOfSectionsBlock)(Jobs_CollectionView_Target_CollectionView_Arguments);
typedef NSInteger(^jobsCollectionViewNumberOfItemsInSectionBlock)(Jobs_CollectionView_Target_CollectionView_Section_Arguments);
typedef NSInteger(^jobsTableViewNumberOfSectionsBlock)(Jobs_TableView_Target_TableView_Arguments);
typedef NSInteger(^jobsTableViewNumberOfRowsInSectionBlock)(Jobs_TableView_Target_TableView_Section_Arguments);
/// NSUInteger
typedef NSUInteger(^JobsRetNSUIntegerByVoidBlock)(void);
typedef NSUInteger(^JobsRetByNSUIntegerBlock)(NSUInteger data);
typedef NSUInteger(^JobsRetNSUIntegerByIDBlock)(id _Nullable data);
/// CGFloat
typedef CGFloat(^JobsRetCGFloatByVoidBlock)(void);
typedef CGFloat(^JobsRetCGFloatByCGFloatBlock)(CGFloat data);
typedef CGFloat(^JobsRetCGFloatByDoubleBlock)(double data);
typedef CGFloat(^JobsRetByCGPointBlock)(CGPoint data);
typedef CGFloat(^JobsRetCGFloatByViewBlock)(UIView *_Nullable view);
typedef CGFloat(^JobsRetCGFloatByIDBlock)(id _Nullable data);
typedef CGFloat(^JobsRetCGFloatByArrBlock)(NSMutableArray <__kindof NSObject *>*_Nullable data);
typedef CGFloat(^JobsRetCGFloatByFontBlock)(UIFont *_Nullable font);
typedef CGFloat(^JobsRetCGFloatByNumberBlock)(NSNumber *_Nullable data);
/// BOOL
typedef BOOL(^JobsRetBOOLByVoidBlock)(void);
typedef BOOL(^JobsRetBOOLByCGFloatBlock)(CGFloat data);
typedef BOOL(^JobsRetBOOLByBOOLBlock)(BOOL data);
typedef BOOL(^JobsRetBOOLByNSUIntegerBlock)(NSUInteger data);
typedef BOOL(^JobsRetBOOLByNSIntegerBlock)(NSInteger data);
typedef BOOL(^JobsRetBOOLBySizeBlock)(CGSize size);
typedef BOOL(^JobsRetBOOLByPointBlock)(CGPoint point);
typedef BOOL(^JobsRetBOOLByFrameBlock)(CGRect frame);
typedef BOOL(^JobsRetBOOLByIDBlock)(id _Nullable data);
typedef BOOL(^JobsRetBOOLByDateBlock)(NSDate *_Nullable date);
typedef BOOL(^JobsRetBOOLByViewBlock)(__kindof UIView *_Nullable view);
typedef BOOL(^JobsRetBOOLByVCBlock)(__kindof UIViewController *_Nullable viewController);
typedef BOOL(^JobsRetBOOLByStrBlock)(__kindof NSString *_Nullable data);
typedef BOOL(^JobsRetBOOLByArrBlock)(__kindof NSArray *_Nullable arr);
typedef BOOL(^JobsRetBOOLByRACBoolPredicateBlock)(JobsRetBOOLByIDBlock _Nullable block);
typedef BOOL(^JobsRetBOOLByIDNSErrorPointerBlock)(Jobs_ID_NSErrorPointer_Arguments);
/// int
typedef int(^JobsRetIntByVoidBlock)(void);
typedef int(^JobsRetIntByIntBlock)(int data);
typedef int(^JobsRetIntByIDBlock)(id _Nullable data);
/// unsigned int
typedef unsigned int(^JobsRetUnsignedIntByVoidBlock)(void);
typedef unsigned int(^JobsRetByUnsignedIntBlock)(unsigned int data);
typedef unsigned int(^JobsRetUnsignedIntByIDBlock)(id _Nullable data);
/// float
typedef float(^JobsRetFloatByVoidBlock)(void);
typedef float(^JobsRetByFloatBlock)(float data);
typedef float(^JobsRetFloatByIDBlock)(id _Nullable data);
typedef float(^JobsRetFloatByStrBlock)(NSString *_Nullable data);
/// double
typedef double(^JobsRetDoubleByVoidBlock)(void);
typedef double(^JobsRetDoubleByNSIntegerBlock)(NSInteger data);
typedef double(^JobsRetByDoubleBlock)(double data);
typedef double(^JobsRetDoubleByIDBlock)(id _Nullable data);
typedef double(^JobsRetDoubleByStrBlock)(NSString *_Nullable data);
/// char
typedef char(^JobsRetByCharBlock)(char data);
typedef char(^JobsRetCharByIDBlock)(id _Nullable data);
typedef char(^JobsRetCharByVoidBlock)(void);
/// unsigned char
typedef unsigned char(^JobsRetByUnsignedCharBlock)(unsigned char data);
typedef unsigned char(^JobsRetUnsignedCharByIDBlock)(id _Nullable data);
typedef unsigned char(^JobsRetUnsignedCharByVoidBlock)(void);
/// short
typedef short(^JobsRetByShortBlock)(short data);
typedef short(^JobsRetShortByIDBlock)(id _Nullable data);
typedef short(^JobsRetShortByVoidBlock)(void);
/// unsigned short
typedef unsigned short(^JobsRetUnsignedShortByVoidBlock)(void);
typedef unsigned short(^JobsRetByUnsignedShortBlock)(unsigned short data);
typedef unsigned short(^JobsRetUnsignedShortByIDBlock)(id _Nullable data);
typedef unsigned short(^JobsRetUnsignedShortByNSUIntegerBlock)(NSUInteger data);
/// long
typedef long(^JobsRetLongByVoidBlock)(void);
typedef long(^JobsRetByLongBlock)(long data);
typedef long(^JobsRetLongByIDBlock)(id _Nullable data);
/// unsigned long
typedef unsigned long(^JobsRetUnsignedLongByVoidBlock)(void);
typedef unsigned long(^JobsRetByUnsignedLongBlock)(unsigned long data);
typedef unsigned long(^JobsRetUnsignedLongByIDBlock)(id _Nullable data);
/// unsigned long long
typedef unsigned long long(^JobsRetUnsignedLongLongByIDBlock)(id _Nullable data);
typedef unsigned long long(^JobsRetUnsignedLongLongByVoidBlock)(void);
typedef unsigned long long(^JobsRetByUnsignedLongLongBlock)(unsigned long long data);
#pragma mark —— 关于 id
typedef id _Nullable(^JobsRetIDByVoidBlock)(void);
typedef id _Nullable(^JobsRetIDByCGSizeBlock)(CGSize size);
typedef id _Nullable(^JobsRetIDByFrameBlock)(CGRect frame);
typedef id _Nullable(^JobsRetIDByCGPointBlock)(CGPoint point);
typedef id _Nullable(^JobsRetIDByCGFloatBlock)(CGFloat data);
typedef id _Nullable(^JobsRetIDByIDBlock)(id _Nullable data);
typedef id _Nullable(^JobsRetIDByStrBlock)(__kindof NSString *_Nullable data);
typedef id _Nonnull(^JobsRetIDBySaltStrBlock)(__kindof NSString *_Nullable salt);
typedef id<CAAction> _Nullable(^JobsRetCAActionByStringBlock)(NSString *_Nullable key);
typedef id _Nullable(^JobsRetIDByNotificationBlock)(NSNotification *_Nullable notification);
typedef id _Nullable(^JobsRetIDByObjBlock)(__kindof NSObject *_Nullable data);
typedef id _Nullable(^JobsRetIDByArrBlock)(__kindof NSArray *_Nullable data);
typedef id _Nullable(^JobsRetIDByDataBlock)(NSData *_Nullable data);
typedef id _Nullable(^JobsRetIDBySELBlock)(SEL _Nullable data);
typedef id _Nullable(^JobsRetIDByGestureBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef id _Nullable(^JobsRetIDByDicBlock)(__kindof NSDictionary *_Nullable data);
typedef id _Nullable(^JobsRetIDByImageBlock)(UIImage *_Nullable data);
typedef id _Nullable(^JobsRetIDByNSIntegerBlock)(NSInteger data);
typedef id _Nullable(^JobsRetIDByUIntegerBlock)(NSUInteger data);
typedef id _Nullable(^JobsRetIDByBOOLBlock)(BOOL data);
typedef id _Nullable(^JobsRetIDByIntBlock)(int data);
typedef id _Nullable(^JobsRetIDByUnsignedIntBlock)(unsigned int data);
typedef id _Nullable(^JobsRetIDByFloatBlock)(float data);
typedef id _Nullable(^JobsRetIDByDoubleBlock)(double data);
typedef id _Nullable(^JobsRetIDByCharBlock)(char data);
typedef id _Nullable(^JobsRetIDByUnsignedCharBlock)(unsigned char data);
typedef id _Nullable(^JobsRetIDByShortBlock)(short data);
typedef id _Nullable(^JobsRetIDByUnsignedShortBlock)(unsigned short data);
typedef id _Nullable(^JobsRetIDByLongBlock)(long data);
typedef id _Nullable(^JobsRetIDByUnsignedLongBlock)(unsigned long data);
typedef id _Nullable(^JobsRetIDByUnsignedLongLongBlock)(unsigned long long data);
typedef id _Nullable(^JobsRetIDByRACBoolPredicateBlock)(JobsRetBOOLByIDBlock _Nullable block);
typedef id _Nullable(^JobsRetIDByNSErrorPointerBlock)(NSError *_Nullable *_Nullable errorPtr);
typedef id _Nullable(^JobsRetIDByIDNSErrorPointerBlock)(Jobs_ID_NSErrorPointer_Arguments);
typedef id _Nullable(^JobsRetIDByRACValueBlock)(id _Nullable value);
typedef id _Nullable(^JobsRetNSMapTableByObjectForKeyedSubscriptBlock)(id<NSCopying> _Nullable data);
typedef __kindof NSMapTable *_Nullable(^JobsRetNSMapTableByIDBlock)(id<NSCopying> _Nullable data);
typedef __kindof NSMapTable *_Nullable(^JobsRetNSMapTableByVoidBlock)(void);
typedef id _Nullable(^JobsRetNSCacheByObjectForKeyedSubscriptBlock)(id<NSCopying> _Nullable data);
typedef __kindof NSCache *_Nullable(^JobsRetNSCacheByNSUIntegerBlock)(NSUInteger data);
typedef __kindof NSCache *_Nullable(^JobsRetNSCacheByBOOLBlock)(BOOL data);
typedef __kindof NSCache *_Nullable(^JobsRetNSCacheByIDBlock)(id<NSCopying> _Nullable data);
typedef __kindof NSCache *_Nullable(^JobsRetNSCacheByVoidBlock)(void);
typedef id _Nullable(^JobsRetIDByIDAndIDBlock)(Jobs_2_Arguments);
typedef id _Nullable(^JobsRetIDByIDIDNSUIntegerBlock)(Jobs_ID_ID_NSUInteger_Arguments);
typedef id _Nullable(^JobsRetIDByCenterBlock)(Jobs_ReturnIDByCenterBlock_Arguments);
typedef id _Nullable(^JobsRetIDByTwoIDBlock) (Jobs_2_Arguments);// weakSelf、arg
typedef id _Nullable(^JobsRetIDByThreeIDBlock) (Jobs_3_Arguments);// weakSelf、arg、data
typedef id _Nonnull(^JobsRetIDByClsAndSaltStrBlock)(Jobs_UITableViewHeaderFooterViewBlock_Arguments);
#pragma mark —— 关于 NSPointerArray
typedef __kindof NSPointerArray *_Nullable(^JobsRetPointerArrayByPointerBlock)(void *_Nullable pointer);
typedef __kindof NSPointerArray *_Nullable(^JobsRetPointerArrayByNSUIntegerBlock)(NSUInteger index);
#pragma mark —— NSMutableParagraphStyle
typedef __kindof NSMutableParagraphStyle *_Nullable(^JobsRetMutableParagraphStyleByCGFloatBlock)(CGFloat data);
typedef __kindof NSMutableParagraphStyle *_Nullable(^JobsRetMutableParagraphStyleByFloatBlock)(float data);
typedef __kindof NSMutableParagraphStyle *_Nullable(^JobsRetMutableParagraphStyleByBOOLBlock)(BOOL data);
typedef __kindof NSMutableParagraphStyle *_Nullable(^JobsRetMutableParagraphStyleByNSIntegerBlock)(NSInteger data);
typedef __kindof NSMutableParagraphStyle *_Nullable(^JobsRetMutableParagraphStyleByNSUIntegerBlock)(NSUInteger data);
typedef __kindof NSMutableParagraphStyle *_Nullable(^JobsRetMutableParagraphStyleByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSMutableParagraphStyle *_Nullable(^JobsRetMutableParagraphStyleByNSTextTabBlock)(NSTextTab *_Nullable data);
typedef __kindof NSMutableParagraphStyle *_Nullable(^JobsRetMutableParagraphStyleByNSParagraphStyleBlock)(__kindof NSParagraphStyle *_Nullable data);
#pragma mark —— 关于 UIStoryboard
typedef __kindof UIStoryboard *_Nullable(^JobsRetStoryboardByBundleBlock)(NSBundle *_Nullable bundle);
#pragma mark —— 关于 NSRunLoop
typedef __kindof NSRunLoop *_Nullable(^JobsRetRunLoopByTimerBlock)(NSTimer *_Nonnull timer);
#pragma mark —— 关于数据容器
/// NSArray
typedef __kindof NSArray *_Nullable(^JobsRetArrByVoidBlock)(void);
typedef __kindof NSArray<NSDate *> *_Nullable(^JobsRetFSCalendarByGetSelectedDatesBlock)(void);
typedef __kindof NSArray<UILabel *> *_Nullable(^JobsRetFSCalendarWeekdayViewByGetWeekdayLabelsBlock)(void);
typedef __kindof NSArray *_Nullable(^JobsRetArrByIDBlock)(id _Nullable data);
typedef __kindof NSArray *_Nullable(^JobsRetArrByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsRetArrByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsRetArrByIntegerBlock)(NSInteger data);
typedef __kindof NSArray <PHAssetResource *>*_Nonnull(^JobsRetArrayByPHAssetBlock)(__kindof PHAsset *_Nullable data);
/// NSMutableArray
typedef NSMutableArray <__kindof NSObject *>*_Nullable(^JobsRetMutableArrayByVoidBlock)(void);
typedef NSMutableArray <__kindof NSObject *>*_Nullable(^JobsRetMutableArrayByIDBlock)(id _Nullable data);
typedef NSMutableArray <__kindof NSObject *>*_Nullable(^JobsRetMutableArrayByObjBlock)(__kindof NSObject *_Nullable data);
/// NSDictionary
typedef __kindof NSDictionary *_Nullable(^JobsRetDicByVoidBlock)(void);
typedef __kindof NSDictionary *_Nullable(^JobsRetDicByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSDictionary *_Nullable(^JobsRetDicByDataBlock)(NSData *_Nullable data);
typedef __kindof NSDictionary *_Nullable(^JobsRetDicByURLBlock)(NSURL *_Nullable url);
/// NSMutableDictionary
typedef NSMutableDictionary *_Nonnull(^JobsRetMutableDicByVoidBlock)(void);
typedef NSMutableDictionary *_Nonnull(^JobsRetMutableDicByDicBlock)(__kindof NSDictionary *_Nullable dic);
typedef NSMutableDictionary *_Nonnull(^JobsRetMutableDicByKeyValueBlock)(Jobs_ReturnMutableDicByKeyValueBlock_Arguments);
typedef NSMutableDictionary *_Nonnull(^JobsRetMutableDicByKey_ValueBlock)(Jobs_ReturnMutableDicByKey_ValueBlock_Arguments);
/// NSSet
typedef __kindof NSSet *_Nullable(^JobsRetSetByIDBlock)(id _Nullable data);
typedef __kindof NSSet *_Nullable(^JobsRetSetByArrBlock)(__kindof NSArray *_Nullable data);
/// NSMutableSet
typedef __kindof NSMutableSet *_Nullable(^JobsRetMutableSetByIDBlock)(id _Nullable data);
#pragma mark —— 关于 UIControl
typedef __kindof UIControl *_Nullable(^JobsRetControlByVoidBlock)(void);
typedef __kindof UIControl *_Nullable(^JobsRetControlByBOOLBlock)(BOOL data);
typedef __kindof UIControl *_Nullable(^JobsRetControlByStringBlock)(NSString *_Nullable text);
typedef __kindof UIControl *_Nullable(^JobsRetControlByActionBlock)(UIAction *_Nullable data) API_AVAILABLE(ios(14.0));
typedef __kindof UIControl *_Nullable(^JobsRetControlByEventsBlock)(UIControlEvents events);
typedef __kindof UIControl *_Nullable(^JobsRetControlByVerticalAlignBlock)(UIControlContentVerticalAlignment vertical);
typedef __kindof UIControl *_Nullable(^JobsRetControlByHorizontalAlignBlock)(UIControlContentHorizontalAlignment horizontal);
typedef __kindof UIControl *_Nullable(^JobsRetControlByHandlerBlock)(jobsByCtrlBlock _Nullable handler);
typedef __kindof UIControl *_Nullable(^JobsRetControlByAlignBlock)(Jobs_Control_Align_Arguments);
typedef __kindof UIControl *_Nullable(^JobsRetControlByActionEventsBlock)(Jobs_Control_Action_Events_Arguments);
typedef __kindof UIControl *_Nullable(^JobsRetControlByEventsHandlerBlock)(Jobs_Control_Events_Handler_Arguments);
typedef __kindof UIControl *_Nullable(^JobsRetControlByIdentifierEventsBlock)(Jobs_Control_Identifier_Events_Arguments);
typedef __kindof UIControl *_Nullable(^JobsRetControlByTargetActionEventsBlock)(Jobs_Control_Target_Action_Events_Arguments);
typedef __kindof UIControl *_Nullable(^JobsRetControlByEventsIdentifierActionHandlerBlock)(Jobs_Control_Events_Identifier_ActionHandler_Arguments);
#pragma mark —— 关于 NSBundle
typedef NSBundle *_Nullable(^JobsRetBundleByStrBlock)(__kindof NSString *_Nullable data);
typedef NSBundle *_Nullable(^JobsRetBundleByURLBlock)(NSURL *_Nullable data);
typedef NSBundle *_Nullable(^JobsRetBundleByClsBlock)(Class _Nullable data);
#pragma mark —— 关于 NSLocale
typedef NSLocale *_Nullable(^JobsRetLocaleByStrBlock)(__kindof NSString *_Nullable data);
#pragma mark —— 关于 NSValue
typedef NSValue *_Nullable(^JobsRetValueByVoidBlock)(void);
typedef NSValue *_Nullable(^JobsRetValueByPointerBlock)(const void *_Nullable data);
typedef NSValue *_Nullable(^JobsRetValueByCGFloatBlock)(CGFloat data);
typedef NSValue *_Nullable(^JobsRetValueByCGSizeBlock)(CGSize size);
typedef NSValue *_Nullable(^JobsRetValueByPointBlock)(CGPoint point);
typedef NSValue *_Nullable(^JobsRetValueByVectorBlock)(CGVector data);
typedef NSValue *_Nullable(^JobsRetValueByFrameBlock)(CGRect frame);
typedef NSValue *_Nullable(^JobsRetValueByOffsetBlock)(UIOffset data);
typedef NSValue *_Nullable(^JobsRetValueByEdgeInsetsBlock)(UIEdgeInsets data);
typedef NSValue *_Nullable(^JobsRetValueByAffineTransformBlock)(CGAffineTransform data);
typedef NSValue *_Nullable(^JobsRetValueByDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
#pragma mark —— 关于贝塞尔曲线 UIBezierPath
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByVoidBlock)(void);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByBOOLBlock)(BOOL data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGFloatBlock)(CGFloat data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGLineCapBlock)(CGLineCap data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGLineJoinBlock)(CGLineJoin data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGAffineTransformBlock)(CGAffineTransform data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByFrameBlock)(CGRect frame);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGPointBlock)(CGPoint data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByBezierPathBlock)(__kindof UIBezierPath *_Nullable data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByAddArcBlock)(Jobs_BezierPath_AddArc_Arguments);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByAddCurveBlock)(Jobs_BezierPath_AddCurve_Arguments);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByLineDashBlock)(Jobs_BezierPath_LineDash_Arguments);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByAddQuadCurveBlock)(Jobs_BezierPath_AddQuadCurve_Arguments);
#pragma mark —— 关于 UIBackgroundConfiguration
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByCGFloatBlock)(CGFloat data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByContentModeBlock)(UIViewContentMode data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByInsetsBlock)(NSDirectionalEdgeInsets data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByRectEdgeBlock)(NSDirectionalRectEdge data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByCorTransformerBlock)(UIConfigurationColorTransformer _Nullable transformer) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByCorBlock)(UIColor *_Nullable data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByViewBlock)(UIView *_Nullable data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByImageBlock)(UIImage *_Nullable data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByVisualEffectBlock)(UIVisualEffect *_Nullable data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
#pragma mark —— 关于 UIButtonConfiguration
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByVoidBlock)(void) API_IOS15_TVOS15_UNAVAILABLE_WATCHOS;
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByFontBlock)(UIFont *_Nullable data) API_IOS15_TVOS15_UNAVAILABLE_WATCHOS;
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByBtnConfigBlock)(UIButtonConfiguration *_Nullable config) API_IOS15_TVOS15_UNAVAILABLE_WATCHOS;
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByBackgroundBlock)(UIBackgroundConfiguration *_Nullable data) API_IOS15_TVOS15_UNAVAILABLE_WATCHOS;
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByCornerStyleBlock)(UIButtonConfigurationCornerStyle data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigBySizeBlock)(UIButtonConfigurationSize data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByMacIdiomStyleBlock)(UIButtonConfigurationMacIdiomStyle data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReBtnConfigByBaseForegroundCorBlock)(UIColor *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByBaseBackgroundCorBlock)(UIColor *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByImageBlock)(UIImage *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByImageCorTransformerBlock)(UIConfigurationColorTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByPreferredSymbolConfigForImageBlock)(UIImageSymbolConfiguration *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByShowsActivityIndicatorBlock)(BOOL data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByActivityIndicatorCorTransformerBlock)(UIConfigurationColorTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByStrBlock)(NSString *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByAttributedStrBlock)(NSAttributedString *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByTitleTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByTitleLineBreakModeBlock)(NSLineBreakMode data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigBySubtitleBlock)(NSString *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByAttributedSubtitleBlock)(NSAttributedString *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigBySubtitleTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigBySubtitleLineBreakModeBlock)(NSLineBreakMode data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByIndicatorBlock)(UIButtonConfigurationIndicator data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByIndicatorColorTransformerBlock)(UIConfigurationColorTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByContentInsetsBlock)(NSDirectionalEdgeInsets data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByImagePlacementBlock)(NSDirectionalRectEdge data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByCGFloatBlock)(CGFloat data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByAutomaticallyUpdateForSelectionBlock)(BOOL data) API_AVAILABLE(ios(16.0));
#pragma mark —— 关于手势
/// UIGestureRecognizer
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureByVoidBlock)(void);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureByVoidStarBlock)(void *_Nullable key);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerBySELBlock)(SEL _Nullable data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByDelegateBlock)(id<UIGestureRecognizerDelegate> _Nullable data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByBOOLBlock)(BOOL data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureByGesture)(__kindof UIGestureRecognizer *_Nullable data);
/// UITapGestureRecognizer
typedef UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByUIEventButtonMaskBlock)(UIEventButtonMask data) API_AVAILABLE(ios(13.4)) API_UNAVAILABLE(tvos, watchos);
/// UILongPressGestureRecognizer
typedef UILongPressGestureRecognizer *_Nullable(^JobsRetFSCalendarByGetSwipeToChooseGestureBlock)(void);
typedef UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByCGFloatBlock)(CGFloat data);
typedef UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByNSTimeIntervalBlock)(NSTimeInterval data);
/// UISwipeGestureRecognizer
typedef UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
/// UIPanGestureRecognizer
typedef UIPanGestureRecognizer *_Nullable(^JobsRetFSCalendarByGetScopeGestureBlock)(void);
typedef UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByUIScrollTypeMaskBlock)(UIScrollTypeMask data) API_AVAILABLE(ios(13.4)) API_UNAVAILABLE(tvos, watchos);
/// UIPinchGestureRecognizer
typedef UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByCGFloatBlock)(CGFloat data);
/// UIRotationGestureRecognizer
typedef UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByCGFloatBlock)(CGFloat data);
/// UISwipeGestureRecognizer
typedef UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByDirectionBlock)(UISwipeGestureRecognizerDirection data);
/// UIScreenEdgePanGestureRecognizer
typedef UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByUIRectEdgeBlock)(UIRectEdge data);
#pragma mark —— 关于 CAEmitterCell
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByVoidBlock)(void);

typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByIDBlock)(id _Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByBOOLBlock)(BOOL data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByFloatBlock)(float data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCGFloatBlock)(CGFloat data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByNSUIntegerBlock)(NSUInteger data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCAMediaTimingFillModeBlock)(CAMediaTimingFillMode _Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCGRectBlock)(CGRect data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByUIColorBlock)(UIColor *_Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByStringBlock)(NSString *_Nullable data);
#pragma mark —— 关于 Layer
/// CALayer
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByVoidBlock)(void);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByBOOLBlock)(BOOL data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGPointBlock)(CGPoint data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGSizeBlock)(CGSize data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGRectBlock)(CGRect data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGAffineTransformBlock)(CGAffineTransform data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByUnsignedIntBlock)(unsigned int data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByNSIntegerBlock)(NSInteger data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGFloatBlock)(CGFloat data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGCorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCAToneMapModeBlock)(CAToneMapMode data) API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCADynamicRangeBlock)(CADynamicRange data) API_AVAILABLE(ios(26.0), tvos(26.0), visionos(26.0)) API_UNAVAILABLE(watchos);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByIDBlock)(id _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCorBlock)(UIColor *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByBezierPathBlock)(UIBezierPath *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCAPropertyAnimationBlock)(__kindof CAPropertyAnimation *_Nullable animation);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCAAnimationKeyBlock)(Jobs_CALayer_CAAnimation_Key_Arguments);
#pragma mark —— 关于 Layer 子类继承 CALayer 返回类型
/// CAMetalLayer _Nullable
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
/// CAShapeLayer
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCorBlock)(UIColor *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByBezierPathBlock)(UIBezierPath *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGCorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByFillRuleBlock)(CAShapeLayerFillRule _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByLineCapBlock)(CAShapeLayerLineCap _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByLineJoinBlock)(CAShapeLayerLineJoin _Nullable data);
/// CATextLayer _Nullable
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCFTypeRefBlock)(CFTypeRef _Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByTruncationModeBlock)(CATextLayerTruncationMode data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByAlignmentModeBlock)(CATextLayerAlignmentMode data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByBOOLBlock)(BOOL data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByIDBlock)(id _Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByUIColorBlock)(UIColor *_Nullable data);
/// CAGradientLayer
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCGPointBlock)(CGPoint data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByTypeBlock)(CAGradientLayerType _Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByArrBlock)(__kindof NSArray *_Nullable data);
/// CAReplicatorLayer
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByNSIntegerBlock)(NSInteger data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByBOOLBlock)(BOOL data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByUIColorBlock)(UIColor *_Nullable data);
/// CAScrollLayer
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByScrollModeBlock)(CAScrollLayerScrollMode data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCGPointBlock)(CGPoint data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCGRectBlock)(CGRect data);
/// CATiledLayer
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByNSIntegerBlock)(NSInteger data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCGSizeBlock)(CGSize data);
/// CAEmitterLayer _Nullable
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByFloatBlock)(float data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCGPointBlock)(CGPoint data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCGSizeBlock)(CGSize data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByBOOLBlock)(BOOL data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByUnsignedIntBlock)(unsigned int data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByEmitterShapeBlock)(CAEmitterLayerEmitterShape data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByEmitterModeBlock)(CAEmitterLayerEmitterMode data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByRenderModeBlock)(CAEmitterLayerRenderMode data);
/// CAEAGLLayer
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByBOOLBlock)(BOOL data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
/// CAMetalLayer
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByIDBlock)(id _Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByBOOLBlock)(BOOL data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGSizeBlock)(CGSize data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGColorSpaceRefBlock)(CGColorSpaceRef _Nullable data);
#pragma mark —— 关于 View
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByVoidBlock)(void);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByBOOLBlock)(BOOL data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByCGFloatBlock)(CGFloat data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFDisplayModeBlock)(PDFDisplayMode data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFDisplayDirectionBlock)(PDFDisplayDirection data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFDisplayBoxBlock)(PDFDisplayBox data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByDelegateBlock)(id<PDFViewDelegate> _Nullable data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByCorBlock)(UIColor *_Nullable data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFDocumentBlock)(PDFDocument *_Nullable data);
/// UIView
typedef __kindof UIView *_Nullable(^JobsRetViewByVoidBlock)(void);
typedef __kindof UIView *_Nullable(^JobsRetViewByIDBlock)(id _Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByInteractionBlock)(id <UIInteraction>_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByImageBlock)(UIImage *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByNSIntegerReturnViewBlock)(NSInteger data);
typedef __kindof UIView *_Nullable(^JobsRetViewByBarButtonItemBlock)(__kindof UIBarButtonItem *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByViewBlock)(UIView *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCorBlock)(UIColor *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByBOOLBlock)(BOOL data);
typedef __kindof UIView *_Nullable(^JobsRetViewByFloatBlock)(float data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCGFloatBlock)(CGFloat data);
typedef __kindof UIView *_Nullable(^JobsRetViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UIView *_Nullable(^JobsRetViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIView *_Nullable(^JobsRetViewByUIEdgeInsetBlock)(UIEdgeInsets data);
typedef __kindof UIView *_Nullable(^JobsRetViewByUIRectEdgeBlock)(UIRectEdge data);
typedef __kindof UIView *_Nullable(^JobsRetViewByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCGSizeBlock)(CGSize size);
typedef __kindof UIView *_Nullable(^JobsRetViewByFrameBlock)(CGRect frame);
typedef __kindof UIView *_Nullable(^JobsRetViewByCGPointBlock)(CGPoint data);
typedef __kindof UIView *_Nullable(^JobsRetViewByUIUserInterfaceStyleBlock)(UIUserInterfaceStyle data);
typedef __kindof UIView *_Nullable(^JobsRetViewBySwipeGestureRecognizerDirectionBlock)(UISwipeGestureRecognizerDirection data);
typedef __kindof UIView *_Nullable(^JobsRetViewByNSLayoutAttributeBlock)(NSLayoutAttribute data);
typedef __kindof UIView *_Nullable(^JobsRetViewByNSDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCGAffineTransformBlock)(CGAffineTransform data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCATransform3DBlock)(CATransform3D data);
typedef __kindof UIView *_Nullable(^JobsRetViewByClassBlock)(Class _Nonnull cls);
typedef __kindof UIView *_Nullable(^JobsRetViewByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UIView *_Nullable(^JobsRetViewByViewModelBlock)(UIViewModel *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCornerConfigBlock)(UICornerConfiguration *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByTableViewHeaderFooterViewBlock)(__kindof UITableViewHeaderFooterView *_Nonnull headerFooterView);
typedef __kindof UIView *_Nullable(^JobsRetViewByCenterBlock)(Jobs_Center_Arguments);
/// UIView + UIGestureRecognizer
typedef __kindof UIView *_Nullable(^JobsRetViewByGestureRecognizer)(UIGestureRecognizer *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByTapGestureBlock)(UITapGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByLongPressGestureBlock)(UILongPressGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewBySwipeGestureBlock)(UISwipeGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByPanGestureBlock)(UIPanGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByPinchGestureBlock)(UIPinchGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByRotationGestureBlock)(UIRotationGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByScreenEdgePanGestureBlock)(UIScreenEdgePanGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByGestureRecognizerActionBlock)(jobsByGestureRecognizerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByTapGestureRecognizerActionBlock)(jobsByTapGestureRecognizerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByLongPressGestureRecognizerActionBlock)(jobsByLongPressGestureRecognizerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewBySwipeGestureRecognizerActionBlock)(jobsBySwipeGestureRecognizerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByPanGestureRecognizerActionBlock)(jobsByPanGestureRecognizerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByPinchGestureRecognizerActionBlock)(jobsByPinchGestureRecognizerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByRotationGestureRecognizerActionBlock)(jobsByRotationGestureRecognizerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByScreenEdgePanGestureRecognizerActionBlock)(jobsByScreenEdgePanGestureRecognizerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByJobsByViewBlock)(jobsByViewBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsRetViewByLayerBlock)(jobsByCALayerBlock _Nullable block);
/// UIBarButtonItem
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByVoidBlock)(void);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByStyleBlock)(UIBarButtonItemStyle data);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByContextMenuConfigurationElementOrderBlock)(UIContextMenuConfigurationElementOrder data) API_AVAILABLE(ios(16.0), tvos(17.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByRACCommandBlock)(__kindof RACCommand *_Nullable command);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemBySetBlock)(__kindof NSSet *_Nullable data);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemBySELBlock)(SEL _Nullable data);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByIDBlock)(id _Nullable data);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByActionBlock)(UIAction *_Nullable data) API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByMenuBlock)(UIMenu *_Nullable data) API_AVAILABLE(ios(14.0), tvos(17.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByRACCommandBlock)(__kindof RACCommand *_Nullable command);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByBOOLBlock)(BOOL data);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByCGFloatBlock)(CGFloat data);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByMenuElementBlock)(UIMenuElement *_Nullable data) API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByStringBlock)(NSString *_Nullable data) API_AVAILABLE(ios(26.0));
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByCorBlock)(UIColor *_Nullable data);
/// UIImageView
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByImageBlock)(UIImage *_Nullable data);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByURLBlock)(NSURL *_Nullable data);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByNSTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByVoidBlock)(void);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByBOOLBlock)(BOOL data);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewBySymbolConfigurationBlock)(UIImageSymbolConfiguration *_Nullable data) API_AVAILABLE(ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByImageDynamicRangeBlock)(UIImageDynamicRange data) API_AVAILABLE(ios(17.0), tvos(17.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewBySymbolEffectBlock)(NSSymbolEffect *_Nonnull data) API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewBySymbolEffectOptionsBlock)(NSSymbolEffectOptions *_Nonnull data) API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
/// UIWindow
typedef __kindof UIWindow *_Nullable(^JobsRetWindowByVoidBlock)(void);
typedef __kindof UIWindow *_Nullable(^JobsRetWindowByFrameBlock)(CGRect frame);
typedef __kindof UIWindow *_Nullable(^JobsRetWindowByWindowSceneBlock)(UIWindowScene *_Nullable data);
/// UIMenuItem
typedef __kindof UIMenuItem *_Nullable(^JobsRetMenuItemByVoidBlock)(void);
typedef __kindof UIMenuItem *_Nullable(^JobsRetMenuItemBySELBlock)(SEL _Nullable data);
typedef __kindof UIMenuItem *_Nullable(^JobsRetMenuItemByIDBlock)(id _Nullable data);
typedef __kindof UIMenuItem *_Nullable(^JobsRetMenuItemByStringBlock)(NSString *_Nullable data);
typedef __kindof UIMenuItem *_Nullable(^JobsRetMenuItemByMenuItemBlock)(jobsByMenuItemBlock _Nullable block);
#pragma mark —— 关于 UIMenuController
typedef __kindof UIMenuController *_Nullable(^JobsRetMenuControllerByVoidBlock)(void);
typedef __kindof UIMenuController *_Nullable(^JobsRetMenuControllerByBOOLBlock)(BOOL data);
typedef __kindof UIMenuController *_Nullable(^JobsRetMenuControllerByArrBlock)(__kindof NSArray<UIMenuItem *> *_Nullable data);
typedef __kindof UIMenuController *_Nullable(^JobsRetMenuControllerByArrowDirectionBlock)(UIMenuControllerArrowDirection data);
typedef __kindof UIMenuController *_Nullable(^JobsRetMenuControllerByViewBlock)(__kindof UIView *_Nullable data) API_AVAILABLE(ios(13.0));
#pragma mark —— 关于 UITextView
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByBOOLBlock)(BOOL data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByCGFloatBlock)(CGFloat data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByPointBlock)(CGPoint point);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByNSRangeBlock)(NSRange data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByIDBlock)(id _Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByTextContentTypeBlock)(UITextContentType _Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByBorderStyleBlock)(UITextViewBorderStyle data) API_AVAILABLE(ios(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByDelegateBlock)(id<UITextViewDelegate> _Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByStringBlock)(NSString *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByAttributedStringBlock)(NSAttributedString *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByCorBlock)(UIColor *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByFontBlock)(UIFont *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByNSDictionaryBlock)(NSDictionary *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByViewBlock)(UIView *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByAttributedTextBlock)(__kindof NSAttributedString *_Nullable attributedText);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByDicBlock)(__kindof NSDictionary<NSAttributedStringKey,id> *_Nullable dic);
#pragma mark —— 关于 UITableView
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByIDBlock)(id _Nullable data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByVoidBlock)(void);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDelegateBlock)(id <UITableViewDelegate>_Nullable delegate);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDataSourceBlock)(id <UITableViewDataSource>_Nullable dataSource);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDataSourcePrefetchingBlock)(id <UITableViewDataSourcePrefetching>_Nullable dataSourcePrefetching);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDragDelegateBlock)(id <UITableViewDragDelegate>_Nullable delegate);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDropDelegateBlock)(id <UITableViewDropDelegate>_Nullable delegate);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByBOOLBlock)(BOOL data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByCGFloatBlock)(CGFloat data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByEdgeInsetsBlock)(UIEdgeInsets inset);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByUIScrollViewContentInsetAdjustmentBehaviorBlock)(UIScrollViewContentInsetAdjustmentBehavior behavior);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByStringBlock)(NSString *_Nullable data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByCorBlock)(UIColor *_Nullable cor);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByVisualEffectBlock)(UIVisualEffect *_Nullable effect);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByCellSeparatorStyleBlock)(UITableViewCellSeparatorStyle style);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByClsAndSaltStrBlock)(Jobs_UITableViewHeaderFooterViewBlock_Arguments);
typedef __kindof UITableViewCell *_Nonnull(^jobsTableViewCellForRowAtBlock)(Jobs_TableView_Target_TableView_IndexPath_Arguments);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByNumberOfSectionsConfigBlock)(jobsTableViewNumberOfSectionsBlock _Nullable block);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByNumberOfRowsInSectionConfigBlock)(jobsTableViewNumberOfRowsInSectionBlock _Nullable block);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByCellForRowAtConfigBlock)(jobsTableViewCellForRowAtBlock _Nullable block);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDidSelectRowAtConfigBlock)(jobsTableViewDidSelectRowAtBlock _Nullable block);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByMJRefreshConfigModelBlock)(MJRefreshConfigModel *_Nullable config);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByArrBlock)(NSArray<NSIndexPath *> *_Nonnull data);
#pragma mark —— 关于 UITableViewCell
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByVoidBlock)(void);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByAccessoryTypeBlock)(UITableViewCellAccessoryType type);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByCellStyleBlock)(UITableViewCellStyle tableViewCellStyle);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellBySelectionStyleBlock)(UITableViewCellSelectionStyle data);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByFocusStyleBlock)(UITableViewCellFocusStyle data) API_AVAILABLE(ios(9.0));
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByStateMaskBlock)(UITableViewCellStateMask data) API_AVAILABLE(ios(3.0));
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByDragStateBlock)(UITableViewCellDragState data) API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByUIEdgeInsetsBlock)(UIEdgeInsets insets);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByFrameBlock)(CGRect frame);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellBySizeBlock)(CGSize size);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByCGFloatBlock)(CGFloat data);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByBOOLBlock)(BOOL data);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByIndexBlock)(NSInteger index);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByIDBlock)(id _Nullable data);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByContentConfigurationBlock)(id<UIContentConfiguration> _Nullable data) API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByDelegateBlock)(id<NSObject> _Nonnull delegate);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByClsBlock)(Class _Nonnull cls);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByConfigurationUpdateHandlerBlock)(UITableViewCellConfigurationUpdateHandler _Nullable data) API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByBackgroundConfigurationBlock)(UIBackgroundConfiguration *_Nullable data) API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByTableViewBlock)(UITableView *_Nonnull tableView);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByIndexPathBlock)(NSIndexPath *_Nonnull indexPath);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByImageBlock)(UIImage *_Nonnull image);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByCorBlock)(UIColor *_Nonnull cor);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByFontBlock)(UIFont *_Nonnull font);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByViewBlock)(__kindof UIView *_Nullable data);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByJobsByViewBlock)(jobsByViewBlock _Nullable block);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByLabelBlock)(jobsByLabelBlock _Nullable block);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByImageViewBlock)(jobsByImageViewBlock _Nullable block);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByClsAndSaltStrBlock)(Jobs_ByClassAndSaltBlock_Arguments);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByCls_SaltStr_IndexPath_Block)(Jobs_UITableViewCellBlock_Arguments);
#pragma mark —— 关于 UITextField
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByBOOLBlock)(BOOL data);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByNSIntegerBlock)(NSInteger data);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByCGFloatrBlock)(CGFloat data);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByModeBlock)(UITextFieldViewMode mode);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByKeyboardAppearanceBlock)(UIKeyboardAppearance appearance);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByKeyboardTypeBlock)(UIKeyboardType type);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByReturnKeyTypeBlock)(UIReturnKeyType type);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByDelegateBlock)(id <UITextFieldDelegate>_Nullable delegate);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByStringBlock)(__kindof NSString *_Nullable str);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByAttributedStringBlock)(__kindof NSAttributedString *_Nullable str);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByFontBlock)(__kindof UIFont *_Nullable font);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByCorBlock)(__kindof UIColor *_Nullable cor);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByImageBlock)(__kindof UIImage *_Nullable image);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByNSDictionaryBlock)(NSDictionary<NSAttributedStringKey,id>*_Nonnulldata);
#pragma mark —— 关于 UISearchBar
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByBOOLBlock)(BOOL data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByNSIntegerBlock)(NSInteger data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByDelegateBlock)(id<UISearchBarDelegate> _Nullable data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByStringBlock)(NSString *_Nullable data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByCorBlock)(UIColor *_Nullable data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByImageBlock)(UIImage *_Nullable data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByArrBlock)(NSArray<NSString *> *_Nullable data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByViewBlock)(__kindof UIView *_Nullable data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByOffsetBlock)(UIOffset data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarByBarStyleBlock)(UIBarStyle data);
typedef __kindof UISearchBar *_Nullable(^JobsRetSearchBarBySearchBarStyleBlock)(UISearchBarStyle data);
#pragma mark —— 关于 Label
typedef __kindof UILabel *_Nullable(^JobsRetLabelByVoidBlock)(void);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByNSIntegerBlock)(NSInteger data);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByTextAlignmentBlock)(NSTextAlignment textAlignment);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByImageBlock)(__kindof UIImage *_Nullable image);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByCorBlock)(__kindof UIColor *_Nullable cor);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByBtnBlock)(__kindof UIButton *_Nullable btn);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByTextBlock)(__kindof NSString *_Nullable str);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByFontBlock)(__kindof UIFont *_Nullable font);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByAttributedStringBlock)(__kindof NSAttributedString *_Nullable attributedString);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByLabelBlock)(jobsByLabelBlock _Nullable block);
#pragma mark —— 关于按钮
typedef __kindof UIButton *_Nullable(^JobsRetBtnByVoidBlock)(void);
typedef __kindof UIButton *_Nonnull(^JobsRetBtnByBOOLBlock)(BOOL data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByCGFloatBlock)(CGFloat data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByFloatBlock)(float data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByDoubleBlock)(double interva);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByLongBlock)(long data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByCGSizeBlock)(CGSize data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByNSIntegerBlock)(NSInteger data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByControlStateBlock)(UIControlState data);
API_AVAILABLE(ios(15.0))
typedef __kindof UIButton *_Nullable(^JobsRetBtnByTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByImagePlacementBlock)(NSDirectionalRectEdge data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByButtonConfigurationBlock)(UIButtonConfiguration *_Nullable data) API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByConfigurationUpdateHandlerBlock)(UIButtonConfigurationUpdateHandler _Nullable data) API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByRoleBlock)(UIButtonRole data) API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByPointerStyleProviderBlock)(UIButtonPointerStyleProvider _Nullable data) API_AVAILABLE(ios(13.4)) API_UNAVAILABLE(watchos, tvos);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByMenuBlock)(UIMenu *_Nullable data) API_AVAILABLE(ios(14.0), tvos(17.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByContextMenuConfigurationElementOrderBlock)(UIContextMenuConfigurationElementOrder data) API_AVAILABLE(ios(16.0), tvos(17.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIButton *_Nullable(^JobsRetBtnBySymbolConfigurationBlock)(UIImageSymbolConfiguration *_Nullable data) API_AVAILABLE(ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByIDBlock)(id _Nullable data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByDicBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByImageBlock)(UIImage *_Nullable image);
typedef __kindof UIButton *_Nonnull(^JobsRetBtnByURLBlock)(NSURL *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByFontBlock)(UIFont *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByCorBlock)(UIColor *_Nonnull cor);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByCorAndControlStateBlock)(UIColor *_Nullable cor, UIControlState state);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByStringBlock)(__kindof NSString *_Nullable data);// 主文字内容
typedef __kindof UIButton *_Nullable(^JobsRetBtnByAttributedStringBlock)(NSAttributedString *_Nullable title);// 富文本内容
typedef __kindof UIButton *_Nullable(^JobsRetBtnByButtonModelBlock)(UIButtonModel *_Nullable buttonModel);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByBtnConfigBlock)(jobsByButtonConfigurationBlock _Nullable block) API_IOS15_TVOS15_UNAVAILABLE_WATCHOS;
typedef __kindof UIButton *_Nullable(^JobsRetBtnByLabelBlock)(jobsByLabelBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByImageViewBlock)(jobsByImageViewBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByImagePlacementAndPaddingBlock)(Jobs_ReturnButtonByImagePlacementAndPaddingBlock_Arguments);
typedef __kindof UIButton *_Nonnull(^JobsRetBtnByCor_FloatBlock)(Jobs_ReturnButtonByColor_FloatBlock_Arguments);
/// 主/副 文字内容 title/subTitle
typedef __kindof UIButton *_Nullable(^JobsRetBtnByTitlesBlock)(Jobs_NSStringBlock_3_Arguments);
/// 主/副 富文本内容 title/subTitle
typedef __kindof UIButton *_Nullable(^JobsRetBtnByAttributedStringsBlock)(Jobs_ReturnButtonByAttributedStringsBlock_Arguments);
/// 主文字内容、字体大小
typedef __kindof UIButton *_Nullable(^JobsRetBtnByStyle1Block)(Jobs_Title_Font_Arguments);
/// 主文字内容、字体大小、主文字颜色
typedef __kindof UIButton *_Nullable(^JobsRetBtnByStyle2Block)(Jobs_Title_Font_TitleCor_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片、图片和文字的位置关系、x
typedef __kindof UIButton *_Nullable(^JobsRetBtnByStyle3Block)(Jobs_Title_Font_TitleCor_Image_imagePlacement_X_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片
typedef __kindof UIButton *_Nullable(^JobsRetBtnByStyle4Block)(Jobs_Title_Font_TitleCor_Image_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片、按钮背景图片、图片和文字的位置关系
typedef __kindof UIButton *_Nullable(^JobsRetBtnByStyle5Block)(Jobs_Title_Font_TitleCor_Image_BackgroundImage_ImagePlacement_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片、图文相对位置、图文距离
typedef __kindof UIButton *_Nullable(^JobsRetBtnByStyle6Block)(Jobs_Title_Font_TitleCor_Image_DirectionalRectEdge_X_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片、图文距离
typedef __kindof UIButton *_Nullable(^JobsRetBtnByStyle7Block)(Jobs_Title_Font_TitleCor_Image_X_Arguments);
#pragma mark —— 关于 UIActivityIndicatorView
typedef __kindof UIActivityIndicatorView *_Nullable(^JobsRetActivityIndicatorViewByVoidBlock)(void);
typedef __kindof UIActivityIndicatorView *_Nullable(^JobsRetActivityIndicatorViewByBOOLBlock)(BOOL data);
typedef __kindof UIActivityIndicatorView *_Nullable(^JobsRetActivityIndicatorViewByCorBlock)(UIColor *_Nullable data);
typedef __kindof UIActivityIndicatorView *_Nullable(^JobsRetActivityIndicatorViewByNSInteger)(NSInteger data);
#pragma mark —— 关于 UITableViewHeaderFooterView
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByStringBlock)(__kindof NSString *_Nullable string);
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByTableViewBlock)(__kindof UITableView *_Nullable tableView);
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByTableViewAndSaltBlock)(Jobs_UITableViewHeaderFooterViewBlock2_Arguments);
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByClsAndSaltStrBlock)(Jobs_UITableViewHeaderFooterViewBlock_Arguments);
#pragma mark —— 关于 UICollectionView
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByVoidBlock)(void);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDelegateBlock)(id <UICollectionViewDelegate>_Nullable delegate);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDataSourceBlock)(id <UICollectionViewDataSource>_Nullable dataSource);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDragDelegateBlock)(id <UICollectionViewDragDelegate>_Nullable delegate);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDropDelegateBlock)(id <UICollectionViewDropDelegate>_Nullable delegate);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDataSourcePrefetchingBlock)(id <UICollectionViewDataSourcePrefetching>_Nullable dataSourcePrefetching);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByBOOLBlock)(BOOL data);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByLayoutBlock)(__kindof UICollectionViewLayout *_Nullable layout);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByFlowLayoutBlock)(__kindof UICollectionViewFlowLayout *_Nullable layout);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByIDBlock)(id _Nullable target);
typedef __kindof UICollectionViewCell *_Nonnull(^jobsCollectionViewCellForItemAtBlock)(Jobs_CollectionView_Target_CollectionView_IndexPath_Arguments);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByNumberOfSectionsConfigBlock)(jobsCollectionViewNumberOfSectionsBlock _Nullable block);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByNumberOfItemsInSectionConfigBlock)(jobsCollectionViewNumberOfItemsInSectionBlock _Nullable block);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByCellForItemAtConfigBlock)(jobsCollectionViewCellForItemAtBlock _Nullable block);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDidSelectItemAtConfigBlock)(jobsCollectionViewDidSelectItemAtBlock _Nullable block);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByMJRefreshConfigModelBlock)(MJRefreshConfigModel *_Nullable config);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByClassAndSaltStrBlock)(Jobs_UITableViewHeaderFooterViewBlock_Arguments);
#pragma mark —— 关于 UICollectionViewFlowLayout
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByVoidBlock)(void);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByBOOLBlock)(BOOL data);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByCGFloatBlock)(CGFloat data);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByCGSizeBlock)(CGSize size);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByUIEdgeInsetsBlock)(UIEdgeInsets insets);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByUICollectionViewScrollDirectionBlock)(UICollectionViewScrollDirection direction);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByUICollectionViewFlowLayoutSectionInsetReferenceBlock)(UICollectionViewFlowLayoutSectionInsetReference reference) API_AVAILABLE(ios(11.0), tvos(11.0));
#pragma mark —— 关于 UICollectionViewLayoutAttributes
typedef __kindof UICollectionViewLayoutAttributes *_Nullable(^JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock)(__kindof NSIndexPath *_Nullable indexPath);
#pragma mark —— 关于 UICollectionViewCell
typedef __kindof UICollectionViewCell *_Nullable(^JobsRetCollectionViewCellByVoidBlock)(void);
typedef __kindof UICollectionViewCell *_Nullable(^JobsRetCollectionViewCellByBOOLBlock)(BOOL data);
typedef __kindof UICollectionViewCell *_Nullable(^JobsRetCollectionViewCellByIDBlock)(id _Nullable data);
typedef __kindof UICollectionViewCell *_Nullable(^JobsRetCollectionViewCellByIndexPathBlock)(NSIndexPath *_Nullable indexPath);
typedef __kindof UICollectionViewCell *_Nullable(^JobsRetCollectionViewCellByCorBlock)(UIColor *_Nullable cor);
typedef __kindof UICollectionViewCell *_Nullable(^JobsRetCollectionViewCellByDelegateBlock)(UIColor *_Nullable cor);
typedef __kindof UICollectionViewCell *_Nullable(^JobsRetCollectionViewCellByJobsByViewBlock)(jobsByViewBlock _Nullable block);
#pragma mark —— 关于 UIPageControl
typedef __kindof UIPageControl *_Nullable(^JobsRetPageControlByNSIntegerBlock)(NSInteger data);
typedef __kindof UIPageControl *_Nullable(^JobsRetPageControlByVoidBlock)(void);
typedef __kindof UIPageControl *_Nullable(^JobsRetPageControlByBOOLBlock)(BOOL data);
typedef __kindof UIPageControl *_Nullable(^JobsRetPageControlByBackgroundStyleBlock)(UIPageControlBackgroundStyle style);
typedef __kindof UIPageControl *_Nullable(^JobsRetPageControlByDirectionBlock)(UIPageControlDirection direction);
typedef __kindof UIPageControl *_Nullable(^JobsRetPageControlByColorBlock)(UIColor *_Nullable color);
typedef __kindof UIPageControl *_Nullable(^JobsRetPageControlByImageBlock)(UIImage *_Nullable image);
typedef __kindof UIPageControl *_Nullable(^JobsRetPageControlByImageAndNSIntegerBlock)(Jobs_PageControl_Image_Page_Arguments);
#pragma mark —— 关于 UIScrollView
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByVoidBlock)(void);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByCGFloatBlock)(CGFloat data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByBOOLBlock)(BOOL data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByPointBlock)(CGPoint data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByFrameBlock)(CGRect frame);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewBySizeBlock)(CGSize size);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByUIEdgeInsetsBlock)(UIEdgeInsets insets);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByContentInsetAdjustmentBehaviorBlock)(UIScrollViewContentInsetAdjustmentBehavior data) API_AVAILABLE(ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByIndicatorStyleBlock)(UIScrollViewIndicatorStyle data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByDecelerationRateBlock)(UIScrollViewDecelerationRate data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByKeyboardDismissModeBlock)(UIScrollViewKeyboardDismissMode data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByUIAxisBlock)(UIAxis data) API_AVAILABLE(visionos(26.0)) API_UNAVAILABLE(ios, watchos, tvos);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByIDBlock)(id _Nullable data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByDelegateBlock)(id <UIScrollViewDelegate>_Nullable delegate);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByUIRefreshControlBlock)(UIRefreshControl *_Nullable data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByMutArrBlock)(NSMutableArray <NSObject *>*_Nullable data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByMJRefreshConfigModelBlock)(MJRefreshConfigModel *_Nullable config);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByButtonModelBlock)(__kindof UIButtonModel *_Nullable buttonModel);
#pragma mark —— 关于 PDF
typedef __kindof PDFDocument *_Nullable(^JobsRetPDFDocumentByURLBlock)(NSURL *_Nullable pdfURL);
#pragma mark —— 关于 WKWebView
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByVoidBlock)(void);
typedef __kindof WKWebView *_Nullable(^JobsRetCollectionViewByNavDelegateBlock)(id <WKNavigationDelegate>_Nullable delegate);
typedef __kindof WKWebView *_Nullable(^JobsRetCollectionViewByUIDelegateBlock)(id <WKUIDelegate>_Nullable delegate);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByConfigurationBlock)(WKWebViewConfiguration *_Nullable config);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByURLRequestBlock)(__kindof NSURLRequest *_Nullable request);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByURLBlock)(NSURL *_Nullable URL);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByViewModelBlock)(__kindof UIViewModel *_Nullable viewModel);
#pragma mark —— 关于 UIProgressView
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByFloatBlock)(float progress);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByStyleBlock)(UIProgressViewStyle style);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByColorBlock)(UIColor *_Nullable color);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByImageBlock)(UIImage *_Nullable image);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByNSProgressBlock)(NSProgress *_Nullable progress);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByFloatAnimatedBlock)(Jobs_Progress_Animated_Arguments);
#pragma mark —— 关于 控制器
/// UIViewController
typedef __kindof UIViewController *_Nullable(^JobsRetVCByVoidBlock)(void);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByIDBlock)(id _Nullable data);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByViewBlock)(__kindof UIView *_Nonnull view);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByNSLayoutAttributeBlock)(NSLayoutAttribute data);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByVCBlock)(__kindof UIViewController *_Nonnull vc);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByWebViewBlock)(__kindof WKWebView *_Nonnull webView);
/// UINavigationController
typedef __kindof UINavigationController *_Nullable(^JobsRetNavCtrByDelegateBlock)(id <UINavigationControllerDelegate>_Nullable delegate);
typedef __kindof UINavigationController *_Nullable(^JobsRetNavCtrByVoidBlock)(void);
typedef __kindof UINavigationController *_Nullable(^JobsRetNavCtrByVCBlock)(__kindof UIViewController *_Nonnull vc);
typedef __kindof UINavigationController *_Nullable(^JobsRetNavCtrByClassBlock)(Class _Nonnull cls);
/// UIAlertController
typedef __kindof UIAlertController *_Nullable(^JobsRetAlertCtrlByActionBlock)(UIAlertAction *_Nullable data);
typedef __kindof UIAlertController *_Nullable(^JobsRetAlertCrtlByStringBlock)(__kindof NSString *_Nullable data);
/// MFMessageComposeViewController
typedef __kindof MFMessageComposeViewController *_Nullable(^JobsRetMessageComposeVCByBOOLBlock)(BOOL data);
typedef __kindof MFMessageComposeViewController *_Nullable(^JobsRetMessageComposeVCByDelegateBlock)(id<MFMessageComposeViewControllerDelegate> _Nullable data);
typedef __kindof MFMessageComposeViewController *_Nullable(^JobsRetMessageComposeVCByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof MFMessageComposeViewController *_Nullable(^JobsRetMessageComposeVCByArrBlock)(__kindof NSArray *_Nullable data);
/// MFMailComposeViewController
typedef __kindof MFMailComposeViewController *_Nullable(^JobsRetMailComposeVCByDelegateBlock)(id<MFMailComposeViewControllerDelegate> _Nullable data);
typedef __kindof MFMailComposeViewController *_Nullable(^JobsRetMailComposeVCByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof MFMailComposeViewController *_Nullable(^JobsRetMailComposeVCByArrBlock)(__kindof NSArray *_Nullable data);
#pragma mark —— 关于 富文本
/// NSAttributedString
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByVoidBlock)(void);
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByNSUIntegerBlock)(NSUInteger data);
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByCorBlock)(UIColor *_Nonnull data);
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByStrBlock)(__kindof NSString *_Nullable string);
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByAttributedStringBlock)(__kindof NSAttributedString *_Nonnull aString);
/// NSMutableAttributedString
typedef __kindof NSMutableAttributedString *_Nullable(^JobsRetMutableAttributedStringByStrBlock)(__kindof NSString *_Nullable string);
typedef __kindof NSMutableAttributedString *_Nullable(^JobsRetMutableAttributedStringByAttributedStringBlock)(__kindof NSAttributedString *_Nonnull aString);
#pragma mark —— NSNumber
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByCharBlock)(char data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByUnsignedCharBlock)(unsigned char data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByShortBlock)(short data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByUnsignedShortBlock)(unsigned short data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByIntBlock)(int data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByUnsignedIntBlock)(unsigned int data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByLongBlock)(long data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByUnsignedLongBlock)(unsigned long data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByLongLongBlock)(long long data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByUnsignedLongLongBlock)(unsigned long long data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByFloatBlock)(float data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByDoubleBlock)(double data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByBOOLBlock)(BOOL data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByNSIntegerBlock)(NSInteger data);
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByNSUIntegerBlock)(NSUInteger data);
/// CGFloat 是一个平台相关的类型，它在 32 位系统上是 float 类型，而在 64 位系统上是 double 类型。
/// 因此，直接将 CGFloat 封装为 NSNumber 时，需要根据平台的不同选择正确的 NSNumber 方法。
typedef __kindof NSNumber *_Nullable(^JobsRetNumberByCGFloatBlock)(CGFloat data);
#pragma mark —— 关于字符串
typedef __kindof NSString *_Nullable(^JobsRetStrByVoidBlock)(void);
typedef __kindof NSString *_Nullable(^JobsRetStrByBOOLBlock)(BOOL data);
typedef __kindof NSString *_Nullable(^JobsRetStrByCGFloatBlock)(CGFloat data);
typedef __kindof NSString *_Nullable(^JobsRetStrByUIntegerBlock)(NSUInteger data);
typedef __kindof NSString *_Nullable(^JobsRetStrByIntegerBlock)(NSInteger data);
typedef __kindof NSString *_Nullable(^JobsRetStrByIntegersBlock)(NSInteger data, ...);
typedef __kindof NSString *_Nullable(^JobsRetStrByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof NSString *_Nullable(^JobsRetStrByTimeIntervalsBlock)(NSTimeInterval data, ...);
typedef __kindof NSString *_Nullable(^JobsRetStrByRangeBlock)(NSRange data);
typedef __kindof NSString *_Nullable(^JobsRetStrByCGPointBlock)(CGPoint data);
typedef __kindof NSString *_Nullable(^JobsRetStrByCharBlock)(char *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByIDBlock)(id _Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByDataBlock)(__kindof NSData *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByDicBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByURLBlock)(NSURL *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByDateBlock)(NSDate *_Nullable date);
typedef __kindof NSString *_Nullable(^JobsRetStrByCorBlock)(UIColor *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByImageBlock)(UIImage *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByCharacterSetBlock)(NSCharacterSet *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByDateFormatterBlock)(NSDateFormatter *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByArrAndNSIntegerBlock)(Jobs_NSStringBlock_1_Arguments);
typedef __kindof NSString *_Nullable(^JobsRetStrByTimeIntervalAndDateFormatterBlock)(Jobs_NSStringBlock_2_Arguments);
typedef __kindof NSString *_Nullable(^JobsRetStrByStrsBlock)(Jobs_NSStringBlock_3_Arguments);
#pragma mark —— 关于 NSRegularExpression
typedef __kindof NSRegularExpression *_Nullable(^JobsRetRegularExpressionByStrBlock)(NSString *_Nullable data);
#pragma mark —— 关于时间（格式）/日历/计时器/间隔时间
/// UNNotificationSound
typedef __kindof UNNotificationSound *_Nullable(^JobsRetNotificationSoundByVoidBlock)(void);
typedef __kindof UNNotificationSound *_Nullable(^JobsRetNotificationSoundByStrBlock)(NSString *_Nullable data);
typedef __kindof UNNotificationSound *_Nullable(^JobsRetNotificationSoundByCGFloatBlock)(CGFloat data);
/// CADisplayLink
typedef __kindof CADisplayLink *_Nullable(^JobsRetCADisplayLinkByVoidBlock)(void);
typedef __kindof CADisplayLink *_Nullable(^JobsRetCADisplayLinkByBOOLBlock)(BOOL data);
typedef __kindof CADisplayLink *_Nullable(^JobsRetCADisplayLinkByNSIntegerBlock)(NSInteger data);
#if defined(__IPHONE_15_0)
typedef __kindof CADisplayLink *_Nullable(^JobsRetCADisplayLinkByCAFrameRateRangeBlock)(CAFrameRateRange data) API_AVAILABLE(ios(15.0));
#endif
/// NSDateFormatter
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByVoidBlock)(void);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByBOOLBlock)(BOOL data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByDateFormatterStyleBlock)(NSDateFormatterStyle data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByDateFormatterBehaviorBlock)(NSDateFormatterBehavior data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByStrBlock)(NSString *_Nullable);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByLocaleBlock)(NSLocale *_Nullable data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByTimeZoneBlock)(NSTimeZone *_Nullable data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByCalendarBlock)(NSCalendar *_Nullable data);
/// NSTimer
typedef __kindof NSTimer *_Nullable(^JobsRetTimerByVoidBlock)(void);
typedef __kindof NSTimer *_Nullable(^JobsRetTimerByTimerBlock)(NSTimer *_Nullable timer);
/// NSCalendar
typedef __kindof NSCalendar *_Nullable(^JobsRetFSCalendarByGetGregorianBlock)(void);
typedef __kindof NSCalendar *_Nullable(^JobsRetCalendarByCalendarIdentifierBlock)(NSCalendarIdentifier _Nullable data);
typedef __kindof NSCalendar *_Nullable(^JobsRetCalendarByNSUIntegerBlock)(NSUInteger data);
/// UNCalendarNotificationTrigger
typedef __kindof UNCalendarNotificationTrigger *_Nullable(^JobsRetCalendarNotificationTriggerByComponentsBlock)(NSDateComponents *_Nullable data);
/// NSTimeInterval
typedef NSTimeInterval(^JobsRetTimeIntervalByDateBlock)(NSDate *_Nullable data);
/// NSTimeZone
typedef NSTimeZone *_Nullable(^JobsRetTimeZoneByVoidBlock)(void);
typedef NSTimeZone *_Nullable(^JobsRetTimeZoneByStrBlock)(__kindof NSString *_Nullable data);
typedef NSTimeZone *_Nullable(^JobsRetTimeZoneByIntegerBlock)(NSInteger data);
#pragma mark —— 关于URL
typedef NSURL *_Nullable(^JobsRetURLByStrBlock)(__kindof NSString *_Nullable data);
typedef NSURL *_Nullable(^JobsRetURLByURLBlock)(NSURL *_Nullable data);
typedef NSURL *_Nullable(^JobsRetURLByVoidBlock)(void);
typedef __kindof NSURLRequest *_Nullable(^JobsRetURLRequestByVoidBlock)(void);
typedef __kindof NSURLRequest *_Nullable(^JobsRetURLRequestByURLBlock)(NSURL *_Nullable url);
typedef __kindof NSMutableURLRequest *_Nullable(^JobsRetMutableURLRequestByURLBlock)(NSURL *_Nullable url);
typedef __kindof NSMutableURLRequest *_Nullable(^JobsRetMutableURLRequestByVoidBlock)(void);
#pragma mark —— 关于相册
typedef PHAsset *_Nullable(^JobsRetAssetByStrBlock)(NSString *_Nullable Key);
#pragma mark —— 关于NSData
typedef __kindof NSData *_Nullable(^JobsRetDataByVoidBlock)(void);
typedef __kindof NSData *_Nullable(^JobsRetDataByIDBlock)(id _Nullable data);
typedef __kindof NSData *_Nullable(^JobsRetDataByNSUIntegerBlock)(NSUInteger data);
typedef __kindof NSData *_Nullable(^JobsRetDataByDataBlock)(__kindof NSData *_Nullable data);
typedef __kindof NSData *_Nullable(^JobsRetDataByImageBlock)(UIImage *_Nullable data);
typedef __kindof NSData *_Nullable(^JobsRetDataByFloatBlock)(CGFloat data);
typedef __kindof NSData *_Nullable(^JobsRetDataByURLBlock)(NSURL *_Nullable data);
typedef __kindof NSData *_Nullable(^JobsRetDataByAssetBlock)(AVAsset *_Nullable asset);
typedef __kindof NSData *_Nullable(^JobsRetDataByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSData *_Nullable(^JobsRetDataByDicBlock)(__kindof NSDictionary *_Nullable data);
#pragma mark —— 关于NSDate
typedef __kindof NSDate *_Nullable(^JobsRetDateByVoidBlock)(void);
typedef __kindof NSDate *_Nullable(^JobsRetDateByNSIntegerBlock)(NSInteger data);
typedef __kindof NSDate *_Nullable(^JobsRetDateByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof NSDate *_Nullable(^JobsRetDateByDateBlock)(NSDate *_Nullable data);
typedef __kindof NSDate *_Nullable(^JobsRetDateByStrBlock)(NSString *_Nullable data);
typedef __kindof NSDate *_Nullable(^JobsRetDateByDateFormatterBlock)(NSDateFormatter *_Nullable data);
typedef __kindof NSDate *_Nullable(^JobsRetDateByDateComponentsBlock)(NSDateComponents *_Nullable data);
typedef __kindof NSDate *_Nullable(^JobsRetDateByIndexPathBlock)(NSIndexPath *_Nullable data);
#pragma mark —— 关于字体
typedef UIFont *_Nullable(^JobsRetFontByVoidBlock)(void);
typedef UIFont *_Nullable(^JobsRetFontByConfigurationTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer) API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
#pragma mark —— 关于颜色
typedef UIColor *_Nonnull(^JobsRetCorByCGFloatBlock)(CGFloat data);
typedef UIColor *_Nullable(^JobsRetCorByNSUIntegerBlock)(NSUInteger data);
typedef UIColor *_Nullable(^JobsRetCorByConfigTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer) API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
typedef UIColor *_Nullable(^JobsRetCorByHexBlock)(uint32_t hexValue);
typedef UIColor *_Nullable(^JobsRetCorByStrBlock)(NSString *_Nonnull cor);
typedef UIColor *_Nullable(^JobsRetCorByImageBlock)(UIImage *_Nonnull cor);
typedef UIColor *_Nullable(^JobsRetFSCalendarCellByColorForCurrentStateInDictionaryBlock)(NSDictionary *_Nullable data);
typedef UIColor *_Nullable(^JobsRetCorByHexAlphaBlock)(Jobs_UIColorBlock_Arguments);
#pragma mark —— 关于图片
typedef UIImage *_Nonnull(^JobsRetImageByVoidBlock)(void);
typedef UIImage *_Nonnull(^JobsRetImageByAlphaBlock)(CGFloat alpha);
typedef UIImage *_Nullable(^JobsRetImageByNSUIntegerBlock)(NSUInteger data);
typedef UIImage *_Nullable(^JobsRetImageByNSIntegerBlock)(NSInteger data);
typedef UIImage *_Nonnull(^JobsRetImageByFrameBlock)(CGRect frame);
typedef UIImage *_Nonnull(^JobsRetImageByCGSizeBlock)(CGSize size);
typedef UIImage *_Nonnull(^JobsRetImageByAVURLAssetBlock)(AVURLAsset *_Nonnull data);
typedef UIImage *_Nonnull(^JobsRetImageByViewBlock)(__kindof UIView *_Nonnull data);
typedef UIImage *_Nullable(^JobsRetImageByImageBlock)(UIImage *_Nullable data);
typedef UIImage *_Nullable(^JobsRetImageByCorBlock)(UIColor *_Nullable data);
typedef UIImage *_Nullable(^JobsRetImageByDataBlock)(__kindof NSData *_Nullable data);
typedef UIImage *_Nonnull(^JobsRetImageByCGImageRefBlock)(CGImageRef _Nullable data);
typedef UIImage *_Nullable(^JobsRetImageByStrBlock)(__kindof NSString *_Nullable data);
#pragma mark —— 关于段落配置
typedef __kindof NSParagraphStyle *_Nullable(^JobsRetParagraphStyleByVoidBlock)(void);
typedef __kindof NSParagraphStyle *_Nullable(^JobsRetParagraphStyleByTextAlignmentBlock)(NSTextAlignment data);
#pragma mark —— 关于 动画
/// CAAnimation
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByVoidBlock)(void);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByFloatBlock)(float data);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByBOOLBlock)(BOOL data);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByCAMediaTimingFillModeBlock)(CAMediaTimingFillMode _Nullable data);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByCAMediaTimingFunctionBlock)(CAMediaTimingFunction *_Nullable data);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByDelegateBlock)(id<CAAnimationDelegate> _Nullable delegate);
/// CAKeyframeAnimation
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByIDBlock)(id _Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCAAnimationCalculationModeBlock)(CAAnimationCalculationMode _Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCAAnimationRotationModeBlock)(CAAnimationRotationMode _Nullable data);
/// CABasicAnimation
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByBOOLBlock)(BOOL data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByFloatBlock)(float data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByCAMediaTimingFillModeBlock)(CAMediaTimingFillMode _Nullable data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByIDBlock)(id _Nullable data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByStrBlock)(NSString *_Nullable data);
/// CAPropertyAnimation
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByBOOLBlock)(BOOL data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByStrBlock)(NSString *_Nullable data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByCAValueFunctionBlock)(CAValueFunction *_Nullable data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByCAPropertyAnimationBlock)(__kindof CAPropertyAnimation *_Nullable animation);
#pragma mark —— 关于 JavaScript
typedef JSValue *_Nullable(^JobsRetJSValueByStrBlock)(NSString *_Nullable jsCode);
#pragma mark —— 关于 UIImpactFeedbackGenerator
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsRetImpactFeedbackGeneratorByVoidBlock)(void);
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsRetImpactFeedbackGeneratorByNSIntegerBlock)(NSInteger data);
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsRetImpactFeedbackGeneratorByViewBlock)(__kindof UIView *_Nullable view);
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsRetImpactFeedbackGeneratorByCGFloatBlock)(CGFloat data);
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsRetImpactFeedbackGeneratorByCGPointBlock)(CGPoint data);
#pragma mark —— 关于 PHAssetCollectionChangeRequest
typedef __kindof PHAssetCollectionChangeRequest *_Nonnull(^JobsRetPHAssetCollectionChangeRequestByPHAssetCollectionBlock)(__kindof PHAssetCollection *_Nullable data);
typedef __kindof PHAssetCollectionChangeRequest *_Nonnull(^JobsRetPHAssetCollectionChangeRequestByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof PHAssetCollectionChangeRequest *_Nullable(^JobsRetPHAssetCollectionChangeRequestByIDBlock)(id<NSFastEnumeration> _Nullable data);
#pragma mark —— 关于 PHFetchResult
typedef __kindof PHFetchResult <__kindof PHCollection *>*_Nonnull(^JobsRetPHFetchResultWithPHCollectionByPHFetchOptionsBlock)(__kindof PHFetchOptions *_Nullable options);
typedef __kindof PHFetchResult <PHAsset *>*_Nonnull(^JobsRetPHFetchResultWithPHAssetByPHFetchOptionsBlock)(__kindof PHFetchOptions *_Nullable options);
#pragma mark —— 关于位置
/// NSRange
typedef NSRange (^JobsRetRangeByVoidBlock)(void);
typedef NSRange (^JobsRetRangeByIntegerBlock)(NSInteger data);
typedef NSRange (^JobsRetRangeByStrBlock)(NSString *_Nullable data);
typedef NSRange (^JobsRetRangeByTextCheckingResultBlock)(NSTextCheckingResult *_Nullable data);
/// UIEdgeInsets
typedef UIEdgeInsets(^JobsRetUIEdgeInsetsByVoidBlock)(void);
typedef UIEdgeInsets(^JobsRetUIEdgeInsetsByIDBlock)(id _Nullable data);
/// CGSize
typedef CGSize(^JobsRetCGSizeByVoidBlock)(void);
typedef CGSize(^JobsRetCGSizeByArrBlock)(NSArray *_Nullable data);
typedef CGSize(^JobsRetCGSizeByIDBlock)(id _Nullable data);
typedef CGSize(^JobsRetSizeByBOOLBlock)(BOOL data);
typedef CGSize(^JobsRetSizeByIntBlock)(int data);
typedef CGSize(^JobsRetSizeByLongBlock)(long data);
typedef CGSize(^JobsRetSizeByNSIntegerBlock)(NSInteger data);
typedef CGSize(^JobsRetSizeByUIntegerBlock)(NSUInteger data);
typedef CGSize(^JobsRetSizeByCGFloatBlock)(CGFloat data);
typedef CGSize(^JobsRetSizeByFloatBlock)(float data);
typedef CGSize(^JobsRetSizeByDoubleBlock)(double data);
typedef CGSize(^JobsRetSizeByShortBlock)(short data);
typedef CGSize(^JobsRetSizeByCharBlock)(char data);
typedef CGSize(^JobsRetSizeByUnsignedIntBlock)(unsigned int data);
typedef CGSize(^JobsRetSizeByUnsignedCharBlock)(unsigned char data);
typedef CGSize(^JobsRetSizeByUnsignedShortBlock)(unsigned short data);
typedef CGSize(^JobsRetSizeByUnsignedLongBlock)(unsigned long data);
typedef CGSize(^JobsRetSizeByUnsignedLongLongBlock)(unsigned long long data);
/// CGRect
typedef CGRect(^JobsRetFrameByVoidBlock)(void);
typedef CGRect(^JobsRetFrameByNSIntegerBlock)(NSInteger data);
typedef CGRect(^JobsRetFrameByUIntegerBlock)(NSUInteger data);
typedef CGRect(^JobsRetFrameByCGFloatBlock)(CGFloat data);
typedef CGRect(^JobsRetFrameByBOOLBlock)(BOOL data);
typedef CGRect(^JobsRetFrameByIntBlock)(int data);
typedef CGRect(^JobsRetFrameByLongBlock)(long data);
typedef CGRect(^JobsRetFrameByShortBlock)(short data);
typedef CGRect(^JobsRetFrameByFloatBlock)(float data);
typedef CGRect(^JobsRetFrameByDoubleBlock)(double data);
typedef CGRect(^JobsRetFrameByCharBlock)(char data);
typedef CGRect(^JobsRetFrameByUnsignedIntBlock)(unsigned int data);
typedef CGRect(^JobsRetFrameByUnsignedShortBlock)(unsigned short data);
typedef CGRect(^JobsRetFrameByUnsignedCharBlock)(unsigned char data);
typedef CGRect(^JobsRetFrameByUnsignedLongBlock)(unsigned long data);
typedef CGRect(^JobsRetFrameByUnsignedLongLongBlock)(unsigned long long data);
typedef CGRect(^JobsRetFrameByCGPointBlock)(CGPoint point);
typedef CGRect(^JobsRetFrameByCGSizeBlock)(CGSize size);
typedef CGRect(^JobsRetFrameByIDBlock)(id _Nullable data);
typedef CGRect(^JobsRetFrameByArrBlock)(__kindof NSArray <__kindof UIView *>*_Nullable arr);
typedef CGRect(^JobsRetFrameByViewBlock)(__kindof UIView *_Nonnull data);
typedef CGRect(^JobsRetFSCalendarByFrameForDateBlock)(NSDate *_Nullable data);
typedef CGRect(^JobsRetFrameByCGFloatAndUIViewBlock)(Jobs_ReturnCGRectByCGFloatAndUIViewBlock_Arguments);
/// CGPoint
typedef CGPoint(^JobsRetCGPointByVoidBlock)(void);
typedef CGPoint(^JobsRetCGPointByViewBlock)(__kindof UIView *_Nullable data);
typedef CGPoint(^JobsRetCGPointByBOOLBlock)(BOOL data);
typedef CGPoint(^JobsRetCGPointByIntBlock)(int data);
typedef CGPoint(^JobsRetCGPointByFloatBlock)(float data);
typedef CGPoint(^JobsRetCGPointByDoubleBlock)(double data);
typedef CGPoint(^JobsRetCGPointByShortBlock)(short data);
typedef CGPoint(^JobsRetCGPointByLongBlock)(long data);
typedef CGPoint(^JobsRetCGPointByCharBlock)(char data);
typedef CGPoint(^JobsRetCGPointByUnsignedIntBlock)(unsigned int data);
typedef CGPoint(^JobsRetCGPointByUnsignedCharBlock)(unsigned char data);
typedef CGPoint(^JobsRetCGPointByUnsignedShortBlock)(unsigned short data);
typedef CGPoint(^JobsRetCGPointByUnsignedLongBlock)(unsigned long data);
typedef CGPoint(^JobsRetCGPointByUnsignedLongLongBlock)(unsigned long long data);
typedef CGPoint(^JobsRetCGPointByNSIntegerBlock)(NSInteger data);
typedef CGPoint(^JobsRetCGPointByUIntegerBlock)(NSUInteger data);
typedef CGPoint(^JobsRetCGPointByCGFloatBlock)(CGFloat data);
typedef CGPoint(^JobsRetCGPointByIDBlock)(id _Nullable data);
/// https://github.com/texturegroup/texture
#pragma mark —— 关于 Texture
/// ASDisplayNode
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByFrameBlock)(CGRect data);
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByColorBlock)(UIColor *_Nullable data);
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByCGFloatBlock)(CGFloat data);
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByBOOLBlock)(BOOL data);
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByIntegerBlock)(NSInteger data);
/// ASButtonNode
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByCornerRadiusBlock)(CGFloat radius);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByHitTestSlopBlock)(UIEdgeInsets slop);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByContentEdgeInsetsBlock)(UIEdgeInsets insets);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByOnClickBlock)(jobsByButtonNodeBlock _Nullable handler);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByOnLongPressBlock)(jobsByButtonNodeLongPressBlock _Nullable handler);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByBackgroundColorsBlock)(UIColor *_Nullable color);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeImageByConfigBlock)(Jobs_ButtonNode_Image_State_Arguments);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByOnLongPressWithTimeBlock)(Jobs_ButtonNode_LongPressTime_Arguments);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByTitleConfigBlock)(Jobs_ButtonNode_Title_Font_Color_State_Arguments);
/// ASStackLayoutSpec
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecBySpacingBlock)(CGFloat spacing);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByLineSpacingBlock)(CGFloat lineSpacing);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByConcurrentBlock)(BOOL concurrent);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByUnsignedCharBlock)(unsigned char dir);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByChildrenBlock)(NSArray<id<ASLayoutElement>> *_Nullable children);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByAppendChildrenBlock)(NSArray<id<ASLayoutElement>> *_Nullable children);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByAddChildBlock)(id<ASLayoutElement> _Nullable child);
/// ASEditableTextNode
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByBoolBlock)(BOOL flag);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByRangeBlock)(NSRange range);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByUIntBlock)(NSUInteger value);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByInsetsBlock)(UIEdgeInsets insets);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByReturnKeyBlock)(UIReturnKeyType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByKeyboardTypeBlock)(UIKeyboardType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeBySpellBlock)(UITextSpellCheckingType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByAutocorrBlock)(UITextAutocorrectionType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodByeAutocapBlock)(UITextAutocapitalizationType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByKeyboardAppearanceBlock)(UIKeyboardAppearance t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByAttrTextBlock)(NSAttributedString *_Nullable attrText);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByDictBlock)(NSDictionary<NSString*, id> *_Nullable dict);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByTextViewBlock)(jobsByTextViewBlock _Nullable cfg);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByOnChangeBlock)(JobsEditableTextEventBlock _Nullable handler);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByOnBeginBlock)(JobsEditableTextEventBlock _Nullable handler);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByOnEndBlock)(JobsEditableTextEventBlock _Nullable handler);
/// ASCollectionNode
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByVoidBlock)(void);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByBoolBlock)(BOOL flag);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByCGFloatBlock)(CGFloat value);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByInsetsBlock)(UIEdgeInsets insets);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByPointBlock)(CGPoint point);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByReloadWithCompletionBlock)(dispatch_block_t _Nullable completion);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByLayoutBlock)(UICollectionViewLayout *_Nullable layout);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByInspectorBlock)(id<ASCollectionViewLayoutInspecting> _Nullable inspector);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByDelegateBlock)(id<ASCollectionDelegate> _Nullable delegate);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByDataSourceBlock)(id<ASCollectionDataSource> _Nullable dataSource);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByStringBlock)(NSString *_Nullable str);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByDispatchBlock)(dispatch_block_t _Nullable updates);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByBatchBlock)(Jobs_CollectionNode_Batch_Arguments);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeBySelectBlock)(Jobs_CollectionNode_Select_Arguments);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByDeselectBlock)(Jobs_CollectionNode_Deselect_Arguments);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByScrollToItemBlock)(Jobs_CollectionNode_ScrollToItem_Arguments);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByBatchAnimatedBlock)(Jobs_CollectionNode_BatchAnimated_Arguments);
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeByPointAnimatedBlock)(Jobs_CollectionNode_Point_Animated_Arguments);
/// ASCollectionNode
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeBySetTuningBlock)(Jobs_CollectionNode_SetTuning_Arguments);// ASLayoutRangeType
typedef __kindof ASCollectionNode *_Nonnull(^JobsRetCollectionNodeBySetTuningForModeBlock) (Jobs_CollectionNode_SetTuningForMode_Arguments); // ASLayoutRangeType
/// ASNetworkImageNode
typedef __kindof ASNetworkImageNode *_Nonnull(^JobsRetNetworkImageNodeByBOOLBlock)(BOOL on);
typedef __kindof ASNetworkImageNode *_Nonnull(^JobsRetNetworkImageNodeByDelegateBlock)(id<ASNetworkImageNodeDelegate> _Nullable delegate);
typedef __kindof ASNetworkImageNode *_Nonnull(^JobsRetNetworkImageNodeByImageBlock)(UIImage *_Nullable image);
typedef __kindof ASNetworkImageNode *_Nonnull(^JobsRetNetworkImageNodeByURLBlock)(NSURL *_Nullable URL);
#pragma mark —— 其他
typedef void *_Nullable(^JobsRetPointerByNSUIntegerBlock)(NSUInteger index);
typedef Class _Nullable(^JobsRetClassByBOOLBlock)(BOOL data);
/// UIEditMenuInteraction
typedef UIEditMenuInteraction *_Nullable(^JobsRetUIEditMenuInteractionByIDBlock)(id<UIEditMenuInteractionDelegate>_Nullable data) API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos) API_UNAVAILABLE(watchos);
/// UIContextMenuInteraction
typedef UIContextMenuInteraction *_Nonnull(^JobsRetContextMenuInteractionByIDBlock)(id <UIContextMenuInteractionDelegate>_Nullable delegate) API_AVAILABLE(ios(13.0), tvos(17.0)) API_UNAVAILABLE(watchos);
/// NSXMLParser
typedef __kindof NSXMLParser *_Nonnull(^JobsRetNSXMLParserByNSDataBlock)(__kindof NSData *_Nullable data);
/// PHAssetChangeRequest
typedef PHAssetChangeRequest *_Nonnull(^JobsRetPHAssetChangeRequestByURLBlock)(NSURL *_Nullable url);
/// AVAssetImageGenerator
typedef __kindof AVAssetImageGenerator *_Nonnull(^JobsRetAVAssetImageGeneratorByAVURLAssetBlock)(__kindof AVURLAsset *_Nullable data);
#pragma mark —— 系统 API 补齐
/// UILabel
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByBOOLBlock)(BOOL data);
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByCGFloatBlock)(CGFloat data);
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByNSIntegerBlock)(NSInteger data);
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByCGSizeBlock)(CGSize data);
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByUIColorBlock)(UIColor *_Nullable data);
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByNSAttributedStringBlock)(NSAttributedString *_Nullable data);
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByBaselineAdjustmentBlock)(UIBaselineAdjustment data);
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByLineBreakModeBlock)(NSLineBreakMode data);
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByVibrancyBlock)(UILabelVibrancy data) API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
typedef __kindof UILabel *_Nullable(^JobsRetUILabelByLineBreakStrategyBlock)(NSLineBreakStrategy data);
/// UITextField
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByTextContentTypeBlock)(UITextContentType _Nullable data);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByPasswordRulesBlock)(UITextInputPasswordRules *_Nullable data) API_AVAILABLE(ios(12.0));
/// UITextView
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByTextDragDelegateBlock)(id<UITextDragDelegate> _Nullable data) API_AVAILABLE(ios(11.0));
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByTextDropDelegateBlock)(id<UITextDropDelegate> _Nullable data) API_AVAILABLE(ios(11.0));
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByTextDragOptionsBlock)(UITextDragOptions data) API_AVAILABLE(ios(11.0));
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByWritingToolsBehaviorBlock)(UIWritingToolsBehavior data) API_AVAILABLE(ios(18.0), visionos(2.4)) API_UNAVAILABLE(tvos, watchos);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByWritingToolsResultOptionsBlock)(UIWritingToolsResultOptions data) API_AVAILABLE(ios(18.0), visionos(2.4)) API_UNAVAILABLE(tvos, watchos);
/// UICollectionView
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByReorderingCadenceBlock)(UICollectionViewReorderingCadence data) API_AVAILABLE(ios(11.0));
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewBySelfSizingInvalidationBlock)(UICollectionViewSelfSizingInvalidation data) API_AVAILABLE(ios(16.0), tvos(16.0)) API_UNAVAILABLE(watchos);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByCGPointBlock)(CGPoint data);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByIndexSetBlock)(NSIndexSet *_Nonnull data);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByArrBlock)(NSArray<NSIndexPath *> *_Nonnull data);
/// PDFView
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFInterpolationQualityBlock)(PDFInterpolationQuality data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFPageBlock)(PDFPage *_Nullable data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFDestinationBlock)(PDFDestination *_Nullable data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFSelectionBlock)(PDFSelection *_Nullable data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByArrBlock)(NSArray<PDFSelection *> *_Nullable data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFAreaOfInterestBlock)(PDFAreaOfInterest data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFActionBlock)(PDFAction *_Nullable data) API_AVAILABLE(ios(11.0));
/// NSDateFormatter
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByDateBlock)(NSDate *_Nullable data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByArrBlock)(NSArray<NSString *> *_Nullable data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByNSIntegerBlock)(NSInteger data);
#pragma mark —— 关于 NSIndexPath
typedef NSIndexPath *_Nonnull(^JobsRetIndexPathByXYBlock)(Jobs_ReturnIDByCenterBlock_Arguments);
typedef NSIndexPath *_Nullable(^JobsRetFSCalendarCalculatorByIndexPathForDateBlock)(NSDate *_Nullable data);
#pragma mark —— SDWebImage
/// UIButton
typedef __kindof UIButton *_Nullable (^JobsRetButBySDWebImageOptionsBlocks)(SDWebImageOptions options);
typedef __kindof UIButton *_Nullable (^JobsRetButBySDExternalCompletionBlocks)(SDExternalCompletionBlock _Nullable completionBlock);
typedef __kindof UIButton *_Nullable (^JobsRetButBySDImageLoaderProgressBlocks)(SDImageLoaderProgressBlock _Nullable progressBlock);
/// UIImageView
typedef __kindof UIImageView *_Nullable (^JobsRetImageViewBySDWebImageOptionsBlocks)(SDWebImageOptions options);
typedef __kindof UIImageView *_Nullable (^JobsRetImageViewBySDExternalCompletionBlocks)(SDExternalCompletionBlock _Nullable completionBlock);
typedef __kindof UIImageView *_Nullable (^JobsRetImageViewBySDImageLoaderProgressBlocks)(SDImageLoaderProgressBlock _Nullable progressBlock);
#pragma mark —— FSCalendar
/// FSCalendar
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByTimeZoneBlock)(NSTimeZone *_Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByDelegateBlock)(id<FSCalendarDelegate> _Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByDataSourceBlock)(id<FSCalendarDataSource> _Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByTodayBlock)(NSDate *_Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByCurrentPageBlock)(NSDate *_Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByLocaleBlock)(NSLocale *_Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByScrollDirectionBlock)(NSInteger data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByScopeBlock)(NSInteger data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByPlaceholderTypeBlock)(NSInteger data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByFirstWeekdayBlock)(NSUInteger data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByHeaderHeightBlock)(CGFloat data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByWeekdayHeightBlock)(CGFloat data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByCalendarWeekdayViewBlock)(FSCalendarWeekdayView *_Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByCalendarHeaderViewBlock)(FSCalendarHeaderView *_Nullable data);

typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByVoidBlock)(void);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByBOOLBlock)(BOOL data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByRowHeightBlock)(CGFloat data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByDateBlock)(NSDate *_Nullable data);
typedef __kindof FSCalendar *_Nullable(^JobsRetFSCalendarByPanGestureRecognizerBlock)(UIPanGestureRecognizer *_Nullable data);

typedef __kindof FSCalendarCalculator *_Nullable(^JobsRetFSCalendarByGetCalculatorBlock)(void);
typedef __kindof FSCalendarCollectionViewLayout *_Nullable(^JobsRetFSCalendarLayoutByVoidBlock)(void);
typedef __kindof FSCalendarCollectionView *_Nullable(^JobsRetFSCalendarCollectionViewByVoidBlock)(void);
typedef __kindof FSCalendarTransitionCoordinator *_Nullable(^JobsRetFSCalendarByGetTransitionCoordinatorBlock)(void);

typedef NSDate *_Nullable(^JobsRetFSCalendarByDateForCellBlock)(FSCalendarCell *_Nullable data);
typedef NSInteger(^JobsRetFSCalendarByMonthPositionForCellBlock)(FSCalendarCell *_Nullable data);
typedef NSArray<__kindof FSCalendarCell *> *_Nullable(^JobsRetFSCalendarByVisibleCellsBlock)(void);
/// JobsModel
typedef JobsResponseModel *_Nullable(^JobsRetResponseModelByYTKBaseRequestBlock)(YTKBaseRequest *_Nonnull request);
typedef __kindof UIButtonModel *_Nullable(^JobsRetBtnModelByStrAndImagesBlock)(Jobs_ReturnButtonModelByStringAndImagesBlock_Arguments);
/// FSCalendarAppearance
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarByGetAppearanceBlock)(void);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByTitleFontBlock)(UIFont *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceBySubtitleFontBlock)(UIFont *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByWeekdayFontBlock)(UIFont *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByHeaderTitleFontBlock)(UIFont *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByHeaderTitleOffsetBlock)(CGPoint data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByTitleOffsetBlock)(CGPoint data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceBySubtitleOffsetBlock)(CGPoint data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByEventOffsetBlock)(CGPoint data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByImageOffsetBlock)(CGPoint data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByEventDefaultColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByEventSelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByWeekdayTextColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByHeaderTitleColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByHeaderSeparatorColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByHeaderDateFormatBlock)(NSString *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByHeaderTitleAlignmentBlock)(NSTextAlignment data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByHeaderMinimumDissolvedAlphaBlock)(CGFloat data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByTitleDefaultColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByTitleSelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByTitleTodayColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByTitlePlaceholderColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByTitleWeekendColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceBySubtitleDefaultColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceBySubtitleSelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceBySubtitleTodayColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceBySubtitlePlaceholderColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceBySubtitleWeekendColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceBySelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByTodayColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByTodaySelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByBorderDefaultColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByBorderSelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByBorderRadiusBlock)(CGFloat data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByCaseOptionsBlock)(NSInteger data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceBySeparatorsBlock)(NSInteger data);
typedef __kindof FSCalendarAppearance *_Nullable(^JobsRetFSCalendarAppearanceByCalendarBlock)(FSCalendar *_Nullable data);
/// FSCalendarCell
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByTitleLabelBlock)(UILabel *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellBySubtitleLabelBlock)(UILabel *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByShapeLayerBlock)(CAShapeLayer *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByImageViewBlock)(UIImageView *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByEventIndicatorBlock)(FSCalendarEventIndicator *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPlaceholderBlock)(BOOL data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByCalendarBlock)(FSCalendar *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByAppearanceBlock)(FSCalendarAppearance *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellBySubtitleBlock)(NSString *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByImageBlock)(UIImage *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByMonthPositionBlock)(NSInteger data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByNumberOfEventsBlock)(NSInteger data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByDateIsTodayBlock)(BOOL data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByWeekendBlock)(BOOL data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredFillDefaultColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredFillSelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredTitleDefaultColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredTitleSelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredSubtitleDefaultColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredSubtitleSelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredBorderDefaultColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredBorderSelectionColorBlock)(UIColor *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredTitleOffsetBlock)(CGPoint data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredSubtitleOffsetBlock)(CGPoint data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredImageOffsetBlock)(CGPoint data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredEventOffsetBlock)(CGPoint data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredEventDefaultColorsBlock)(NSArray<UIColor *> *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredEventSelectionColorsBlock)(NSArray<UIColor *> *_Nullable data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPreferredBorderRadiusBlock)(CGFloat data);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByLayoutSubviewsBlock)(void);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByConfigureAppearanceBlock)(void);
typedef __kindof FSCalendarCell *_Nullable(^JobsRetFSCalendarCellByPerformSelectingBlock)(void);
/// FSCalendarEventIndicator
typedef __kindof FSCalendarEventIndicator *_Nullable(^JobsRetFSCalendarEventIndicatorByNumberOfEventsBlock)(NSInteger data);
typedef __kindof FSCalendarEventIndicator *_Nullable(^JobsRetFSCalendarEventIndicatorByColorBlock)(id _Nullable data);
/// FSCalendarBlankCell
typedef __kindof FSCalendarBlankCell *_Nullable(^JobsRetFSCalendarBlankCellByConfigureAppearanceBlock)(void);
/// FSCalendarCollectionView
typedef __kindof FSCalendarCollectionView *_Nullable(^JobsRetFSCalendarCollectionViewByInternalDelegateBlock)(id<FSCalendarCollectionViewInternalDelegate> _Nullable data);
/// FSCalendarCollectionViewLayout
typedef __kindof FSCalendarCollectionViewLayout *_Nullable(^JobsRetFSCalendarCollectionViewLayoutByCalendarBlock)(FSCalendar *_Nullable data);
typedef __kindof FSCalendarCollectionViewLayout *_Nullable(^JobsRetFSCalendarCollectionViewLayoutBySectionInsetsBlock)(UIEdgeInsets data);
typedef __kindof FSCalendarCollectionViewLayout *_Nullable(^JobsRetFSCalendarCollectionViewLayoutByScrollDirectionBlock)(UICollectionViewScrollDirection data);
typedef CGSize(^JobsRetFSCalendarCollectionViewLayoutByGetEstimatedItemSizeBlock)(void);
/// FSCalendarCalculator
typedef __kindof FSCalendarCalculator *_Nullable(^JobsRetFSCalendarCalculatorByCalendarBlock)(FSCalendar *_Nullable data);
typedef NSValue *_Nullable(^JobsRetFSCalendarCalculatorByCoordinateForIndexPathBlock)(NSIndexPath *_Nullable data);
typedef __kindof FSCalendarCalculator *_Nullable(^JobsRetFSCalendarCalculatorByReloadSectionsBlock)(void);
/// FSCalendarDelegationProxy
typedef __kindof FSCalendarDelegationProxy *_Nullable(^JobsRetFSCalendarDelegationProxyByDelegationBlock)(id _Nullable data);
typedef __kindof FSCalendarDelegationProxy *_Nullable(^JobsRetFSCalendarDelegationProxyByProtocolBlock)(Protocol *_Nullable data);
typedef __kindof FSCalendarDelegationProxy *_Nullable(^JobsRetFSCalendarDelegationProxyByDeprecationsBlock)(NSDictionary<NSString *,NSString *> *_Nullable data);
typedef SEL _Nullable(^JobsRetFSCalendarDelegationProxyByDeprecatedSelectorOfSelectorBlock)(SEL _Nullable data);
/// FSCalendarHeaderView
typedef __kindof FSCalendarHeaderView *_Nullable(^JobsRetFSCalendarHeaderViewByVoidBlock)(void);
typedef __kindof FSCalendarHeaderView *_Nullable(^JobsRetFSCalendarHeaderViewByScrollEnabledBlock)(BOOL data);
typedef __kindof FSCalendarHeaderView *_Nullable(^JobsRetFSCalendarHeaderViewBySetScrollOffsetBlock)(CGFloat data);
typedef __kindof FSCalendarHeaderView *_Nullable(^JobsRetFSCalendarHeaderViewByScrollDirectionBlock)(UICollectionViewScrollDirection data);
typedef __kindof FSCalendarHeaderView *_Nullable(^JobsRetFSCalendarHeaderViewByCollectionViewBlock)(FSCalendarCollectionView *_Nullable data);
typedef __kindof FSCalendarHeaderView *_Nullable(^JobsRetFSCalendarHeaderViewByCollectionViewLayoutBlock)(FSCalendarHeaderLayout *_Nullable data);
typedef __kindof FSCalendarHeaderView *_Nullable(^JobsRetFSCalendarHeaderViewByCalendarBlock)(FSCalendar *_Nullable data);
/// FSCalendarWeekdayView
typedef __kindof FSCalendarWeekdayView *_Nullable(^JobsRetFSCalendarWeekdayViewByConfigureAppearanceBlock)(void);
typedef __kindof FSCalendarWeekdayView *_Nullable(^JobsRetFSCalendarWeekdayViewByCalendarBlock)(FSCalendar *_Nullable data);
/// FSCalendarHeaderCell
typedef __kindof FSCalendarHeaderCell *_Nullable(^JobsRetFSCalendarHeaderCellByTitleLabelBlock)(UILabel *_Nullable data);
typedef __kindof FSCalendarHeaderCell *_Nullable(^JobsRetFSCalendarHeaderCellByHeaderBlock)(FSCalendarHeaderView *_Nullable data);
/// FSCalendarHeaderTouchDeliver
typedef __kindof FSCalendarHeaderTouchDeliver *_Nullable(^JobsRetFSCalendarHeaderTouchDeliverByCalendarBlock)(FSCalendar *_Nullable data);
typedef __kindof FSCalendarHeaderTouchDeliver *_Nullable(^JobsRetFSCalendarHeaderTouchDeliverByHeaderBlock)(FSCalendarHeaderView *_Nullable data);
/// FSCalendarStickyHeader
typedef __kindof FSCalendarStickyHeader *_Nullable(^JobsRetFSCalendarStickyHeaderByCalendarBlock)(FSCalendar *_Nullable data);
typedef __kindof FSCalendarStickyHeader *_Nullable(^JobsRetFSCalendarStickyHeaderByTitleLabelBlock)(UILabel *_Nullable data);
typedef __kindof FSCalendarStickyHeader *_Nullable(^JobsRetFSCalendarStickyHeaderByMonthBlock)(NSDate *_Nullable data);
typedef __kindof FSCalendarStickyHeader *_Nullable(^JobsRetFSCalendarStickyHeaderByConfigureAppearanceBlock)(void);
/// FSCalendarTransitionCoordinator
typedef __kindof FSCalendarTransitionCoordinator *_Nullable(^JobsRetFSCalendarTransitionCoordinatorByStateBlock)(NSInteger data);
typedef __kindof FSCalendarTransitionCoordinator *_Nullable(^JobsRetFSCalendarTransitionCoordinatorByCachedMonthSizeBlock)(CGSize data);
typedef __kindof FSCalendarTransitionCoordinator *_Nullable(^JobsRetFSCalendarTransitionCoordinatorByHandleScopeGestureBlock)(id _Nullable data);
/// FSCalendarTransitionAttributes
typedef __kindof FSCalendarTransitionAttributes *_Nullable(^JobsRetFSCalendarTransitionAttributesBySourceBoundsBlock)(CGRect data);
typedef __kindof FSCalendarTransitionAttributes *_Nullable(^JobsRetFSCalendarTransitionAttributesByTargetBoundsBlock)(CGRect data);
typedef __kindof FSCalendarTransitionAttributes *_Nullable(^JobsRetFSCalendarTransitionAttributesBySourcePageBlock)(NSDate *_Nullable data);
typedef __kindof FSCalendarTransitionAttributes *_Nullable(^JobsRetFSCalendarTransitionAttributesByTargetPageBlock)(NSDate *_Nullable data);
typedef __kindof FSCalendarTransitionAttributes *_Nullable(^JobsRetFSCalendarTransitionAttributesByFocusedRowBlock)(NSInteger data);
typedef __kindof FSCalendarTransitionAttributes *_Nullable(^JobsRetFSCalendarTransitionAttributesByFocusedDateBlock)(NSDate *_Nullable data);
typedef __kindof FSCalendarTransitionAttributes *_Nullable(^JobsRetFSCalendarTransitionAttributesByTargetScopeBlock)(NSInteger data);
typedef __kindof FSCalendarTransitionAttributes *_Nullable(^JobsRetFSCalendarTransitionAttributesByRevertBlock)(void);
#pragma mark —— ReactiveObjC
/// RACSignal
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByVoidBlock)(void);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByIDBlock)(id _Nullable data);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByNSErrorBlock)(NSError *_Nullable error);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACSignalBlock)(__kindof RACSignal *_Nullable signal);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACSubjectBlock)(__kindof RACSubject *_Nullable subject);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACSchedulerBlock)(__kindof RACScheduler *_Nullable scheduler);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByNSUIntegerBlock)(NSUInteger data);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByNSIntegerBlock)(NSInteger data);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACNextBlock)(jobsByIDBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACErrorBlock)(jobsByErrBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACCompletedBlock)(jobsByVoidBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACSignalProviderBlock)(JobsRetRACSignalByVoidBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRACSignalBindResultBlock)(Jobs_ID_BOOLPointer_Arguments);
typedef JobsRACSignalBindResultBlock _Nullable(^JobsRACSignalBindBlockProvider)(void);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACBindBlockProviderBlock)(JobsRACSignalBindBlockProvider _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACSignalValueBlock)(JobsRetRACSignalByIDBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACSignalErrorBlock)(JobsRetRACSignalByNSErrorBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACBoolPredicateBlock)(JobsRetBOOLByIDBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACIDTransformBlock)(JobsRetIDByRACValueBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACIDErrorTransformBlock)(JobsRetIDByIDNSErrorPointerBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACBoolErrorPredicateBlock)(JobsRetBOOLByIDNSErrorPointerBlock _Nullable block);
typedef __kindof RACSignal *_Nullable(^JobsRetRACSignalByRACSubscriberBlock)(id<RACSubscriber> _Nullable subscriber);
/// id
typedef id _Nullable(^JobsRetIDByRACDisposableBlock)(__kindof RACDisposable *_Nullable disposable);
/// RACDisposable
typedef __kindof RACDisposable *_Nullable(^JobsRetRACDisposableByVoidBlock)(void);
typedef __kindof RACDisposable *_Nullable(^JobsRetRACDisposableByVoidCallbackBlock)(jobsByVoidBlock _Nullable block);
typedef __kindof RACDisposable *_Nullable(^JobsRetRACDisposableByRACNextBlock)(jobsByIDBlock _Nullable block);
typedef __kindof RACDisposable *_Nullable(^JobsRetRACDisposableByRACErrorBlock)(jobsByErrBlock _Nullable block);
typedef __kindof RACDisposable *_Nullable(^JobsRetRACDisposableByRACCompletedBlock)(jobsByVoidBlock _Nullable block);
typedef __kindof RACDisposable *_Nullable(^JobsRetRACDisposableByRACSubscriberBlock)(id<RACSubscriber> _Nullable subscriber);
/// RACScopedDisposable
typedef __kindof RACScopedDisposable *_Nullable(^JobsRetRACScopedDisposableByVoidBlock)(void);
typedef __kindof RACScopedDisposable *_Nullable(^JobsRetRACScopedDisposableByRACDisposableBlock)(__kindof RACDisposable *_Nullable disposable);
/// RACCompoundDisposable
typedef __kindof RACCompoundDisposable *_Nullable(^JobsRetRACCompoundDisposableByVoidBlock)(void);
typedef __kindof RACCompoundDisposable *_Nullable(^JobsRetRACCompoundDisposableByArrBlock)(__kindof NSArray *_Nullable disposables);
typedef __kindof RACCompoundDisposable *_Nullable(^JobsRetRACCompoundDisposableByRACDisposableBlock)(__kindof RACDisposable *_Nullable disposable);
/// RACCommand
typedef __kindof RACCommand *_Nullable(^JobsRetRACCommandByRACSignalValueBlock)(JobsRetRACSignalByIDBlock _Nullable block);
typedef __kindof RACCommand *_Nullable(^JobsRetRACCommandByBOOLBlock)(BOOL data);
/// RACSubject
typedef __kindof RACSubject *_Nullable(^JobsRetRACSubjectByVoidBlock)(void);
typedef __kindof RACSubject *_Nullable(^JobsRetRACSubjectByIDBlock)(id _Nullable data);
typedef __kindof RACSubject *_Nullable(^JobsRetRACSubjectByNSErrorBlock)(NSError *_Nullable error);
/// RACReplaySubject
typedef __kindof RACReplaySubject *_Nullable(^JobsRetRACReplaySubjectByNSUIntegerBlock)(NSUInteger capacity);
/// RACMulticastConnection
typedef __kindof RACMulticastConnection *_Nullable(^JobsRetRACMulticastConnectionByVoidBlock)(void);
typedef __kindof RACMulticastConnection *_Nullable(^JobsRetRACMulticastConnectionByRACSubjectBlock)(__kindof RACSubject *_Nullable subject);
/// RACScheduler
typedef __kindof RACScheduler *_Nullable(^JobsRetRACSchedulerByVoidBlock)(void);
typedef __kindof RACScheduler *_Nullable(^JobsRetRACSchedulerByNSIntegerBlock)(NSInteger priority);
/// RACDisposable
typedef __kindof RACDisposable *_Nullable(^JobsRetRACDisposableByVoidCallbackForSchedulerBlock)(jobsByVoidBlock _Nullable block);
typedef __kindof RACDisposable *_Nullable(^JobsRetRACDisposableBySchedulerRecursiveBlock)(jobsByRACSchedulerRecursiveBlock _Nullable block);
/// RACSequence
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByVoidBlock)(void);
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByIDBlock)(id _Nullable data);
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByRACSequenceBlock)(__kindof RACSequence *_Nullable sequence);
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByNSUIntegerBlock)(NSUInteger data);
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByRACSchedulerBlock)(__kindof RACScheduler *_Nullable scheduler);
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByRACBoolPredicateBlock)(JobsRetBOOLByIDBlock _Nullable block);
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByRACIDTransformBlock)(JobsRetIDByRACValueBlock _Nullable block);
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByRACSequenceProviderBlock)(JobsRetRACSequenceByVoidBlock _Nullable block);
typedef __kindof RACSequence *_Nullable(^JobsRACSequenceBindResultBlock)(Jobs_ID_BOOLPointer_Arguments);
typedef JobsRACSequenceBindResultBlock _Nullable(^JobsRACSequenceBindBlockProvider)(void);
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByRACBindBlockProviderBlock)(JobsRACSequenceBindBlockProvider _Nullable block);
typedef __kindof RACSequence *_Nullable(^JobsRetRACSequenceByRACSequenceValueBlock)(JobsRetRACSequenceByIDBlock _Nullable block);
/// RACTuple
typedef __kindof RACTuple *_Nullable(^JobsRetRACTupleByIDBlock)(id _Nullable data);
typedef __kindof RACTuple *_Nullable(^JobsRetRACTupleByArrBlock)(__kindof NSArray *_Nullable data);

typedef JobsRetIDByIDBlock _Nullable(^JobsRetIDByIDBlockByViewModelOthersProtocolID)(id<UIViewModelOthersProtocol> _Nullable data);
#pragma clang diagnostic pop
#endif /* ReturnByCertainParameters_h */

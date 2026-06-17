//
//  ReturnByCertainParametersBlock.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#import <Photos/Photos.h>
#import <UserNotifications/UserNotifications.h>
#import <PDFKit/PDFKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "JobsBlockDef.h"
#import "JobsBlockHeader.h"
#ifndef ReturnByCertainParameters_h
#define ReturnByCertainParameters_h
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
///【 确定入参个数 并且 有返回值的Block定义】
#pragma mark —— 关于 id
typedef id _Nullable(^JobsRetIDByVoidBlock)(void);
typedef id _Nullable(^JobsRetIDByCGSizeBlock)(CGSize size);
typedef id _Nullable(^JobsRetIDByFrameBlock)(CGRect frame);
typedef id _Nullable(^JobsRetIDByCGPointBlock)(CGPoint point);
typedef id _Nullable(^JobsRetIDByCGFloatBlock)(CGFloat data);
typedef id _Nullable(^JobsRetIDByIDBlock)(id _Nullable data);
typedef id _Nullable(^JobsRetIDByNotificationBlock)(NSNotification *_Nullable notification);
typedef id _Nullable(^JobsRetIDByObjBlock)(__kindof NSObject *_Nullable data);
typedef id _Nullable(^JobsRetIDByArrBlock)(__kindof NSArray *_Nullable data);
typedef id _Nullable(^JobsRetIDByDataBlock)(NSData *_Nullable data);
typedef id _Nullable(^JobsRetIDByStrBlock)(__kindof NSString *_Nullable data);
typedef id _Nonnull(^JobsRetIDBySaltStrBlock)(__kindof NSString *_Nullable salt);
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
#pragma mark —— 关于 NSPointerArray
typedef void *_Nullable(^JobsRetPointerByNSUIntegerBlock)(NSUInteger index);
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
/// 数组
typedef __kindof NSArray *_Nullable(^JobsRetArrByVoidBlock)(void);
typedef __kindof NSArray *_Nullable(^JobsRetArrByIDBlock)(id _Nullable data);
typedef __kindof NSArray *_Nullable(^JobsRetArrByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsRetArrByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsRetArrByIntegerBlock)(NSInteger data);
typedef NSMutableArray <__kindof NSObject *>*_Nullable(^JobsRetMutableArrayByVoidBlock)(void);
typedef NSMutableArray <__kindof NSObject *>*_Nullable(^JobsRetMutableArrayByIDBlock)(id _Nullable data);
typedef NSMutableArray <__kindof NSObject *>*_Nullable(^JobsRetMutableArrayByObjBlock)(__kindof NSObject *_Nullable data);
/// 字典
typedef __kindof NSDictionary *_Nullable(^JobsRetDicByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSDictionary *_Nullable(^JobsRetDicByDataBlock)(NSData *_Nullable data);
typedef __kindof NSDictionary *_Nullable(^JobsReturnDicByURLBlock)(NSURL *_Nullable url);
typedef NSMutableDictionary *_Nonnull(^JobsRetMutableDicByVoidBlock)(void);
typedef NSMutableDictionary *_Nonnull(^JobsRetMutableDicByDicBlock)(__kindof NSDictionary *_Nullable dic);
/// 集合
typedef __kindof NSSet *_Nullable(^JobsRetSetByIDBlock)(id _Nullable data);
typedef __kindof NSSet *_Nullable(^JobsRetSetByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSMutableSet *_Nullable(^JobsRetMutableSetByIDBlock)(id _Nullable data);
#pragma mark —— 关于 UIControl
typedef void(^JobsControlHandler)(__kindof UIControl *_Nonnull control);
typedef __kindof UIControl *_Nullable(^JobsRetControlByBOOLBlock)(BOOL data);
typedef __kindof UIControl *_Nullable(^JobsRetControlByEventsHandlerBlock)(UIControlEvents events,
                                                                           JobsControlHandler _Nullable handler);
typedef __kindof UIControl *_Nullable(^JobsRetControlByHandlerBlock)(JobsControlHandler _Nullable handler);
typedef __kindof UIControl *_Nullable(^JobsRetControlByAlignBlock)(UIControlContentHorizontalAlignment horizontal,
                                                                    UIControlContentVerticalAlignment vertical);
typedef __kindof UIControl *_Nullable(^JobsRetControlByHorizontalAlignBlock)(UIControlContentHorizontalAlignment horizontal);
typedef __kindof UIControl *_Nullable(^JobsRetControlByVerticalAlignBlock)(UIControlContentVerticalAlignment vertical);
typedef __kindof UIControl *_Nullable(^JobsRetControlByTargetActionEventsBlock)(__kindof id _Nullable target,
                                                                                SEL _Nullable action,
                                                                                UIControlEvents events);
typedef __kindof UIControl *_Nullable(^JobsRetControlByEventsBlock)(UIControlEvents events);
typedef __kindof UIControl *_Nullable(^JobsRetControlByActionEventsBlock)(UIAction *_Nonnull action,
                                                                          UIControlEvents events);
typedef __kindof UIControl *_Nullable(^JobsRetControlByIdentifierEventsBlock)(UIActionIdentifier _Nonnull identifier,
                                                                              UIControlEvents events);
typedef __kindof UIControl *_Nullable(^JobsRetControlByEventsIdentifierActionHandlerBlock)(UIControlEvents events,
                                                                                           UIActionIdentifier _Nullable identifier,
                                                                                           void(^ _Nonnull handler)(UIAction *_Nullable action));
/// 无参数（比如 performPrimaryAction）
typedef __kindof UIControl *_Nullable(^JobsRetControlByVoidBlock)(void);
/// 字符串（比如 toolTip）
typedef __kindof UIControl *_Nullable(^JobsRetControlByStringBlock)(NSString *_Nullable text);
#pragma mark —— 关于 NSBundle
typedef NSBundle *_Nullable(^JobsRetBundleByStrBlock)(__kindof NSString *_Nullable data);
typedef NSBundle *_Nullable(^JobsRetBundleByURLBlock)(NSURL *_Nullable data);
typedef NSBundle *_Nullable(^JobsRetBundleByClsBlock)(Class _Nullable data);
#pragma mark —— 关于 NSLocale
typedef NSLocale *_Nullable(^JobsRetLocaleByStrBlock)(__kindof NSString *_Nullable data);
#pragma mark —— 关于 NSValue
typedef NSValue *_Nullable(^JobsRetValueByVoidBlock)(void);
typedef NSValue *_Nullable(^JobsRetValueByCGFloatBlock)(CGFloat data);
typedef NSValue *_Nullable(^JobsRetValueByCGSizeBlock)(CGSize size);
typedef NSValue *_Nullable(^JobsRetValueByPointerBlock)(const void *_Nullable data);
typedef NSValue *_Nullable(^JobsRetValueByPointBlock)(CGPoint point);
typedef NSValue *_Nullable(^JobsRetValueByVectorBlock)(CGVector data);
typedef NSValue *_Nullable(^JobsRetValueByFrameBlock)(CGRect frame);
typedef NSValue *_Nullable(^JobsRetValueByAffineTransformBlock)(CGAffineTransform data);
typedef NSValue *_Nullable(^JobsRetValueByEdgeInsetsBlock)(UIEdgeInsets data);
typedef NSValue *_Nullable(^JobsRetValueByDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef NSValue *_Nullable(^JobsRetValueByOffsetBlock)(UIOffset data);
#pragma mark —— 关于贝塞尔曲线
typedef UIBezierPath *_Nullable(^JobsRetBezierPathByFrameBlock)(CGRect frame);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByVoidBlock)(void);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGPointBlock)(CGPoint data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByBezierPathBlock)(__kindof UIBezierPath *_Nullable data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGAffineTransformBlock)(CGAffineTransform data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGFloatBlock)(CGFloat data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByBOOLBlock)(BOOL data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGLineCapBlock)(CGLineCap data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByCGLineJoinBlock)(CGLineJoin data);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByAddArcBlock)(CGPoint center, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByAddCurveBlock)(CGPoint endPoint, CGPoint controlPoint1, CGPoint controlPoint2);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByAddQuadCurveBlock)(CGPoint endPoint, CGPoint controlPoint);
typedef __kindof UIBezierPath *_Nullable(^JobsRetBezierPathByLineDashBlock)(NSArray<NSNumber *> *_Nullable pattern, CGFloat phase);
#pragma mark —— 关于UIBackgroundConfiguration
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByCorBlock)(UIColor *_Nullable data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByCGFloatBlock)(CGFloat data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByInsetsBlock)(NSDirectionalEdgeInsets data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByViewBlock)(UIView *_Nullable data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByImageBlock)(UIImage *_Nullable data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByContentModeBlock)(UIViewContentMode data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByVisualEffectBlock)(UIVisualEffect *_Nullable data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByRectEdgeBlock)(NSDirectionalRectEdge data) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
typedef UIBackgroundConfiguration *_Nonnull(^JobsRetBackgroundConfigByCorTransformerBlock)(UIConfigurationColorTransformer _Nullable transformer) API_IOS14_TVOS14_UNAVAILABLE_WATCHOS;
#pragma mark —— 关于按钮配置信息
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
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByImagePaddingBlock)(CGFloat data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByTitlePaddingBlock)(CGFloat data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsRetBtnConfigByAutomaticallyUpdateForSelectionBlock)(BOOL data) API_AVAILABLE(ios(16.0));
#pragma mark —— 关于手势
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByVoidBlock)(void);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByBOOLBlock)(BOOL data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByStringBlock)(NSString *_Nullable data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByDelegateBlock)(id<UIGestureRecognizerDelegate> _Nullable data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureRecognizerByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef CGPoint(^JobsRetCGPointByViewBlock)(__kindof UIView *_Nullable data);
typedef __kindof UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByVoidBlock)(void);
typedef __kindof UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByBOOLBlock)(BOOL data);
typedef __kindof UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByStringBlock)(NSString *_Nullable data);
typedef __kindof UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByDelegateBlock)(id<UIGestureRecognizerDelegate> _Nullable data);
typedef __kindof UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByCGFloatBlock)(CGFloat data);
typedef __kindof UITapGestureRecognizer *_Nullable(^JobsRetTapGestureRecognizerByNSTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByVoidBlock)(void);
typedef __kindof UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByBOOLBlock)(BOOL data);
typedef __kindof UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByStringBlock)(NSString *_Nullable data);
typedef __kindof UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByDelegateBlock)(id<UIGestureRecognizerDelegate> _Nullable data);
typedef __kindof UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByCGFloatBlock)(CGFloat data);
typedef __kindof UILongPressGestureRecognizer *_Nullable(^JobsRetLongPressGestureRecognizerByNSTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByVoidBlock)(void);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByBOOLBlock)(BOOL data);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByStringBlock)(NSString *_Nullable data);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByDelegateBlock)(id<UIGestureRecognizerDelegate> _Nullable data);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByCGFloatBlock)(CGFloat data);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByNSTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByVoidBlock)(void);
typedef __kindof UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByBOOLBlock)(BOOL data);
typedef __kindof UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByStringBlock)(NSString *_Nullable data);
typedef __kindof UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByDelegateBlock)(id<UIGestureRecognizerDelegate> _Nullable data);
typedef __kindof UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByCGFloatBlock)(CGFloat data);
typedef __kindof UIPanGestureRecognizer *_Nullable(^JobsRetPanGestureRecognizerByNSTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByVoidBlock)(void);
typedef __kindof UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByBOOLBlock)(BOOL data);
typedef __kindof UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByStringBlock)(NSString *_Nullable data);
typedef __kindof UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByDelegateBlock)(id<UIGestureRecognizerDelegate> _Nullable data);
typedef __kindof UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByCGFloatBlock)(CGFloat data);
typedef __kindof UIPinchGestureRecognizer *_Nullable(^JobsRetPinchGestureRecognizerByNSTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByVoidBlock)(void);
typedef __kindof UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByBOOLBlock)(BOOL data);
typedef __kindof UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByStringBlock)(NSString *_Nullable data);
typedef __kindof UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByDelegateBlock)(id<UIGestureRecognizerDelegate> _Nullable data);
typedef __kindof UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByCGFloatBlock)(CGFloat data);
typedef __kindof UIRotationGestureRecognizer *_Nullable(^JobsRetRotationGestureRecognizerByNSTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByVoidBlock)(void);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByBOOLBlock)(BOOL data);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByStringBlock)(NSString *_Nullable data);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByDelegateBlock)(id<UIGestureRecognizerDelegate> _Nullable data);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByCGFloatBlock)(CGFloat data);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByNSTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UISwipeGestureRecognizer *_Nullable(^JobsRetSwipeGestureRecognizerByDirectionBlock)(UISwipeGestureRecognizerDirection data);
typedef __kindof UIScreenEdgePanGestureRecognizer *_Nullable(^JobsRetScreenEdgePanGestureRecognizerByUIRectEdgeBlock)(UIRectEdge data);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureByVoidBlock)(void);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsRetGestureByVoidStarBlock)(void *_Nullable key);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsReturnGestureByGesture)(__kindof UIGestureRecognizer *_Nullable data);
#pragma mark —— 关于 Layer
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByVoidBlock)(void);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByStringBlock)(NSString *_Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByIDBlock)(id _Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCGFloatBlock)(CGFloat data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByFloatBlock)(float data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByBOOLBlock)(BOOL data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByNSUIntegerBlock)(NSUInteger data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCGRectBlock)(CGRect data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCAMediaTimingFillModeBlock)(CAMediaTimingFillMode _Nullable data);
typedef __kindof CAEmitterCell *_Nullable(^JobsRetCAEmitterCellByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCAPropertyAnimationBlock)(__kindof CAPropertyAnimation *_Nullable animation);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerBlock)(CALayer *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCorBlock)(UIColor *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGFloatBlock)(CGFloat data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByBezierPathBlock)(UIBezierPath *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByBOOLBlock)(BOOL data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGCorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCorBlock)(UIColor *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByBezierPathBlock)(UIBezierPath *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGCorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByVoidBlock)(void);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByIDBlock)(id _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGPointBlock)(CGPoint data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGSizeBlock)(CGSize data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGRectBlock)(CGRect data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByUnsignedIntBlock)(unsigned int data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByNSIntegerBlock)(NSInteger data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsRetCALayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef id<CAAction> _Nullable(^JobsRetCAActionByStringBlock)(NSString *_Nullable key);
#pragma mark —— 关于 Layer 子类继承 CALayer DSL 返回类型
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCGPointBlock)(CGPoint data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCGRectBlock)(CGRect data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByCGSizeBlock)(CGSize data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByIDBlock)(id _Nullable data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByVoidBlock)(void);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByCGRectBlock)(CGRect data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByIDBlock)(id _Nullable data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CAEmitterLayer *_Nullable(^JobsRetCAEmitterLayerByVoidBlock)(void);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByBOOLBlock)(BOOL data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCGRectBlock)(CGRect data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCGSizeBlock)(CGSize data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByIDBlock)(id _Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByVoidBlock)(void);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGPointBlock)(CGPoint data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGRectBlock)(CGRect data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByVoidBlock)(void);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCGPointBlock)(CGPoint data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCGRectBlock)(CGRect data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCGSizeBlock)(CGSize data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByIDBlock)(id _Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByVoidBlock)(void);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByBOOLBlock)(BOOL data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCGSizeBlock)(CGSize data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByIDBlock)(id _Nullable data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByVoidBlock)(void);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByBOOLBlock)(BOOL data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGPointBlock)(CGPoint data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGRectBlock)(CGRect data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGSizeBlock)(CGSize data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByIDBlock)(id _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByVoidBlock)(void);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCGPointBlock)(CGPoint data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCGRectBlock)(CGRect data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCGSizeBlock)(CGSize data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByVoidBlock)(void);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByBOOLBlock)(BOOL data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCGPointBlock)(CGPoint data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCGRectBlock)(CGRect data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByIDBlock)(id _Nullable data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByVoidBlock)(void);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByBOOLBlock)(BOOL data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCAAnimationKeyBlock)(__kindof CAAnimation *_Nullable animation, NSString *_Nullable key);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCACornerMaskBlock)(CACornerMask data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCAEdgeAntialiasingMaskBlock)(CAEdgeAntialiasingMask data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCALayerBlock)(__kindof CALayer *_Nullable data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCALayerContentsFilterBlock)(CALayerContentsFilter data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCALayerContentsFormatBlock)(CALayerContentsFormat data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCALayerContentsGravityBlock)(CALayerContentsGravity data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCALayerCornerCurveBlock)(CALayerCornerCurve data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCGContextRefBlock)(CGContextRef _Nullable data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCGPointBlock)(CGPoint data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCGRectBlock)(CGRect data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByCGSizeBlock)(CGSize data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByDelegateBlock)(id<CALayerDelegate> _Nullable data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByIDBlock)(id _Nullable data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByStringBlock)(NSString *_Nullable data);
typedef __kindof CATransformLayer *_Nullable(^JobsRetCATransformLayerByVoidBlock)(void);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByFillRuleBlock)(CAShapeLayerFillRule data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByLineCapBlock)(CAShapeLayerLineCap data);
typedef __kindof CAShapeLayer *_Nullable(^JobsRetCAShapeLayerByLineJoinBlock)(CAShapeLayerLineJoin data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByIDBlock)(id _Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCFTypeRefBlock)(CFTypeRef _Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByBOOLBlock)(BOOL data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByTruncationModeBlock)(CATextLayerTruncationMode data);
typedef __kindof CATextLayer *_Nullable(^JobsRetCATextLayerByAlignmentModeBlock)(CATextLayerAlignmentMode data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByCGPointBlock)(CGPoint data);
typedef __kindof CAGradientLayer *_Nullable(^JobsRetCAGradientLayerByTypeBlock)(CAGradientLayerType data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByNSIntegerBlock)(NSInteger data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByBOOLBlock)(BOOL data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCATransform3DBlock)(CATransform3D data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCGColorRefBlock)(CGColorRef _Nullable data);
typedef __kindof CAReplicatorLayer *_Nullable(^JobsRetCAReplicatorLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByScrollModeBlock)(CAScrollLayerScrollMode data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCGPointBlock)(CGPoint data);
typedef __kindof CAScrollLayer *_Nullable(^JobsRetCAScrollLayerByCGRectBlock)(CGRect data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByNSIntegerBlock)(NSInteger data);
typedef __kindof CATiledLayer *_Nullable(^JobsRetCATiledLayerByCGSizeBlock)(CGSize data);
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
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByNSDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof CAEAGLLayer *_Nullable(^JobsRetCAEAGLLayerByBOOLBlock)(BOOL data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByIDBlock)(id _Nullable data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByNSUIntegerBlock)(NSUInteger data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByBOOLBlock)(BOOL data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGSizeBlock)(CGSize data);
typedef __kindof CAMetalLayer *_Nullable(^JobsRetCAMetalLayerByCGColorSpaceRefBlock)(CGColorSpaceRef _Nullable data);
#pragma mark —— 关于 View
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByVoidBlock)(void);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByBOOLBlock)(BOOL data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByCGFloatBlock)(CGFloat data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByCorBlock)(UIColor *_Nullable data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFDocumentBlock)(PDFDocument *_Nullable data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByDelegateBlock)(id<PDFViewDelegate> _Nullable data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFDisplayModeBlock)(PDFDisplayMode data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFDisplayDirectionBlock)(PDFDisplayDirection data);
typedef __kindof PDFView *_Nullable(^JobsRetPDFViewByPDFDisplayBoxBlock)(PDFDisplayBox data);
/// UIView
typedef __kindof UIView *_Nullable(^JobsRetViewByVoidBlock)(void);
typedef __kindof UIView *_Nullable(^JobsRetViewByBarButtonItemBlock)(__kindof UIBarButtonItem *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByViewBlock)(UIView *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByInteractionBlock)(id <UIInteraction>_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByIDBlock)(id _Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCorBlock)(UIColor *_Nullable data);
API_AVAILABLE(ios(26.0))
typedef __kindof UIView *_Nullable(^JobsRetViewByCornerConfigBlock)(UICornerConfiguration *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByBOOLBlock)(BOOL data);
typedef __kindof UIView *_Nullable(^JobsRetViewByFloatBlock)(float data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCGFloatBlock)(CGFloat data);
typedef __kindof UIView *_Nullable(^JobsRetViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIView *_Nullable(^JobsRetViewByUIRectCornerBlock)(UIRectCorner data);
typedef __kindof UIView *_Nullable(^JobsRetViewByUIUserInterfaceStyleBlock)(UIUserInterfaceStyle data);
typedef __kindof UIView *_Nullable(^JobsRetViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UIView *_Nullable(^JobsRetViewByUIEdgeInsetBlock)(UIEdgeInsets data);
typedef __kindof UIView *_Nullable(^JobsRetViewByNSDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCGSizeBlock)(CGSize size);
typedef __kindof UIView *_Nullable(^JobsRetViewByFrameBlock)(CGRect frame);
typedef __kindof UIView *_Nullable(^JobsRetViewByCGPointBlock)(CGPoint data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCenterBlock)(CGFloat x,CGFloat y);
typedef __kindof UIView *_Nullable(^JobsRetViewByCGAffineTransformBlock)(CGAffineTransform data);
typedef __kindof UIView *_Nullable(^JobsRetViewByCATransform3DBlock)(CATransform3D data);
typedef __kindof UIView *_Nullable(^JobsRetViewByClassBlock)(Class _Nonnull cls);
typedef __kindof UIView *_Nullable(^JobsRetViewByTableViewHeaderFooterViewBlock)(__kindof UITableViewHeaderFooterView *_Nonnull headerFooterView);
typedef __kindof UIView *_Nullable(^JobsRetViewByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof UIView *_Nullable(^JobsRetViewByViewModelBlock)(UIViewModel * _Nullable data);
/// UIView + UIGestureRecognizer
typedef __kindof UIView *_Nullable(^JobsRetViewByGestureRecognizer)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsRetViewByTapGestureBlock)(UITapGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByLongPressGestureBlock)(UILongPressGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewBySwipeGestureBlock)(UISwipeGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByPanGestureBlock)(UIPanGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByPinchGestureBlock)(UIPinchGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsRetViewByRotationGestureBlock)(UIRotationGestureRecognizer *_Nullable gesture);
/// UIBarButtonItem
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByRACCommandBlock)(__kindof RACCommand *_Nullable command);
typedef __kindof UIBarButtonItem *_Nullable(^JobsRetBarButtonItemByVoidBlock)(void);
/// UIImageView
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByImageBlock)(UIImage *_Nullable data);
typedef __kindof UIImageView *_Nonnull(^JobsRetImageViewByURLBlock)(NSURL *_Nullable data);
/// UIWindow
typedef __kindof UIWindow *_Nullable(^JobsRetWindowByVoidBlock)(void);
typedef __kindof UIWindow *_Nullable(^JobsRetWindowByFrameBlock)(CGRect frame);
typedef __kindof UIWindow *_Nullable(^JobsRetWindowByWindowSceneBlock)(UIWindowScene *_Nullable data);
/// UIMenuItem
typedef __kindof UIMenuItem *_Nullable(^JobsRetMenuItemByIDBlock)(id _Nullable data);
typedef __kindof UIMenuItem *_Nullable(^JobsRetMenuItemBySELBlock)(SEL _Nullable data);
#pragma mark —— 关于 UITextView
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByStringBlock)(NSString *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByAttributedStringBlock)(NSAttributedString *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByCorBlock)(UIColor *_Nullable data);
typedef JobsRetTextViewByCorBlock JobsRetTextViewByCor;
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByFontBlock)(UIFont *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByBOOLBlock)(BOOL data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByNSRangeBlock)(NSRange data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByNSDictionaryBlock)(NSDictionary *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByUIEdgeInsetsBlock)(UIEdgeInsets data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByCGFloatBlock)(CGFloat data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByViewBlock)(UIView *_Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByDelegateBlock)(id<UITextViewDelegate> _Nullable data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByKeyboardAppearanceBlock)(UIKeyboardAppearance data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByKeyboardTypeBlock)(UIKeyboardType data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByReturnKeyTypeBlock)(UIReturnKeyType data);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByTextContentTypeBlock)(UITextContentType _Nullable data);
/// 兼容旧命名，新增 DSL 优先使用上面的标准命名。
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByEdgeInsetsBlock)(UIEdgeInsets insets);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByPointBlock)(CGPoint point);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByAttributedTextBlock)(__kindof NSAttributedString *_Nullable attributedText);
typedef __kindof UITextView *_Nullable(^JobsRetTextViewByDicBlock)(__kindof NSDictionary<NSAttributedStringKey,id> *_Nullable dic);
#pragma mark —— 关于 UITableView
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByBOOLBlock)(BOOL data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByCGFloatBlock)(CGFloat data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByEdgeInsetsBlock)(UIEdgeInsets inset);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByStringBlock)(NSString *_Nullable data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByCorBlock)(UIColor *_Nullable cor);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByVisualEffectBlock)(UIVisualEffect *_Nullable effect);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByUIScrollViewContentInsetAdjustmentBehaviorBlock)(UIScrollViewContentInsetAdjustmentBehavior behavior);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByCellSeparatorStyleBlock)(UITableViewCellSeparatorStyle style);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByIDBlock)(id _Nullable data);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDelegateBlock)(id <UITableViewDelegate>_Nullable delegate);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDataSourceBlock)(id <UITableViewDataSource>_Nullable dataSource);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDataSourcePrefetchingBlock)(id <UITableViewDataSourcePrefetching>_Nullable dataSourcePrefetching);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDragDelegateBlock)(id <UITableViewDragDelegate>_Nullable delegate);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDropDelegateBlock)(id <UITableViewDropDelegate>_Nullable delegate);
typedef NSInteger(^jobsTableViewNumberOfSectionsBlock)(id _Nonnull target, UITableView *_Nonnull tableView);
typedef NSInteger(^jobsTableViewNumberOfRowsInSectionBlock)(id _Nonnull target, UITableView *_Nonnull tableView, NSInteger section);
typedef __kindof UITableViewCell *_Nonnull(^jobsTableViewCellForRowAtBlock)(id _Nonnull target, UITableView *_Nonnull tableView, NSIndexPath *_Nonnull indexPath);
typedef void(^jobsTableViewDidSelectRowAtBlock)(id _Nonnull target, UITableView *_Nonnull tableView, NSIndexPath *_Nonnull indexPath);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByTargetBlock)(id _Nullable target);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByNumberOfSectionsConfigBlock)(jobsTableViewNumberOfSectionsBlock _Nullable block);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByNumberOfRowsInSectionConfigBlock)(jobsTableViewNumberOfRowsInSectionBlock _Nullable block);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByCellForRowAtConfigBlock)(jobsTableViewCellForRowAtBlock _Nullable block);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByDidSelectRowAtConfigBlock)(jobsTableViewDidSelectRowAtBlock _Nullable block);
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByMJRefreshConfigModelBlock)(MJRefreshConfigModel *_Nullable config);
#pragma mark —— 关于 UITextField
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByDelegateBlock)(id <UITextFieldDelegate>_Nullable delegate);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByBOOLBlock)(BOOL data);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByNSIntegerBlock)(NSInteger data);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByCGFloatrBlock)(CGFloat data);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByNSDictionaryBlock)(NSDictionary<NSAttributedStringKey,id>* _Nonnull data);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByModeBlock)(UITextFieldViewMode mode);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByKeyboardAppearanceBlock)(UIKeyboardAppearance appearance);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByKeyboardTypeBlock)(UIKeyboardType type);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByReturnKeyTypeBlock)(UIReturnKeyType type);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByStringBlock)(__kindof NSString *_Nullable str);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByAttributedStringBlock)(__kindof NSAttributedString *_Nullable str);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByFontBlock)(__kindof UIFont *_Nullable font);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByCorBlock)(__kindof UIColor *_Nullable cor);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByImageBlock)(__kindof UIImage *_Nullable image);
typedef __kindof UITextField *_Nullable(^JobsRetTextFieldByViewBlock)(__kindof UIView *_Nullable view);
#pragma mark —— 关于 Label
typedef __kindof UILabel *_Nullable(^JobsRetLabelByImageBlock)(__kindof UIImage *_Nullable image);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByCorBlock)(__kindof UIColor *_Nullable cor);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByBtnBlock)(__kindof UIButton *_Nullable btn);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByTextBlock)(__kindof NSString *_Nullable str);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByFontBlock)(__kindof UIFont *_Nullable font);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByAttributedStringBlock)(__kindof NSAttributedString *_Nullable attributedString);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByTextAlignmentBlock)(NSTextAlignment textAlignment);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UILabel *_Nullable(^JobsRetLabelByNSIntegerBlock)(NSInteger data);
#pragma mark —— 关于按钮
typedef __kindof UIButton *_Nullable(^JobsRetBtnByVoidBlock)(void);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByControlStateBlock)(UIControlState data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByBtnConfigBlock)(void(^ _Nullable block)(__kindof UIButtonConfiguration *_Nullable config)) API_IOS15_TVOS15_UNAVAILABLE_WATCHOS;
typedef __kindof UIButton *_Nonnull(^JobsRetBtnByBOOLBlock)(BOOL data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByCGFloatBlock)(CGFloat data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByFloatBlock)(float data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByDoubleBlock)(double interva);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByLongBlock)(long data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByNSIntegerBlock)(NSInteger data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByNSUIntegerBlock)(NSUInteger data);
API_AVAILABLE(ios(15.0))
typedef __kindof UIButton *_Nullable(^JobsRetBtnByTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByImagePlacementBlock)(NSDirectionalRectEdge data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByIDBlock)(id _Nullable data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByDicBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByImageBlock)(UIImage *_Nullable image);
typedef __kindof UIButton *_Nonnull(^JobsRetBtnByURLBlock)(NSURL *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByFontBlock)(UIFont *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByCorBlock)(UIColor *_Nonnull cor);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByStringBlock)(__kindof NSString *_Nullable data);/// 主文字内容
typedef __kindof UIButton *_Nullable(^JobsRetBtnByAttributedStringBlock)(NSAttributedString *_Nullable title);/// 富文本内容
typedef __kindof UIButton *_Nullable(^JobsRetBtnByButtonModelBlock)(UIButtonModel *_Nullable buttonModel);
#pragma mark —— 关于 UIActivityIndicatorView
typedef __kindof UIActivityIndicatorView *_Nullable(^JobsRetActivityIndicatorViewByVoidBlock)(void);
typedef __kindof UIActivityIndicatorView *_Nullable(^JobsRetActivityIndicatorViewByBOOLBlock)(BOOL data);
typedef __kindof UIActivityIndicatorView *_Nullable(^JobsRetActivityIndicatorViewByCorBlock)(UIColor *_Nullable data);
typedef __kindof UIActivityIndicatorView *_Nullable(^JobsRetActivityIndicatorViewByNSInteger)(NSInteger data);
#pragma mark —— 关于 UITableViewHeaderFooterView
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByTableViewBlock)(__kindof UITableView *_Nullable tableView);
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByTableViewAndSaltBlock)(Jobs_UITableViewHeaderFooterViewBlock2_Arguments);
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByStringBlock)(__kindof NSString *_Nullable string);
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsRetTableViewHeaderFooterViewByClsAndSaltStrBlock)(Jobs_UITableViewHeaderFooterViewBlock_Arguments);
#pragma mark —— 关于 UITableViewCell
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByVoidBlock)(void);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByAccessoryTypeBlock)(UITableViewCellAccessoryType type);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByCellStyleBlock)(UITableViewCellStyle tableViewCellStyle);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByUIEdgeInsetsBlock)(UIEdgeInsets insets);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByFrameBlock)(CGRect frame);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellBySizeBlock)(CGSize size);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByCGFloatBlock)(CGFloat data);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByBOOLBlock)(BOOL data);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByIndexBlock)(NSInteger index);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByIDBlock)(id _Nullable data);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByClsBlock)(Class _Nonnull cls);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByTableViewBlock)(UITableView *_Nonnull tableView);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByIndexPathBlock)(NSIndexPath *_Nonnull indexPath);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByImageBlock)(UIImage *_Nonnull image);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByCorBlock)(UIColor *_Nonnull cor);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByFontBlock)(UIFont *_Nonnull font);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByDelegateBlock)(id<NSObject> _Nonnull delegate);
/// 多参数
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByClsAndSaltStrBlock)(Jobs_ByClassAndSaltBlock_Arguments);
typedef __kindof UITableViewCell *_Nullable(^JobsRetTableViewCellByCls_SaltStr_IndexPath_Block)(Jobs_UITableViewCellBlock_Arguments);
#pragma mark —— 关于 UICollectionView
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByVoidBlock)(void);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByBOOLBlock)(BOOL data);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDelegateBlock)(id <UICollectionViewDelegate>_Nullable delegate);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDataSourceBlock)(id <UICollectionViewDataSource>_Nullable dataSource);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDragDelegateBlock)(id <UICollectionViewDragDelegate>_Nullable delegate);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDropDelegateBlock)(id <UICollectionViewDropDelegate>_Nullable delegate);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDataSourcePrefetchingBlock)(id <UICollectionViewDataSourcePrefetching>_Nullable dataSourcePrefetching);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByLayoutBlock)(__kindof UICollectionViewLayout *_Nullable layout);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByFlowLayoutBlock)(__kindof UICollectionViewFlowLayout *_Nullable layout);
typedef NSInteger(^jobsCollectionViewNumberOfSectionsBlock)(id _Nonnull target, UICollectionView *_Nonnull collectionView);
typedef NSInteger(^jobsCollectionViewNumberOfItemsInSectionBlock)(id _Nonnull target, UICollectionView *_Nonnull collectionView, NSInteger section);
typedef __kindof UICollectionViewCell *_Nonnull(^jobsCollectionViewCellForItemAtBlock)(id _Nonnull target, UICollectionView *_Nonnull collectionView, NSIndexPath *_Nonnull indexPath);
typedef void(^jobsCollectionViewDidSelectItemAtBlock)(id _Nonnull target, UICollectionView *_Nonnull collectionView, NSIndexPath *_Nonnull indexPath);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByIDBlock)(id _Nullable target);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByNumberOfSectionsConfigBlock)(jobsCollectionViewNumberOfSectionsBlock _Nullable block);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByNumberOfItemsInSectionConfigBlock)(jobsCollectionViewNumberOfItemsInSectionBlock _Nullable block);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByCellForItemAtConfigBlock)(jobsCollectionViewCellForItemAtBlock _Nullable block);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByDidSelectItemAtConfigBlock)(jobsCollectionViewDidSelectItemAtBlock _Nullable block);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByMJRefreshConfigModelBlock)(MJRefreshConfigModel *_Nullable config);
typedef __kindof UICollectionView *_Nullable(^JobsRetCollectionViewByClassAndSaltStrBlock)(Jobs_UITableViewHeaderFooterViewBlock_Arguments);
#pragma mark —— 关于 UICollectionViewFlowLayout
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByVoidBlock)(void);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByCGFloatBlock)(CGFloat data);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByCGSizeBlock)(CGSize size);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByUIEdgeInsetsBlock)(UIEdgeInsets insets);
typedef __kindof UICollectionViewFlowLayout *_Nullable(^JobsRetCollectionViewFlowLayoutByBOOLBlock)(BOOL data);
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
#pragma mark —— 关于 UIScrollView
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByVoidBlock)(void);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByIDBlock)(id _Nullable data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByUIRefreshControlBlock)(UIRefreshControl * _Nullable data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByDelegateBlock)(id <UIScrollViewDelegate>_Nullable delegate);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByCGFloatBlock)(CGFloat data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByBOOLBlock)(BOOL data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByPointBlock)(CGPoint data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByFrameBlock)(CGRect frame);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewBySizeBlock)(CGSize size);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByUIEdgeInsetsBlock)(UIEdgeInsets insets);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByMutArrBlock)(NSMutableArray <NSObject *>*_Nullable data);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByMJRefreshConfigModelBlock)(MJRefreshConfigModel *_Nullable config);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByButtonModelBlock)(__kindof UIButtonModel *_Nullable buttonModel);
#pragma mark —— 关于 PDF
typedef __kindof PDFDocument *_Nullable(^JobsRetPDFDocumentByURLBlock)(NSURL *_Nullable pdfURL);
#pragma mark —— 关于 WKWebView
#import <WebKit/WebKit.h>
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByVoidBlock)(void);
typedef __kindof WKWebView *_Nullable(^JobsRetCollectionViewByNavDelegateBlock)(id <WKNavigationDelegate>_Nullable delegate);
typedef __kindof WKWebView *_Nullable(^JobsRetCollectionViewByUIDelegateBlock)(id <WKUIDelegate>_Nullable delegate);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByConfigurationBlock)(WKWebViewConfiguration *_Nullable config);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByURLRequestBlock)(__kindof NSURLRequest *_Nullable request);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByStrBlock)(NSString *_Nullable data);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByURLBlock)(NSURL *_Nullable URL);
typedef __kindof WKWebView *_Nullable(^JobsRetWKWebViewByViewModelBlock)(__kindof UIViewModel *_Nullable viewModel);
#pragma mark —— 关于 UIProgressView
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByStyleBlock)(UIProgressViewStyle style);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByFloatBlock)(float progress);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByFloatAnimatedBlock)(float progress, BOOL animated);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByColorBlock)(UIColor *_Nullable color);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByImageBlock)(UIImage *_Nullable image);
typedef __kindof UIProgressView *_Nullable(^JobsRetProgressViewByNSProgressBlock)(NSProgress *_Nullable progress);
#pragma mark —— 关于 控制器
typedef __kindof MFMailComposeViewController *_Nullable(^JobsRetMailComposeVCByStrBlock)(NSString *_Nullable data);
typedef __kindof MFMailComposeViewController *_Nullable(^JobsRetMailComposeVCByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof MFMailComposeViewController *_Nullable(^JobsRetMailComposeVCByDelegateBlock)(id<MFMailComposeViewControllerDelegate> _Nullable data);
typedef __kindof MFMessageComposeViewController *_Nullable(^JobsRetMessageComposeVCByStrBlock)(NSString *_Nullable data);
typedef __kindof MFMessageComposeViewController *_Nullable(^JobsRetMessageComposeVCByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof MFMessageComposeViewController *_Nullable(^JobsRetMessageComposeVCByDelegateBlock)(id<MFMessageComposeViewControllerDelegate> _Nullable data);
typedef __kindof MFMessageComposeViewController *_Nullable(^JobsRetMessageComposeVCByBOOLBlock)(BOOL data);
/// UIViewController
typedef __kindof UIViewController *_Nullable(^JobsRetVCByVoidBlock)(void);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByIDBlock)(id _Nullable data);
typedef __kindof UIViewController *_Nullable(^JobsRetVCByViewBlock)(__kindof UIView *_Nonnull view);
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
#pragma mark —— 关于 富文本
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByVoidBlock)(void);
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByNSUIntegerBlock)(NSUInteger data);
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByStrBlock)(__kindof NSString *_Nullable string);
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByAttributedStringBlock)(__kindof NSAttributedString *_Nonnull aString);
typedef __kindof NSAttributedString *_Nullable(^JobsRetAttributedStringByCorBlock)(UIColor *_Nonnull data);
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
typedef __kindof NSString *_Nullable(^JobsRetStrByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof NSString *_Nullable(^JobsRetStrByCGFloatBlock)(CGFloat data);
typedef __kindof NSString *_Nullable(^JobsRetStrByIntegerBlock)(NSInteger data);
typedef __kindof NSString *_Nullable(^JobsRetStrByUIntegerBlock)(NSUInteger data);
typedef __kindof NSString *_Nullable(^JobsRetStrByRangeBlock)(NSRange data);
typedef __kindof NSString *_Nullable(^JobsRetStrByCGPointBlock)(CGPoint data);
typedef __kindof NSString *_Nullable(^JobsRetStrByCharBlock)(char *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByIDBlock)(id _Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByURLBlock)(NSURL *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByDateBlock)(NSDate *_Nullable date);
typedef __kindof NSString *_Nullable(^JobsRetStrByDataBlock)(__kindof NSData *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByImageBlock)(UIImage *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByDicBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByCorBlock)(UIColor *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsRetStrByCharacterSetBlock)(NSCharacterSet *_Nullable data);
#pragma mark —— 关于 NSRegularExpression
typedef __kindof NSRegularExpression *_Nullable(^JobsRetRegularExpressionByStrBlock)(NSString *_Nullable data);
#pragma mark —— 关于时间（格式）/日历/计时器/间隔时间
typedef UNNotificationSound *_Nullable(^JobsRetNotificationSoundByVoidBlock)(void);
typedef UNNotificationSound *_Nullable(^JobsRetNotificationSoundByStrBlock)(NSString *_Nullable data);
typedef UNNotificationSound *_Nullable(^JobsRetNotificationSoundByCGFloatBlock)(CGFloat data);
typedef __kindof CADisplayLink *_Nullable(^JobsRetCADisplayLinkByVoidBlock)(void);
typedef __kindof CADisplayLink *_Nullable(^JobsRetCADisplayLinkByBOOLBlock)(BOOL data);
typedef __kindof CADisplayLink *_Nullable(^JobsRetCADisplayLinkByNSIntegerBlock)(NSInteger data);
#if defined(__IPHONE_15_0)
typedef __kindof CADisplayLink *_Nullable(^JobsRetCADisplayLinkByCAFrameRateRangeBlock)(CAFrameRateRange data) API_AVAILABLE(ios(15.0));
#endif
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByVoidBlock)(void);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByLocaleBlock)(NSLocale *_Nullable data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByTimeZoneBlock)(NSTimeZone *_Nullable data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByCalendarBlock)(NSCalendar *_Nullable data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByDateFormatterStyleBlock)(NSDateFormatterStyle data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByDateFormatterBehaviorBlock)(NSDateFormatterBehavior data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByBOOLBlock)(BOOL data);
typedef NSTimeZone *_Nullable(^JobsRetTimeZoneByVoidBlock)(void);
typedef __kindof NSString *_Nullable(^JobsRetStrByDateFormatterBlock)(NSDateFormatter *_Nullable data);
typedef __kindof NSTimer *_Nullable(^JobsRetTimerByVoidBlock)(void);
typedef __kindof NSTimer *_Nullable(^JobsRetTimerByTimerBlock)(NSTimer *_Nullable timer);
typedef __kindof NSDate *_Nullable(^JobsRetDateByStrBlock)(NSString *_Nullable data);
typedef __kindof NSDate *_Nullable(^JobsRetDateByVoidBlock)(void);
typedef __kindof NSDate *_Nullable(^JobsRetDateByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof NSDate *_Nullable(^JobsRetDateByDateFormatterBlock)(NSDateFormatter *_Nullable data);
typedef __kindof NSDate *_Nullable(^JobsRetDateByDateComponentsBlock)(NSDateComponents *_Nullable data);
typedef __kindof NSDateFormatter *_Nullable(^JobsRetDateFormatterByStrBlock)(NSString *_Nullable);
typedef __kindof NSCalendar *_Nullable(^JobsRetCalendarByCalendarIdentifierBlock)(NSCalendarIdentifier _Nullable data);
typedef __kindof UNCalendarNotificationTrigger *_Nullable(^JobsRetCalendarNotificationTriggerByComponentsBlock)(NSDateComponents *_Nullable data);
typedef NSTimeZone *_Nullable(^JobsRetTimeZoneByStrBlock)(__kindof NSString *_Nullable data);
typedef NSTimeZone *_Nullable(^JobsRetTimeZoneByIntegerBlock)(NSInteger data);
typedef NSTimeInterval(^JobsRetTimeIntervalByDateBlock)(NSDate *_Nullable data);
#pragma mark —— 关于URL
typedef NSURL *_Nullable(^JobsRetURLByStrBlock)(__kindof NSString *_Nullable data);
typedef NSURL *_Nullable(^JobsRetURLByURLBlock)(NSURL *_Nullable data);
typedef NSURL *_Nullable(^JobsRetURLByVoidBlock)(void);
typedef __kindof NSURLRequest *_Nullable(^JobsRetURLRequestByVoidBlock)(void);
typedef __kindof NSURLRequest *_Nullable(^JobsRetURLRequestByURLBlock)(NSURL *_Nullable url);
typedef NSMutableURLRequest *_Nullable(^JobsRetMutableURLRequestByURLBlock)(NSURL *_Nullable url);
typedef NSMutableURLRequest *_Nullable(^JobsRetMutableURLRequestByVoidBlock)(void);
#pragma mark —— 关于相册
typedef PHAsset *_Nullable(^JobsRetAssetByStrBlock)(NSString *_Nullable Key);
#pragma mark —— 关于数据
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
#pragma mark —— 关于字体
typedef UIFont *_Nullable(^JobsRetFontByVoidBlock)(void);
typedef UIFont *_Nullable(^JobsRetFontByConfigurationTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer) API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
#pragma mark —— 关于颜色
typedef UIColor *_Nullable(^JobsRetCorByHexAlphaBlock)(Jobs_UIColorBlock_Arguments);
typedef UIColor *_Nullable(^JobsRetCorByHexBlock)(uint32_t hexValue);
typedef UIColor *_Nonnull(^JobsRetCorByCGFloatBlock)(CGFloat data);
typedef UIColor *_Nullable(^JobsRetCorByNSUIntegerBlock)(NSUInteger data);
typedef UIColor *_Nullable(^JobsRetCorByConfigTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer) API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
typedef UIColor *_Nullable(^JobsRetCorByStrBlock)(NSString *_Nonnull cor);
typedef UIColor *_Nullable(^JobsRetCorByImageBlock)(UIImage *_Nonnull cor);
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
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByVoidBlock)(void);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByFloatBlock)(float data);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByCAMediaTimingFillModeBlock)(CAMediaTimingFillMode _Nullable data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByVoidBlock)(void);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByFloatBlock)(float data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByCAMediaTimingFillModeBlock)(CAMediaTimingFillMode _Nullable data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByCAMediaTimingFunctionBlock)(CAMediaTimingFunction *_Nullable data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByDelegateBlock)(id<CAAnimationDelegate> _Nullable data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByVoidBlock)(void);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByCAMediaTimingFunctionBlock)(CAMediaTimingFunction *_Nullable data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByDelegateBlock)(id<CAAnimationDelegate> _Nullable data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByCAValueFunctionBlock)(CAValueFunction *_Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByVoidBlock)(void);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByIDBlock)(id _Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByFloatBlock)(float data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByBOOLBlock)(BOOL data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCAMediaTimingFillModeBlock)(CAMediaTimingFillMode _Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCAMediaTimingFunctionBlock)(CAMediaTimingFunction *_Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByDelegateBlock)(id<CAAnimationDelegate> _Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCAValueFunctionBlock)(CAValueFunction *_Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCAAnimationCalculationModeBlock)(CAAnimationCalculationMode _Nullable data);
typedef __kindof CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByCAAnimationRotationModeBlock)(CAAnimationRotationMode _Nullable data);
#import <QuartzCore/QuartzCore.h>
typedef CAKeyframeAnimation *_Nullable(^JobsRetCAKeyframeAnimationByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByStrBlock)(__kindof NSString *_Nullable data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByIDBlock)(id _Nullable data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByCFTimeIntervalBlock)(CFTimeInterval data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByFloatBlock)(float data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByBOOLBlock)(BOOL data);
typedef __kindof CABasicAnimation *_Nullable(^JobsRetCABasicAnimationByCAMediaTimingFillModeBlock)(CAMediaTimingFillMode _Nullable data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByBOOLBlock)(BOOL data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByStrBlock)(NSString *_Nullable data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByCAValueFunctionBlock)(CAValueFunction *_Nullable data);
typedef __kindof CAPropertyAnimation *_Nullable(^JobsRetCAPropertyAnimationByCAPropertyAnimationBlock)(__kindof CAPropertyAnimation *_Nullable animation);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByCAMediaTimingFunctionBlock)(CAMediaTimingFunction *_Nullable data);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByDelegateBlock)(id<CAAnimationDelegate> _Nullable delegate);
typedef __kindof CAAnimation *_Nullable(^JobsRetCAAnimationByBOOLBlock)(BOOL data);
#pragma mark —— 关于 JavaScript
typedef JSValue *_Nullable(^JobsRetJSValueByStrBlock)(NSString *_Nullable jsCode);
#pragma mark —— UIImpactFeedbackGenerator
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsRetImpactFeedbackGeneratorByVoidBlock)(void);
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsRetImpactFeedbackGeneratorByNSIntegerBlock)(NSInteger data);
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsRetImpactFeedbackGeneratorByViewBlock)(__kindof UIView *_Nullable view);
#pragma mark —— 关于PHAssetCollectionChangeRequest
typedef __kindof PHAssetCollectionChangeRequest *_Nonnull(^JobsRetPHAssetCollectionChangeRequestByPHAssetCollectionBlock)(__kindof PHAssetCollection *_Nullable data);
typedef __kindof PHAssetCollectionChangeRequest *_Nonnull(^JobsRetPHAssetCollectionChangeRequestByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof PHAssetCollectionChangeRequest *_Nullable(^JobsRetPHAssetCollectionChangeRequestByIDBlock)(id<NSFastEnumeration> _Nullable data);
#pragma mark —— 关于 PHFetchResult
typedef __kindof PHFetchResult <__kindof PHCollection *>*_Nonnull(^JobsRetPHFetchResultWithPHCollectionByPHFetchOptionsBlock)(__kindof PHFetchOptions *_Nullable options);
typedef __kindof PHFetchResult <PHAsset *>*_Nonnull(^JobsRetPHFetchResultWithPHAssetByPHFetchOptionsBlock)(__kindof PHFetchOptions *_Nullable options);
#pragma mark —— 关于位置
typedef NSRange (^JobsRetRangeByTextCheckingResultBlock)(NSTextCheckingResult *_Nullable data);
typedef NSRange (^JobsRetRangeByIntegerBlock)(NSInteger data);
typedef NSRange (^JobsRetRangeByStrBlock)(NSString *_Nullable data);
typedef NSRange (^JobsRetRangeByVoidBlock)(void);
typedef UIEdgeInsets(^JobsRetUIEdgeInsetsByVoidBlock)(void);
typedef UIEdgeInsets(^JobsRetUIEdgeInsetsByIDBlock)(id _Nullable data);
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
typedef CGRect(^JobsRetFrameByVoidBlock)(void);
typedef CGRect(^JobsRetFrameByArrBlock)(__kindof NSArray <__kindof UIView *>*_Nullable arr);
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
typedef CGRect(^JobsRetFrameByViewBlock)(__kindof UIView *_Nonnull data);
typedef CGPoint(^JobsRetCGPointByVoidBlock)(void);
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
#pragma mark —— 关于数据类型
typedef NSInteger(^JobsRetNSIntegerByVoidBlock)(void);
typedef NSInteger(^JobsRetByNSIntegerBlock)(NSInteger data);
typedef NSInteger(^JobsRetNSIntegerByIDBlock)(id _Nullable data);
typedef NSInteger(^JobsRetNSIntegerByStrBlock)(NSString *_Nullable data);
typedef NSInteger(^JobsRetNSIntegerByPointBlock)(CGPoint data);
typedef NSUInteger(^JobsRetNSUIntegerByVoidBlock)(void);
typedef NSUInteger(^JobsRetByNSUIntegerBlock)(NSUInteger data);
typedef NSUInteger(^JobsRetNSUIntegerByIDBlock)(id _Nullable data);
typedef CGFloat(^JobsRetCGFloatByVoidBlock)(void);
typedef CGFloat(^JobsRetCGFloatByCGFloatBlock)(CGFloat data);
typedef CGFloat(^JobsRetCGFloatByDoubleBlock)(double data);
typedef CGFloat(^JobsRetByCGPointBlock)(CGPoint data);
typedef CGFloat(^JobsRetCGFloatByViewBlock)(UIView *_Nullable view);
typedef CGFloat(^JobsRetCGFloatByIDBlock)(id _Nullable data);
typedef CGFloat(^JobsRetCGFloatByArrBlock)(NSMutableArray <__kindof NSObject *>*_Nullable data);
typedef CGFloat(^JobsRetCGFloatByFontBlock)(UIFont *_Nullable font);
typedef CGFloat(^JobsRetCGFloatByNumberBlock)(NSNumber *_Nullable data);
typedef BOOL(^JobsRetBOOLByVoidBlock)(void);
typedef BOOL(^JobsRetBOOLBySizeBlock)(CGSize size);
typedef BOOL(^JobsRetBOOLByPointBlock)(CGPoint point);
typedef BOOL(^JobsRetBOOLByCGPointBlock)(CGPoint data);
typedef BOOL(^JobsRetBOOLByFrameBlock)(CGRect frame);
typedef BOOL(^JobsRetBOOLByCGFloatBlock)(CGFloat data);
typedef BOOL(^JobsRetBOOLByBOOLBlock)(BOOL data);
typedef BOOL(^JobsRetBOOLByNSUIntegerBlock)(NSUInteger data);
typedef BOOL(^JobsRetBOOLByNSIntegerBlock)(NSInteger data);
typedef BOOL(^JobsRetBOOLByIDBlock)(id _Nullable data);
typedef BOOL(^JobsRetBOOLByViewBlock)(__kindof UIView *_Nullable view);
typedef BOOL(^JobsRetBOOLByVCBlock)(__kindof UIViewController *_Nullable viewController);
typedef BOOL(^JobsRetBOOLByStrBlock)(__kindof NSString *_Nullable data);
typedef BOOL(^JobsRetBOOLByDateBlock)(NSDate *_Nullable date);
typedef BOOL(^JobsRetBOOLByArrBlock)(__kindof NSArray *_Nullable arr);
typedef int(^JobsRetIntByVoidBlock)(void);
typedef int(^JobsRetIntByIntBlock)(int data);
typedef int(^JobsRetIntByIDBlock)(id _Nullable data);
typedef NSInteger(^JobsRetIntegerByDateBlock)(NSDate *_Nullable data);
typedef unsigned int(^JobsRetUnsignedIntByVoidBlock)(void);
typedef unsigned int(^JobsRetByUnsignedIntBlock)(unsigned int data);
typedef unsigned int(^JobsRetUnsignedIntByIDBlock)(id _Nullable data);
typedef float(^JobsRetFloatByVoidBlock)(void);
typedef float(^JobsRetByFloatBlock)(float data);
typedef float(^JobsRetFloatByIDBlock)(id _Nullable data);
typedef float(^JobsRetFloatByStrBlock)(NSString *_Nullable data);
typedef double(^JobsRetDoubleByVoidBlock)(void);
typedef double(^JobsRetDoubleByNSIntegerBlock)(NSInteger data);
typedef double(^JobsRetByDoubleBlock)(double data);
typedef double(^JobsRetDoubleByIDBlock)(id _Nullable data);
typedef double(^JobsRetDoubleByStrBlock)(NSString *_Nullable data);
typedef char(^JobsRetByCharBlock)(char data);
typedef char(^JobsRetCharByIDBlock)(id _Nullable data);
typedef char(^JobsRetCharByVoidBlock)(void);
typedef unsigned char(^JobsRetByUnsignedCharBlock)(unsigned char data);
typedef unsigned char(^JobsRetUnsignedCharByIDBlock)(id _Nullable data);
typedef unsigned char(^JobsRetUnsignedCharByVoidBlock)(void);
typedef short(^JobsRetByShortBlock)(short data);
typedef short(^JobsRetShortByIDBlock)(id _Nullable data);
typedef short(^JobsRetShortByVoidBlock)(void);
typedef unsigned short(^JobsRetUnsignedShortByVoidBlock)(void);
typedef unsigned short(^JobsRetByUnsignedShortBlock)(unsigned short data);
typedef unsigned short(^JobsRetUnsignedShortByIDBlock)(id _Nullable data);
typedef unsigned short(^JobsRetUnsignedShortByNSUIntegerBlock)(NSUInteger data);
typedef long(^JobsRetLongByVoidBlock)(void);
typedef long(^JobsRetByLongBlock)(long data);
typedef long(^JobsRetLongByIDBlock)(id _Nullable data);
typedef unsigned long(^JobsRetUnsignedLongByVoidBlock)(void);
typedef unsigned long(^JobsRetByUnsignedLongBlock)(unsigned long data);
typedef unsigned long(^JobsRetUnsignedLongByIDBlock)(id _Nullable data);
typedef unsigned long long(^JobsRetUnsignedLongLongByIDBlock)(id _Nullable data);
typedef unsigned long long(^JobsRetUnsignedLongLongByVoidBlock)(void);
typedef unsigned long long(^JobsRetByUnsignedLongLongBlock)(unsigned long long data);
#pragma mark —— 关于Texture
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByFrameBlock)(CGRect data);
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByColorBlock)(UIColor *_Nullable data);
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByCGFloatBlock)(CGFloat data);
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByBOOLBlock)(BOOL data);
typedef __kindof ASDisplayNode *_Nonnull(^JobsRetDisplayNodeByIntegerBlock)(NSInteger data);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeImageByConfigBlock)(UIImage *_Nonnull image, UIControlState state);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByContentEdgeInsetsBlock)(UIEdgeInsets insets);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByBackgroundColorsBlock)(UIColor *_Nullable color);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByCornerRadiusBlock)(CGFloat radius);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByHitTestSlopBlock)(UIEdgeInsets slop);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByTitleConfigBlock)(NSString *_Nonnull title,
                                                                              UIFont *_Nullable font,
                                                                              UIColor *_Nullable color,
                                                                              UIControlState state);
#import "VoidByCertainParametersBlock.h"
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByOnClickBlock)(jobsByButtonNodeBlock _Nullable handler);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByOnLongPressBlock)(jobsByButtonNodeLongPressBlock _Nullable handler);
typedef __kindof ASButtonNode *_Nonnull(^JobsRetButtonNodeByOnLongPressWithTimeBlock)(NSTimeInterval minDuration,
                                                                                      CGFloat allowableMovement,
                                                                                      jobsByButtonNodeLongPressBlock _Nullable handler);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByUnsignedCharBlock)(unsigned char dir);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecBySpacingBlock)(CGFloat spacing);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByLineSpacingBlock)(CGFloat lineSpacing);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByConcurrentBlock)(BOOL concurrent);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByChildrenBlock)(NSArray<id<ASLayoutElement>> * _Nullable children);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByAppendChildrenBlock)(NSArray<id<ASLayoutElement>> * _Nullable children);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByAddChildBlock)(id<ASLayoutElement> _Nullable child);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByBoolBlock)(BOOL flag);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByInsetsBlock)(UIEdgeInsets insets);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByRangeBlock)(NSRange range);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByAttrTextBlock)(NSAttributedString * _Nullable attrText);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByUIntBlock)(NSUInteger value);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByDictBlock)(NSDictionary<NSString*, id> * _Nullable dict);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodByeAutocapBlock)(UITextAutocapitalizationType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByAutocorrBlock)(UITextAutocorrectionType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeBySpellBlock)(UITextSpellCheckingType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByKeyboardTypeBlock)(UIKeyboardType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByKeyboardAppearanceBlock)(UIKeyboardAppearance t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByReturnKeyBlock)(UIReturnKeyType t);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByTextViewBlock)(jobsByTextViewBlock _Nullable cfg);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByOnChangeBlock)(JobsEditableTextEventBlock _Nullable handler);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByOnBeginBlock)(JobsEditableTextEventBlock _Nullable handler);
typedef __kindof ASEditableTextNode *_Nonnull(^JobsRetEditableTextNodeByOnEndBlock)(JobsEditableTextEventBlock _Nullable handler);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByBoolBlock)(BOOL flag);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByCGFloatBlock)(CGFloat value);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByInsetsBlock)(UIEdgeInsets insets);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByPointBlock)(CGPoint point);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByPointAnimatedBlock)(CGPoint point, BOOL animated);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByLayoutBlock)(UICollectionViewLayout *_Nullable layout);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByInspectorBlock)(id<ASCollectionViewLayoutInspecting> _Nullable inspector);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByDelegateBlock)(id<ASCollectionDelegate> _Nullable delegate);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByDataSourceBlock)(id<ASCollectionDataSource> _Nullable dataSource);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByStringBlock)(NSString *_Nullable str);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByDispatchBlock)(dispatch_block_t _Nullable updates);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByBatchAnimatedBlock) (BOOL animated,
                                                                                           dispatch_block_t _Nullable updates,
                                                                                           jobsByBOOLBlock _Nullable completion);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByBatchBlock)(dispatch_block_t _Nullable updates,
                                                                                  jobsByBOOLBlock _Nullable completion);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeBySelectBlock)(NSIndexPath *_Nullable indexPath,
                                                                                   BOOL animated,
                                                                                   UICollectionViewScrollPosition scrollPosition);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByDeselectBlock) (NSIndexPath *_Nullable indexPath, BOOL animated);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByScrollToItemBlock) (NSIndexPath *_Nullable indexPath,
                                                                                          UICollectionViewScrollPosition scrollPosition,
                                                                                          BOOL animated);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByReloadWithCompletionBlock)(dispatch_block_t _Nullable completion);
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeByVoidBlock)(void);
typedef __kindof ASNetworkImageNode * _Nonnull (^JobsRetNetworkImageNodeByDelegateBlock)(id<ASNetworkImageNodeDelegate> _Nullable delegate);
typedef __kindof ASNetworkImageNode * _Nonnull (^JobsRetNetworkImageNodeByImageBlock)(UIImage *_Nullable image);
typedef __kindof ASNetworkImageNode * _Nonnull (^JobsRetNetworkImageNodeByURLBlock)(NSURL *_Nullable URL);
typedef __kindof ASNetworkImageNode * _Nonnull (^JobsRetNetworkImageNodeByBOOLBlock)(BOOL on);
#if __has_include(<AsyncDisplayKit/AsyncDisplayKit.h>)
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#else
typedef struct {
    CGFloat leadingBufferScreenfuls;
    CGFloat trailingBufferScreenfuls;
} ASRangeTuningParameters;
#endif
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeBySetTuningBlock) (ASRangeTuningParameters params, NSInteger type);// ASLayoutRangeType
typedef __kindof ASCollectionNode * _Nonnull (^JobsRetCollectionNodeBySetTuningForModeBlock) (ASRangeTuningParameters params,
                                                                                              char mode,// ASLayoutRangeMode
                                                                                              NSInteger type); // ASLayoutRangeType
#pragma mark —— 其他
typedef UIEditMenuInteraction *_Nullable(^JobsRetUIEditMenuInteractionByIDBlock)(id<UIEditMenuInteractionDelegate>_Nullable data) API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos) API_UNAVAILABLE(watchos) ;
typedef UIContextMenuInteraction *_Nonnull(^JobsRetContextMenuInteractionByIDBlock)(id <UIContextMenuInteractionDelegate>_Nullable delegate) API_AVAILABLE(ios(13.0), tvos(17.0)) API_UNAVAILABLE(watchos);
typedef __kindof NSXMLParser *_Nonnull(^JobsRetNSXMLParserByNSDataBlock)(__kindof NSData *_Nullable data);
typedef PHAssetChangeRequest *_Nonnull(^JobsRetPHAssetChangeRequestByURLBlock)(NSURL *_Nullable url);
typedef __kindof AVAssetImageGenerator *_Nonnull(^JobsRetAVAssetImageGeneratorByAVURLAssetBlock)(__kindof AVURLAsset *_Nullable data);
typedef __kindof NSArray <PHAssetResource *>*_Nonnull(^JobsRetArrayByPHAssetBlock)(__kindof PHAsset *_Nullable data);
#pragma mark —— 多入参，返回 id
typedef id _Nullable(^JobsRetIDByCenterBlock)(Jobs_ReturnIDByCenterBlock_Arguments);
typedef id _Nonnull(^JobsRetIDByClsAndSaltStrBlock)(Jobs_UITableViewHeaderFooterViewBlock_Arguments);
typedef id _Nullable(^JobsRetIDByTwoIDBlock) (Jobs_2_Arguments);/// weakSelf、arg
typedef id _Nullable(^JobsRetIDByThreeIDBlock) (Jobs_3_Arguments);/// weakSelf、arg、data
#pragma mark —— 多入参，返回 NSString
typedef __kindof NSString *_Nullable(^JobsRetStrByIntegersBlock)(NSInteger data, ...);
typedef __kindof NSString *_Nullable(^JobsRetStrByTimeIntervalsBlock)(NSTimeInterval data, ...);
typedef __kindof NSString *_Nullable(^JobsRetStrByArrAndNSIntegerBlock)(Jobs_NSStringBlock_1_Arguments);
typedef __kindof NSString *_Nullable(^JobsRetStrByTimeIntervalAndDateFormatterBlock)(Jobs_NSStringBlock_2_Arguments);
typedef __kindof NSString *_Nullable(^JobsRetStrByStrsBlock)(Jobs_NSStringBlock_3_Arguments);
#pragma mark —— 多入参，返回 UITableView
typedef __kindof UITableView *_Nullable(^JobsRetTableViewByClsAndSaltStrBlock)(Jobs_UITableViewHeaderFooterViewBlock_Arguments);
#pragma mark —— 多入参，返回 UIButton
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
/// NSMutableDictionary
typedef NSMutableDictionary *_Nonnull(^JobsRetMutableDicByKeyValueBlock)(Jobs_ReturnMutableDicByKeyValueBlock_Arguments);
typedef NSMutableDictionary *_Nonnull(^JobsRetMutableDicByKey_ValueBlock)(Jobs_ReturnMutableDicByKey_ValueBlock_Arguments);
typedef CGRect(^JobsRetFrameByCGFloatAndUIViewBlock)(Jobs_ReturnCGRectByCGFloatAndUIViewBlock_Arguments);
typedef NSIndexPath *_Nonnull(^JobsReturnIndexPathByXYBlock)(Jobs_ReturnIDByCenterBlock_Arguments);
typedef __kindof UIButtonModel *_Nullable(^JobsRetBtnModelByStrAndImagesBlock)(Jobs_ReturnButtonModelByStringAndImagesBlock_Arguments);
#pragma clang diagnostic pop
#endif /* ReturnByCertainParameters_h */

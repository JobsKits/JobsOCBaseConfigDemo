//
//  JobsSystemAPIDSLSupplement.h
//  JobsOCDSL
//
//  Auto-supplemented wrappers for existing system API DSL categories.
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_JOBSSYSTEMAPIDSLSUPPLEMENT
#define JOBS_HEADER_GUARD_JOBSSYSTEMAPIDSLSUPPLEMENT

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <MessageUI/MessageUI.h>
#import <PDFKit/PDFKit.h>
#import <WebKit/WebKit.h>

#if __has_include(<Metal/Metal.h>)
#import <Metal/Metal.h>
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAMetalLayer (JobsSystemAPIDSLSupplement)
#if defined(__IPHONE_16_0)
-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byWantsExtendedDynamicRangeContent;
#endif
#if defined(__IPHONE_13_0)
-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byDisplaySyncEnabled;
#endif
#if defined(__IPHONE_13_0)
-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byAllowsNextDrawableTimeout;
#endif
#if defined(__IPHONE_16_0)
-(JobsRetCAMetalLayerByNSDictionaryBlock _Nonnull)byDeveloperHUDProperties;
#endif
@end

@interface MFMailComposeViewController (JobsSystemAPIDSLSupplement)
#if defined(__IPHONE_11_0)
-(JobsRetMailComposeVCByStrBlock _Nonnull)bySetPreferredSendingEmailAddress;
#endif
@end

@interface MFMessageComposeViewController (JobsSystemAPIDSLSupplement)
-(JobsRetMessageComposeVCByStrBlock _Nonnull)bySubject;
@end

@interface NSDateFormatter (JobsSystemAPIDSLSupplement)
-(JobsRetDateFormatterByBOOLBlock _Nonnull)byGeneratesCalendarDates;
-(JobsRetDateFormatterByDateBlock _Nonnull)byTwoDigitStartDate;
-(JobsRetDateFormatterByDateBlock _Nonnull)byDefaultDate;
-(JobsRetDateFormatterByArrBlock _Nonnull)byEraSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byMonthSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byShortMonthSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byWeekdaySymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byShortWeekdaySymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byVeryShortWeekdaySymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byStandaloneMonthSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byShortStandaloneMonthSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byVeryShortStandaloneMonthSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byQuarterSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byShortQuarterSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byStandaloneQuarterSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byShortStandaloneQuarterSymbols;
-(JobsRetDateFormatterByArrBlock _Nonnull)byVeryShortMonthSymbols;
-(JobsRetDateFormatterByStrBlock _Nonnull)byAMSymbol;
-(JobsRetDateFormatterByStrBlock _Nonnull)byPMSymbol;
-(JobsRetDateFormatterByDateBlock _Nonnull)byGregorianStartDate;
-(JobsRetDateFormatterByBOOLBlock _Nonnull)byDoesRelativeDateFormatting;
-(JobsRetDateFormatterByNSIntegerBlock _Nonnull)byFormattingContext;
@end

@interface PDFView (JobsSystemAPIDSLSupplement)
-(JobsRetPDFViewByBOOLBlock _Nonnull)byDisplaysAsBook;
-(JobsRetPDFViewByBOOLBlock _Nonnull)byDisplaysRTL;
-(JobsRetPDFViewByCGFloatBlock _Nonnull)byMinScaleFactor;
-(JobsRetPDFViewByCGFloatBlock _Nonnull)byMaxScaleFactor;
-(JobsRetPDFViewByPDFInterpolationQualityBlock _Nonnull)byInterpolationQuality;
-(JobsRetPDFViewByUIEdgeInsetsBlock _Nonnull)byPageBreakMargins;
-(JobsRetPDFViewByBOOLBlock _Nonnull)byPageShadowsEnabled;
-(JobsRetPDFViewByBOOLBlock _Nonnull)byUsePageViewController;
-(JobsRetPDFViewByPDFPageBlock _Nonnull)byGoToPage;
-(JobsRetPDFViewByPDFDestinationBlock _Nonnull)byGoToDestination;
-(JobsRetPDFViewByPDFSelectionBlock _Nonnull)byGoToSelection;
-(JobsRetPDFViewByPDFSelectionBlock _Nonnull)bySetCurrentSelection;
-(JobsRetPDFViewByArrBlock _Nonnull)byHighlightedSelections;
@end

@interface UICollectionView (JobsSystemAPIDSLSupplement)
-(JobsRetCollectionViewByVoidBlock _Nonnull)byReloadData;
-(JobsRetCollectionViewByVoidBlock _Nonnull)byFinishInteractiveTransition API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(tvos);
-(JobsRetCollectionViewByVoidBlock _Nonnull)byCancelInteractiveTransition API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(tvos);
-(JobsRetCollectionViewByVoidBlock _Nonnull)byEndInteractiveMovement API_AVAILABLE(ios(9.0)) API_UNAVAILABLE(tvos);
-(JobsRetCollectionViewByVoidBlock _Nonnull)byCancelInteractiveMovement API_AVAILABLE(ios(9.0)) API_UNAVAILABLE(tvos);
-(JobsRetCollectionViewByIndexSetBlock _Nonnull)byReloadSections;
-(JobsRetCollectionViewByIndexSetBlock _Nonnull)byInsertSections;
-(JobsRetCollectionViewByIndexSetBlock _Nonnull)byDeleteSections;
-(JobsRetCollectionViewByArrBlock _Nonnull)byReloadItemsAtIndexPaths;
-(JobsRetCollectionViewByArrBlock _Nonnull)byInsertItemsAtIndexPaths;
-(JobsRetCollectionViewByArrBlock _Nonnull)byDeleteItemsAtIndexPaths;
-(JobsRetCollectionViewByArrBlock _Nonnull)byReconfigureItemsAtIndexPaths API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
-(JobsRetCollectionViewByCGPointBlock _Nonnull)byUpdateInteractiveMovementTargetPosition API_AVAILABLE(ios(9.0)) API_UNAVAILABLE(tvos);
@end

@interface UIScrollView (JobsSystemAPIDSLSupplement)
-(JobsRetScrollViewByVoidBlock _Nonnull)byFlashScrollIndicators;
-(JobsRetScrollViewByVoidBlock _Nonnull)byStopScrollingAndZooming API_AVAILABLE(ios(18.0)) API_UNAVAILABLE(tvos, watchos);
@end

@interface UIImageView (JobsSystemAPIDSLSupplement)
-(JobsRetImageViewBySymbolConfigurationBlock _Nonnull)byPreferredSymbolConfiguration API_AVAILABLE(ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
-(JobsRetImageViewByImageDynamicRangeBlock _Nonnull)byPreferredImageDynamicRange API_AVAILABLE(ios(17.0), tvos(17.0)) API_UNAVAILABLE(watchos);
-(JobsRetImageViewByVoidBlock _Nonnull)byStartAnimating;
-(JobsRetImageViewByVoidBlock _Nonnull)byStopAnimating;
-(JobsRetImageViewByVoidBlock _Nonnull)byRemoveAllSymbolEffects API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
-(JobsRetImageViewBySymbolEffectBlock _Nonnull)byAddSymbolEffect API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
-(JobsRetImageViewBySymbolEffectBlock _Nonnull)byRemoveSymbolEffectOfType API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
-(JobsRetImageViewBySymbolEffectOptionsBlock _Nonnull)byRemoveAllSymbolEffectsWithOptions API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
@end

@interface UIImagePickerController (JobsSystemAPIDSLSupplement)
-(JobsRetImagePickerControllerBySourceTypeBlock _Nonnull)bySourceType;
-(JobsRetImagePickerControllerByIDBlock _Nonnull)byDelegate;
-(JobsRetImagePickerControllerByBOOLBlock _Nonnull)byAllowsEditing;
@end

@interface UIPageControl (JobsSystemAPIDSLSupplement)
-(JobsRetPageControlByNSIntegerBlock _Nonnull)byNumberOfPages;
-(JobsRetPageControlByNSIntegerBlock _Nonnull)byCurrentPage;
-(JobsRetPageControlByBOOLBlock _Nonnull)byHidesForSinglePage;
-(JobsRetPageControlByBOOLBlock _Nonnull)byAllowsContinuousInteraction API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
-(JobsRetPageControlByBOOLBlock _Nonnull)byDefersCurrentPageDisplay;
-(JobsRetPageControlByVoidBlock _Nonnull)byUpdateCurrentPageDisplay;
-(JobsRetPageControlByColorBlock _Nonnull)byPageIndicatorTintColor;
-(JobsRetPageControlByColorBlock _Nonnull)byCurrentPageIndicatorTintColor;
-(JobsRetPageControlByImageBlock _Nonnull)byPreferredIndicatorImage API_AVAILABLE(ios(14.0), tvos(14.0));
-(JobsRetPageControlByImageAndNSIntegerBlock _Nonnull)byIndicatorImageForPage API_AVAILABLE(ios(14.0), tvos(14.0));
-(JobsRetPageControlByBackgroundStyleBlock _Nonnull)byBackgroundStyle API_AVAILABLE(ios(14.0), tvos(14.0));
-(JobsRetPageControlByDirectionBlock _Nonnull)byDirection API_AVAILABLE(ios(16.0), tvos(16.0));
@end

@interface UITableView (JobsSystemAPIDSLSupplement)
-(JobsRetTableViewByVoidBlock _Nonnull)byBeginUpdates;
-(JobsRetTableViewByVoidBlock _Nonnull)byEndUpdates;
-(JobsRetTableViewByVoidBlock _Nonnull)byReloadData;
-(JobsRetTableViewByVoidBlock _Nonnull)byReloadSectionIndexTitles;
-(JobsRetTableViewByArrBlock _Nonnull)byReconfigureRowsAtIndexPaths API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
@end

@interface UILabel (JobsSystemAPIDSLSupplement)
-(JobsRetUILabelByUIColorBlock _Nonnull)byTextColor;
-(JobsRetUILabelByNSAttributedStringBlock _Nonnull)byAttributedText;
-(JobsRetUILabelByUIColorBlock _Nonnull)byShadowColor;
-(JobsRetUILabelByCGSizeBlock _Nonnull)byShadowOffset;
-(JobsRetUILabelByCGFloatBlock _Nonnull)byMinimumFontSize API_UNAVAILABLE(tvos) API_UNAVAILABLE(visionos, watchos);
-(JobsRetUILabelByBOOLBlock _Nonnull)byAdjustsLetterSpacingToFitWidth API_UNAVAILABLE(tvos) API_UNAVAILABLE(visionos, watchos);
#if defined(__IPHONE_10_0)
#endif
@end

@interface UITextField (JobsSystemAPIDSLSupplement)
-(JobsRetTextFieldByCorBlock _Nonnull)byTextColor;
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byAutocapitalizationType;
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byAutocorrectionType;
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)bySpellCheckingType;
#if defined(__IPHONE_11_0)
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)bySmartQuotesType;
#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)bySmartDashesType;
#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)bySmartInsertDeleteType;
#endif
-(JobsRetTextFieldByBOOLBlock _Nonnull)byEnablesReturnKeyAutomatically;
#if defined(__IPHONE_10_0)
-(JobsRetTextFieldByTextContentTypeBlock _Nonnull)byTextContentType;
#endif
#if defined(__IPHONE_12_0)
-(JobsRetTextFieldByPasswordRulesBlock _Nonnull)byPasswordRules;
#endif
#if defined(__IPHONE_10_0)
-(JobsRetTextFieldByBOOLBlock _Nonnull)byAdjustsFontForContentSizeCategory;
#endif
@end

@interface UITextView (JobsSystemAPIDSLSupplement)
-(JobsRetTextViewByCorBlock _Nonnull)byTextColor;
-(JobsRetTextViewByAttributedStringBlock _Nonnull)byAttributedString;
#if defined(__IPHONE_11_0)
-(JobsRetTextViewByTextDragDelegateBlock _Nonnull)byTextDragDelegate;
#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextViewByTextDropDelegateBlock _Nonnull)byTextDropDelegate;
#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextViewByTextDragOptionsBlock _Nonnull)byTextDragOptions;
#endif
#if defined(__IPHONE_13_0)
-(JobsRetTextViewByBOOLBlock _Nonnull)byUsesStandardTextScaling;
#endif
-(JobsRetTextViewByBOOLBlock _Nonnull)byFindInteractionEnabled API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(watchos, tvos);
-(JobsRetTextViewByBorderStyleBlock _Nonnull)byBorderStyle API_AVAILABLE(ios(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
-(JobsRetTextViewByIDBlock _Nonnull)byInteractionState API_AVAILABLE(ios(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
@end

@interface UIPanGestureRecognizer (JobsSystemAPIDSLSupplement)
-(JobsRetPanGestureRecognizerByUIScrollTypeMaskBlock _Nonnull)byAllowedScrollTypesMask API_AVAILABLE(ios(13.4)) API_UNAVAILABLE(tvos, watchos);
@end

@interface UITapGestureRecognizer (JobsSystemAPIDSLSupplement)
-(JobsRetTapGestureRecognizerByUIEventButtonMaskBlock _Nonnull)byButtonMaskRequired API_AVAILABLE(ios(13.4)) API_UNAVAILABLE(tvos, watchos);
@end

@interface UIView (JobsSystemAPIDSLSupplement)
-(JobsRetViewByStringBlock _Nonnull)byRestorationIdentifier;
-(JobsRetViewByFrameBlock _Nonnull)byContentStretch;
#if defined(__IPHONE_11_0)
-(JobsRetViewByArrBlock _Nonnull)byInteractions;
#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByStringBlock _Nonnull)byLargeContentTitle;
#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByImageBlock _Nonnull)byLargeContentImage;
#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByBOOLBlock _Nonnull)byScalesLargeContentImage;
#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByBOOLBlock _Nonnull)byShowsLargeContentViewer;
#endif
#if defined(__IPHONE_11_0)
-(JobsRetViewByBOOLBlock _Nonnull)byAccessibilityIgnoresInvertColors;
#endif
-(JobsRetBOOLByBOOLBlock _Nonnull)byEndEditing;
-(JobsRetViewByNSIntegerReturnViewBlock _Nonnull)byViewWithTag;
@end

@interface UIWindow (JobsSystemAPIDSLSupplement)
-(JobsRetUIWindowByViewControllerBlock _Nonnull)byRootViewController;
-(JobsRetUIWindowByWindowSceneBlock _Nonnull)byWindowScene API_AVAILABLE(ios(13.0));
-(JobsRetUIWindowByFrameBlock _Nonnull)byWindowFrame;
-(JobsRetUIWindowByVoidBlock _Nonnull)byMakeKeyAndVisible;
@end

@interface UIAlertAction (JobsSystemAPIDSLSupplement)
-(JobsRetUIAlertActionByBOOLBlock _Nonnull)byEnabled;
@end

@interface NSShadow (JobsSystemAPIDSLSupplement)
-(JobsRetNSShadowByIDBlock _Nonnull)byShadowColor;
-(JobsRetNSShadowByCGSizeBlock _Nonnull)byShadowOffset;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN NSShadow
-(JobsRetNSShadowByCGFloatBlock _Nonnull)byShadowBlurRadius;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END NSShadow
@end

@interface UICollectionViewLayoutAttributes (JobsSystemAPIDSLSupplement)
-(JobsRetCollectionViewLayoutAttributesByCGRectBlock _Nonnull)byFrame;
-(JobsRetCollectionViewLayoutAttributesByCGAffineTransformBlock _Nonnull)byTransform;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UICollectionViewLayoutAttributes
-(JobsRetUICollectionViewLayoutAttributesByNSIntegerBlock _Nonnull)byZIndex;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UICollectionViewLayoutAttributes
@end

@interface UIPasteboard (JobsSystemAPIDSLSupplement)
-(JobsRetUIPasteboardByStrBlock _Nonnull)byString;
@end

@interface UINavigationItem (JobsSystemAPIDSLSupplement)
-(JobsRetNavigationItemByBarButtonItemsBlock _Nonnull)byRightBarButtonItems;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UINavigationItem
-(JobsRetUINavigationItemByUIBarButtonItemBlock _Nonnull)byLeftBarButtonItem;
-(JobsRetUINavigationItemByBOOLBlock _Nonnull)byHidesBackButton;
-(JobsRetUINavigationItemByUIBarButtonItemBlock _Nonnull)byRightBarButtonItem;
-(JobsRetUINavigationItemByUIViewBlock _Nonnull)byTitleView;
-(JobsRetUINavigationItemByUINavigationItemLargeTitleDisplayModeBlock _Nonnull)byLargeTitleDisplayMode;
-(void)setHidesBackButton:(BOOL)data;
-(void)setRightBarButtonItem:(UIBarButtonItem * _Nullable)data;
-(void)setTitleView:(UIView * _Nullable)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UINavigationItem
@end


@interface UIViewController (JobsSystemAPIDSLSupplement)
-(JobsRetVCByBOOLBlock _Nonnull)byHidesBottomBarWhenPushed;
-(JobsRetUIViewControllerByUIModalPresentationStyleBlock _Nonnull)byModalPresentationStyle;
-(JobsRetUIViewControllerByUITabBarItemBlock _Nonnull)byTabBarItem;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UIViewController
-(JobsRetUIViewControllerByIDUIViewControllerTransitioningDelegateBlock _Nonnull)byTransitioningDelegate;
-(void)setModalPresentationStyle:(UIModalPresentationStyle)data;
-(void)setTabBarItem:(UITabBarItem * _Nullable)data;
-(void)setTransitioningDelegate:(id <UIViewControllerTransitioningDelegate> _Nullable)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UIViewController
@end

@interface NSURLComponents (JobsSystemAPIDSLSupplement)
-(JobsRetURLComponentsByStrBlock _Nonnull)byScheme;
-(JobsRetURLComponentsByStrBlock _Nonnull)byPath;
-(JobsRetURLComponentsByQueryItemsBlock _Nonnull)byQueryItems;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN NSURLComponents
-(JobsRetURLComponentsByStrBlock _Nonnull)byFragment;
-(JobsRetURLComponentsByStrBlock _Nonnull)byQuery;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END NSURLComponents
@end

@interface UIScreen (JobsSystemAPIDSLSupplement)
-(JobsRetScreenByCGFloatBlock _Nonnull)byBrightness;
@end

@interface UIApplication (JobsSystemAPIDSLSupplement)
-(JobsRetApplicationByBOOLBlock _Nonnull)byIdleTimerDisabled;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UIApplication
-(JobsRetApplicationByBOOLBlock _Nonnull)byApplicationSupportsShakeToEdit;
-(JobsRetUIApplicationByNSIntegerBlock _Nonnull)byApplicationIconBadgeNumber;
-(void)setApplicationIconBadgeNumber:(NSInteger)data;
-(void)setApplicationSupportsShakeToEdit:(BOOL)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UIApplication
@end

@interface CATransition (JobsSystemAPIDSLSupplement)
-(JobsRetCATransitionByTimeIntervalBlock _Nonnull)byDuration;
-(JobsRetCATransitionByStrBlock _Nonnull)byType;
-(JobsRetCATransitionByStrBlock _Nonnull)bySubtype;
-(JobsRetCATransitionByTimingFunctionBlock _Nonnull)byTimingFunction;
-(JobsRetCATransitionByBOOLBlock _Nonnull)byRemovedOnCompletion;
@end

@interface NSDateComponents (JobsSystemAPIDSLSupplement)
-(JobsRetDateComponentsByCalendarBlock _Nonnull)byCalendar;
-(JobsRetDateComponentsByTimeZoneBlock _Nonnull)byTimeZone;
-(JobsRetDateComponentsByIntegerBlock _Nonnull)byYear;
-(JobsRetDateComponentsByIntegerBlock _Nonnull)byMonth;
-(JobsRetDateComponentsByIntegerBlock _Nonnull)byDay;
-(JobsRetDateComponentsByIntegerBlock _Nonnull)byHour;
-(JobsRetDateComponentsByIntegerBlock _Nonnull)byMinute;
-(JobsRetDateComponentsByIntegerBlock _Nonnull)bySecond;
@end

@interface UNUserNotificationCenter (JobsSystemAPIDSLSupplement)
-(JobsRetUNUserNotificationCenterByDelegateBlock _Nonnull)byDelegate API_AVAILABLE(ios(10.0));
@end

@interface UNMutableNotificationContent (JobsSystemAPIDSLSupplement)
-(JobsRetUNMutableNotificationContentByStrBlock _Nonnull)byTitle;
-(JobsRetUNMutableNotificationContentByStrBlock _Nonnull)bySubtitle;
-(JobsRetUNMutableNotificationContentByNumBlock _Nonnull)byBadge;
-(JobsRetUNMutableNotificationContentByStrBlock _Nonnull)byBody;
-(JobsRetUNMutableNotificationContentBySoundBlock _Nonnull)bySound;
-(JobsRetUNMutableNotificationContentByAttachmentsBlock _Nonnull)byAttachments;
-(JobsRetUNMutableNotificationContentByStrBlock _Nonnull)byLaunchImageName;
-(JobsRetUNMutableNotificationContentByStrBlock _Nonnull)byCategoryIdentifier;
@end

@interface UIGraphicsImageRendererFormat (JobsSystemAPIDSLSupplement)
-(JobsRetGraphicsImageRendererFormatByBOOLBlock _Nonnull)byOpaque;
@end

@interface NSTextAttachment (JobsSystemAPIDSLSupplement)
-(JobsRetTextAttachmentByImageBlock _Nonnull)byImage;
-(JobsRetTextAttachmentByCGRectBlock _Nonnull)byBounds;
@end

@interface AVPlayerLayer (JobsSystemAPIDSLSupplement)
-(JobsRetAVPlayerLayerByPlayerBlock _Nonnull)byPlayer;
-(JobsRetAVPlayerLayerByAVLayerVideoGravityBlock _Nonnull)byVideoGravity;
@end

@interface WKWebView (JobsSystemAPIDSLSupplement)
-(JobsRetWKWebViewByIDBlock _Nonnull)byUIDelegate;
-(JobsRetWKWebViewByIDBlock _Nonnull)byNavigationDelegate;
-(JobsRetWKWebViewByBOOLBlock _Nonnull)byAllowsBackForwardNavigationGestures;
@end

@interface WKWebViewConfiguration (JobsSystemAPIDSLSupplement)
-(JobsRetWKWebViewConfigurationByUserContentControllerBlock _Nonnull)byUserContentController;
-(JobsRetWKWebViewConfigurationByPreferencesBlock _Nonnull)byDefaultWebpagePreferences;
-(JobsRetWKWebViewConfigurationByBOOLBlock _Nonnull)byAllowsInlineMediaPlayback;
@end

@interface WKWebpagePreferences (JobsSystemAPIDSLSupplement)
-(JobsRetWKWebpagePreferencesByBOOLBlock _Nonnull)byAllowsContentJavaScript;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSYSTEMAPIDSLSUPPLEMENT */

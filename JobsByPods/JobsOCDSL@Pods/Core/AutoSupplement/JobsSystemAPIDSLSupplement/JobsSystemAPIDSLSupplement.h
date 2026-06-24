//
//  JobsSystemAPIDSLSupplement.h
//  JobsOCDSL
//
//  Auto-supplemented wrappers for existing system API DSL categories.
//

#ifndef JOBS_HEADER_GUARD_JOBSSYSTEMAPIDSLSUPPLEMENT
#define JOBS_HEADER_GUARD_JOBSSYSTEMAPIDSLSUPPLEMENT

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import <PDFKit/PDFKit.h>

#if __has_include(<Metal/Metal.h>)
#import <Metal/Metal.h>
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

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
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byPrefetchingEnabled;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byDragInteractionEnabled API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetCollectionViewByReorderingCadenceBlock _Nonnull)byReorderingCadence API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetCollectionViewBySelfSizingInvalidationBlock _Nonnull)bySelfSizingInvalidation API_AVAILABLE(ios(16.0), tvos(16.0)) API_UNAVAILABLE(watchos);
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelection;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelection;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)bySelectionFollowsFocus API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocus API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byEditing API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
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
-(JobsRetScrollViewByPointBlock _Nonnull)byContentOffset;
-(JobsRetScrollViewBySizeBlock _Nonnull)byContentSize;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byContentInset;
-(JobsRetScrollViewByPointBlock _Nonnull)byContentAlignmentPoint API_AVAILABLE(ios(26.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetScrollViewByContentInsetAdjustmentBehaviorBlock _Nonnull)byContentInsetAdjustmentBehavior API_AVAILABLE(ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAutomaticallyAdjustsScrollIndicatorInsets API_AVAILABLE(ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDirectionalLockEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBounces;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceVertical;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceHorizontal;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byPagingEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersHorizontalScrollingToParent API_AVAILABLE(ios(18.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersVerticalScrollingToParent API_AVAILABLE(ios(18.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsVerticalScrollIndicator;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsHorizontalScrollIndicator;
-(JobsRetScrollViewByIndicatorStyleBlock _Nonnull)byIndicatorStyle;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byVerticalScrollIndicatorInsets API_AVAILABLE(ios(11.1), tvos(11.1)) API_UNAVAILABLE(watchos);
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byHorizontalScrollIndicatorInsets API_AVAILABLE(ios(11.1), tvos(11.1)) API_UNAVAILABLE(watchos);
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byScrollIndicatorInsets;
-(JobsRetScrollViewByDecelerationRateBlock _Nonnull)byDecelerationRate;
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndexDisplayMode API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDelaysContentTouches;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byCanCancelContentTouches;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMinimumZoomScale;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMaximumZoomScale;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byZoomScale;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesZoom;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollsToTop;
-(JobsRetScrollViewByKeyboardDismissModeBlock _Nonnull)byKeyboardDismissMode API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAllowsKeyboardScrolling API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(tvos, watchos);
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
-(JobsRetUILabelByVibrancyBlock _Nonnull)byPreferredVibrancy API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
-(JobsRetUILabelByUIColorBlock _Nonnull)byTextColor;
-(JobsRetUILabelByNSAttributedStringBlock _Nonnull)byAttributedText;
-(JobsRetUILabelByUIColorBlock _Nonnull)byShadowColor;
-(JobsRetUILabelByCGSizeBlock _Nonnull)byShadowOffset;
-(JobsRetUILabelByUIColorBlock _Nonnull)byHighlightedTextColor;
-(JobsRetUILabelByBOOLBlock _Nonnull)byHighlighted;
-(JobsRetUILabelByBOOLBlock _Nonnull)byEnabled;
-(JobsRetUILabelByNSIntegerBlock _Nonnull)byBaselineAdjustment;
-(JobsRetUILabelByBOOLBlock _Nonnull)byAdjustsFontSizeToFitWidth;
-(JobsRetUILabelByCGFloatBlock _Nonnull)byMinimumScaleFactor;
-(JobsRetUILabelByNSIntegerBlock _Nonnull)byLineBreakMode;
-(JobsRetUILabelByBOOLBlock _Nonnull)byAllowsDefaultTighteningForTruncation;
-(JobsRetUILabelByCGFloatBlock _Nonnull)byPreferredMaxLayoutWidth;
-(JobsRetUILabelByLineBreakStrategyBlock _Nonnull)byLineBreakStrategy API_AVAILABLE(ios(14.0), tvos(14.0), watchos(7.0));
-(JobsRetUILabelByBOOLBlock _Nonnull)byShowsExpansionTextWhenTruncated API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetUILabelByCGFloatBlock _Nonnull)byMinimumFontSize API_DEPRECATED("", ios(2.0, 6.0)) API_UNAVAILABLE(tvos) API_UNAVAILABLE(visionos, watchos);
-(JobsRetUILabelByBOOLBlock _Nonnull)byAdjustsLetterSpacingToFitWidth API_DEPRECATED("", ios(6.0, 7.0)) API_UNAVAILABLE(tvos) API_UNAVAILABLE(visionos, watchos);
#if defined(__IPHONE_10_0)
-(JobsRetUILabelByBOOLBlock _Nonnull)byAdjustsFontForContentSizeCategory;
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

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSYSTEMAPIDSLSUPPLEMENT */

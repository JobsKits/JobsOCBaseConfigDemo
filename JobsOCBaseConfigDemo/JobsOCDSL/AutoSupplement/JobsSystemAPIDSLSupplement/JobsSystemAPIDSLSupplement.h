//
//  JobsSystemAPIDSLSupplement.h
//  JobsOCBaseConfigDemo
//
//  Auto-supplemented wrappers for existing system API DSL categories.
//

#ifndef JOBS_HEADER_GUARD_JOBSSYSTEMAPIDSLSUPPLEMENT
#define JOBS_HEADER_GUARD_JOBSSYSTEMAPIDSLSUPPLEMENT

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import <PDFKit/PDFKit.h>
#import <Metal/Metal.h>

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
-(JobsRetCollectionViewByIndexSetBlock _Nonnull)byReloadSections;
-(JobsRetCollectionViewByIndexSetBlock _Nonnull)byInsertSections;
-(JobsRetCollectionViewByIndexSetBlock _Nonnull)byDeleteSections;
-(JobsRetCollectionViewByArrBlock _Nonnull)byReloadItemsAtIndexPaths;
-(JobsRetCollectionViewByArrBlock _Nonnull)byInsertItemsAtIndexPaths;
-(JobsRetCollectionViewByArrBlock _Nonnull)byDeleteItemsAtIndexPaths;
@end

@interface UIPageControl (JobsSystemAPIDSLSupplement)
-(JobsRetPageControlByNSIntegerBlock _Nonnull)byNumberOfPages;
-(JobsRetPageControlByNSIntegerBlock _Nonnull)byCurrentPage;
-(JobsRetPageControlByBOOLBlock _Nonnull)byHidesForSinglePage;
-(JobsRetPageControlByColorBlock _Nonnull)byPageIndicatorTintColor;
-(JobsRetPageControlByColorBlock _Nonnull)byCurrentPageIndicatorTintColor;
-(JobsRetPageControlByImageBlock _Nonnull)byPreferredIndicatorImage API_AVAILABLE(ios(14.0), tvos(14.0));
-(JobsRetPageControlByImageAndNSIntegerBlock _Nonnull)byIndicatorImageForPage API_AVAILABLE(ios(14.0), tvos(14.0));
-(JobsRetPageControlByBackgroundStyleBlock _Nonnull)byBackgroundStyle API_AVAILABLE(ios(14.0), tvos(14.0));
-(JobsRetPageControlByDirectionBlock _Nonnull)byDirection API_AVAILABLE(ios(16.0), tvos(16.0));
@end

@interface UILabel (JobsSystemAPIDSLSupplement)
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

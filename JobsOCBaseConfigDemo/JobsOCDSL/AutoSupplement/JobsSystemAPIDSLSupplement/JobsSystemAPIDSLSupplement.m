//
//  JobsSystemAPIDSLSupplement.m
//  JobsOCBaseConfigDemo
//

#import "JobsSystemAPIDSLSupplement.h"

@implementation CAMetalLayer (JobsSystemAPIDSLSupplement)
#if defined(__IPHONE_16_0)
-(JobsRetCAMetalLayerByBOOLBlock)byWantsExtendedDynamicRangeContent{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.wantsExtendedDynamicRangeContent = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetCAMetalLayerByBOOLBlock)byDisplaySyncEnabled{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        (void)data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetCAMetalLayerByBOOLBlock)byAllowsNextDrawableTimeout{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsNextDrawableTimeout = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_16_0)
-(JobsRetCAMetalLayerByNSDictionaryBlock)byDeveloperHUDProperties{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.developerHUDProperties = data;
        return self;
    };
}

#endif
@end

@implementation MFMailComposeViewController (JobsSystemAPIDSLSupplement)
#if defined(__IPHONE_11_0)
-(JobsRetMailComposeVCByStrBlock)bySetPreferredSendingEmailAddress{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        [self setPreferredSendingEmailAddress:data];
        return self;
    };
}

#endif
@end

@implementation MFMessageComposeViewController (JobsSystemAPIDSLSupplement)
-(JobsRetMessageComposeVCByStrBlock)bySubject{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.subject = data;
        return self;
    };
}

@end

@implementation NSDateFormatter (JobsSystemAPIDSLSupplement)
-(JobsRetDateFormatterByBOOLBlock)byGeneratesCalendarDates{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.generatesCalendarDates = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateBlock)byTwoDigitStartDate{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDate *_Nullable data){
        @jobs_strongify(self)
        self.twoDigitStartDate = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateBlock)byDefaultDate{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDate *_Nullable data){
        @jobs_strongify(self)
        self.defaultDate = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byEraSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.eraSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.monthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byShortMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byWeekdaySymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.weekdaySymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byShortWeekdaySymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortWeekdaySymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byVeryShortWeekdaySymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.veryShortWeekdaySymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byStandaloneMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.standaloneMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byShortStandaloneMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortStandaloneMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byVeryShortStandaloneMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.veryShortStandaloneMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byQuarterSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.quarterSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byShortQuarterSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortQuarterSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byStandaloneQuarterSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.standaloneQuarterSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byShortStandaloneQuarterSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortStandaloneQuarterSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock)byVeryShortMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.veryShortMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByStrBlock)byAMSymbol{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.AMSymbol = data;
        return self;
    };
}

-(JobsRetDateFormatterByStrBlock)byPMSymbol{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.PMSymbol = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateBlock)byGregorianStartDate{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDate *_Nullable data){
        @jobs_strongify(self)
        self.gregorianStartDate = data;
        return self;
    };
}

-(JobsRetDateFormatterByBOOLBlock)byDoesRelativeDateFormatting{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.doesRelativeDateFormatting = data;
        return self;
    };
}

-(JobsRetDateFormatterByNSIntegerBlock)byFormattingContext{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSFormattingContext data){
        @jobs_strongify(self)
        self.formattingContext = data;
        return self;
    };
}

@end

@implementation PDFView (JobsSystemAPIDSLSupplement)
-(JobsRetPDFViewByBOOLBlock)byDisplaysAsBook{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.displaysAsBook = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock)byDisplaysRTL{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.displaysRTL = data;
        return self;
    };
}

-(JobsRetPDFViewByCGFloatBlock)byMinScaleFactor{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minScaleFactor = data;
        return self;
    };
}

-(JobsRetPDFViewByCGFloatBlock)byMaxScaleFactor{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.maxScaleFactor = data;
        return self;
    };
}

-(JobsRetPDFViewByPDFInterpolationQualityBlock)byInterpolationQuality{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFInterpolationQuality data){
        @jobs_strongify(self)
        self.interpolationQuality = data;
        return self;
    };
}

-(JobsRetPDFViewByUIEdgeInsetsBlock)byPageBreakMargins{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        self.pageBreakMargins = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock)byPageShadowsEnabled{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.pageShadowsEnabled = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock)byUsePageViewController{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        [self usePageViewController:data withViewOptions:nil];
        return self;
    };
}

-(JobsRetPDFViewByPDFPageBlock)byGoToPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFPage *_Nonnull data){
        @jobs_strongify(self)
        [self goToPage:data];
        return self;
    };
}

-(JobsRetPDFViewByPDFDestinationBlock)byGoToDestination{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDestination *_Nonnull data){
        @jobs_strongify(self)
        [self goToDestination:data];
        return self;
    };
}

-(JobsRetPDFViewByPDFSelectionBlock)byGoToSelection{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFSelection *_Nonnull data){
        @jobs_strongify(self)
        [self goToSelection:data];
        return self;
    };
}

-(JobsRetPDFViewByPDFSelectionBlock)bySetCurrentSelection{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFSelection *_Nullable data){
        @jobs_strongify(self)
        [self setCurrentSelection:data];
        return self;
    };
}

-(JobsRetPDFViewByArrBlock)byHighlightedSelections{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(NSArray<PDFSelection *> *_Nullable data){
        @jobs_strongify(self)
        self.highlightedSelections = data;
        return self;
    };
}

@end

@implementation UICollectionView (JobsSystemAPIDSLSupplement)
-(JobsRetCollectionViewByIndexSetBlock)byReloadSections{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSIndexSet *_Nonnull data){
        @jobs_strongify(self)
        [self reloadSections:data];
        return self;
    };
}

-(JobsRetCollectionViewByIndexSetBlock)byInsertSections{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSIndexSet *_Nonnull data){
        @jobs_strongify(self)
        [self insertSections:data];
        return self;
    };
}

-(JobsRetCollectionViewByIndexSetBlock)byDeleteSections{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSIndexSet *_Nonnull data){
        @jobs_strongify(self)
        [self deleteSections:data];
        return self;
    };
}

-(JobsRetCollectionViewByArrBlock)byReloadItemsAtIndexPaths{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSArray<NSIndexPath *> *_Nonnull data){
        @jobs_strongify(self)
        [self reloadItemsAtIndexPaths:data];
        return self;
    };
}

-(JobsRetCollectionViewByArrBlock)byInsertItemsAtIndexPaths{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSArray<NSIndexPath *> *_Nonnull data){
        @jobs_strongify(self)
        [self insertItemsAtIndexPaths:data];
        return self;
    };
}

-(JobsRetCollectionViewByArrBlock)byDeleteItemsAtIndexPaths{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSArray<NSIndexPath *> *_Nonnull data){
        @jobs_strongify(self)
        [self deleteItemsAtIndexPaths:data];
        return self;
    };
}

@end

@implementation UIPageControl (JobsSystemAPIDSLSupplement)
-(JobsRetPageControlByNSIntegerBlock)byNumberOfPages{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.numberOfPages = data;
        return self;
    };
}

-(JobsRetPageControlByNSIntegerBlock)byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(JobsRetPageControlByBOOLBlock)byHidesForSinglePage{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.hidesForSinglePage = data;
        return self;
    };
}

-(JobsRetPageControlByColorBlock)byPageIndicatorTintColor{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.pageIndicatorTintColor = color;
        return self;
    };
}

-(JobsRetPageControlByColorBlock)byCurrentPageIndicatorTintColor{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.currentPageIndicatorTintColor = color;
        return self;
    };
}

-(JobsRetPageControlByImageBlock)byPreferredIndicatorImage API_AVAILABLE(ios(14.0), tvos(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.preferredIndicatorImage = image;
        };return self;
    };
}

-(JobsRetPageControlByImageAndNSIntegerBlock)byIndicatorImageForPage API_AVAILABLE(ios(14.0), tvos(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIImage *_Nullable image, NSInteger page){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            [self setIndicatorImage:image forPage:page];
        };return self;
    };
}

-(JobsRetPageControlByBackgroundStyleBlock)byBackgroundStyle API_AVAILABLE(ios(14.0), tvos(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIPageControlBackgroundStyle style){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.backgroundStyle = style;
        };return self;
    };
}

-(JobsRetPageControlByDirectionBlock)byDirection API_AVAILABLE(ios(16.0), tvos(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIPageControlDirection direction){
        @jobs_strongify(self)
        if (@available(iOS 16.0, tvOS 16.0, *)) {
            self.direction = direction;
        };return self;
    };
}

@end

@implementation UILabel (JobsSystemAPIDSLSupplement)
-(JobsRetUILabelByUIColorBlock)byTextColor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(JobsRetUILabelByNSAttributedStringBlock)byAttributedText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSAttributedString *_Nullable data){
        @jobs_strongify(self)
        self.attributedText = data;
        return self;
    };
}

-(JobsRetUILabelByUIColorBlock)byShadowColor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.shadowColor = data;
        return self;
    };
}

-(JobsRetUILabelByCGSizeBlock)byShadowOffset{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.shadowOffset = data;
        return self;
    };
}

-(JobsRetUILabelByUIColorBlock)byHighlightedTextColor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.highlightedTextColor = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock)byHighlighted{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.highlighted = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock)byEnabled{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.enabled = data;
        return self;
    };
}

-(JobsRetUILabelByNSIntegerBlock)byBaselineAdjustment{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIBaselineAdjustment data){
        @jobs_strongify(self)
        self.baselineAdjustment = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock)byAdjustsFontSizeToFitWidth{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.adjustsFontSizeToFitWidth = data;
        return self;
    };
}

-(JobsRetUILabelByCGFloatBlock)byMinimumScaleFactor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minimumScaleFactor = data;
        return self;
    };
}

-(JobsRetUILabelByNSIntegerBlock)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSLineBreakMode data){
        @jobs_strongify(self)
        self.lineBreakMode = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock)byAllowsDefaultTighteningForTruncation{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsDefaultTighteningForTruncation = data;
        return self;
    };
}

-(JobsRetUILabelByCGFloatBlock)byPreferredMaxLayoutWidth{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.preferredMaxLayoutWidth = data;
        return self;
    };
}

#if defined(__IPHONE_10_0)
-(JobsRetUILabelByBOOLBlock)byAdjustsFontForContentSizeCategory{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.adjustsFontForContentSizeCategory = data;
        return self;
    };
}

#endif
@end

@implementation UITextField (JobsSystemAPIDSLSupplement)
-(JobsRetTextFieldByCorBlock)byTextColor{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock)byAutocapitalizationType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextAutocapitalizationType data){
        @jobs_strongify(self)
        self.autocapitalizationType = data;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock)byAutocorrectionType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextAutocorrectionType data){
        @jobs_strongify(self)
        self.autocorrectionType = data;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock)bySpellCheckingType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextSpellCheckingType data){
        @jobs_strongify(self)
        self.spellCheckingType = data;
        return self;
    };
}

#if defined(__IPHONE_11_0)
-(JobsRetTextFieldByNSIntegerBlock)bySmartQuotesType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextSmartQuotesType data){
        @jobs_strongify(self)
        self.smartQuotesType = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextFieldByNSIntegerBlock)bySmartDashesType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextSmartDashesType data){
        @jobs_strongify(self)
        self.smartDashesType = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextFieldByNSIntegerBlock)bySmartInsertDeleteType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextSmartInsertDeleteType data){
        @jobs_strongify(self)
        self.smartInsertDeleteType = data;
        return self;
    };
}

#endif
-(JobsRetTextFieldByBOOLBlock)byEnablesReturnKeyAutomatically{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.enablesReturnKeyAutomatically = data;
        return self;
    };
}

#if defined(__IPHONE_10_0)
-(JobsRetTextFieldByTextContentTypeBlock)byTextContentType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextContentType _Nullable data){
        @jobs_strongify(self)
        self.textContentType = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_12_0)
-(JobsRetTextFieldByPasswordRulesBlock)byPasswordRules{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextInputPasswordRules *_Nullable data){
        @jobs_strongify(self)
        self.passwordRules = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_10_0)
-(JobsRetTextFieldByBOOLBlock)byAdjustsFontForContentSizeCategory{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.adjustsFontForContentSizeCategory = data;
        return self;
    };
}

#endif
@end

@implementation UITextView (JobsSystemAPIDSLSupplement)
-(JobsRetTextViewByCorBlock)byTextColor{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(JobsRetTextViewByAttributedStringBlock)byAttributedString{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSAttributedString *_Nullable data){
        @jobs_strongify(self)
        self.attributedText = data;
        return self;
    };
}

#if defined(__IPHONE_11_0)
-(JobsRetTextViewByTextDragDelegateBlock)byTextDragDelegate{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(id<UITextDragDelegate> _Nullable data){
        @jobs_strongify(self)
        self.textDragDelegate = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextViewByTextDropDelegateBlock)byTextDropDelegate{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(id<UITextDropDelegate> _Nullable data){
        @jobs_strongify(self)
        self.textDropDelegate = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextViewByTextDragOptionsBlock)byTextDragOptions{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextDragOptions data){
        @jobs_strongify(self)
        self.textDragOptions = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetTextViewByBOOLBlock)byUsesStandardTextScaling{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.usesStandardTextScaling = data;
        return self;
    };
}

#endif
@end

@implementation UIView (JobsSystemAPIDSLSupplement)
-(JobsRetViewByStringBlock)byRestorationIdentifier{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.restorationIdentifier = data;
        return self;
    };
}

-(JobsRetViewByFrameBlock)byContentStretch{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.contentStretch = data;
        return self;
    };
}

#if defined(__IPHONE_11_0)
-(JobsRetViewByArrBlock)byInteractions{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSArray<id<UIInteraction>> *_Nonnull data){
        @jobs_strongify(self)
        self.interactions = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByStringBlock)byLargeContentTitle{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.largeContentTitle = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByImageBlock)byLargeContentImage{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.largeContentImage = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByBOOLBlock)byScalesLargeContentImage{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.scalesLargeContentImage = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByBOOLBlock)byShowsLargeContentViewer{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsLargeContentViewer = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetViewByBOOLBlock)byAccessibilityIgnoresInvertColors{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.accessibilityIgnoresInvertColors = data;
        return self;
    };
}

#endif
-(JobsRetBOOLByBOOLBlock)byEndEditing{
    @jobs_weakify(self)
    return ^BOOL(BOOL data){
        @jobs_strongify(self)
        return [self endEditing:data];
    };
}

-(JobsRetViewByNSIntegerReturnViewBlock)byViewWithTag{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self viewWithTag:data];
    };
}

@end

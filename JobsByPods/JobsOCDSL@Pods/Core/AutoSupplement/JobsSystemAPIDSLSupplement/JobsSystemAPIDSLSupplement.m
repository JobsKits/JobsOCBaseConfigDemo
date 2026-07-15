//
//  JobsSystemAPIDSLSupplement.m
//  JobsOCDSL
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
-(JobsRetCollectionViewByBOOLBlock)byPrefetchingEnabled{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.prefetchingEnabled = data;
        return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)byDragInteractionEnabled{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            self.dragInteractionEnabled = data;
        };return self;
    };
}

-(JobsRetCollectionViewByReorderingCadenceBlock)byReorderingCadence{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UICollectionViewReorderingCadence data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            self.reorderingCadence = data;
        };return self;
    };
}

-(JobsRetCollectionViewBySelfSizingInvalidationBlock)bySelfSizingInvalidation{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UICollectionViewSelfSizingInvalidation data){
        @jobs_strongify(self)
        if (@available(iOS 16.0, tvOS 16.0, *)) {
            self.selfSizingInvalidation = data;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)byAllowsSelection{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsSelection = data;
        return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)byAllowsMultipleSelection{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsMultipleSelection = data;
        return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)byRemembersLastFocusedIndexPath{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.remembersLastFocusedIndexPath = data;
        return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)bySelectionFollowsFocus{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.selectionFollowsFocus = data;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)byAllowsFocus{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.allowsFocus = data;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)byAllowsFocusDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.allowsFocusDuringEditing = data;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)byEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.editing = data;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)byAllowsSelectionDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.allowsSelectionDuringEditing = data;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock)byAllowsMultipleSelectionDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.allowsMultipleSelectionDuringEditing = data;
        };return self;
    };
}

-(JobsRetCollectionViewByVoidBlock)byReloadData{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        [self reloadData];
        return self;
    };
}

-(JobsRetCollectionViewByVoidBlock)byFinishInteractiveTransition{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        [self finishInteractiveTransition];
        return self;
    };
}

-(JobsRetCollectionViewByVoidBlock)byCancelInteractiveTransition{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        [self cancelInteractiveTransition];
        return self;
    };
}

-(JobsRetCollectionViewByVoidBlock)byEndInteractiveMovement{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) {
            [self endInteractiveMovement];
        };return self;
    };
}

-(JobsRetCollectionViewByVoidBlock)byCancelInteractiveMovement{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) {
            [self cancelInteractiveMovement];
        };return self;
    };
}

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

-(JobsRetCollectionViewByArrBlock)byReconfigureItemsAtIndexPaths{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSArray<NSIndexPath *> *_Nonnull data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            [self reconfigureItemsAtIndexPaths:data];
        };return self;
    };
}

-(JobsRetCollectionViewByCGPointBlock)byUpdateInteractiveMovementTargetPosition{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) {
            [self updateInteractiveMovementTargetPosition:data];
        };return self;
    };
}

@end

@implementation UIScrollView (JobsSystemAPIDSLSupplement)
-(JobsRetScrollViewByPointBlock)byContentOffset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        self.contentOffset = data;
        return self;
    };
}

-(JobsRetScrollViewBySizeBlock)byContentSize{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.contentSize = data;
        return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock)byContentInset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        self.contentInset = data;
        return self;
    };
}

-(JobsRetScrollViewByPointBlock)byContentAlignmentPoint{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        if (@available(iOS 26.0, *)) {
            self.contentAlignmentPoint = data;
        };return self;
    };
}

-(JobsRetScrollViewByContentInsetAdjustmentBehaviorBlock)byContentInsetAdjustmentBehavior{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewContentInsetAdjustmentBehavior data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, tvOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byAutomaticallyAdjustsScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            self.automaticallyAdjustsScrollIndicatorInsets = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byDirectionalLockEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.directionalLockEnabled = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byBounces{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.bounces = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byAlwaysBounceVertical{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.alwaysBounceVertical = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byAlwaysBounceHorizontal{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.alwaysBounceHorizontal = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byPagingEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.pagingEnabled = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byScrollEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.scrollEnabled = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byTransfersHorizontalScrollingToParent{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 18.0, *)) {
            self.transfersHorizontalScrollingToParent = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byTransfersVerticalScrollingToParent{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 18.0, *)) {
            self.transfersVerticalScrollingToParent = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byShowsVerticalScrollIndicator{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsVerticalScrollIndicator = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byShowsHorizontalScrollIndicator{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsHorizontalScrollIndicator = data;
        return self;
    };
}

-(JobsRetScrollViewByIndicatorStyleBlock)byIndicatorStyle{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewIndicatorStyle data){
        @jobs_strongify(self)
        self.indicatorStyle = data;
        return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock)byVerticalScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        if (@available(iOS 11.1, tvOS 11.1, *)) {
            self.verticalScrollIndicatorInsets = data;
        };return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock)byHorizontalScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        if (@available(iOS 11.1, tvOS 11.1, *)) {
            self.horizontalScrollIndicatorInsets = data;
        };return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock)byScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        self.scrollIndicatorInsets = data;
        return self;
    };
}

-(JobsRetScrollViewByDecelerationRateBlock)byDecelerationRate{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewDecelerationRate data){
        @jobs_strongify(self)
        self.decelerationRate = data;
        return self;
    };
}

-(JobsRetScrollViewByNSIntegerBlock)byIndexDisplayMode{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewIndexDisplayMode data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            self.indexDisplayMode = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byDelaysContentTouches{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.delaysContentTouches = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byCanCancelContentTouches{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.canCancelContentTouches = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock)byMinimumZoomScale{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minimumZoomScale = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock)byMaximumZoomScale{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.maximumZoomScale = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock)byZoomScale{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.zoomScale = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byBouncesZoom{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.bouncesZoom = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byScrollsToTop{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.scrollsToTop = data;
        return self;
    };
}

-(JobsRetScrollViewByKeyboardDismissModeBlock)byKeyboardDismissMode{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewKeyboardDismissMode data){
        @jobs_strongify(self)
        if (@available(iOS 7.0, *)) {
            self.keyboardDismissMode = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock)byAllowsKeyboardScrolling{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, *)) {
            self.allowsKeyboardScrolling = data;
        };return self;
    };
}

-(JobsRetScrollViewByVoidBlock)byFlashScrollIndicators{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(void){
        @jobs_strongify(self)
        [self flashScrollIndicators];
        return self;
    };
}

-(JobsRetScrollViewByVoidBlock)byStopScrollingAndZooming{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(void){
        @jobs_strongify(self)
        if (@available(iOS 18.0, *)) {
            [self stopScrollingAndZooming];
        };return self;
    };
}

@end

@implementation UIImageView (JobsSystemAPIDSLSupplement)
-(JobsRetImageViewBySymbolConfigurationBlock)byPreferredSymbolConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(UIImageSymbolConfiguration *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            self.preferredSymbolConfiguration = data;
        };return self;
    };
}

-(JobsRetImageViewByImageDynamicRangeBlock)byPreferredImageDynamicRange{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(UIImageDynamicRange data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, *)) {
            self.preferredImageDynamicRange = data;
        };return self;
    };
}

-(JobsRetImageViewByVoidBlock)byStartAnimating{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(void){
        @jobs_strongify(self)
        [self startAnimating];
        return self;
    };
}

-(JobsRetImageViewByVoidBlock)byStopAnimating{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(void){
        @jobs_strongify(self)
        [self stopAnimating];
        return self;
    };
}

-(JobsRetImageViewByVoidBlock)byRemoveAllSymbolEffects{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(void){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)) {
            [self removeAllSymbolEffects];
        };return self;
    };
}

-(JobsRetImageViewBySymbolEffectBlock)byAddSymbolEffect{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(NSSymbolEffect *_Nonnull data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)) {
            [self addSymbolEffect:data];
        };return self;
    };
}

-(JobsRetImageViewBySymbolEffectBlock)byRemoveSymbolEffectOfType{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(NSSymbolEffect *_Nonnull data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)) {
            [self removeSymbolEffectOfType:data];
        };return self;
    };
}

-(JobsRetImageViewBySymbolEffectOptionsBlock)byRemoveAllSymbolEffectsWithOptions{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(NSSymbolEffectOptions *_Nonnull data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)) {
            [self removeAllSymbolEffectsWithOptions:data];
        };return self;
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

-(JobsRetPageControlByBOOLBlock)byAllowsContinuousInteraction{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.allowsContinuousInteraction = data;
        };return self;
    };
}

-(JobsRetPageControlByBOOLBlock)byDefersCurrentPageDisplay{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.defersCurrentPageDisplay = data;
        return self;
    };
}

-(JobsRetPageControlByVoidBlock)byUpdateCurrentPageDisplay{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(void){
        @jobs_strongify(self)
        [self updateCurrentPageDisplay];
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

@implementation UITableView (JobsSystemAPIDSLSupplement)
-(JobsRetTableViewByVoidBlock)byBeginUpdates{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(void){
        @jobs_strongify(self)
        [self beginUpdates];
        return self;
    };
}

-(JobsRetTableViewByVoidBlock)byEndUpdates{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(void){
        @jobs_strongify(self)
        [self endUpdates];
        return self;
    };
}

-(JobsRetTableViewByVoidBlock)byReloadData{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(void){
        @jobs_strongify(self)
        [self reloadData];
        return self;
    };
}

-(JobsRetTableViewByVoidBlock)byReloadSectionIndexTitles{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(void){
        @jobs_strongify(self)
        [self reloadSectionIndexTitles];
        return self;
    };
}

-(JobsRetTableViewByArrBlock)byReconfigureRowsAtIndexPaths{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(NSArray<NSIndexPath *> *_Nonnull data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            [self reconfigureRowsAtIndexPaths:data];
        };return self;
    };
}

@end

@implementation UILabel (JobsSystemAPIDSLSupplement)
-(JobsRetUILabelByVibrancyBlock)byPreferredVibrancy{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UILabelVibrancy data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)) {
            self.preferredVibrancy = data;
        };return self;
    };
}

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

-(JobsRetUILabelByLineBreakStrategyBlock)byLineBreakStrategy{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSLineBreakStrategy data){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)) {
            self.lineBreakStrategy = data;
        };return self;
    };
}

-(JobsRetUILabelByBOOLBlock)byShowsExpansionTextWhenTruncated{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)) {
            self.showsExpansionTextWhenTruncated = data;
        };return self;
    };
}

-(JobsRetUILabelByCGFloatBlock)byMinimumFontSize{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGFloat data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.minimumFontSize = data;);
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock)byAdjustsLetterSpacingToFitWidth{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.adjustsLetterSpacingToFitWidth = data;);
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

-(JobsRetTextViewByBOOLBlock)byFindInteractionEnabled{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            self.findInteractionEnabled = data;
        };return self;
    };
}

-(JobsRetTextViewByBorderStyleBlock)byBorderStyle{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextViewBorderStyle data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, visionOS 1.0, *)) {
            self.borderStyle = data;
        };return self;
    };
}

-(JobsRetTextViewByIDBlock)byInteractionState{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, visionOS 1.0, *)) {
            self.interactionState = data;
        };return self;
    };
}

@end

@implementation UIPanGestureRecognizer (JobsSystemAPIDSLSupplement)
-(JobsRetPanGestureRecognizerByUIScrollTypeMaskBlock)byAllowedScrollTypesMask{
    @jobs_weakify(self)
    return ^UIPanGestureRecognizer *_Nullable(UIScrollTypeMask data){
        @jobs_strongify(self)
        if (@available(iOS 13.4, *)) {
            self.allowedScrollTypesMask = data;
        };return self;
    };
}

@end

@implementation UITapGestureRecognizer (JobsSystemAPIDSLSupplement)
-(JobsRetTapGestureRecognizerByUIEventButtonMaskBlock)byButtonMaskRequired{
    @jobs_weakify(self)
    return ^UITapGestureRecognizer *_Nullable(UIEventButtonMask data){
        @jobs_strongify(self)
        if (@available(iOS 13.4, *)) {
            self.buttonMaskRequired = data;
        };return self;
    };
}

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

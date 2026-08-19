//
//  JobsSystemAPIDSLSupplement.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "JobsSystemAPIDSLSupplement.h"

@implementation CAMetalLayer (JobsSystemAPIDSLSupplement)
#if defined(__IPHONE_16_0)
-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byWantsExtendedDynamicRangeContent{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.wantsExtendedDynamicRangeContent = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byDisplaySyncEnabled{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        (void)data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byAllowsNextDrawableTimeout{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsNextDrawableTimeout = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_16_0)
-(JobsRetCAMetalLayerByNSDictionaryBlock _Nonnull)byDeveloperHUDProperties{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.developerHUDProperties = data;
        return self;
    };
}

#endif

@end

@implementation NSDateComponents (JobsSystemAPIDSLSupplement)
-(JobsRetDateComponentsByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof NSDateComponents *_Nullable(NSCalendar *_Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}
-(JobsRetDateComponentsByTimeZoneBlock _Nonnull)byTimeZone{
    @jobs_weakify(self)
    return ^__kindof NSDateComponents *_Nullable(NSTimeZone *_Nullable data){
        @jobs_strongify(self)
        self.timeZone = data;
        return self;
    };
}
#define JobsNSDateComponentsDSL(_name_, _property_) \
-(JobsRetDateComponentsByIntegerBlock _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof NSDateComponents *_Nullable(NSInteger data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}
JobsNSDateComponentsDSL(Year, year)
JobsNSDateComponentsDSL(Month, month)
JobsNSDateComponentsDSL(Day, day)
JobsNSDateComponentsDSL(Hour, hour)
JobsNSDateComponentsDSL(Minute, minute)
JobsNSDateComponentsDSL(Second, second)
#undef JobsNSDateComponentsDSL
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UINavigationItem
@interface UINavigationItem (JobsPropertyDSLSetterAutogen_70a2fbb5a1)
-(void)setHidesBackButton:(BOOL)data;
-(void)setLeftBarButtonItem:(UIBarButtonItem * _Nullable)data;
-(void)setRightBarButtonItem:(UIBarButtonItem * _Nullable)data;
-(void)setTitleView:(UIView * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UINavigationItem

@implementation UINavigationItem (JobsSystemAPIDSLSupplement)
-(JobsRetNavigationItemByBarButtonItemsBlock _Nonnull)byRightBarButtonItems{
    @jobs_weakify(self)
    return ^__kindof UINavigationItem *_Nullable(NSArray<UIBarButtonItem *> *_Nullable data){
        @jobs_strongify(self)
        self.rightBarButtonItems = data;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UINavigationItem
-(JobsRetUINavigationItemByUIBarButtonItemBlock _Nonnull)byLeftBarButtonItem{
    @jobs_weakify(self)
    return ^__kindof UINavigationItem * _Nullable(UIBarButtonItem * _Nullable data){
        @jobs_strongify(self)
        [self setLeftBarButtonItem:data];
        return self;
    };
}
-(JobsRetUINavigationItemByBOOLBlock _Nonnull)byHidesBackButton{
    @jobs_weakify(self)
    return ^__kindof UINavigationItem * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHidesBackButton:data];
        return self;
    };
}

-(JobsRetUINavigationItemByUIBarButtonItemBlock _Nonnull)byRightBarButtonItem{
    @jobs_weakify(self)
    return ^__kindof UINavigationItem * _Nullable(UIBarButtonItem * _Nullable data){
        @jobs_strongify(self)
        [self setRightBarButtonItem:data];
        return self;
    };
}

-(JobsRetUINavigationItemByUIViewBlock _Nonnull)byTitleView{
    @jobs_weakify(self)
    return ^__kindof UINavigationItem * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setTitleView:data];
        return self;
    };
}

-(JobsRetUINavigationItemByUINavigationItemLargeTitleDisplayModeBlock _Nonnull)byLargeTitleDisplayMode{
    @jobs_weakify(self)
    return ^__kindof UINavigationItem *_Nullable(UINavigationItemLargeTitleDisplayMode data){
        @jobs_strongify(self)
        self.largeTitleDisplayMode = data;
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UINavigationItem
@end


// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UIViewController
@interface UIViewController (JobsPropertyDSLSetterAutogen_70a2fbb5a1)
-(void)setModalPresentationStyle:(UIModalPresentationStyle)data;
-(void)setTabBarItem:(UITabBarItem * _Nullable)data;
-(void)setTransitioningDelegate:(id <UIViewControllerTransitioningDelegate> _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UIViewController

@implementation UIViewController (JobsSystemAPIDSLSupplement)
-(JobsRetVCByBOOLBlock _Nonnull)byHidesBottomBarWhenPushed{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.hidesBottomBarWhenPushed = data;
        return self;
    };
}

-(JobsRetUIViewControllerByUIModalPresentationStyleBlock _Nonnull)byModalPresentationStyle{
    @jobs_weakify(self)
    return ^__kindof UIViewController * _Nullable(UIModalPresentationStyle data){
        @jobs_strongify(self)
        [self setModalPresentationStyle:data];
        return self;
    };
}

-(JobsRetUIViewControllerByUITabBarItemBlock _Nonnull)byTabBarItem{
    @jobs_weakify(self)
    return ^__kindof UIViewController * _Nullable(UITabBarItem * _Nullable data){
        @jobs_strongify(self)
        [self setTabBarItem:data];
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UIViewController
-(JobsRetUIViewControllerByIDUIViewControllerTransitioningDelegateBlock _Nonnull)byTransitioningDelegate{
    @jobs_weakify(self)
    return ^__kindof UIViewController * _Nullable(id <UIViewControllerTransitioningDelegate> _Nullable data){
        @jobs_strongify(self)
        [self setTransitioningDelegate:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UIViewController
@end


// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN NSURLComponents
@interface NSURLComponents (JobsPropertyDSLSetterAutogen_70a2fbb5a1)
-(void)setFragment:(NSString * _Nullable)data;
-(void)setQuery:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END NSURLComponents

@implementation NSURLComponents (JobsSystemAPIDSLSupplement)
-(JobsRetURLComponentsByStrBlock _Nonnull)byScheme{
    @jobs_weakify(self)
    return ^__kindof NSURLComponents *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.scheme = data;
        return self;
    };
}

-(JobsRetURLComponentsByStrBlock _Nonnull)byPath{
    @jobs_weakify(self)
    return ^__kindof NSURLComponents *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.path = data;
        return self;
    };
}

-(JobsRetURLComponentsByQueryItemsBlock _Nonnull)byQueryItems{
    @jobs_weakify(self)
    return ^__kindof NSURLComponents *_Nullable(NSArray<NSURLQueryItem *> *_Nullable data){
        @jobs_strongify(self)
        self.queryItems = data;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN NSURLComponents
-(JobsRetURLComponentsByStrBlock _Nonnull)byFragment{
    @jobs_weakify(self)
    return ^__kindof NSURLComponents * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setFragment:data];
        return self;
    };
}

-(JobsRetURLComponentsByStrBlock _Nonnull)byQuery{
    @jobs_weakify(self)
    return ^__kindof NSURLComponents * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setQuery:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END NSURLComponents
@end


@implementation UIScreen (JobsSystemAPIDSLSupplement)
-(JobsRetScreenByCGFloatBlock _Nonnull)byBrightness{
    @jobs_weakify(self)
    return ^__kindof UIScreen *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.brightness = data;
        return self;
    };
}
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UIApplication
@interface UIApplication (JobsPropertyDSLSetterAutogen_70a2fbb5a1)
-(void)setApplicationIconBadgeNumber:(NSInteger)data;
-(void)setApplicationSupportsShakeToEdit:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UIApplication

@implementation UIApplication (JobsSystemAPIDSLSupplement)
-(JobsRetApplicationByBOOLBlock _Nonnull)byIdleTimerDisabled{
    @jobs_weakify(self)
    return ^__kindof UIApplication *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.idleTimerDisabled = data;
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UIApplication
-(JobsRetApplicationByBOOLBlock _Nonnull)byApplicationSupportsShakeToEdit{
    @jobs_weakify(self)
    return ^__kindof UIApplication * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setApplicationSupportsShakeToEdit:data];
        return self;
    };
}

-(JobsRetUIApplicationByNSIntegerBlock _Nonnull)byApplicationIconBadgeNumber{
    @jobs_weakify(self)
    return ^__kindof UIApplication * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setApplicationIconBadgeNumber:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UIApplication
@end


@implementation CATransition (JobsSystemAPIDSLSupplement)
-(JobsRetCATransitionByTimeIntervalBlock _Nonnull)byDuration{
    @jobs_weakify(self)
    return ^__kindof CATransition *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.duration = data;
        return self;
    };
}
-(JobsRetCATransitionByStrBlock _Nonnull)byType{
    @jobs_weakify(self)
    return ^__kindof CATransition *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.type = data;
        return self;
    };
}
-(JobsRetCATransitionByStrBlock _Nonnull)bySubtype{
    @jobs_weakify(self)
    return ^__kindof CATransition *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.subtype = data;
        return self;
    };
}
-(JobsRetCATransitionByTimingFunctionBlock _Nonnull)byTimingFunction{
    @jobs_weakify(self)
    return ^__kindof CATransition *_Nullable(CAMediaTimingFunction *_Nullable data){
        @jobs_strongify(self)
        self.timingFunction = data;
        return self;
    };
}
-(JobsRetCATransitionByBOOLBlock _Nonnull)byRemovedOnCompletion{
    @jobs_weakify(self)
    return ^__kindof CATransition *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.removedOnCompletion = data;
        return self;
    };
}
@end


@implementation UIAlertAction (JobsSystemAPIDSLSupplement)
-(JobsRetUIAlertActionByBOOLBlock _Nonnull)byEnabled{
    @jobs_weakify(self)
    return ^UIAlertAction *(BOOL enabled){
        @jobs_strongify(self)
        self.enabled = enabled;
        return self;
    };
}
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN NSShadow
@interface NSShadow (JobsPropertyDSLSetterAutogen_70a2fbb5a1)
-(void)setShadowBlurRadius:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END NSShadow

@implementation NSShadow (JobsSystemAPIDSLSupplement)
-(JobsRetNSShadowByIDBlock _Nonnull)byShadowColor{
    @jobs_weakify(self)
    return ^NSShadow *(id shadowColor){
        @jobs_strongify(self)
        self.shadowColor = shadowColor;
        return self;
    };
}

-(JobsRetNSShadowByCGSizeBlock _Nonnull)byShadowOffset{
    @jobs_weakify(self)
    return ^NSShadow *(CGSize shadowOffset){
        @jobs_strongify(self)
        self.shadowOffset = shadowOffset;
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN NSShadow
-(JobsRetNSShadowByCGFloatBlock _Nonnull)byShadowBlurRadius{
    @jobs_weakify(self)
    return ^__kindof NSShadow * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setShadowBlurRadius:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END NSShadow
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UICollectionViewLayoutAttributes
@interface UICollectionViewLayoutAttributes (JobsPropertyDSLSetterAutogen_70a2fbb5a1)
-(void)setZIndex:(NSInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UICollectionViewLayoutAttributes

@implementation UICollectionViewLayoutAttributes (JobsSystemAPIDSLSupplement)
-(JobsRetCollectionViewLayoutAttributesByCGRectBlock _Nonnull)byFrame{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewLayoutAttributes *(CGRect frame){
        @jobs_strongify(self)
        self.frame = frame;
        return self;
    };
}

-(JobsRetCollectionViewLayoutAttributesByCGAffineTransformBlock _Nonnull)byTransform{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewLayoutAttributes *(CGAffineTransform transform){
        @jobs_strongify(self)
        self.transform = transform;
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UICollectionViewLayoutAttributes
-(JobsRetUICollectionViewLayoutAttributesByNSIntegerBlock _Nonnull)byZIndex{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewLayoutAttributes * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setZIndex:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UICollectionViewLayoutAttributes
@end

@implementation UIPasteboard (JobsSystemAPIDSLSupplement)
-(JobsRetUIPasteboardByStrBlock _Nonnull)byString{
    @jobs_weakify(self)
    return ^UIPasteboard *(NSString *string){
        @jobs_strongify(self)
        self.string = string;
        return self;
    };
}
@end

@implementation UIWindow (JobsSystemAPIDSLSupplement)
-(JobsRetUIWindowByViewControllerBlock _Nonnull)byRootViewController{
    @jobs_weakify(self)
    return ^__kindof UIWindow *_Nullable(__kindof UIViewController *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.rootViewController = data;
        return self;
    };
}

-(JobsRetUIWindowByWindowSceneBlock _Nonnull)byWindowScene{
    @jobs_weakify(self)
    return ^__kindof UIWindow *_Nullable(UIWindowScene *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.windowScene = data;
        return self;
    };
}

-(JobsRetUIWindowByFrameBlock _Nonnull)byWindowFrame{
    @jobs_weakify(self)
    return ^__kindof UIWindow *_Nullable(CGRect data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.frame = data;
        return self;
    };
}

-(JobsRetUIWindowByVoidBlock _Nonnull)byMakeKeyAndVisible{
    @jobs_weakify(self)
    return ^__kindof UIWindow *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        [self makeKeyAndVisible];
        return self;
    };
}

@end

@implementation MFMailComposeViewController (JobsSystemAPIDSLSupplement)
#if defined(__IPHONE_11_0)
-(JobsRetMailComposeVCByStrBlock _Nonnull)bySetPreferredSendingEmailAddress{
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
-(JobsRetMessageComposeVCByStrBlock _Nonnull)bySubject{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.subject = data;
        return self;
    };
}

@end

@implementation NSDateFormatter (JobsSystemAPIDSLSupplement)
-(JobsRetDateFormatterByBOOLBlock _Nonnull)byGeneratesCalendarDates{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.generatesCalendarDates = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateBlock _Nonnull)byTwoDigitStartDate{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDate *_Nullable data){
        @jobs_strongify(self)
        self.twoDigitStartDate = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateBlock _Nonnull)byDefaultDate{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDate *_Nullable data){
        @jobs_strongify(self)
        self.defaultDate = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byEraSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.eraSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.monthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byShortMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byWeekdaySymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.weekdaySymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byShortWeekdaySymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortWeekdaySymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byVeryShortWeekdaySymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.veryShortWeekdaySymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byStandaloneMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.standaloneMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byShortStandaloneMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortStandaloneMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byVeryShortStandaloneMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.veryShortStandaloneMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byQuarterSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.quarterSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byShortQuarterSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortQuarterSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byStandaloneQuarterSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.standaloneQuarterSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byShortStandaloneQuarterSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.shortStandaloneQuarterSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByArrBlock _Nonnull)byVeryShortMonthSymbols{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        self.veryShortMonthSymbols = data;
        return self;
    };
}

-(JobsRetDateFormatterByStrBlock _Nonnull)byAMSymbol{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.AMSymbol = data;
        return self;
    };
}

-(JobsRetDateFormatterByStrBlock _Nonnull)byPMSymbol{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.PMSymbol = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateBlock _Nonnull)byGregorianStartDate{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDate *_Nullable data){
        @jobs_strongify(self)
        self.gregorianStartDate = data;
        return self;
    };
}

-(JobsRetDateFormatterByBOOLBlock _Nonnull)byDoesRelativeDateFormatting{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.doesRelativeDateFormatting = data;
        return self;
    };
}

-(JobsRetDateFormatterByNSIntegerBlock _Nonnull)byFormattingContext{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSFormattingContext data){
        @jobs_strongify(self)
        self.formattingContext = data;
        return self;
    };
}

@end

@implementation PDFView (JobsSystemAPIDSLSupplement)
-(JobsRetPDFViewByBOOLBlock _Nonnull)byDisplaysAsBook{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.displaysAsBook = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock _Nonnull)byDisplaysRTL{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.displaysRTL = data;
        return self;
    };
}

-(JobsRetPDFViewByCGFloatBlock _Nonnull)byMinScaleFactor{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minScaleFactor = data;
        return self;
    };
}

-(JobsRetPDFViewByCGFloatBlock _Nonnull)byMaxScaleFactor{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.maxScaleFactor = data;
        return self;
    };
}

-(JobsRetPDFViewByPDFInterpolationQualityBlock _Nonnull)byInterpolationQuality{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFInterpolationQuality data){
        @jobs_strongify(self)
        self.interpolationQuality = data;
        return self;
    };
}

-(JobsRetPDFViewByUIEdgeInsetsBlock _Nonnull)byPageBreakMargins{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        self.pageBreakMargins = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock _Nonnull)byPageShadowsEnabled{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.pageShadowsEnabled = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock _Nonnull)byUsePageViewController{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        [self usePageViewController:data withViewOptions:nil];
        return self;
    };
}

-(JobsRetPDFViewByPDFPageBlock _Nonnull)byGoToPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFPage *_Nonnull data){
        @jobs_strongify(self)
        [self goToPage:data];
        return self;
    };
}

-(JobsRetPDFViewByPDFDestinationBlock _Nonnull)byGoToDestination{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDestination *_Nonnull data){
        @jobs_strongify(self)
        [self goToDestination:data];
        return self;
    };
}

-(JobsRetPDFViewByPDFSelectionBlock _Nonnull)byGoToSelection{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFSelection *_Nonnull data){
        @jobs_strongify(self)
        [self goToSelection:data];
        return self;
    };
}

-(JobsRetPDFViewByPDFSelectionBlock _Nonnull)bySetCurrentSelection{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFSelection *_Nullable data){
        @jobs_strongify(self)
        [self setCurrentSelection:data];
        return self;
    };
}

-(JobsRetPDFViewByArrBlock _Nonnull)byHighlightedSelections{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(NSArray<PDFSelection *> *_Nullable data){
        @jobs_strongify(self)
        self.highlightedSelections = data;
        return self;
    };
}

@end

@implementation UICollectionView (JobsSystemAPIDSLSupplement)


-(JobsRetCollectionViewByVoidBlock _Nonnull)byReloadData{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        [self reloadData];
        return self;
    };
}

-(JobsRetCollectionViewByVoidBlock _Nonnull)byFinishInteractiveTransition{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        [self finishInteractiveTransition];
        return self;
    };
}

-(JobsRetCollectionViewByVoidBlock _Nonnull)byCancelInteractiveTransition{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        [self cancelInteractiveTransition];
        return self;
    };
}

-(JobsRetCollectionViewByVoidBlock _Nonnull)byEndInteractiveMovement{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) {
            [self endInteractiveMovement];
        };return self;
    };
}

-(JobsRetCollectionViewByVoidBlock _Nonnull)byCancelInteractiveMovement{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(void){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) {
            [self cancelInteractiveMovement];
        };return self;
    };
}

-(JobsRetCollectionViewByIndexSetBlock _Nonnull)byReloadSections{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSIndexSet *_Nonnull data){
        @jobs_strongify(self)
        [self reloadSections:data];
        return self;
    };
}

-(JobsRetCollectionViewByIndexSetBlock _Nonnull)byInsertSections{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSIndexSet *_Nonnull data){
        @jobs_strongify(self)
        [self insertSections:data];
        return self;
    };
}

-(JobsRetCollectionViewByIndexSetBlock _Nonnull)byDeleteSections{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSIndexSet *_Nonnull data){
        @jobs_strongify(self)
        [self deleteSections:data];
        return self;
    };
}

-(JobsRetCollectionViewByArrBlock _Nonnull)byReloadItemsAtIndexPaths{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSArray<NSIndexPath *> *_Nonnull data){
        @jobs_strongify(self)
        [self reloadItemsAtIndexPaths:data];
        return self;
    };
}

-(JobsRetCollectionViewByArrBlock _Nonnull)byInsertItemsAtIndexPaths{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSArray<NSIndexPath *> *_Nonnull data){
        @jobs_strongify(self)
        [self insertItemsAtIndexPaths:data];
        return self;
    };
}

-(JobsRetCollectionViewByArrBlock _Nonnull)byDeleteItemsAtIndexPaths{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSArray<NSIndexPath *> *_Nonnull data){
        @jobs_strongify(self)
        [self deleteItemsAtIndexPaths:data];
        return self;
    };
}

-(JobsRetCollectionViewByArrBlock _Nonnull)byReconfigureItemsAtIndexPaths{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(NSArray<NSIndexPath *> *_Nonnull data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            [self reconfigureItemsAtIndexPaths:data];
        };return self;
    };
}

-(JobsRetCollectionViewByCGPointBlock _Nonnull)byUpdateInteractiveMovementTargetPosition{
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


-(JobsRetScrollViewByVoidBlock _Nonnull)byFlashScrollIndicators{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(void){
        @jobs_strongify(self)
        [self flashScrollIndicators];
        return self;
    };
}

-(JobsRetScrollViewByVoidBlock _Nonnull)byStopScrollingAndZooming{
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
-(JobsRetImageViewBySymbolConfigurationBlock _Nonnull)byPreferredSymbolConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(UIImageSymbolConfiguration *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            self.preferredSymbolConfiguration = data;
        };return self;
    };
}

-(JobsRetImageViewByImageDynamicRangeBlock _Nonnull)byPreferredImageDynamicRange{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(UIImageDynamicRange data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, *)) {
            self.preferredImageDynamicRange = data;
        };return self;
    };
}

-(JobsRetImageViewByVoidBlock _Nonnull)byStartAnimating{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(void){
        @jobs_strongify(self)
        [self startAnimating];
        return self;
    };
}

-(JobsRetImageViewByVoidBlock _Nonnull)byStopAnimating{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(void){
        @jobs_strongify(self)
        [self stopAnimating];
        return self;
    };
}

-(JobsRetImageViewByVoidBlock _Nonnull)byRemoveAllSymbolEffects{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(void){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)) {
            [self removeAllSymbolEffects];
        };return self;
    };
}

-(JobsRetImageViewBySymbolEffectBlock _Nonnull)byAddSymbolEffect{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(NSSymbolEffect *_Nonnull data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)) {
            [self addSymbolEffect:data];
        };return self;
    };
}

-(JobsRetImageViewBySymbolEffectBlock _Nonnull)byRemoveSymbolEffectOfType{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(NSSymbolEffect *_Nonnull data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)) {
            [self removeSymbolEffectOfType:data];
        };return self;
    };
}

-(JobsRetImageViewBySymbolEffectOptionsBlock _Nonnull)byRemoveAllSymbolEffectsWithOptions{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(NSSymbolEffectOptions *_Nonnull data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, tvOS 17.0, visionOS 1.0, *)) {
            [self removeAllSymbolEffectsWithOptions:data];
        };return self;
    };
}

@end

@implementation UIImagePickerController (JobsSystemAPIDSLSupplement)

-(JobsRetImagePickerControllerBySourceTypeBlock _Nonnull)bySourceType{
    @jobs_weakify(self)
    return ^__kindof UIImagePickerController *_Nullable(UIImagePickerControllerSourceType data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.sourceType = data;
        return self;
    };
}

-(JobsRetImagePickerControllerByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UIImagePickerController *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = data;
        return self;
    };
}

-(JobsRetImagePickerControllerByBOOLBlock _Nonnull)byAllowsEditing{
    @jobs_weakify(self)
    return ^__kindof UIImagePickerController *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.allowsEditing = data;
        return self;
    };
}

@end

@implementation UIPageControl (JobsSystemAPIDSLSupplement)
-(JobsRetPageControlByNSIntegerBlock _Nonnull)byNumberOfPages{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.numberOfPages = data;
        return self;
    };
}

-(JobsRetPageControlByNSIntegerBlock _Nonnull)byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(JobsRetPageControlByBOOLBlock _Nonnull)byHidesForSinglePage{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.hidesForSinglePage = data;
        return self;
    };
}

-(JobsRetPageControlByBOOLBlock _Nonnull)byAllowsContinuousInteraction{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.allowsContinuousInteraction = data;
        };return self;
    };
}

-(JobsRetPageControlByBOOLBlock _Nonnull)byDefersCurrentPageDisplay{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.defersCurrentPageDisplay = data;
        return self;
    };
}

-(JobsRetPageControlByVoidBlock _Nonnull)byUpdateCurrentPageDisplay{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(void){
        @jobs_strongify(self)
        [self updateCurrentPageDisplay];
        return self;
    };
}

-(JobsRetPageControlByColorBlock _Nonnull)byPageIndicatorTintColor{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.pageIndicatorTintColor = color;
        return self;
    };
}

-(JobsRetPageControlByColorBlock _Nonnull)byCurrentPageIndicatorTintColor{
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.currentPageIndicatorTintColor = color;
        return self;
    };
}

-(JobsRetPageControlByImageBlock _Nonnull)byPreferredIndicatorImage API_AVAILABLE(ios(14.0), tvos(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.preferredIndicatorImage = image;
        };return self;
    };
}

-(JobsRetPageControlByImageAndNSIntegerBlock _Nonnull)byIndicatorImageForPage API_AVAILABLE(ios(14.0), tvos(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIImage *_Nullable image, NSInteger page){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            [self setIndicatorImage:image forPage:page];
        };return self;
    };
}

-(JobsRetPageControlByBackgroundStyleBlock _Nonnull)byBackgroundStyle API_AVAILABLE(ios(14.0), tvos(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIPageControl *_Nullable(UIPageControlBackgroundStyle style){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.backgroundStyle = style;
        };return self;
    };
}

-(JobsRetPageControlByDirectionBlock _Nonnull)byDirection API_AVAILABLE(ios(16.0), tvos(16.0)){
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
-(JobsRetTableViewByVoidBlock _Nonnull)byBeginUpdates{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(void){
        @jobs_strongify(self)
        [self beginUpdates];
        return self;
    };
}

-(JobsRetTableViewByVoidBlock _Nonnull)byEndUpdates{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(void){
        @jobs_strongify(self)
        [self endUpdates];
        return self;
    };
}

-(JobsRetTableViewByVoidBlock _Nonnull)byReloadData{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(void){
        @jobs_strongify(self)
        [self reloadData];
        return self;
    };
}

-(JobsRetTableViewByVoidBlock _Nonnull)byReloadSectionIndexTitles{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(void){
        @jobs_strongify(self)
        [self reloadSectionIndexTitles];
        return self;
    };
}

-(JobsRetTableViewByArrBlock _Nonnull)byReconfigureRowsAtIndexPaths{
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


-(JobsRetUILabelByUIColorBlock _Nonnull)byTextColor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(JobsRetUILabelByNSAttributedStringBlock _Nonnull)byAttributedText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSAttributedString *_Nullable data){
        @jobs_strongify(self)
        self.attributedText = data;
        return self;
    };
}

-(JobsRetUILabelByUIColorBlock _Nonnull)byShadowColor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.shadowColor = data;
        return self;
    };
}

-(JobsRetUILabelByCGSizeBlock _Nonnull)byShadowOffset{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.shadowOffset = data;
        return self;
    };
}


-(JobsRetUILabelByCGFloatBlock _Nonnull)byMinimumFontSize{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (@available(iOS 6.0, *)) {
            CGFloat pointSize = self.font.pointSize;
            self.minimumScaleFactor = pointSize > 0
                ? MAX(0, MIN(1, data / pointSize))
                : 0;
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.minimumFontSize = data;);
        };return self;
    };
}

-(JobsRetUILabelByBOOLBlock _Nonnull)byAdjustsLetterSpacingToFitWidth{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.adjustsLetterSpacingToFitWidth = data;);
        return self;
    };
}

#if defined(__IPHONE_10_0)


#endif

@end

@implementation UITextField (JobsSystemAPIDSLSupplement)
-(JobsRetTextFieldByCorBlock _Nonnull)byTextColor{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byAutocapitalizationType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextAutocapitalizationType data){
        @jobs_strongify(self)
        self.autocapitalizationType = data;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byAutocorrectionType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextAutocorrectionType data){
        @jobs_strongify(self)
        self.autocorrectionType = data;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock _Nonnull)bySpellCheckingType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextSpellCheckingType data){
        @jobs_strongify(self)
        self.spellCheckingType = data;
        return self;
    };
}

#if defined(__IPHONE_11_0)
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)bySmartQuotesType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextSmartQuotesType data){
        @jobs_strongify(self)
        self.smartQuotesType = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)bySmartDashesType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextSmartDashesType data){
        @jobs_strongify(self)
        self.smartDashesType = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)bySmartInsertDeleteType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextSmartInsertDeleteType data){
        @jobs_strongify(self)
        self.smartInsertDeleteType = data;
        return self;
    };
}

#endif
-(JobsRetTextFieldByBOOLBlock _Nonnull)byEnablesReturnKeyAutomatically{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.enablesReturnKeyAutomatically = data;
        return self;
    };
}

#if defined(__IPHONE_10_0)
-(JobsRetTextFieldByTextContentTypeBlock _Nonnull)byTextContentType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextContentType _Nullable data){
        @jobs_strongify(self)
        self.textContentType = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_12_0)
-(JobsRetTextFieldByPasswordRulesBlock _Nonnull)byPasswordRules{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextInputPasswordRules *_Nullable data){
        @jobs_strongify(self)
        self.passwordRules = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_10_0)
-(JobsRetTextFieldByBOOLBlock _Nonnull)byAdjustsFontForContentSizeCategory{
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
-(JobsRetTextViewByCorBlock _Nonnull)byTextColor{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(JobsRetTextViewByAttributedStringBlock _Nonnull)byAttributedString{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(NSAttributedString *_Nullable data){
        @jobs_strongify(self)
        self.attributedText = data;
        return self;
    };
}

#if defined(__IPHONE_11_0)
-(JobsRetTextViewByTextDragDelegateBlock _Nonnull)byTextDragDelegate{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(id<UITextDragDelegate> _Nullable data){
        @jobs_strongify(self)
        self.textDragDelegate = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextViewByTextDropDelegateBlock _Nonnull)byTextDropDelegate{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(id<UITextDropDelegate> _Nullable data){
        @jobs_strongify(self)
        self.textDropDelegate = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetTextViewByTextDragOptionsBlock _Nonnull)byTextDragOptions{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextDragOptions data){
        @jobs_strongify(self)
        self.textDragOptions = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetTextViewByBOOLBlock _Nonnull)byUsesStandardTextScaling{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.usesStandardTextScaling = data;
        return self;
    };
}

#endif

-(JobsRetTextViewByBOOLBlock _Nonnull)byFindInteractionEnabled{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            self.findInteractionEnabled = data;
        };return self;
    };
}

-(JobsRetTextViewByBorderStyleBlock _Nonnull)byBorderStyle{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(UITextViewBorderStyle data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, visionOS 1.0, *)) {
            self.borderStyle = data;
        };return self;
    };
}

-(JobsRetTextViewByIDBlock _Nonnull)byInteractionState{
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
-(JobsRetPanGestureRecognizerByUIScrollTypeMaskBlock _Nonnull)byAllowedScrollTypesMask{
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
-(JobsRetTapGestureRecognizerByUIEventButtonMaskBlock _Nonnull)byButtonMaskRequired{
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
-(JobsRetViewByStringBlock _Nonnull)byRestorationIdentifier{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.restorationIdentifier = data;
        return self;
    };
}

-(JobsRetViewByFrameBlock _Nonnull)byContentStretch{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.contentStretch = data;
        return self;
    };
}

#if defined(__IPHONE_11_0)
-(JobsRetViewByArrBlock _Nonnull)byInteractions{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSArray<id<UIInteraction>> *_Nonnull data){
        @jobs_strongify(self)
        self.interactions = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByStringBlock _Nonnull)byLargeContentTitle{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.largeContentTitle = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByImageBlock _Nonnull)byLargeContentImage{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.largeContentImage = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByBOOLBlock _Nonnull)byScalesLargeContentImage{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.scalesLargeContentImage = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_13_0)
-(JobsRetViewByBOOLBlock _Nonnull)byShowsLargeContentViewer{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsLargeContentViewer = data;
        return self;
    };
}

#endif
#if defined(__IPHONE_11_0)
-(JobsRetViewByBOOLBlock _Nonnull)byAccessibilityIgnoresInvertColors{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.accessibilityIgnoresInvertColors = data;
        return self;
    };
}

#endif
-(JobsRetBOOLByBOOLBlock _Nonnull)byEndEditing{
    @jobs_weakify(self)
    return ^BOOL(BOOL data){
        @jobs_strongify(self)
        return [self endEditing:data];
    };
}

-(JobsRetViewByNSIntegerReturnViewBlock _Nonnull)byViewWithTag{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self viewWithTag:data];
    };
}

@end


@implementation UNUserNotificationCenter (JobsSystemAPIDSLSupplement)
-(JobsRetUNUserNotificationCenterByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UNUserNotificationCenter *_Nullable(id<UNUserNotificationCenterDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}
@end

@implementation UNMutableNotificationContent (JobsSystemAPIDSLSupplement)
#define JobsUNMutableNotificationContentDSL(_name_, _blockType_, _dataType_, _property_) \
-(_blockType_ _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof UNMutableNotificationContent *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}
JobsUNMutableNotificationContentDSL(Title, JobsRetUNMutableNotificationContentByStrBlock, NSString *_Nullable, title)
JobsUNMutableNotificationContentDSL(Subtitle, JobsRetUNMutableNotificationContentByStrBlock, NSString *_Nullable, subtitle)
JobsUNMutableNotificationContentDSL(Badge, JobsRetUNMutableNotificationContentByNumBlock, NSNumber *_Nullable, badge)
JobsUNMutableNotificationContentDSL(Body, JobsRetUNMutableNotificationContentByStrBlock, NSString *_Nullable, body)
JobsUNMutableNotificationContentDSL(Sound, JobsRetUNMutableNotificationContentBySoundBlock, UNNotificationSound *_Nullable, sound)
JobsUNMutableNotificationContentDSL(Attachments, JobsRetUNMutableNotificationContentByAttachmentsBlock, NSArray<UNNotificationAttachment *> *_Nullable, attachments)
JobsUNMutableNotificationContentDSL(LaunchImageName, JobsRetUNMutableNotificationContentByStrBlock, NSString *_Nullable, launchImageName)
JobsUNMutableNotificationContentDSL(CategoryIdentifier, JobsRetUNMutableNotificationContentByStrBlock, NSString *_Nullable, categoryIdentifier)
#undef JobsUNMutableNotificationContentDSL
@end

@implementation UIGraphicsImageRendererFormat (JobsSystemAPIDSLSupplement)

-(JobsRetGraphicsImageRendererFormatByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof UIGraphicsImageRendererFormat *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

@end

@implementation NSTextAttachment (JobsSystemAPIDSLSupplement)

-(JobsRetTextAttachmentByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof NSTextAttachment *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetTextAttachmentByCGRectBlock _Nonnull)byBounds{
    @jobs_weakify(self)
    return ^__kindof NSTextAttachment *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.bounds = data;
        return self;
    };
}

@end

@implementation AVPlayerLayer (JobsSystemAPIDSLSupplement)

-(JobsRetAVPlayerLayerByPlayerBlock _Nonnull)byPlayer{
    @jobs_weakify(self)
    return ^__kindof AVPlayerLayer *_Nullable(AVPlayer *_Nullable data){
        @jobs_strongify(self)
        self.player = data;
        return self;
    };
}

-(JobsRetAVPlayerLayerByAVLayerVideoGravityBlock _Nonnull)byVideoGravity{
    @jobs_weakify(self)
    return ^__kindof AVPlayerLayer *_Nullable(AVLayerVideoGravity data){
        @jobs_strongify(self)
        self.videoGravity = data;
        return self;
    };
}

@end

@implementation WKWebView (JobsSystemAPIDSLSupplement)

-(JobsRetWKWebViewByIDBlock _Nonnull)byUIDelegate{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable(id<WKUIDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.UIDelegate = delegate;
        return self;
    };
}

-(JobsRetWKWebViewByIDBlock _Nonnull)byNavigationDelegate{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable(id<WKNavigationDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.navigationDelegate = delegate;
        return self;
    };
}

-(JobsRetWKWebViewByBOOLBlock _Nonnull)byAllowsBackForwardNavigationGestures{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsBackForwardNavigationGestures = data;
        return self;
    };
}

@end

@implementation WKWebViewConfiguration (JobsSystemAPIDSLSupplement)

-(JobsRetWKWebViewConfigurationByUserContentControllerBlock _Nonnull)byUserContentController{
    @jobs_weakify(self)
    return ^__kindof WKWebViewConfiguration *_Nullable(WKUserContentController *_Nullable data){
        @jobs_strongify(self)
        self.userContentController = data;
        return self;
    };
}

-(JobsRetWKWebViewConfigurationByPreferencesBlock _Nonnull)byDefaultWebpagePreferences{
    @jobs_weakify(self)
    return ^__kindof WKWebViewConfiguration *_Nullable(jobsByWKWebpagePreferencesBlock _Nullable data){
        @jobs_strongify(self)
        if (data) data(self.defaultWebpagePreferences);
        return self;
    };
}

-(JobsRetWKWebViewConfigurationByBOOLBlock _Nonnull)byAllowsInlineMediaPlayback{
    @jobs_weakify(self)
    return ^__kindof WKWebViewConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsInlineMediaPlayback = data;
        return self;
    };
}

@end

@implementation WKWebpagePreferences (JobsSystemAPIDSLSupplement)

-(JobsRetWKWebpagePreferencesByBOOLBlock _Nonnull)byAllowsContentJavaScript{
    @jobs_weakify(self)
    return ^__kindof WKWebpagePreferences *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsContentJavaScript = data;
        return self;
    };
}

@end

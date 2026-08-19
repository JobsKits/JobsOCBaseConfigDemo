//
//  JobsTheme.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年7月29日，星期三.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

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

typedef NSString *JobsThemeStyle NS_TYPED_EXTENSIBLE_ENUM;
typedef NSString *JobsThemeColorKey NS_TYPED_EXTENSIBLE_ENUM;
typedef NSString *JobsThemeImageKey NS_TYPED_EXTENSIBLE_ENUM;

FOUNDATION_EXPORT JobsThemeStyle const JobsThemeStyleLight;
FOUNDATION_EXPORT JobsThemeStyle const JobsThemeStyleDark;

FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundPrimary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundSecondary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundTertiary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundGrouped;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundGroupedSecondary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyBackgroundGroupedTertiary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextPrimary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextSecondary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextTertiary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextQuaternary;
FOUNDATION_EXPORT JobsThemeColorKey const JobsThemeColorKeyTextPlaceholder;

FOUNDATION_EXPORT JobsThemeImageKey const JobsThemeImageKeyThemeToggle;
FOUNDATION_EXPORT NSNotificationName const JobsThemeDidChangeNotification;

@class JobsThemeCenter;
typedef void (^JobsThemeBindingBlock)(__kindof NSObject *object,
                                      JobsThemeCenter *center);

@interface JobsThemeCenter : NSObject

@property(class, nonatomic, readonly) JobsThemeCenter *shared;
@property(nonatomic, copy, readonly) JobsThemeStyle currentStyle;
@property(nonatomic, assign, readonly, getter=isDarkMode) BOOL darkMode;

-(BOOL)configureWithResource:(NSString *)name
               fileExtension:(NSString *)fileExtension
                      bundle:(NSBundle *)bundle
                       error:(NSError * _Nullable * _Nullable)error;
-(JobsRetStrByStrBlock _Nonnull)setStyle;
-(JobsRetStrByVoidBlock _Nonnull)toggle;
-(JobsRetCorByStrBlock _Nonnull)colorForKey;
-(JobsRetCorByStrBlock _Nonnull)resolvedColorForKey;
-(JobsRetImageByStrBlock _Nonnull)imageForKey;
-(JobsRetImageByStrBlock _Nonnull)resolvedImageForKey;
-(void)bindObject:(__kindof NSObject *)object
             slot:(NSString *)slot
            apply:(JobsThemeBindingBlock)apply;
-(void)unbindObject:(__kindof NSObject *)object
               slot:(NSString *)slot;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsThemeCenter
-(JobsRetJobsThemeCenterByJobsThemeStyleBlock _Nonnull)byCurrentStyle;
-(JobsRetJobsThemeCenterByNSBundleBlock _Nonnull)byResourceBundle;
-(JobsRetJobsThemeCenterByNSDictionaryNSStringNSDictionaryBlock _Nonnull)byThemes;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsThemeCenter
@end

@interface UIColor (JobsTheme)

@property(nonatomic, copy, readonly, nullable) JobsThemeColorKey jobsThemeColorKey;

@end

@interface UIImage (JobsTheme)

@property(nonatomic, copy, readonly, nullable) JobsThemeImageKey jobsThemeImageKey;

@end

@interface UIView (JobsThemeBinding)

-(jobsByCorBlock _Nonnull)jobsTheme_setBackgroundColor;
-(jobsByCorBlock _Nonnull)jobsTheme_setTintColor;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UIView
-(JobsRetUIViewByCAGradientLayerBlock _Nonnull)byJobs_ocSkeletonLayer;
-(JobsRetUIViewByJobsNavBarBlock _Nonnull)byJobs_navBar;
-(JobsRetUIViewByJobsNavBarConfigBlock _Nonnull)byJobs_navBarConfig;
-(JobsRetUIViewByJobsOCSkeletonConfigBlock _Nonnull)byJobs_ocSkeletonConfig;
-(JobsRetUIViewByJobsViewNavigatorBlock _Nonnull)byNavigator;
-(JobsRetUIViewByJobsViewPushPresentationBlock _Nonnull)byJobsViewPushPresentation;
-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonCornerRadiusValue;
-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonLastAnimationWidthValue;
-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonOriginalClipsValue;
-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonOriginalCornerRadiusValue;
-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonableValue;
-(JobsRetViewByBOOLBlock _Nonnull)byStopRotateAnimation;
-(JobsRetUIViewByIDTFPopupDelegateBlock _Nonnull)byPopupDelegate;
-(JobsRetViewByCGFloatBlock _Nonnull)byZf_y;
-(JobsRetUIViewByUIScrollViewBlock _Nonnull)byMjRefreshTargetView;
-(void)setMjRefreshTargetView:(UIScrollView * _Nullable)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UIView
@end

@interface UILabel (JobsThemeBinding)

-(jobsByCorBlock _Nonnull)jobsTheme_setTextColor;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UILabel
-(JobsRetUILabelByJobsDirectionTypeBlock _Nonnull)byTransformLayerDirectionType;
-(JobsRetUILabelByCGFloatBlock _Nonnull)byZf_centerY;
-(JobsRetLabelByCorBlock _Nonnull)byBackgroundColor;
-(JobsRetUILabelByCGFloatBlock _Nonnull)byMj_w;
-(void)setMj_w:(CGFloat)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UILabel
@end

@interface UITextField (JobsThemeBinding)

-(jobsByCorBlock _Nonnull)jobsTheme_setTextColor;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UITextField
-(JobsRetTextFieldByStringBlock _Nonnull)byAccessibilityLabel;
-(JobsRetTextFieldByStringBlock _Nonnull)byAccessibilityValue;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UITextField
@end

@interface UITextView (JobsThemeBinding)

-(jobsByCorBlock _Nonnull)jobsTheme_setTextColor;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UITextView
-(JobsRetTextViewByNSIntegerBlock _Nonnull)byCurrentWordNum;
-(JobsRetTextViewByStringBlock _Nonnull)byReplacementText;
-(JobsRetTextViewByStringBlock _Nonnull)byResStr;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UITextView
@end

@interface UIImageView (JobsThemeBinding)

-(jobsByImageBlock _Nonnull)jobsTheme_setImage;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UIImageView
-(JobsRetImageViewByBOOLBlock _Nonnull)byAbleRespose;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UIImageView
@end

FOUNDATION_EXPORT UIColor *JobsThemeColor(JobsThemeColorKey key);
FOUNDATION_EXPORT UIImage *_Nullable JobsThemeImage(JobsThemeImageKey key);

NS_ASSUME_NONNULL_END

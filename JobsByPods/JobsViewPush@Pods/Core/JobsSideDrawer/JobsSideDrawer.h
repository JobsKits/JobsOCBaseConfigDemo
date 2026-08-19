//
//  JobsSideDrawer.h
//  JobsViewPush
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#if __has_include(<JobsOCDefs/JobsDefineProperty.h>)
#import <JobsOCDefs/JobsDefineProperty.h>
#else
#import "JobsDefineProperty.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/UIView+DSL.h>)
#import <JobsOCDSL/UIView+DSL.h>
#else
#import "UIView+DSL.h"
#endif

#if __has_include(<JobsOCDSL/UIGestureRecognizer+DSL.h>)
#import <JobsOCDSL/UIGestureRecognizer+DSL.h>
#else
#import "UIGestureRecognizer+DSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JobsSideDrawerDirection) {
    JobsSideDrawerDirectionTop,
    JobsSideDrawerDirectionBottom,
    JobsSideDrawerDirectionLeft,
    JobsSideDrawerDirectionRight
};

typedef NS_ENUM(NSInteger, JobsSideDrawerContentMode) {
    JobsSideDrawerContentModeFollowing,
    JobsSideDrawerContentModeFixed
};

@interface JobsSideDrawerConfiguration : NSObject

Prop_assign()JobsSideDrawerDirection direction;
Prop_assign()JobsSideDrawerContentMode contentMode;
Prop_assign()CGFloat presentedRatio;
Prop_assign()NSTimeInterval animationDuration;
Prop_strong()UIColor *dimColor;
Prop_assign()BOOL allowsInteractiveTransition;

-(JobsRetJobsSideDrawerConfigurationByJobsSideDrawerDirectionBlock _Nonnull)byDirection;
-(JobsRetJobsSideDrawerConfigurationByJobsSideDrawerContentModeBlock _Nonnull)byContentMode;
-(JobsRetJobsSideDrawerConfigurationByCGFloatBlock _Nonnull)byPresentedRatio;
-(JobsRetJobsSideDrawerConfigurationByTimeIntervalBlock _Nonnull)byAnimationDuration;
-(JobsRetJobsSideDrawerConfigurationByCorBlock _Nonnull)byDimColor;
-(JobsRetJobsSideDrawerConfigurationByBOOLBlock _Nonnull)byAllowsInteractiveTransition;

@end

@interface JobsSideDrawer : NSObject

Prop_strong(readonly)JobsSideDrawerConfiguration *configuration;
Prop_assign(readonly,getter=isOpen)BOOL open;
Prop_copy(nullable)void (^stateChanged)(BOOL open);

-(instancetype)initWithHostView:(UIView *)hostView
                     drawerView:(UIView *)drawerView
                    contentView:(UIView *)contentView
                  configuration:(JobsSideDrawerConfiguration *)configuration NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
-(jobsByVoidBlock _Nonnull)updateLayout;
-(jobsByBOOLBlock _Nonnull)applyConfigurationAnimated;
-(jobsByBOOLBlock _Nonnull)toggleAnimated;
-(jobsByBOOLBlock _Nonnull)openAnimated;
-(jobsByBOOLBlock _Nonnull)closeAnimated;
-(jobsByVoidBlock _Nonnull)invalidate;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsSideDrawer
-(JobsRetJobsSideDrawerByNSNumberBlock _Nonnull)byInteractiveProgress;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsSideDrawer
@end

NS_ASSUME_NONNULL_END

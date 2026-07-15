//
//  JobsSideDrawer.h
//  JobsViewPush
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefineProperty.h>)
#import <JobsOCDefs/JobsDefineProperty.h>
#else
#import "JobsDefineProperty.h"
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
-(void)updateLayout;
-(void)applyConfigurationAnimated:(BOOL)animated;
-(void)toggleAnimated:(BOOL)animated;
-(void)openAnimated:(BOOL)animated;
-(void)closeAnimated:(BOOL)animated;
-(void)invalidate;

@end

NS_ASSUME_NONNULL_END

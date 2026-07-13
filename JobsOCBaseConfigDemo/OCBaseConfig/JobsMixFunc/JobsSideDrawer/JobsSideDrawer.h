//
//  JobsSideDrawer.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import <UIKit/UIKit.h>

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

@property(nonatomic,assign)JobsSideDrawerDirection direction;
@property(nonatomic,assign)JobsSideDrawerContentMode contentMode;
@property(nonatomic,assign)CGFloat presentedRatio;
@property(nonatomic,assign)NSTimeInterval animationDuration;
@property(nonatomic,strong)UIColor *dimColor;

@end

@interface JobsSideDrawer : NSObject

@property(nonatomic,strong,readonly)JobsSideDrawerConfiguration *configuration;
@property(nonatomic,assign,readonly,getter=isOpen)BOOL open;
@property(nonatomic,copy,nullable)void (^stateChanged)(BOOL open);

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


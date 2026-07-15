//
//  JobsCustomTabBar.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCustomTabBar.h"

static JobsCustomTabBarConfig *JobsCustomTabBarAppConfig(void) {
    Class appDelegateClass = NSClassFromString(@"AppDelegate");
    if (appDelegateClass) {
        @try {
            id value = [appDelegateClass valueForKey:@"jobsCustomTabBarConfig"];
            if ([value isKindOfClass:JobsCustomTabBarConfig.class]) return value;
        } @catch (__unused NSException *exception) {
        }
    };return JobsCustomTabBarConfig.sharedManager;
}

@interface JobsCustomTabBar ()

@end

@implementation JobsCustomTabBar
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.setup();
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.setup();
    };return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.setup();
}

-(jobsByVoidBlock _Nonnull)setup{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        JobsCustomTabBarConfig *config = JobsCustomTabBarAppConfig();/// 此时还没有初始化 JobsCustomTabBarConfig.sharedManager;
        self.byBgColor(config.tabBarBackgroundImage ? self.byPatternImage(config.tabBarBackgroundImage) :config.tabBarBackgroundColor);
        NSInteger itemCount = config.tabBarItems.count;
        if (!itemCount) return;
        CGFloat itemWidth = (config.tabBarWidth ? : JobsRealWidth()) / itemCount;
        for (NSInteger index = 0; index < itemCount; index++) {
            UIView *item = config.tabBarItems[index];
            CGFloat xPosition = itemWidth * index;
            CGFloat yOffset = (index < config.tabBarItemYOffsets.count) ? [config.tabBarItemYOffsets[index] floatValue] : 0;
            CGFloat offset = 0;
            if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationPortrait &&
               UIDevice.isBangScreen) offset = JobsBottomSafeAreaHeight();
            item.frame = CGRectMake(xPosition,
                                    yOffset,
                                    itemWidth,
                                    config.tabBarHeight + offset);
            if(item.isKindOfClass(UIButton.class)){
                UIButton *btn = (UIButton *)item;
                btn.imageViewFrameOffsetY = config.imageViewFrameOffsetY;
                btn.textLabelFrameOffsetY = config.textLabelFrameOffsetY;
            }self.addSubview(item);
        }
    };
}

-(jobsByViewBlock _Nonnull)configMasonryBy{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable view){
        @jobs_strongify(self)
        JobsCustomTabBarConfig *config = JobsCustomTabBarAppConfig();
        view.addSubview(self);
        if(!jobsZeroRectValue(config.tabBarFrame)){
            self.byFrame(config.tabBarFrame);
        }else{
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                if(config.tabBarX){
                    make.left.mas_equalTo(config.tabBarX);
                }else{
                    make.centerX.equalTo(view);
                }
                if (config.tabBarY) {
                    make.top.mas_equalTo(config.tabBarY);
                }else{
                    make.bottom.equalTo(view);
                }
                if (!jobsZeroPointValue(config.tabBarOrigin)) {
                    make.left.mas_equalTo(config.tabBarOrigin.x);
                    make.top.mas_equalTo(config.tabBarOrigin.y);
                }
                if (!jobsZeroSizeValue(config.tabBarSize)) {
                    make.size.mas_equalTo(config.tabBarSize);
                }
                if(config.tabBarHeight){
                    // 这里使用 JobsCustomTabBarConfig.sharedManager.tabBarHeight 会崩
                    make.height.mas_equalTo(config.tabBarHeight);
                }
                if(config.tabBarWidth){
                    // 这里使用 JobsCustomTabBarConfig.sharedManager.tabBarWidth 会崩
                    make.width.mas_equalTo(config.tabBarWidth);
                }
            }];view.refresh();
        }
    };
}

@end

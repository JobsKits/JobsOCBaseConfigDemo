//
//  JobsTabBar.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTabBar.h"

#import <JobsOCTools/JobsTabBarItemConfig.h>
#import <JobsOCTools/UITabBar+Ex.h>

static NSArray<__kindof JobsTabBarItemConfig *> *JobsTabBarItemConfigs(void) {
    Class appDelegateClass = NSClassFromString(@"AppDelegate");
    if (!appDelegateClass) return @[];
    @try {
        id value = [appDelegateClass valueForKey:@"tabBarItemConfigMutArr"];
        return [value isKindOfClass:NSArray.class] ? value : @[];
    } @catch (__unused NSException *exception) {
        return @[];
    }
}

@interface JobsTabBar ()

Prop_strong()NSMutableArray <__kindof UIView *>*tabBarButtons;
Prop_strong()NSMutableArray <__kindof LOTAnimationView *>*lOTAnimationViews;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsTabBar
@interface JobsTabBar (JobsPropertyDSLSetterAutogen_f470089e46)
-(void)setAlignmentType:(AlignmentType)data;
-(void)setY:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsTabBar

@implementation JobsTabBar
-(JobsRetJobsTabBarByBarStyleBlock _Nonnull)byBarStyle{
    @jobs_weakify(self)
    return ^__kindof JobsTabBar *_Nullable(UIBarStyle style){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setBarStyle:style];
        return self;
    };
}

-(JobsRetJobsTabBarByBOOLBlock _Nonnull)byTranslucent{
    @jobs_weakify(self)
    return ^__kindof JobsTabBar *_Nullable(BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setTranslucent:value];
        return self;
    };
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byClipsToBounds(NO);
        self.byBarStyle(UIBarStyleBlack);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBar.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBar.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        for (UIView *view in self.tabBarButtons) {
            for (UIView *subview in view.subviews) {
                UILabel *label = nil; /// TabBar的文字
                UIImageView *imageView = nil; /// TabBar的图片
                if ([subview isKindOfClass:UILabel.class]) {
                    label = (UILabel *)subview;
                    label.byBgColor(JobsRedColor);
                    [label sizeToFit];
                }
                if ([subview isKindOfClass:UIImageView.class]) {
                    imageView = (UIImageView *)subview;
                }
                [self layoutIfNeeded];
                if (label && imageView) {
                    NSArray<__kindof JobsTabBarItemConfig *> *tabBarItemConfigs = JobsTabBarItemConfigs();
                    if (self.tabBarButtons.count > tabBarItemConfigs.count) continue;
                    JobsTabBarItemConfig *tabBarControllerConfig = tabBarItemConfigs[self.tabBarButtons.count - 1];
                    [self alignLabel:label
                           imageView:imageView
                        tabBarButton:subview
                             spacing:tabBarControllerConfig.spacing];
                }
            }
        }
        CGFloat s = 0.f;
        NSArray<__kindof JobsTabBarItemConfig *> *tabBarItemConfigs = JobsTabBarItemConfigs();
        for (int t = 0; t < tabBarItemConfigs.count ; t++) {
            if (t >= self.tabBarButtons.count) break;
            JobsTabBarItemConfig *tabBarControllerConfig = tabBarItemConfigs[t];
            LOTAnimationView *lOTAnimationView = nil;
            if(self.lOTAnimationViews.count){
                lOTAnimationView = self.lOTAnimationViews[t];
            }
            UIView *tabBarButton = self.tabBarButtons[t];
            if(tabBarControllerConfig.xOffset){
                if (t) {
                    tabBarButton.resetOriginX(s + tabBarControllerConfig.xOffset);
                }else{
                    tabBarButton.resetOriginX(tabBarControllerConfig.xOffset);
                }
                s += (tabBarControllerConfig.xOffset + tabBarControllerConfig.tabBarItemWidth);
            }
            if(tabBarControllerConfig.tabBarItemWidth){
                tabBarButton.resetWidth(tabBarControllerConfig.tabBarItemWidth);
            }
            lOTAnimationView.byFrame(tabBarButton.frame);
        }
    };
}
///【覆写父类方法】自定义 TabBar 的高度
- (CGSize)sizeThatFits:(CGSize)size {
    return ((((JobsRetCGSizeByCGSizeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBar.class, @selector(sizeThatFits)))(self, @selector(sizeThatFits))))(size);
}
-(JobsRetCGSizeByCGSizeBlock _Nonnull)sizeThatFits{
    @jobs_weakify(self)
    return ^CGSize(CGSize size){
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return self.checkScreenOrientation_UIInterfaceOrientation(^CGSize(UIInterfaceOrientation data) {
            switch (data) {
                /// 倒竖屏方向
                case UIInterfaceOrientationPortraitUpsideDown:
                /// 竖屏方向
                case UIInterfaceOrientationPortrait:{
                    return [super sizeThatFits:size];
                }break;
                /// 左横屏方向
                case UIInterfaceOrientationLandscapeLeft:
                /// 右横屏方向
                case UIInterfaceOrientationLandscapeRight:{
                    CGSize newSize = [super sizeThatFits:size];
                    newSize.height = JobsWidth(80);
                    return newSize;
                }
                /// 未匹配已知分支时执行兜底处理
                default:
                    return [super sizeThatFits:size];
                    break;
            }
        });
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model);
        if (self.viewModel) {
            self.byBarTintColor(self.viewModel.bgCor);
            self.byTranslucent(self.viewModel.isTranslucent);
            // 有设定背景图片值优先走背景图片设定，背景颜色自动忽略
            if (self.viewModel.bgImage) {
                //self.viewModel.bgImage;//用系统的backgroundImage属性失灵
                self.backgroundImageView.byImage(self.viewModel.bgImage);
                return;
            }
            if (self.viewModel.bgCor) {
                self.byBgColor(self.viewModel.bgCor);
            }
        }
    };
}
#pragma mark —— 一些公共方法
-(JobsRetCGFloatByVoidBlock _Nonnull)customTabBarOffsetHeight{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return self.viewModel.offsetHeight ? self.viewModel.offsetHeight : 0.f;
    };
}
#pragma mark —— 一些私有方法
- (void)alignLabel:(UILabel *)label
         imageView:(UIImageView *)imageView
      tabBarButton:(UIView *)tabBarButton
           spacing:(CGFloat)spacing{
    CGFloat totalWidth = tabBarButton.bounds.size.width;
    CGFloat totalHeight = tabBarButton.bounds.size.height;
    CGFloat labelWidth = label.bounds.size.width;
    CGFloat labelHeight = label.bounds.size.height;
    CGFloat imageWidth = imageView.bounds.size.width;
    CGFloat imageHeight = imageView.bounds.size.height;
    switch (self.alignmentType) {
        /// 处理 ImageLeftTitleRight 分支
        case ImageLeftTitleRight: {
            CGFloat totalContentWidth = imageWidth + spacing + labelWidth;
            CGFloat startingX = (totalWidth - totalContentWidth) / 2.0;
            CGFloat centerY = totalHeight / 2.0;
            imageView.frame = CGRectMake(startingX,
                                         centerY - imageHeight / 2.0,
                                         imageWidth,
                                         imageHeight);
            label.frame = CGRectMake(CGRectGetMaxX(imageView.frame) + spacing,
                                     centerY - labelHeight / 2.0,
                                     labelWidth,
                                     labelHeight);
            label.byTextAlignment(NSTextAlignmentLeft);
            break;
        }
        /// 处理 ImageRightTitleLeft 分支
        case ImageRightTitleLeft: {
            CGFloat totalContentWidth = labelWidth + spacing + imageWidth;
            CGFloat startingX = (totalWidth - totalContentWidth) / 2.0;
            label.frame = CGRectMake(startingX,
                                     (totalHeight - labelHeight) / 2.0,
                                     labelWidth,
                                     labelHeight);
            imageView.frame = CGRectMake(CGRectGetMaxX(label.frame) + spacing,
                                         (totalHeight - imageHeight) / 2.0,
                                         imageWidth,
                                         imageHeight);
            label.byTextAlignment(NSTextAlignmentRight);
            break;
        }
        /// 处理 ImageTopTitleBottom 分支
        case ImageTopTitleBottom: {
            CGFloat totalContentHeight = imageHeight + spacing + labelHeight;
            CGFloat startingY = (totalHeight - totalContentHeight) / 2.0;
            imageView.frame = CGRectMake((totalWidth - imageWidth) / 2.0,
                                         startingY,
                                         imageWidth,
                                         imageHeight);
            label.frame = CGRectMake((totalWidth - labelWidth) / 2.0,
                                     CGRectGetMaxY(imageView.frame) + spacing,
                                     labelWidth,
                                     labelHeight);
            if(labelHeight >= labelWidth){
                label.resetWidth(labelHeight);
                label.resetHeight(labelWidth);
            }
//            label.jobsLogFrame(@"打印的时候额外添加的标识字符.Frame");
//            label.jobsLogPoint(@"打印的时候额外添加的标识字符.Point");
//            label.jobsLogSize(@"打印的时候额外添加的标识字符.Size");
            label.byTextAlignment(NSTextAlignmentCenter);
            break;
        }
        /// 处理 ImageBottomTitleTop 分支
        case ImageBottomTitleTop: {
            CGFloat totalContentHeight = labelHeight + spacing + imageHeight;
            CGFloat startingY = (totalHeight - totalContentHeight) / 2.0;
            label.frame = CGRectMake((totalWidth - labelWidth) / 2.0,
                                     startingY,
                                     labelWidth,
                                     labelHeight);
            imageView.frame = CGRectMake((totalWidth - imageWidth) / 2.0,
                                         CGRectGetMaxY(label.frame) + spacing,
                                         imageWidth,
                                         imageHeight);
            label.byTextAlignment(NSTextAlignmentCenter);
            break;
        }
    }
}
#pragma mark —— LazyLoad
-(NSMutableArray<__kindof UIView *> *)tabBarButtons{
    if(!_tabBarButtons){
        @jobs_weakify(self)
        _tabBarButtons = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (UIView *subview in self.subviews) {
                if([subview isKindOfClass:NSClassFromString(UITabBarButton)]){
                    data.add(subview);
                }
            }
        });
    };return _tabBarButtons;
}

-(NSMutableArray<__kindof LOTAnimationView *> *)lOTAnimationViews{
    if(!_lOTAnimationViews){
        @jobs_weakify(self)
        _lOTAnimationViews = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (int t = 0;
                 t < self.tabBarButtons.count;
                 t++) {
                NSArray<__kindof JobsTabBarItemConfig *> *tabBarItemConfigs = JobsTabBarItemConfigs();
                if (t >= tabBarItemConfigs.count) break;
                JobsTabBarItemConfig *config = (JobsTabBarItemConfig *)tabBarItemConfigs[t];
    //            -config.humpOffsetY / 2
                /// 根据config.lottieName 方法-config.lottieName:offsetY:lottieName:内部做了判空处理
                LOTAnimationView *lotAnimationView = [self addLottieImage:t
                                                               lottieName:config.lottieName];
                if (lotAnimationView) {
                    data.add(lotAnimationView);
                }
            }
        });
    };return _lOTAnimationViews;
}
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
-(UIViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {});
    };return _viewModel;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsTabBar
-(JobsRetJobsTabBarByAlignmentTypeBlock _Nonnull)byAlignmentType{
    @jobs_weakify(self)
    return ^__kindof JobsTabBar * _Nullable(AlignmentType data){
        @jobs_strongify(self)
        [self setAlignmentType:data];
        return self;
    };
}
-(JobsRetJobsTabBarByCGFloatBlock _Nonnull)byY{
    @jobs_weakify(self)
    return ^__kindof JobsTabBar * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setY:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsTabBar
@end

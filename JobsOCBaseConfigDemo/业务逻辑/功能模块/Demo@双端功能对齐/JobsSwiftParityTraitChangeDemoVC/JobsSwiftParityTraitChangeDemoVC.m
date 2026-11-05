//
//  JobsSwiftParityTraitChangeDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityTraitChangeDemoVC.h"

JobsKey(JobsJobsSwiftParityTraitChangeDemoVCModernTraitsRegistrationKey)

@implementation JobsSwiftParityTraitChangeDemoVC

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"TraitChange";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoDescription{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"主动切换深浅色外观，并在 Trait 变化回调中反馈当前模式。";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoIconName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"circle.lefthalf.fill";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)primaryActionTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"切换深色 / 浅色模式";
    };
}

-(void)viewDidLoad{
    [super viewDidLoad];
    if (@available(iOS 17.0, tvOS 17.0, *)) {
        if (!Jobs_getAssociatedObjectByTarget(self, JobsJobsSwiftParityTraitChangeDemoVCModernTraitsRegistrationKey)) {
            Jobs_setAssociatedRETAIN_NONATOMICByTarget(self, JobsJobsSwiftParityTraitChangeDemoVCModernTraitsRegistrationKey, @YES)
            NSArray<UITrait> *traits = [UITraitCollection.systemTraitsAffectingColorAppearance arrayByAddingObjectsFromArray:@[
                UITraitDisplayScale.class,
                UITraitPreferredContentSizeCategory.class,
                UITraitHorizontalSizeClass.class,
                UITraitVerticalSizeClass.class,
                UITraitLayoutDirection.class
            ]];
            [self registerForTraitChanges:traits
                             withHandler:^(__kindof id<UITraitEnvironment> environment,
                                           UITraitCollection *previousTraitCollection) {
                JobsSwiftParityTraitChangeDemoVC *target = (JobsSwiftParityTraitChangeDemoVC *)environment;
                jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(target), SEL))JobsBlockInstanceMethodIMP(JobsSwiftParityTraitChangeDemoVC.class, @selector(jobsTraitCollectionDidChange)))(target, @selector(jobsTraitCollectionDidChange));
                if (action) {
                    action(previousTraitCollection);
                }
            }];
        }
    }
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    if (@available(iOS 17.0, tvOS 17.0, *)) {
        return;
    }
    jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSwiftParityTraitChangeDemoVC.class, @selector(jobsTraitCollectionDidChange)))(self, @selector(jobsTraitCollectionDidChange));
    if (action) action(previousTraitCollection);
}

-(jobsByUITraitCollectionBlock _Nonnull)jobsTraitCollectionDidChange{
    @jobs_weakify(self)
    return ^(UITraitCollection * previousTraitCollection){
        @jobs_strongify(self)
        if (!self) return;
        if (@available(iOS 17.0, tvOS 17.0, *)) {
            // 现代注册回调只执行业务刷新，旧系统保留父类通知。
        } else {
            SuppressWdeprecatedDeclarationsWarning([super traitCollectionDidChange:previousTraitCollection];);
        }
        if (previousTraitCollection.userInterfaceStyle == self.traitCollection.userInterfaceStyle) return;
        NSString *style = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? @"深色" : @"浅色";
        self.updateStatus([NSString stringWithFormat:@"TraitChange 已响应：%@模式",style]);
    };
}

-(jobsByVoidBlock _Nonnull)performPrimaryAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIUserInterfaceStyle currentStyle = self.view.window.overrideUserInterfaceStyle;
        UIUserInterfaceStyle targetStyle =
            currentStyle == UIUserInterfaceStyleDark
            ? UIUserInterfaceStyleLight
            : UIUserInterfaceStyleDark;
        self.view.window.byOverrideUserInterfaceStyle(targetStyle);
        self.previewImageView.byImage(@"circle.lefthalf.fill".sys_img);
        self.previewTitleLab.byText(targetStyle == UIUserInterfaceStyleDark ? @"目标：深色模式" : @"目标：浅色模式");
        self.updateStatus(@"已请求 TraitChange");
    };
}

@end

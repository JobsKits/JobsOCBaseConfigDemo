//
//  JobsSwiftParityTraitChangeDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityTraitChangeDemoVC.h"

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

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSwiftParityTraitChangeDemoVC.class, @selector(jobsTraitCollectionDidChange)))(self, @selector(jobsTraitCollectionDidChange));
    if (action) action(previousTraitCollection);
}

-(jobsByUITraitCollectionBlock _Nonnull)jobsTraitCollectionDidChange{
    @jobs_weakify(self)
    return ^(UITraitCollection * previousTraitCollection){
        @jobs_strongify(self)
        if (!self) return;
        [super traitCollectionDidChange:previousTraitCollection];
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

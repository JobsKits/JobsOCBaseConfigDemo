//
//  JobsSwiftParityOpenDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityOpenDemoVC.h"

@implementation JobsSwiftParityOpenDemoVC

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"JobsOpen";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoDescription{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"通过 JobsOCOpen 统一入口打开外部 URL。";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoIconName{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"arrow.up.right.square.fill";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)primaryActionTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"打开 Apple 官网";
    };
}

-(jobsByVoidBlock _Nonnull)performPrimaryAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsOCOpenResult result = @"https://www.apple.com".jobs_open();
        self.previewImageView.byImage(@"arrow.up.right.square".sys_img);
        self.previewTitleLab.byText(@"JobsOpen：打开 https://www.apple.com");
        self.updateStatus(result == JobsOCOpenResultOpened ? @"JobsOpen 已受理" : @"JobsOpen 无法打开目标");
    };
}

@end

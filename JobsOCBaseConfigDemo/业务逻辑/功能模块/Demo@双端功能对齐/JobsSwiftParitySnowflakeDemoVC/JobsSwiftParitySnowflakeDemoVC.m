//
//  JobsSwiftParitySnowflakeDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParitySnowflakeDemoVC.h"

@interface JobsSwiftParitySnowflakeDemoVC ()

Prop_strong()JobsOCSnowflake *snowflake;

@end

@implementation JobsSwiftParitySnowflakeDemoVC

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"雪花算法";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoDescription{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"使用固定发布纪元、数据中心 ID 和机器 ID 生成唯一编号。";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoIconName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"snowflake";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)primaryActionTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"生成 Snowflake ID";
    };
}

-(jobsByVoidBlock _Nonnull)performPrimaryAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSNumber *snowflakeID = self.snowflake.nextID();
        self.previewImageView.byImage(@"snowflake".sys_img);
        self.previewTitleLab.byText([NSString stringWithFormat:@"Snowflake ID\n%@",snowflakeID ?: @"生成失败"]);
        self.updateStatus(snowflakeID ? @"雪花 ID 生成成功" : @"雪花 ID 生成失败");
    };
}
#pragma mark —— LazyLoad
-(JobsOCSnowflake *)snowflake{
    if (!_snowflake) {
        _snowflake = [JobsOCSnowflake.alloc initWithPublishMillisecond:1743494400000
                                                                IDCID:1
                                                            machineID:1];
    };return _snowflake;
}

@end

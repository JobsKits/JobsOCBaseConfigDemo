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

-(NSString *)demoNavigationTitle{
    return @"雪花算法";
}

-(NSString *)demoDescription{
    return @"使用固定发布纪元、数据中心 ID 和机器 ID 生成唯一编号。";
}

-(NSString *)demoIconName{
    return @"snowflake";
}

-(NSString *)primaryActionTitle{
    return @"生成 Snowflake ID";
}

-(void)performPrimaryAction{
    NSNumber *snowflakeID = self.snowflake.nextID;
    self.previewImageView.byImage(@"snowflake".sys_img);
    self.previewTitleLab.byText([NSString stringWithFormat:@"Snowflake ID\n%@",snowflakeID ?: @"生成失败"]);
    [self updateStatus:snowflakeID ? @"雪花 ID 生成成功" : @"雪花 ID 生成失败"];
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

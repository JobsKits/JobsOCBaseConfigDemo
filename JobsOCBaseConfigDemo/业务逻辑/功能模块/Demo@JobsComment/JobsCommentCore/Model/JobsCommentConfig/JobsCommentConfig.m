//
//  JobsCommentConfig.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCommentConfig.h"

@interface JobsCommentConfig ()

Prop_assign()CGSize headerImageViewSize;/// 发表此评论的用户的头像大小
Prop_strong()UIFont *titleFont;/// 发表此评论的用户的名字字体大小
Prop_strong()UIFont *subTitleFont;/// 具体的评论内容的字体大小
Prop_strong()UIColor *titleCor;/// 发表此评论的用户的名字字体颜色
Prop_strong()UIColor *subTitleCor;/// 具体的评论内容的字体颜色
Prop_assign()UIColor *bgCor;/// 显示评论的承载cell背景色
Prop_assign()CGFloat cellHeight;/// 显示评论的承载cell高度
Prop_assign()CGFloat secondLevelCommentOffset;/// 二级标题相对于一级标题控件的偏移量

@end

@implementation JobsCommentConfig
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_jobsCommentConfigOnceToken = 0;
    static_jobsCommentConfig = nil;
}
static JobsCommentConfig *static_jobsCommentConfig = nil;
static dispatch_once_t static_jobsCommentConfigOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_jobsCommentConfigOnceToken, ^{
        static_jobsCommentConfig = JobsCommentConfig.new;
    });return static_jobsCommentConfig;
}
#pragma mark —— Lazyload
-(CGSize)headerImageViewSize{
    return CGSizeMake(JobsWidth(36), JobsWidth(36));
}

-(UIFont *)titleFont{
    return JobsFontRegular(13);
}

-(UIFont *)subTitleFont{
    return JobsFontRegular(15);
}

-(UIColor *)titleCor{
    return HEXCOLOR(0x64748B);
}

-(UIColor *)subTitleCor{
    return HEXCOLOR(0x111827);
}

-(UIColor *)bgCor{
    return JobsWhiteColor;
}

-(CGFloat)cellHeight{
    return JobsWidth(72);
}

-(CGFloat)secondLevelCommentOffset{
    return JobsWidth(46);
}

@end

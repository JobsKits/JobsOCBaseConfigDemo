//
//  JobsCommentConfig.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCommentConfig : NSObject

Prop_assign(readonly)CGSize headerImageViewSize;/// 发表此评论的用户的头像大小
Prop_strong(readonly)UIFont *titleFont;/// 发表此评论的用户的名字字体大小
Prop_strong(readonly)UIFont *subTitleFont;/// 具体的评论内容的字体大小
Prop_strong(readonly)UIColor *titleCor;/// 发表此评论的用户的名字字体颜色
Prop_strong(readonly)UIColor *subTitleCor;/// 具体的评论内容的字体颜色
Prop_assign(readonly)UIColor *bgCor;/// 显示评论的承载cell背景色
Prop_assign(readonly)CGFloat cellHeight;/// 显示评论的承载cell高度
Prop_assign(readonly)CGFloat secondLevelCommentOffset;/// 二级标题相对于一级标题控件的偏移量

+(instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END

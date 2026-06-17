//
//  JobsCommentConfig.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/11/17.
//

#import <Foundation/Foundation.h>
#import "JobsDefineProperty.h"

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

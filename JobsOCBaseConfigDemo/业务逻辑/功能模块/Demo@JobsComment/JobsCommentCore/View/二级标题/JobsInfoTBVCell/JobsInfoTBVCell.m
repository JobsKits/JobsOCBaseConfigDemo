//
//  JobsInfoTBVCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsInfoTBVCell.h"

@interface JobsInfoTBVCell ()
/// UI
Prop_strong()RBCLikeButton *likeBtn;
/// Data
Prop_strong()JobsChildCommentModel *childCommentModel;

-(JobsRetImageByStrBlock _Nonnull)jobs_commentAvatarPlaceholderImageByID;

@end

@implementation JobsInfoTBVCell
#pragma mark —— UITableViewCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1ByTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsInfoTBVCell *cell = (JobsInfoTBVCell *)tableView.tableViewCellClass(JobsInfoTBVCell.class,@"");
        if (!cell) {
            cell = JobsInfoTBVCell.initTableViewCellWithStyle(UITableViewCellStyleSubtitle);
            cell
                .bySelectionStyle(UITableViewCellSelectionStyleNone)
                .byContentView(^(__kindof UIView * _Nullable view) {
                    view.byBgColor(JobsCommentConfig.jobsSharedManager().bgCor);
                });
            cell.byBgColor(JobsClearColor);
        };return cell;
    };
}
#pragma mark —— BaseCellProtocol
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsCommentConfig.jobsSharedManager().cellHeight;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:JobsChildCommentModel.class]) {
            self.childCommentModel = (JobsChildCommentModel *)model;
            self.likeBtn.byAlpha(1);
            self.textLabel.byText(self.childCommentModel.nickname);
            self.detailTextLabel.byText(self.childCommentModel.content);
            UIImage *placeholderImage = self.jobs_commentAvatarPlaceholderImageByID(self.childCommentModel.ID ? : self.childCommentModel.userId);
            self.imageView.byImage(placeholderImage);
            self.imageView
                .imageURL(self.childCommentModel.headImg.jobsImageURLPlus().jobsURL())
                .placeholderImage(placeholderImage)
                .options(self.jobsMakeSDWebImageOptions())
                .completed(^(UIImage * _Nullable image,
                             NSError * _Nullable error,
                             SDImageCacheType cacheType,
                             NSURL * _Nullable imageURL) {
                    if (error) {
                        JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                    } else {
                        JobsLog(@"图片加载成功");
                    }
                }).load();
        };return self;
    };
}
#pragma mark —— 复写系统父类方法
- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsInfoTBVCell.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        CGFloat avatarWH = JobsCommentConfig.jobsSharedManager().headerImageViewSize.width;
        CGFloat left = JobsCommentConfig.jobsSharedManager().secondLevelCommentOffset + JobsWidth(14);
        CGFloat top = JobsWidth(14);
        CGFloat textX = left + avatarWH + JobsWidth(10);
        CGFloat likeW = JobsWidth(46);
        CGFloat textW = self.contentView.width - textX - likeW - JobsWidth(22);
        self.imageView.byFrame(CGRectMake(left, top, avatarWH, avatarWH));
        self.imageView
            .byContentMode(UIViewContentModeScaleAspectFill)
            .byClipsToBounds(YES);
        self.imageView.cornerCutToCircleWithCornerRadius(self.imageView.height / 2);
        self.textLabel
            .byFont(JobsCommentConfig.jobsSharedManager().titleFont)
            .byTextCor(JobsCommentConfig.jobsSharedManager().titleCor)
            .byNumberOfLines(1);
        self.detailTextLabel
            .byFont(JobsCommentConfig.jobsSharedManager().subTitleFont)
            .byTextCor(JobsCommentConfig.jobsSharedManager().subTitleCor)
            .byNumberOfLines(2);
        self.textLabel.byFrame(CGRectMake(textX, JobsWidth(12), textW, JobsWidth(18)));
        self.detailTextLabel.byFrame(CGRectMake(textX, CGRectGetMaxY(self.textLabel.frame) + JobsWidth(4), textW, JobsWidth(36)));
    };
}
#pragma mark —— lazyLoad
-(JobsRetImageByStrBlock _Nonnull)jobs_commentAvatarPlaceholderImageByID{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(NSString *_Nullable avatarID){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *seed = avatarID.length ? avatarID : @"jobs-comment-placeholder";
        NSInteger imageIndex = seed.hash % 4 + 1;
        return JobsLoadBundleImage(@"bundle", @"头像", nil, [NSString stringWithFormat:@"头像_%ld",(long)imageIndex]) ? : @"用户默认头像".img;
    };
}

-(RBCLikeButton *)likeBtn{
    if(!_likeBtn){
        @jobs_weakify(self)
        _likeBtn = RBCLikeButton.jobsInit()
            .jobsResetBtnImage(_likeBtn.selected ? JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like"))
            .jobsResetBtnTitleCor(_likeBtn.selected ? JobsRedColor : JobsGrayColor)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(12))
            .jobsResetBtnTitle((toStringByNSInteger(_likeBtn.thumpNum)))
            .onClickBy(^(RBCLikeButton *x){
                @jobs_strongify(self)
                BOOL selected = !x.selected;
                x
                    .jobsResetBtnImage(selected ? JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like"))
                    .bySelected(selected);
    //            [x setThumbWithSelected:x.selected
    //                           thumbNum:x.selected ? x.thumpNum + 1 : x.thumpNum - 1
    //                          animation:YES];
                if(x.selected){
                    x.byThumpNum(x.thumpNum + 1);
                }else{
                    x.byThumpNum(x.thumpNum - 1);
                }
                x
                    .jobsResetBtnTitle(toStringByNSInteger(x.thumpNum))
                    .jobsResetBtnTitleCor(x.selected ? JobsRedColor : JobsGrayColor);
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .bgColorBy(JobsClearColor)
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(46), JobsWidth(44)));
                make.right.equalTo(self.contentView).offset(-JobsWidth(14));
                make.centerY.equalTo(self.contentView);
            });
        _likeBtn.byThumpNum(0);
    }
    _likeBtn.bySelected(self.childCommentModel.isPraise.boolValue);
    _likeBtn.byThumpNum(self.childCommentModel.praiseNum);
    _likeBtn
        .jobsResetBtnTitle(toStringByNSInteger(_likeBtn.thumpNum))
        .jobsResetBtnTitleCor(_likeBtn.selected ? JobsRedColor : HEXCOLOR(0x94A3B8))
        .jobsResetBtnImage(_likeBtn.selected ? JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like"))
        .makeBtnTitleByShowingType(UILabelShowingType_03);
    return _likeBtn;
}

@end

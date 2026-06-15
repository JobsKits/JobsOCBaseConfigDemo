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
                    view.byBgColor(JobsCommentConfig.sharedManager.bgCor);
                });
        };return cell;
    };
}
#pragma mark —— BaseCellProtocol
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsCommentConfig.sharedManager.cellHeight;
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

            self.imageView
                .imageURL(self.childCommentModel.headImg.imageURLPlus.jobsUrl)
                .placeholderImage(@"动态头像 尺寸126".gif_img ? : @"用户默认头像".img)
                .options(self.makeSDWebImageOptions)
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
    [super layoutSubviews];
    self.imageView.sizer = JobsCommentConfig.sharedManager.headerImageViewSize;//subTitleOffset
    self.imageView.cornerCutToCircleWithCornerRadius(self.imageView.height / 2);
    self.textLabel.byFont(JobsCommentConfig.sharedManager.titleFont);

    self.detailTextLabel.byFont(JobsCommentConfig.sharedManager.subTitleFont);

    self.textLabel.byTextCor(JobsCommentConfig.sharedManager.titleCor);

    self.detailTextLabel.byTextCor(JobsCommentConfig.sharedManager.subTitleCor);

    /// 因为二级评论和一级评论的控件之间存在一定的offset(向右偏)，故这里进行重写约束
    self.imageView.resetOriginX(JobsWidth(50));
    self.imageView.resetOriginY(JobsWidth(0));
    
    self.textLabel.resetOriginX(JobsWidth(110));
    self.textLabel.resetOriginY(JobsWidth(0));
    
    self.detailTextLabel.resetOriginX(JobsWidth(110));
}
#pragma mark —— lazyLoad
-(RBCLikeButton *)likeBtn{
    if(!_likeBtn){
        @jobs_weakify(self)
        _likeBtn = RBCLikeButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnImage(_likeBtn.selected ? JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like"))
            .jobsResetBtnTitleCor(_likeBtn.selected ? JobsRedColor : JobsGrayColor)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(4))
            .jobsResetBtnTitle((toStringByNSInteger(_likeBtn.thumpNum)))
            .onClickBy(^(RBCLikeButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                x.jobsResetBtnImage(x.selected ? JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like"));
    //            [x setThumbWithSelected:x.selected
    //                           thumbNum:x.selected ? x.thumpNum + 1 : x.thumpNum - 1
    //                          animation:YES];
                if(x.selected){
                    x.thumpNum = x.thumpNum + 1;
                }else{
                    x.thumpNum = x.thumpNum - 1;
                }
                x.jobsResetTitle(toStringByNSInteger(x.thumpNum));
                x.jobsResetBtnTitleCor(x.selected ? JobsRedColor : JobsGrayColor);
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(55 / 2));
                make.right.equalTo(self.contentView).offset(-JobsWidth(13));
                make.centerY.equalTo(self.contentView);
            });
        _likeBtn.thumpNum = 0;
    }
    _likeBtn.bySelected(self.childCommentModel.isPraise.boolValue);
    _likeBtn.thumpNum = self.childCommentModel.praiseNum;
    _likeBtn
        .jobsResetBtnTitle(toStringByNSInteger(_likeBtn.thumpNum))
        .jobsResetBtnTitleCor(_likeBtn.selected ? JobsRedColor : JobsGrayColor)
        .jobsResetBtnImage(_likeBtn.selected ? JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like"))
        .makeBtnTitleByShowingType(UILabelShowingType_03);
    return _likeBtn;
}

@end

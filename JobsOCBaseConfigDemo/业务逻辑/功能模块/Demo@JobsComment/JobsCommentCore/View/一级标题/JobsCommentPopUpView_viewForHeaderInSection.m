//
//  JobsCommentPopUpView_viewForHeaderInSection.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCommentPopUpView_viewForHeaderInSection.h"

@interface JobsCommentPopUpView_viewForHeaderInSection ()
/// UI
Prop_strong()BaseButton *userInfoBtn;
Prop_strong()RBCLikeButton *likeBtn;
/// Data
Prop_strong()JobsFirstCommentModel *firstCommentModel;

-(JobsRetImageByStrBlock _Nonnull)jobs_commentAvatarPlaceholderImageByID;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsCommentPopUpView_viewForHeaderInSection
@interface JobsCommentPopUpView_viewForHeaderInSection (JobsPropertyDSLSetterAutogen_27d222f522)
-(void)setFirstCommentModel:(JobsFirstCommentModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsCommentPopUpView_viewForHeaderInSection

@implementation JobsCommentPopUpView_viewForHeaderInSection
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCommentPopUpView_viewForHeaderInSection.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.objBlock) self.objBlock(@1);
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsCommentConfig.jobsSharedManager().cellHeight;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.byBgColor(JobsSecondarySystemBackgroundColor);
        if ([model isKindOfClass:JobsFirstCommentModel.class]) {
            self.byFirstCommentModel(model);
            self.userInfoBtn.byAlpha(1);
            self.likeBtn.byAlpha(1);
        }
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)userInfoBtn{
    if(!_userInfoBtn){
        @jobs_weakify(self)
        _userInfoBtn = ((BaseButton *)BaseButton.jobsInit())
            .byImageViewFrame(CGRectMake(0, JobsWidth(16), JobsWidth(40), JobsWidth(40)))
            .byTextLabelFrame(CGRectMake(JobsWidth(52), JobsWidth(14), JobsWidth(220), JobsWidth(18)))
            .bySubTextLabelFrame(CGRectMake(JobsWidth(52), JobsWidth(34), JobsWidth(240), JobsWidth(22)))
            .bgColorBy(JobsClearColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(0)
            .jobsResetBtnTitleCor(JobsCommentConfig.jobsSharedManager().titleCor)
            .jobsResetBtnTitleFont(JobsCommentConfig.jobsSharedManager().titleFont)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.bySelected(!x.selected);
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(JobsWidth(14));
                make.right.equalTo(self).offset(-JobsWidth(68));
                make.top.bottom.equalTo(self);
            });
        /// 很重要，自定义设置UIBotton.imageView
        _userInfoBtn.imageView
            .byContentMode(UIViewContentModeScaleAspectFill)
            .byClipsToBounds(YES);
        _userInfoBtn.imageView.cornerCutToCircleWithCornerRadius(JobsWidth(20));
    }
    UIImage *placeholderImage = self.jobs_commentAvatarPlaceholderImageByID(self.firstCommentModel.ID ? : self.firstCommentModel.userId);
    self->_userInfoBtn.jobsResetBtnImage(placeholderImage);
    if (self.firstCommentModel.headImg.jobsCanOpenUrl()) {
        self->_userInfoBtn
            .imageURL(self.firstCommentModel.headImg.jobsImageURLPlus().jobsURL())
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
            }).normalLoad();
    }else{
        self->_userInfoBtn.jobsResetBtnImage(placeholderImage);
    }
    _userInfoBtn
        .jobsUpdateButtonConfigurationBy(^(UIButtonConfiguration *config) {
            config
                .byAttributedTitle([NSMutableAttributedString.alloc initWithString:self.firstCommentModel.nickname ? : @""
                                                                        attributes:@{NSFontAttributeName: JobsCommentConfig.jobsSharedManager().titleFont,
                                                                  NSForegroundColorAttributeName: JobsCommentConfig.jobsSharedManager().titleCor}])
                .byAttributedSubtitle([NSMutableAttributedString.alloc initWithString:self.firstCommentModel.content ? : @""
                                                                           attributes:@{NSFontAttributeName: JobsCommentConfig.jobsSharedManager().subTitleFont,
                                                                     NSForegroundColorAttributeName: JobsCommentConfig.jobsSharedManager().subTitleCor}]);
        })
        .makeBtnTitleByShowingType(UILabelShowingType_03);
    return _userInfoBtn;
}

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
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(46), JobsWidth(44)));
                make.right.equalTo(self).offset(-JobsWidth(14));
                make.centerY.equalTo(self);
            });
        _likeBtn.byThumpNum(0);
    }
    _likeBtn.bySelected(self.firstCommentModel.isPraise);
    _likeBtn.byThumpNum(self.firstCommentModel.praiseNum);
    _likeBtn
        .jobsResetBtnTitle(toStringByNSInteger(_likeBtn.thumpNum))
        .jobsResetBtnTitleCor(_likeBtn.selected ? JobsRedColor : HEXCOLOR(0x94A3B8))
        .jobsResetBtnImage(_likeBtn.selected ? JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsLoadBundleImage(nil, @"RBCLikeButton", nil, @"day_like"))
        .makeBtnTitleByShowingType(UILabelShowingType_03);
    return _likeBtn;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsCommentPopUpView_viewForHeaderInSection
-(JobsRetJobsCommentPopUpView_viewForHeaderInSectionByJobsFirstCommentModelBlock _Nonnull)byFirstCommentModel{
    @jobs_weakify(self)
    return ^__kindof JobsCommentPopUpView_viewForHeaderInSection * _Nullable(JobsFirstCommentModel * _Nullable data){
        @jobs_strongify(self)
        [self setFirstCommentModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsCommentPopUpView_viewForHeaderInSection
@end

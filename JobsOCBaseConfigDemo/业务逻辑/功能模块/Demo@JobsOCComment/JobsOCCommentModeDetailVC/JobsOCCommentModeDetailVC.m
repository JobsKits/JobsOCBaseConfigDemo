//
//  JobsOCCommentModeDetailVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCCommentModeDetailVC.h"

@interface JobsOCCommentModeDetailVC ()

Prop_strong()JobsOCCommentView *commentView;
Prop_assign()NSInteger demoRefreshCount;
Prop_assign()NSInteger demoLoadMoreCount;

-(JobsRetJobsOCCommentConfigByVoidBlock _Nonnull)jobs_commentConfig;
-(jobsByJobsOCCommentModelBlock _Nonnull)jobs_openReplyPageByComment;
-(jobsByVoidBlock _Nonnull)jobs_updatePreferredContentSizeIfNeeded;
-(jobsByJobsOCCommentConfigBlock _Nonnull)jobs_bindRefresherByConfig;
-(jobsByJobsOCCommentViewBlock _Nonnull)jobs_pullRefreshByCommentView;
-(jobsByJobsOCCommentViewBlock _Nonnull)jobs_loadMoreByCommentView;
-(JobsOCCommentModel *)jobs_demoGeneratedCommentWithAction:(NSString *)action
                                                     index:(NSInteger)index;
-(JobsRetStrByVoidBlock _Nonnull)jobs_titleText;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCCommentModeDetailVC
@interface JobsOCCommentModeDetailVC (JobsPropertyDSLSetterAutogen_4c5b7744a5)
-(void)setCommentArr:(NSArray <JobsOCCommentModel *>* _Nullable)data;
-(void)setIsHiddenNavigationBar:(BOOL)data;
-(void)setModalPresentationStyle:(UIModalPresentationStyle)data;
-(void)setMode:(JobsOCCommentMode)data;
-(void)setPopUpHeight:(CGFloat)data;
-(void)setPopupStyle:(BOOL)data;
-(void)setPreferredContentSize:(CGSize)data;
-(void)setReplyDetailStyle:(BOOL)data;
-(void)setTransitioningDelegate:(id <UIViewControllerTransitioningDelegate> _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCCommentModeDetailVC

@implementation JobsOCCommentModeDetailVC
@synthesize popUpHeight = _popUpHeight;

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCCommentModeDetailVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(self.jobs_titleText().jobsTr())
                    .byFont(UIFontWeightRegularSize(18))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(HEXCOLOR(0xF6F7FB))
            .byNavBgCor(HEXCOLOR(0xF6F7FB));
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCCommentModeDetailVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        if (self.popupStyle) {
            self.byHiddenNavigationBar(YES);
        }else{
            self.makeNavByAlpha(1);
        }
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.jobs_updatePreferredContentSizeIfNeeded();
        self.commentView.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCCommentModeDetailVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.jobs_updatePreferredContentSizeIfNeeded();
    };
}

-(JobsRetJobsOCCommentConfigByVoidBlock _Nonnull)jobs_commentConfig{
    @jobs_weakify(self)
    return ^JobsOCCommentConfig *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCCommentConfig *config = JobsOCCommentConfig.defaultConfig();
        config.byMode(self.mode);
        config.byTitle(self.jobs_titleText());
        config.byShowsReplyEntrance(!self.replyDetailStyle);
        self.jobs_bindRefresherByConfig(config);
        @jobs_weakify(self)
        config.commentSelectedBlock = ^(id _Nullable data) {
            @jobs_strongify(self)
            if (![data isKindOfClass:JobsOCCommentModel.class]) return;
            JobsOCCommentModel *comment = (JobsOCCommentModel *)data;
            if (self.mode == JobsOCCommentModeToutiao && comment.children.count && !self.replyDetailStyle) {
                self.jobs_openReplyPageByComment(comment);
            }else{
                JobsLog(@"点击评论：%@", comment.messageID);
            }
        };
        return config;
    };
}

-(jobsByJobsOCCommentConfigBlock _Nonnull)jobs_bindRefresherByConfig{
    @jobs_weakify(self)
    return ^(JobsOCCommentConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        if (self.mode != JobsOCCommentModeNetEase && self.mode != JobsOCCommentModeCustom) {
            config.byEnablesPullRefresh(NO);
            config.byEnablesLoadMore(NO);
            return;
        }
        config.byPullRefreshConfig(JobsOCRefreshConfig.defaultHeaderConfig());
        config.pullRefreshConfig.byIdleText(@"下拉刷新评论");
        config.pullRefreshConfig.byPullingText(@"继续下拉");
        config.pullRefreshConfig.byReadyRefreshText(@"松开刷新评论");
        config.pullRefreshConfig.byRefreshingText(@"正在刷新评论...");
        config.byLoadMoreConfig(JobsOCRefreshConfig.defaultFooterConfig());
        config.loadMoreConfig.byIdleText(@"上拉加载更多评论");
        config.loadMoreConfig.byPullingText(@"继续上拉");
        config.loadMoreConfig.byReadyLoadMoreText(@"松开加载更多");
        config.loadMoreConfig.byLoadingMoreText(@"正在加载更多评论...");
        @jobs_weakify(self)
        config.pullRefreshBlock = ^(__kindof JobsOCCommentView *commentView) {
            @jobs_strongify(self)
            self.jobs_pullRefreshByCommentView(commentView);
        };
        config.loadMoreBlock = ^(__kindof JobsOCCommentView *commentView) {
            @jobs_strongify(self)
            self.jobs_loadMoreByCommentView(commentView);
        };
    };
}

-(jobsByJobsOCCommentViewBlock _Nonnull)jobs_pullRefreshByCommentView{
    @jobs_weakify(self)
    return ^(JobsOCCommentView * commentView){
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        __weak typeof(commentView) weakCommentView = commentView;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            JobsOCCommentView *strongCommentView = weakCommentView;
            if (self && strongCommentView) {
                self.demoRefreshCount += 1;
                NSMutableArray <JobsOCCommentModel *>*commentMutArr = self.commentArr.mutableCopy;
                [commentMutArr insertObject:[self jobs_demoGeneratedCommentWithAction:@"refresh"
                                                                                index:self.demoRefreshCount]
                                    atIndex:0];
                self.byCommentArr(commentMutArr.copy);
                strongCommentView.reloadWithComments(self.commentArr);
            }
            strongCommentView.endPullRefresh();
        });
    };
}

-(jobsByJobsOCCommentViewBlock _Nonnull)jobs_loadMoreByCommentView{
    @jobs_weakify(self)
    return ^(JobsOCCommentView * commentView){
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        __weak typeof(commentView) weakCommentView = commentView;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            JobsOCCommentView *strongCommentView = weakCommentView;
            if (self && strongCommentView) {
                self.demoLoadMoreCount += 1;
                NSMutableArray <JobsOCCommentModel *>*commentMutArr = self.commentArr.mutableCopy;
                [commentMutArr addObject:[self jobs_demoGeneratedCommentWithAction:@"loadMore"
                                                                             index:self.demoLoadMoreCount]];
                self.byCommentArr(commentMutArr.copy);
                strongCommentView.reloadWithComments(self.commentArr);
            }
            strongCommentView.endLoadMore();
        });
    };
}

-(JobsOCCommentModel *)jobs_demoGeneratedCommentWithAction:(NSString *)action
                                                     index:(NSInteger)index{
    BOOL isRefresh = [action isEqualToString:@"refresh"];
    NSString *messageID = [NSString stringWithFormat:@"c-%@-%ld-%ld", action, (long)self.mode, (long)index];
    NSString *nickname = isRefresh ? @"刷新来的评论" : @"加载来的评论";
    NSString *content = isRefresh ? @"这条是下拉刷新插入的新一级评论，用来验证模式一/三的刷新入口。" : @"这条是上拉加载追加的新一级评论，用来验证模式一/三的加载入口。";
    return [JobsOCCommentModel commentWithMessageID:messageID
                                         userAvatar:@""
                                           nickname:[NSString stringWithFormat:@"%@%ld", nickname, (long)index]
                                             replyID:@"news-20260706"
                                       replyUserName:nil
                                        publishTime:@"刚刚"
                                            content:content
                                             device:@"JobsOCRefresher"
                                           location:@"深圳"
                                           children:nil];
}

-(jobsByJobsOCCommentModelBlock _Nonnull)jobs_openReplyPageByComment{
    @jobs_weakify(self)
    return ^(JobsOCCommentModel * comment){
        @jobs_strongify(self)
        if (!self) return;
        JobsOCCommentModeDetailVC *vc = JobsOCCommentModeDetailVC.new;
        vc.byMode(JobsOCCommentModeToutiao);
        vc.byReplyDetailStyle(YES);
        vc.byCommentArr(@[comment]);
        if (self.navigationController) {
            [self.navigationController pushViewController:vc
                                                 animated:YES];
        }else{
            vc.byModalPresentationStyle(UIModalPresentationFullScreen);
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
        }
    };
}

-(JobsRetStrByVoidBlock _Nonnull)jobs_titleText{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.replyDetailStyle) {
            JobsOCCommentModel *comment = self.commentArr.firstObject;
            return comment.nickname.length ? [NSString stringWithFormat:@"%@ 的回复", comment.nickname] : @"评论回复";
        };return JobsOCCommentConfig.titleByMode(self.mode);
    };
}

-(void)setPopUpHeight:(CGFloat)popUpHeight{
    _popUpHeight = popUpHeight;
    self.jobs_updatePreferredContentSizeIfNeeded();
}

-(CGFloat)popUpHeight{
    if (_popUpHeight <= 0) {
        _popUpHeight = JobsMainScreen_HEIGHT() * 0.62;
    };return _popUpHeight;
}

-(jobsByVoidBlock _Nonnull)jobs_updatePreferredContentSizeIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.popupStyle) return;
        self.byPreferredContentSize(CGSizeMake(JobsRealWidth(), self.popUpHeight));
    };
}
#pragma mark —— LazyLoad
-(JobsOCCommentView *)commentView{
    if (!_commentView) {
        _commentView = [JobsOCCommentView.alloc initWithConfig:self.jobs_commentConfig()];
        _commentView.byComments(self.commentArr)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                if (self.popupStyle) {
                    make.top.equalTo(self.view);
                }else{
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                }
                make.left.right.bottom.equalTo(self.view);
            });
    };return _commentView;
}

-(NSArray<JobsOCCommentModel *> *)commentArr{
    return _commentArr ? : @[];
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCCommentModeDetailVC
-(JobsRetJobsOCCommentModeDetailVCByBOOLBlock _Nonnull)byHiddenNavigationBar{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModeDetailVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsHiddenNavigationBar:data];
        return self;
    };
}

-(JobsRetJobsOCCommentModeDetailVCByBOOLBlock _Nonnull)byPopupStyle{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModeDetailVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setPopupStyle:data];
        return self;
    };
}

-(JobsRetJobsOCCommentModeDetailVCByBOOLBlock _Nonnull)byReplyDetailStyle{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModeDetailVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setReplyDetailStyle:data];
        return self;
    };
}

-(JobsRetJobsOCCommentModeDetailVCByCGFloatBlock _Nonnull)byPopUpHeight{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModeDetailVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setPopUpHeight:data];
        return self;
    };
}

-(JobsRetJobsOCCommentModeDetailVCByJobsOCCommentModeBlock _Nonnull)byMode{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModeDetailVC * _Nullable(JobsOCCommentMode data){
        @jobs_strongify(self)
        [self setMode:data];
        return self;
    };
}

-(JobsRetJobsOCCommentModeDetailVCByNSArrayJobsOCCommentModelBlock _Nonnull)byCommentArr{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModeDetailVC * _Nullable(NSArray <JobsOCCommentModel *>* _Nullable data){
        @jobs_strongify(self)
        [self setCommentArr:data];
        return self;
    };
}
-(JobsRetJobsOCCommentModeDetailVCByCGSizeBlock _Nonnull)byPreferredContentSize{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModeDetailVC * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setPreferredContentSize:data];
        return self;
    };
}

-(JobsRetJobsOCCommentModeDetailVCByIDUIViewControllerTransitioningDelegateBlock _Nonnull)byTransitioningDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModeDetailVC * _Nullable(id <UIViewControllerTransitioningDelegate> _Nullable data){
        @jobs_strongify(self)
        [self setTransitioningDelegate:data];
        return self;
    };
}

-(JobsRetJobsOCCommentModeDetailVCByUIModalPresentationStyleBlock _Nonnull)byModalPresentationStyle{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModeDetailVC * _Nullable(UIModalPresentationStyle data){
        @jobs_strongify(self)
        [self setModalPresentationStyle:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCCommentModeDetailVC
@end

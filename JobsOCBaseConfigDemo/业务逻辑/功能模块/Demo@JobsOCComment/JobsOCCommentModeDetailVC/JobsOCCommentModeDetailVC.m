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

-(JobsOCCommentConfig *)jobs_commentConfig;
-(void)jobs_openReplyPageByComment:(JobsOCCommentModel *)comment;
-(void)jobs_updatePreferredContentSizeIfNeeded;
-(void)jobs_bindRefresherByConfig:(JobsOCCommentConfig *)config;
-(void)jobs_pullRefreshByCommentView:(JobsOCCommentView *)commentView;
-(void)jobs_loadMoreByCommentView:(JobsOCCommentView *)commentView;
-(JobsOCCommentModel *)jobs_demoGeneratedCommentWithAction:(NSString *)action
                                                     index:(NSInteger)index;
-(NSString *)jobs_titleText;

@end

@implementation JobsOCCommentModeDetailVC
@synthesize popUpHeight = _popUpHeight;

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byText(self.jobs_titleText.tr)
                .byFont(UIFontWeightRegularSize(18))
                .byTextCor(JobsLabelColor);
        })
        .byBgCor(HEXCOLOR(0xF6F7FB))
        .byNavBgCor(HEXCOLOR(0xF6F7FB));
}

-(void)viewDidLoad{
    [super viewDidLoad];
    if (self.popupStyle) {
        self.isHiddenNavigationBar = YES;
    }else{
        self.makeNavByAlpha(1);
    }
    self.view.byBgColor(JobsSystemBackgroundColor);
    [self jobs_updatePreferredContentSizeIfNeeded];
    self.commentView.byAlpha(1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self jobs_updatePreferredContentSizeIfNeeded];
}

-(JobsOCCommentConfig *)jobs_commentConfig{
    JobsOCCommentConfig *config = JobsOCCommentConfig.defaultConfig;
    config.mode = self.mode;
    config.title = self.jobs_titleText;
    config.showsReplyEntrance = !self.replyDetailStyle;
    [self jobs_bindRefresherByConfig:config];
    @jobs_weakify(self)
    config.commentSelectedBlock = ^(id _Nullable data) {
        @jobs_strongify(self)
        if (![data isKindOfClass:JobsOCCommentModel.class]) return;
        JobsOCCommentModel *comment = (JobsOCCommentModel *)data;
        if (self.mode == JobsOCCommentModeToutiao && comment.children.count && !self.replyDetailStyle) {
            [self jobs_openReplyPageByComment:comment];
        }else{
            JobsLog(@"点击评论：%@", comment.messageID);
        }
    };
    return config;
}

-(void)jobs_bindRefresherByConfig:(JobsOCCommentConfig *)config{
    if (self.mode != JobsOCCommentModeNetEase && self.mode != JobsOCCommentModeCustom) {
        config.enablesPullRefresh = NO;
        config.enablesLoadMore = NO;
        return;
    }
    config.pullRefreshConfig = JobsOCRefreshConfig.defaultHeaderConfig;
    config.pullRefreshConfig.idleText = @"下拉刷新评论";
    config.pullRefreshConfig.pullingText = @"继续下拉";
    config.pullRefreshConfig.readyRefreshText = @"松开刷新评论";
    config.pullRefreshConfig.refreshingText = @"正在刷新评论...";
    config.loadMoreConfig = JobsOCRefreshConfig.defaultFooterConfig;
    config.loadMoreConfig.idleText = @"上拉加载更多评论";
    config.loadMoreConfig.pullingText = @"继续上拉";
    config.loadMoreConfig.readyLoadMoreText = @"松开加载更多";
    config.loadMoreConfig.loadingMoreText = @"正在加载更多评论...";
    @jobs_weakify(self)
    config.pullRefreshBlock = ^(__kindof JobsOCCommentView *commentView) {
        @jobs_strongify(self)
        [self jobs_pullRefreshByCommentView:commentView];
    };
    config.loadMoreBlock = ^(__kindof JobsOCCommentView *commentView) {
        @jobs_strongify(self)
        [self jobs_loadMoreByCommentView:commentView];
    };
}

-(void)jobs_pullRefreshByCommentView:(JobsOCCommentView *)commentView{
    __weak typeof(self) weakSelf = self;
    __weak typeof(commentView) weakCommentView = commentView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        JobsOCCommentModeDetailVC *strongSelf = weakSelf;
        JobsOCCommentView *strongCommentView = weakCommentView;
        if (strongSelf && strongCommentView) {
            strongSelf.demoRefreshCount += 1;
            NSMutableArray <JobsOCCommentModel *>*commentMutArr = strongSelf.commentArr.mutableCopy;
            [commentMutArr insertObject:[strongSelf jobs_demoGeneratedCommentWithAction:@"refresh"
                                                                                  index:strongSelf.demoRefreshCount]
                                atIndex:0];
            strongSelf.commentArr = commentMutArr.copy;
            [strongCommentView reloadWithComments:strongSelf.commentArr];
        }
        [strongCommentView endPullRefresh];
    });
}

-(void)jobs_loadMoreByCommentView:(JobsOCCommentView *)commentView{
    __weak typeof(self) weakSelf = self;
    __weak typeof(commentView) weakCommentView = commentView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        JobsOCCommentModeDetailVC *strongSelf = weakSelf;
        JobsOCCommentView *strongCommentView = weakCommentView;
        if (strongSelf && strongCommentView) {
            strongSelf.demoLoadMoreCount += 1;
            NSMutableArray <JobsOCCommentModel *>*commentMutArr = strongSelf.commentArr.mutableCopy;
            [commentMutArr addObject:[strongSelf jobs_demoGeneratedCommentWithAction:@"loadMore"
                                                                               index:strongSelf.demoLoadMoreCount]];
            strongSelf.commentArr = commentMutArr.copy;
            [strongCommentView reloadWithComments:strongSelf.commentArr];
        }
        [strongCommentView endLoadMore];
    });
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

-(void)jobs_openReplyPageByComment:(JobsOCCommentModel *)comment{
    JobsOCCommentModeDetailVC *vc = JobsOCCommentModeDetailVC.new;
    vc.mode = JobsOCCommentModeToutiao;
    vc.replyDetailStyle = YES;
    vc.commentArr = @[comment];
    if (self.navigationController) {
        [self.navigationController pushViewController:vc
                                             animated:YES];
    }else{
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc
                           animated:YES
                         completion:nil];
    }
}

-(NSString *)jobs_titleText{
    if (self.replyDetailStyle) {
        JobsOCCommentModel *comment = self.commentArr.firstObject;
        return comment.nickname.length ? [NSString stringWithFormat:@"%@ 的回复", comment.nickname] : @"评论回复";
    };return [JobsOCCommentConfig titleByMode:self.mode];
}

-(void)setPopUpHeight:(CGFloat)popUpHeight{
    _popUpHeight = popUpHeight;
    [self jobs_updatePreferredContentSizeIfNeeded];
}

-(CGFloat)popUpHeight{
    if (_popUpHeight <= 0) {
        _popUpHeight = JobsMainScreen_HEIGHT() * 0.62;
    };return _popUpHeight;
}

-(void)jobs_updatePreferredContentSizeIfNeeded{
    if (!self.popupStyle) return;
    self.preferredContentSize = CGSizeMake(JobsRealWidth(), self.popUpHeight);
}
#pragma mark —— LazyLoad
-(JobsOCCommentView *)commentView{
    if (!_commentView) {
        _commentView = [JobsOCCommentView.alloc initWithConfig:self.jobs_commentConfig];
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

@end

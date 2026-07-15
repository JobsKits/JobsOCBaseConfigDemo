//
//  JobsOCCommentDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCCommentDemoVC.h"
#import "JobsOCCommentModeDetailVC.h"
#import "JobsPresentationCtrl.h"

static NSString *const JobsOCCommentDemoCellReuseIdentifier = @"JobsOCCommentDemoCellReuseIdentifier";

@interface JobsOCCommentDemoVC ()

Prop_strong()UITableView *commentListView;
Prop_copy()NSArray <NSNumber *>*modeArr;
Prop_copy()NSArray <JobsOCCommentModel *>*commentArr;
Prop_strong()JobsPresentationCtrl *presentationController;

-(void)jobs_showMode:(JobsOCCommentMode)mode;
-(void)jobs_presentPopupMode:(JobsOCCommentMode)mode;
-(void)jobs_pushMode:(JobsOCCommentMode)mode;
-(NSArray <JobsOCCommentModel *>*)jobs_makeDemoComments;

@end

@implementation JobsOCCommentDemoVC
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
            data.byText(@"JobsOCComment".tr);
            data.byFont(UIFontWeightRegularSize(18));
            data.byTextCor(HEXCOLOR(0x2D3642));
        })
        .byBgCor(HEXCOLOR(0xF6F7FB))
        .byNavBgCor(HEXCOLOR(0xF6F7FB));
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF6F7FB));
    self.commentListView.byAlpha(1);
}
#pragma mark —— UITableViewDelegate, UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.modeArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(72);
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCCommentDemoCellReuseIdentifier];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:JobsOCCommentDemoCellReuseIdentifier];
    }
    JobsOCCommentMode mode = self.modeArr[indexPath.row].integerValue;
    cell.textLabel
        .byText([JobsOCCommentConfig titleByMode:mode].tr)
        .byTextCor(HEXCOLOR(0x2D3642))
        .byFont(UIFontWeightMediumSize(16));
    cell.detailTextLabel
        .byText([JobsOCCommentConfig subtitleByMode:mode].tr)
        .byTextCor(HEXCOLOR(0x7A8491))
        .byFont(UIFontWeightRegularSize(13));
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.byBgColor(UIColor.whiteColor);
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                              animated:YES];
    [self jobs_showMode:self.modeArr[indexPath.row].integerValue];
}
#pragma mark —— Private
-(void)jobs_showMode:(JobsOCCommentMode)mode{
    if (mode == JobsOCCommentModeToutiao) {
        [self jobs_pushMode:mode];
    }else{
        [self jobs_presentPopupMode:mode];
    }
}

-(void)jobs_presentPopupMode:(JobsOCCommentMode)mode{
    UIViewController *presentingVC = self.jobsGetCurrentViewController ? : self;
    if (presentingVC.presentedViewController) return;
    JobsOCCommentModeDetailVC *vc = JobsOCCommentModeDetailVC.new;
    vc.mode = mode;
    vc.popupStyle = YES;
    vc.commentArr = self.commentArr;
    vc.popUpHeight = JobsMainScreen_HEIGHT() * 0.62;
    vc.pushOrPresent = ComingStyle_PRESENT;
    vc.preferredContentSize = CGSizeMake(JobsRealWidth(), vc.popUpHeight);
    self.presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:vc
                                                                     presentingViewController:presentingVC];
    vc.transitioningDelegate = self.presentationController;
    [presentingVC presentViewController:vc
                               animated:YES
                             completion:nil];
}

-(void)jobs_pushMode:(JobsOCCommentMode)mode{
    JobsOCCommentModeDetailVC *vc = JobsOCCommentModeDetailVC.new;
    vc.mode = mode;
    vc.commentArr = self.commentArr;
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

-(NSArray<JobsOCCommentModel *> *)jobs_makeDemoComments{
    JobsOCCommentModel *reply1_1_1 = [JobsOCCommentModel commentWithMessageID:@"c-1001-1-1"
                                                                   userAvatar:@""
                                                                     nickname:@"北海有风"
                                                                       replyID:@"c-1001-1"
                                                                 replyUserName:@"江左小白"
                                                                   publishTime:@"刚刚"
                                                                       content:@"我更关心后续有没有把时间线补齐，第三层这里不再继续缩进，但会显示回复对象。"
                                                                      device:@"iPhone 15 Pro"
                                                                    location:@"广州"
                                                                    children:nil];
    JobsOCCommentModel *reply1_1_2 = [JobsOCCommentModel commentWithMessageID:@"c-1001-1-2"
                                                                   userAvatar:@""
                                                                     nickname:@"AAA"
                                                                       replyID:@"c-1001-1"
                                                                 replyUserName:@"江左小白"
                                                                   publishTime:@"刚刚"
                                                                       content:@"我这里是对二级回复的继续回复，缩进和二级保持一致，但要标出回复对象。"
                                                                        device:@"iPhone"
                                                                      location:@"深圳"
                                                                      children:nil];
    JobsOCCommentModel *reply1_1 = [JobsOCCommentModel commentWithMessageID:@"c-1001-1"
                                                                 userAvatar:@""
                                                                   nickname:@"江左小白"
                                                                     replyID:@"c-1001"
                                                               replyUserName:@"Jobs"
                                                                 publishTime:@"3 分钟前"
                                                                      content:@"网易风格里这种回复会留在当前评论块里，不需要再打开新页面。"
                                                                       device:@"iPhone"
                                                                     location:@"杭州"
                                                                     children:@[reply1_1_1, reply1_1_2]];
    JobsOCCommentModel *reply1_2 = [JobsOCCommentModel commentWithMessageID:@"c-1001-2"
                                                                 userAvatar:@""
                                                                   nickname:@"咖啡续杯"
                                                                     replyID:@"c-1001"
                                                               replyUserName:@"Jobs"
                                                                 publishTime:@"5 分钟前"
                                                                     content:@"这个数据结构清楚：replyID 指向上一级，展示时再按模式决定缩进。"
                                                                       device:@"Mac"
                                                                     location:@"上海"
                                                                     children:nil];
    JobsOCCommentModel *reply1_3 = [JobsOCCommentModel commentWithMessageID:@"c-1001-3"
                                                                 userAvatar:@""
                                                                   nickname:@"时间线同学"
                                                                     replyID:@"c-1001"
                                                               replyUserName:@"Jobs"
                                                                 publishTime:@"2 分钟前"
                                                                     content:@"这条用于演示模式三的固定展示数量。"
                                                                      device:@"Web"
                                                                    location:@"南京"
                                                                    children:nil];
    JobsOCCommentModel *reply1_4 = [JobsOCCommentModel commentWithMessageID:@"c-1001-4"
                                                                 userAvatar:@""
                                                                   nickname:@"评论观察员"
                                                                     replyID:@"c-1001"
                                                               replyUserName:@"Jobs"
	                                                                 publishTime:@"1 分钟前"
	                                                                     content:@"超过默认 3 条以后，下面会出现显示更多入口。"
	                                                                      device:@"iPad"
	                                                                    location:@"苏州"
	                                                                    children:nil];
    JobsOCCommentModel *reply1_5 = [JobsOCCommentModel commentWithMessageID:@"c-1001-5"
                                                                 userAvatar:@""
                                                                   nickname:@"尾巴补充"
                                                                     replyID:@"c-1001"
                                                               replyUserName:@"Jobs"
                                                                 publishTime:@"刚刚"
                                                                     content:@"点击显示更多以后，这条也会展开出来。"
                                                                      device:@"Mac"
                                                                    location:@"上海"
                                                                    children:nil];
    JobsOCCommentModel *comment1 = [JobsOCCommentModel commentWithMessageID:@"c-1001"
                                                                 userAvatar:@""
                                                                   nickname:@"Jobs"
                                                                     replyID:@"news-20260706"
                                                               replyUserName:nil
                                                                 publishTime:@"8 分钟前"
                                                                      content:@"这是一级评论：不需要显示回复谁，只表达对整个新闻事件的观点。"
                                                                       device:@"iPhone"
                                                                     location:@"深圳"
                                                                     children:@[reply1_1, reply1_2, reply1_3, reply1_4, reply1_5]];
    JobsOCCommentModel *reply2_1 = [JobsOCCommentModel commentWithMessageID:@"c-1002-1"
                                                                 userAvatar:@""
                                                                   nickname:@"月台来信"
                                                                     replyID:@"c-1002"
                                                               replyUserName:@"产品同学"
                                                                 publishTime:@"12 分钟前"
                                                                     content:@"今日头条模式下，主列表只露出入口，点进去单开回复页。"
                                                                      device:@"iPad"
                                                                    location:@"北京"
                                                                    children:nil];
    JobsOCCommentModel *comment2 = [JobsOCCommentModel commentWithMessageID:@"c-1002"
                                                                 userAvatar:@""
                                                                   nickname:@"产品同学"
                                                                     replyID:@"news-20260706"
                                                               replyUserName:nil
                                                                 publishTime:@"20 分钟前"
                                                                     content:@"模式二适合评论主线和回复详情分开，列表会更轻。"
                                                                      device:@"iPhone"
                                                                    location:@"成都"
                                                                    children:@[reply2_1]];
    JobsOCCommentModel *comment3 = [JobsOCCommentModel commentWithMessageID:@"c-1003"
                                                                 userAvatar:@""
                                                                   nickname:@"晴天脚本"
                                                                     replyID:@"news-20260706"
                                                               replyUserName:nil
                                                                 publishTime:@"30 分钟前"
                                                                     content:@"模式三主要看层级：二级缩进，三级以后回到主缩进并显示回复对象。"
                                                                      device:@"Web"
                                                                    location:@"厦门"
                                                                    children:nil];
    return @[comment1, comment2, comment3];
}
#pragma mark —— LazyLoad
-(UITableView *)commentListView{
    if (!_commentListView) {
        _commentListView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byRowHeight(JobsWidth(72))
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySectionHeaderTopPadding(0)
                .byContentInset(UIEdgeInsetsMake(JobsWidth(12), 0, JobsBottomSafeAreaHeight(), 0))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
    };return _commentListView;
}

-(NSArray<NSNumber *> *)modeArr{
    if (!_modeArr) {
        _modeArr = @[
            @(JobsOCCommentModeNetEase),
            @(JobsOCCommentModeToutiao),
            @(JobsOCCommentModeCustom)
        ];
    };return _modeArr;
}

-(NSArray<JobsOCCommentModel *> *)commentArr{
    if (!_commentArr) {
        _commentArr = [self jobs_makeDemoComments];
    };return _commentArr;
}

@end

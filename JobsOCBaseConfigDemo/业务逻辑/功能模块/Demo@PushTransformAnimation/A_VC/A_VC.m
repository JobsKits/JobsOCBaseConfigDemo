//
//  A_VC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "A_VC.h"
#import "B_VC.h"
#import "PushAnimation.h"
#import "MyFansTBVCell.h"

@interface A_VC ()

@end

@implementation A_VC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

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
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(@"".tr);
            data.byFont(UIFontWeightRegularSize(16));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsYellowColor);
    self.makeNavByAlpha(1);
    self.tableView.byShow(self);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.byDelegate(self);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— UINavigationControllerDelegate
// nav 协议方法的实现 告知 Nav 去使用 UIViewControllerAnimatedTransitioning协议中的方法
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
    return [toVC isKindOfClass:B_VC.class] ? PushAnimation.new : nil;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource ——————————
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MyFansTBVCell.cellHeightByModel(nil);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    B_VC *b = B_VC.new;
    b.indexPath = indexPath;
    self.comingToPushVCByRequestParams(b,jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
        data.byImage(toStringByNSInteger(indexPath.row).add(@".jpeg").img);
        data.backBtnTitleModel.byText(@"B_VC");
    }));
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(void)tableView:(UITableView *)tableView
didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    // highlight的时候，做一下缩放的动画
    MyFansTBVCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    UIView.jobsAnimateWithCompletion(0.3,
        ^{
        cell.transform = CGAffineTransformMakeScale(0.97, 0.97);
    },
        ^(BOOL finished) {
        UIView.jobsAnimateWithCompletion(0.3,
            ^{
            cell.transform = CGAffineTransformIdentity;
        },
            ^(BOOL finished) {
        });
    });
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MyFansTBVCell.cellStyleValue1ByTableView(tableView)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(@(indexPath.row % 4))
            .JobsBlock1(^(id _Nullable data) {;
            });
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byEstimatedRowHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byMJRefreshHeader(self.mjRefreshGifHeader)
                .byMJRefreshFooter(self.mjRefreshAutoGifFooter)
                .byPagingEnabled(YES)
                .byShowsVerticalScrollIndicator(NO)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsWhiteColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
            tableView.mj_footer.byHidden(NO);
            self.view.refresh();
        });
    };return _tableView;
}

@end

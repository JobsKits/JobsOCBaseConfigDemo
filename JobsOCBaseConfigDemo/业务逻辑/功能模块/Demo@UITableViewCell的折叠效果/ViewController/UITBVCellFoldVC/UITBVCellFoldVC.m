//
//  UITBVCellFoldVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITBVCellFoldVC.h"

@interface UITBVCellFoldVC ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()MSCommentView *commentView;

@end

static NSString *const JobsUITBVCellFoldTitle = @"UITableViewCell 折叠效果";

@implementation UITBVCellFoldVC

-(void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
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
        })
        // self.viewModel.textModel.text = @"消息详情页".tr;
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(JobsUITBVCellFoldTitle.tr);
            data.byFont(UIFontWeightRegularSize(16));
        })
    
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        // self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF5F7FB));
    self.makeNavByAlpha(1);
    self.titleLab.byAlpha(1);
    self.commentView.byAlpha(1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(JobsUITBVCellFoldTitle.tr)
                .byTextCor(HEXCOLOR(0x111827))
                .byFont(UIFontWeightBoldSize(22))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(15));
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(25));
                    make.right.equalTo(self.view).offset(-JobsWidth(15));
                    make.height.mas_equalTo(JobsWidth(28));
                })
                .makeLabelByShowingType(UILabelShowingType_03);
        });
    };return _titleLab;
}

-(MSCommentView *)commentView{
    if(!_commentView){
        _commentView = MSCommentView.new;
        _commentView.jobsRichViewByModel(nil);
        _commentView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(12));
            make.left.equalTo(self.view).offset(JobsWidth(12));
            make.right.equalTo(self.view).offset(-JobsWidth(12));
            make.bottom.equalTo(self.view).offset(-JobsWidth(12));
        });
    };return _commentView;
}

@end

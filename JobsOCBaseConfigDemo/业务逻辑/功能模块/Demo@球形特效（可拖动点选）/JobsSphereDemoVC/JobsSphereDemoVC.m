//
//  JobsSphereDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsSphereDemoVC.h"

@interface JobsSphereDemoVC ()

Prop_strong()XLSphereView *sphereView;
Prop_strong()UILabel *statusLabel;
Prop_strong()NSArray <NSString *>*tagTitleArr;
Prop_assign()BOOL sphereItemsPrepared;

-(void)prepareSphereItemsIfNeeded;
-(void)tagButtonClickEvent:(UIButton *)sender;

@end

@implementation JobsSphereDemoVC
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
            data.byText(@"球形特效".tr)
                .byFont(UIFontWeightRegularSize(17))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(HEXCOLOR(0xF4F5F8))
        .byNavBgCor(HEXCOLOR(0xF4F5F8));
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    self.sphereView.alpha = 1;
    self.statusLabel.alpha = 1;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self prepareSphereItemsIfNeeded];
}
#pragma mark —— 一些私有方法
-(void)prepareSphereItemsIfNeeded{
    if (self.sphereItemsPrepared || CGRectGetWidth(self.sphereView.bounds) <= 0) return;
    self.sphereItemsPrepared = YES;
    NSMutableArray <UIButton *>*buttonMutArr = NSMutableArray.array;
    for (NSInteger index = 0; index < self.tagTitleArr.count; index++) {
        NSString *title = self.tagTitleArr[index];
        UIButton *button = UIButton.new;
        button.tag = index;
        button.backgroundColor = [UIColor colorWithHue:(CGFloat)index / (CGFloat)self.tagTitleArr.count
                                            saturation:.62
                                            brightness:.92
                                                 alpha:1];
        button.layer.cornerRadius = JobsWidth(16);
        button.layer.masksToBounds = YES;
        [button setTitle:title.tr
                forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor
                      forState:UIControlStateNormal];
        button.titleLabel.font = UIFontWeightMediumSize(14);
        button.contentEdgeInsets = UIEdgeInsetsMake(0,
                                                   JobsWidth(12),
                                                   0,
                                                   JobsWidth(12));
        [button sizeToFit];
        CGRect frame = button.frame;
        frame.size.width = MAX(frame.size.width + JobsWidth(16), JobsWidth(74));
        frame.size.height = JobsWidth(32);
        button.frame = frame;
        [button addTarget:self
                   action:@selector(tagButtonClickEvent:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.sphereView addSubview:button];
        [buttonMutArr addObject:button];
    }
    [self.sphereView setItems:buttonMutArr];
}

-(void)tagButtonClickEvent:(UIButton *)sender{
    if (sender.tag < 0 || sender.tag >= (NSInteger)self.tagTitleArr.count) return;
    self.statusLabel.text = [NSString stringWithFormat:@"已选中：%@", self.tagTitleArr[sender.tag].tr];
}
#pragma mark —— LazyLoad
-(XLSphereView *)sphereView{
    if (!_sphereView) {
        _sphereView = XLSphereView.new;
        _sphereView.backgroundColor = UIColor.whiteColor;
        _sphereView.layer.cornerRadius = JobsWidth(8);
        _sphereView.layer.masksToBounds = YES;
        [self.view addSubview:_sphereView];
        [_sphereView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view).inset(JobsWidth(20));
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(24));
            make.height.equalTo(_sphereView.mas_width);
        }];
    };return _sphereView;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = UILabel.new;
        _statusLabel.text = @"拖动球体旋转，点按前景标签".tr;
        _statusLabel.textColor = HEXCOLOR(0x5A6372);
        _statusLabel.font = UIFontWeightRegularSize(15);
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        _statusLabel.numberOfLines = 0;
        [self.view addSubview:_statusLabel];
        [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view).inset(JobsWidth(24));
            make.top.equalTo(self.sphereView.mas_bottom).offset(JobsWidth(22));
        }];
    };return _statusLabel;
}

-(NSArray<NSString *> *)tagTitleArr{
    if (!_tagTitleArr) {
        _tagTitleArr = @[
            @"Swift",
            @"Objective-C",
            @"JobsOCTools",
            @"XLSphereView",
            @"拖动",
            @"惯性",
            @"点选",
            @"UIKit",
            @"Masonry",
            @"Demo",
            @"球形",
            @"特效",
            @"标签云",
            @"本地Pod"
        ];
    };return _tagTitleArr;
}

@end

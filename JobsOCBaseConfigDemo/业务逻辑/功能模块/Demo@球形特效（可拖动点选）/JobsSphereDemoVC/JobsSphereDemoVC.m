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
    self.sphereView.byAlpha(1);
    self.statusLabel.byAlpha(1);
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
        UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(title.tr)
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(14))
                .jobsResetBtnBgCor(jobsMakeCor2(^(__kindof JobsCorModel *_Nullable corModel) {
                    corModel
                        .byHue((CGFloat)index / (CGFloat)self.tagTitleArr.count)
                        .bySaturation(.62)
                        .byBrightness(.92)
                        .byAlpha(1);
                }))
                .byTag(index)
                .byContentEdgeInsets(UIEdgeInsetsMake(0, JobsWidth(12), 0, JobsWidth(12)))
                .bySizeToFit();
        });
        CGRect frame = button.frame;
        frame.size.width = MAX(frame.size.width + JobsWidth(16), JobsWidth(74));
        frame.size.height = JobsWidth(32);
        button
            .byAddTarget(self, @selector(tagButtonClickEvent:), UIControlEventTouchUpInside)
            .byFrame(frame)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(JobsWidth(16))
                    .byMasksToBounds(YES);
            })
            .addOn(self.sphereView);
        [buttonMutArr addObject:button];
    }
    [self.sphereView setItems:buttonMutArr];
}

-(void)tagButtonClickEvent:(UIButton *)sender{
    if (sender.tag < 0 || sender.tag >= (NSInteger)self.tagTitleArr.count) return;
    self.statusLabel.byText([NSString stringWithFormat:@"已选中：%@", self.tagTitleArr[sender.tag].tr]);
}
#pragma mark —— LazyLoad
-(XLSphereView *)sphereView{
    if (!_sphereView) {
        _sphereView = XLSphereView.new;
        _sphereView.byBgColor(UIColor.whiteColor);
        _sphereView.layer.byCornerRadius(JobsWidth(8));
        _sphereView.layer.byMasksToBounds(YES);
        _sphereView.addOn(self.view);
        [_sphereView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view).inset(JobsWidth(20));
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(24));
            make.height.equalTo(_sphereView.mas_width);
        }];
    };return _sphereView;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"拖动球体旋转，点按前景标签".tr)
                .byTextCor(HEXCOLOR(0x5A6372))
                .byFont(UIFontWeightRegularSize(15))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view).inset(JobsWidth(24));
                    make.top.equalTo(self.sphereView.mas_bottom).offset(JobsWidth(22));
                });
        });
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

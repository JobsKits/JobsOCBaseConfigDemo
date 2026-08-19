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
Prop_strong()NSMutableArray <UIButton *>*tagButtonMutArr;
Prop_assign()BOOL sphereItemsPrepared;

-(jobsByVoidBlock _Nonnull)prepareSphereItemsIfNeeded;
-(jobsByBtnBlock _Nonnull)tagButtonClickEvent;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsSphereDemoVC
@interface JobsSphereDemoVC (JobsPropertyDSLSetterAutogen_b4f5308b55)
-(void)setSphereItemsPrepared:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsSphereDemoVC

@implementation JobsSphereDemoVC
-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSphereDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byText(@"球形特效".jobsTr())
                    .byFont(UIFontWeightRegularSize(17))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(HEXCOLOR(0xF4F5F8))
            .byNavBgCor(HEXCOLOR(0xF4F5F8));
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSphereDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.sphereView.byAlpha(1);
        self.statusLabel.byAlpha(1);
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSphereDemoVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        self.prepareSphereItemsIfNeeded();
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)prepareSphereItemsIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        if (self.sphereItemsPrepared || CGRectGetWidth(self.sphereView.bounds) <= 0) return;
        self.bySphereItemsPrepared(YES);
        [self.tagButtonMutArr removeAllObjects];
        for (NSInteger index = 0; index < self.tagTitleArr.count; index++) {
            NSString *title = self.tagTitleArr[index];
            UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
                button
                    .jobsResetBtnTitle(title.jobsTr())
                    .jobsResetBtnTitleCor(UIColor.whiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightMediumSize(14))
                    .jobsResetBtnBgCor(jobsMakeCor2(^(__kindof JobsCorModel *_Nullable corModel) {
                        corModel
                            .byHue((CGFloat)index / (CGFloat)self.tagTitleArr.count)
                            .bySaturation(.62)
                            .byBrightness(.92)
                            .byAlpha(1);
                    }))
                    .byContentEdgeInsets(UIEdgeInsetsMake(0, JobsWidth(12), 0, JobsWidth(12)))
                    .byTag(index)
                    .bySizeToFit();
            });
            CGRect frame = button.frame;
            frame.size.width = MAX(frame.size.width + JobsWidth(16), JobsWidth(74));
            frame.size.height = JobsWidth(32);
            button
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.tagButtonClickEvent(button);
                })
                .byFrame(frame)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(16))
                        .byMasksToBounds(YES);
                })
                .addOn(self.sphereView);
            [self.tagButtonMutArr addObject:button];
        }
        [self.sphereView setItems:self.tagButtonMutArr];
    };
}

-(jobsByBtnBlock _Nonnull)tagButtonClickEvent{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (sender.tag < 0 || sender.tag >= (NSInteger)self.tagTitleArr.count) return;
        self.statusLabel.byText([NSString stringWithFormat:@"已选中：%@", self.tagTitleArr[sender.tag].jobsTr()]);
    };
}
#pragma mark —— LazyLoad
-(XLSphereView *)sphereView{
    if (!_sphereView) {
        _sphereView = XLSphereView.new;
        _sphereView.byBgColor(JobsSecondarySystemBackgroundColor);
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
                .byText(@"拖动球体旋转，点按前景标签".jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
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

-(NSMutableArray<UIButton *> *)tagButtonMutArr{
    if (!_tagButtonMutArr) {
        _tagButtonMutArr = NSMutableArray.array;
    };return _tagButtonMutArr;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsSphereDemoVC
-(JobsRetJobsSphereDemoVCByBOOLBlock _Nonnull)bySphereItemsPrepared{
    @jobs_weakify(self)
    return ^__kindof JobsSphereDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setSphereItemsPrepared:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsSphereDemoVC
@end

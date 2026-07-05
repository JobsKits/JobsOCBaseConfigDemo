//
//  CompressStrVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CompressStrVC.h"

@interface CompressStrVC ()

Prop_strong()UIView *contentCardView;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *sourceTitleLab;
Prop_strong()UILabel *sourceValueLab;
Prop_strong()UILabel *compressedTitleLab;
Prop_strong()UILabel *compressedValueLab;
Prop_strong()UILabel *resultTitleLab;
Prop_strong()UILabel *resultValueLab;
Prop_strong()UIButton *refreshBtn;
Prop_copy()NSString *demoText;

@end

@implementation CompressStrVC

- (void)dealloc{
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
            data.byText(data.attributedTitle.string);
            data.byFont(UIFontWeightRegularSize(18));
        })
    
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byBgImage(@"新首页的底图".img)
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.byBgColor(HEXCOLOR(0xF6F8FC));
    self.makeNavByAlpha(1);
    [self buildDemoUI];
    [self refreshCompressResult];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
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
#pragma mark —— UI
-(void)buildDemoUI{
    (void)self.contentCardView;
    (void)self.titleLab;
    (void)self.sourceTitleLab;
    (void)self.sourceValueLab;
    (void)self.compressedTitleLab;
    (void)self.compressedValueLab;
    (void)self.resultTitleLab;
    (void)self.resultValueLab;
    (void)self.refreshBtn;
}

-(void)refreshCompressResult{
    NSData *data = self.demoText.compress;
    NSString *base64Str = [data base64EncodedStringWithOptions:0] ? : @"";
    NSString *decompressStr = data.decompressToStr ? : @"";
    self.sourceValueLab.byText(self.demoText);
    self.compressedValueLab.byText([NSString stringWithFormat:@"NSData 长度：%lu bytes\nBase64：%@",
                                    (unsigned long)data.length,
                                    base64Str]);
    self.resultValueLab.byText(decompressStr);
    JobsLog(@"压缩后的数据: %@",data);
    JobsLog(@"解压后的字符串: %@",decompressStr);
}
#pragma mark —— lazyLoad
-(UIView *)contentCardView{
    if (!_contentCardView) {
        _contentCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsWhiteColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(24));
                    make.left.equalTo(self.view).offset(JobsWidth(20));
                    make.right.equalTo(self.view).offset(JobsWidth(-20));
                });
        });
        _contentCardView.layer
            .byCornerRadius(JobsWidth(12))
            .byShadowColor(UIColor.blackColor.CGColor)
            .byShadowOpacity(0.08)
            .byShadowRadius(JobsWidth(12))
            .byShadowOffset(CGSizeMake(0, JobsWidth(6)));
    };return _contentCardView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"字符串压缩 / 解压结果".tr)
                .byFont(UIFontWeightSemiboldSize(19))
                .byTextCor(HEXCOLOR(0x1E2A36))
                .byNumberOfLines(0)
                .addOn(self.contentCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentCardView).offset(JobsWidth(22));
                    make.left.equalTo(self.contentCardView).offset(JobsWidth(18));
                    make.right.equalTo(self.contentCardView).offset(JobsWidth(-18));
                });
        });
    };return _titleLab;
}

-(UILabel *)sourceTitleLab{
    if (!_sourceTitleLab) {
        _sourceTitleLab = [self sectionTitleLabByText:@"原始字符串".tr
                                                 top:self.titleLab.mas_bottom
                                              offset:JobsWidth(22)];
    };return _sourceTitleLab;
}

-(UILabel *)sourceValueLab{
    if (!_sourceValueLab) {
        _sourceValueLab = [self sectionValueLabByTop:self.sourceTitleLab.mas_bottom
                                              offset:JobsWidth(8)];
    };return _sourceValueLab;
}

-(UILabel *)compressedTitleLab{
    if (!_compressedTitleLab) {
        _compressedTitleLab = [self sectionTitleLabByText:@"压缩后".tr
                                                     top:self.sourceValueLab.mas_bottom
                                                  offset:JobsWidth(18)];
    };return _compressedTitleLab;
}

-(UILabel *)compressedValueLab{
    if (!_compressedValueLab) {
        _compressedValueLab = [self sectionValueLabByTop:self.compressedTitleLab.mas_bottom
                                                  offset:JobsWidth(8)];
    };return _compressedValueLab;
}

-(UILabel *)resultTitleLab{
    if (!_resultTitleLab) {
        _resultTitleLab = [self sectionTitleLabByText:@"解压后".tr
                                                 top:self.compressedValueLab.mas_bottom
                                              offset:JobsWidth(18)];
    };return _resultTitleLab;
}

-(UILabel *)resultValueLab{
    if (!_resultValueLab) {
        _resultValueLab = [self sectionValueLabByTop:self.resultTitleLab.mas_bottom
                                              offset:JobsWidth(8)];
    };return _resultValueLab;
}

-(UIButton *)refreshBtn{
    if (!_refreshBtn) {
        @jobs_weakify(self)
        _refreshBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn
                .byTitle(@"重新压缩".tr)
                .byTitleFont(UIFontWeightMediumSize(15))
                .byTitleCor(JobsWhiteColor)
                .onClickBy(^(UIButton *x) {
                    @jobs_strongify(self)
                    [self refreshCompressResult];
                })
                .byBgColor(HEXCOLOR(0x1E2A36))
                .addOn(self.contentCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.resultValueLab.mas_bottom).offset(JobsWidth(22));
                    make.left.right.equalTo(self.titleLab);
                    make.height.mas_equalTo(JobsWidth(44));
                    make.bottom.equalTo(self.contentCardView).offset(JobsWidth(-22));
                });
            btn.layer.byCornerRadius(JobsWidth(8));
        });
    };return _refreshBtn;
}

-(NSString *)demoText{
    if (!_demoText) {
        _demoText = @"这是一个需要压缩的字符串";
    };return _demoText;
}

-(UILabel *)sectionTitleLabByText:(NSString *)text
                              top:(id)top
                           offset:(CGFloat)offset{
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(text)
            .byFont(UIFontWeightMediumSize(14))
            .byTextCor(HEXCOLOR(0x5F6C7B))
            .byNumberOfLines(1)
            .addOn(self.contentCardView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(top).offset(offset);
                make.left.right.equalTo(self.titleLab);
            });
    });
}

-(UILabel *)sectionValueLabByTop:(id)top
                          offset:(CGFloat)offset{
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(@"")
            .byFont(UIFontWeightRegularSize(13))
            .byTextCor(HEXCOLOR(0x1E2A36))
            .byNumberOfLines(0)
            .byLineBreakMode(NSLineBreakByCharWrapping)
            .byBgColor(HEXCOLOR(0xF3F6FA))
            .addOn(self.contentCardView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(top).offset(offset);
                make.left.right.equalTo(self.titleLab);
            });
        label.layer.byCornerRadius(JobsWidth(8));
        label.layer.masksToBounds = YES;
    });
}

@end

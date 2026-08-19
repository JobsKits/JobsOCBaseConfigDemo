//
//  TestLabelDetailVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "TestLabelDetailVC.h"
#import "TestLabelDemoModel.h"

@interface TestLabelDetailVC ()

Prop_strong()TestLabelDemoModel *demoModel;
Prop_strong()UIScrollView *scrollView;
Prop_strong()UIView *contentView;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()UIView *previewView;
Prop_strong()BaseLabel *demoLabel;
Prop_strong()BaseButton *demoButton;
Prop_strong()RACDisposable *scrollDisposable;
Prop_assign()BOOL didApplyShowingType;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN TestLabelDetailVC
@interface TestLabelDetailVC (JobsPropertyDSLSetterAutogen_f7535fdb38)
-(void)setDemoModel:(TestLabelDemoModel * _Nullable)data;
-(void)setDidApplyShowingType:(BOOL)data;
-(void)setScrollDisposable:(RACDisposable * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END TestLabelDetailVC

@implementation TestLabelDetailVC
@synthesize demoModel = _demoModel;
@synthesize scrollView = _scrollView;
@synthesize contentView = _contentView;
@synthesize titleLab = _titleLab;
@synthesize subTitleLab = _subTitleLab;
@synthesize previewView = _previewView;
@synthesize demoLabel = _demoLabel;
@synthesize demoButton = _demoButton;
@synthesize scrollDisposable = _scrollDisposable;

-(void)dealloc{
    if (_demoLabel) _demoLabel.stopScrolling();
    [_scrollDisposable dispose];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestLabelDetailVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:TestLabelDemoModel.class]) {
            self.byDemoModel((TestLabelDemoModel *)self.requestParams);
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(self.demoModel.title ?: @"Label Demo".jobsTr())
                    .byFont(UIFontWeightRegularSize(16));
            })
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestLabelDetailVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.scrollView.byAlpha(1);
        self.contentView.byAlpha(1);
        self.titleLab.byAlpha(1);
        self.subTitleLab.byAlpha(1);
        self.previewView.byAlpha(1);
        self.buildDemoControl();
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestLabelDetailVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        if (self.didApplyShowingType) return;
        self.byDidApplyShowingType(YES);
        if (self.demoModel.scrollLabelDemo) {
            self.previewView.refresh();
            self.demoLabel.stopScrolling();
            self.byScrollDisposable(self.demoLabel.startScrollingIfNeededWithInterval(0.02f));
        }else if (self.demoModel.controlType == TestLabelDemoControlTypeButtonTitle) {
            self.demoButton.makeBtnTitleByShowingType(self.demoModel.showingType);
        }else{
            self.demoLabel.makeLabelByShowingType(self.demoModel.showingType);
        }
    };
}
#pragma mark —— Demo
-(jobsByVoidBlock _Nonnull)buildDemoControl{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.demoModel.controlType == TestLabelDemoControlTypeButtonTitle) {
            self.demoButton.byAlpha(1);
        }else{
            self.demoLabel.byAlpha(1);
        }
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoPlainText{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.demoModel.scrollLabelDemo) {
            return @"-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据".jobsTr();
        }
        if (self.demoModel.manualNewline) {
            return @"编译器自动管理内存地址".jobsTr()
                .add(JobsComma.add(JobsNewline))
                .add(@"让程序员更加专注于".jobsTr())
                .add(JobsNewline)
                .add(@"APP的业务".jobsTr())
                .add(JobsDot);
        };return @"编译器自动管理内存地址，让程序员更加专注于APP的业务。".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)detailTitleText{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.demoModel.detailTitle.length) return self.demoModel.detailTitle;
        NSString *controlTitle = self.demoModel.controlType == TestLabelDemoControlTypeButtonTitle ? @"UIButton.titleLabel".jobsTr() : @"BaseLabel".jobsTr();
        return controlTitle.add(JobsNewline).add(self.demoModel.title ?: @"Label Demo".jobsTr());
    };
}

-(JobsRetStrByVoidBlock _Nonnull)detailSubTitleText{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.demoModel.detailSubTitle.length ? self.demoModel.detailSubTitle : self.demoModel.subTitle;
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)demoAttributedText{
    @jobs_weakify(self)
    return ^NSAttributedString *{
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
            @jobs_strongify(self)
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                data1.byFont(UIFontWeightRegularSize(JobsWidth(12)))
                     .byTextCor(JobsBlueColor)
                     .byTargetString(@"编译器自动管理内存地址".jobsTr().add(JobsNewline))
                     .byTextBgCor(JobsBrownColor)
                     .byParagraphStyle(self.defaultParagraphStyle());
            }))
            .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                data1.byFont(UIFontWeightSemiboldSize(JobsWidth(13)))
                     .byTextCor(JobsWhiteColor)
                     .byTargetString(@"让程序员更加专注于".jobsTr().add(JobsNewline))
                     .byTextBgCor(JobsBrownColor)
                     .byParagraphStyle(self.defaultParagraphStyle());
            }))
            .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                data1.byFont(UIFontWeightUltraLightSize(JobsWidth(14)))
                     .byTextCor(JobsGreenColor)
                     .byTargetString(@"APP的业务。".jobsTr())
                     .byTextBgCor(JobsBrownColor)
                     .byParagraphStyle(self.defaultParagraphStyle());
            }));
        }));
    };
}

-(jobsByViewBlock _Nonnull)makeDemoControlConstraintsByView{
    @jobs_weakify(self)
    return ^(UIView * view){
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.center.equalTo(self.previewView);
            if (self.demoModel.scrollLabelDemo) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(20)));
            }else if (self.demoModel.showingType == UILabelShowingType_03) {
                make.height.mas_equalTo(JobsWidth(self.demoModel.controlType == TestLabelDemoControlTypeButtonTitle ? 32 : 20));
            }else if (self.demoModel.showingType == UILabelShowingType_05){
                CGFloat width = self.demoModel.manualNewline || self.demoModel.richText ? JobsMainScreen_WIDTH() - JobsWidth(96) : JobsWidth(120);
                if (self.demoModel.controlType == TestLabelDemoControlTypeButtonTitle) {
                    make.size.mas_equalTo(CGSizeMake(width, JobsWidth(76)));
                }else{
                    make.width.mas_equalTo(width);
                }
            }else{
                make.size.mas_equalTo(CGSizeMake(JobsWidth(100), JobsWidth(20)));
            }
        }];
    };
}
#pragma mark —— LazyLoad
-(TestLabelDemoModel *)demoModel{
    if (!_demoModel) {
        _demoModel = [TestLabelDemoModel modelWithTitle:@"BaseLabel · 固定宽高省略".jobsTr()
                                               subTitle:@"定宽定高定字体，超出内容以省略号收口".jobsTr()
                                            showingType:UILabelShowingType_01
                                            controlType:TestLabelDemoControlTypeLabel
                                               richText:NO
                                          manualNewline:NO];
        _demoModel.byDetailTitle(@"BaseLabel".jobsTr().add(JobsNewline).add(@"固定宽高省略".jobsTr()));
        _demoModel.byDetailSubTitle(@"定宽定高定字体".jobsTr().add(JobsNewline).add(@"超出内容以省略号收口".jobsTr()));
    };return _demoModel;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        @jobs_weakify(self)
        _scrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
            if (@available(iOS 11.0, *)) {
                scrollView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }
        });
    };return _scrollView;
}

-(UIView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(JobsClearColor)
                .addOn(self.scrollView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.scrollView);
                    make.width.equalTo(self.scrollView);
                });
        });
    };return _contentView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.detailTitleText())
                .byFont(UIFontWeightSemiboldSize(JobsWidth(18)))
                .byTextCor(JobsLabelColor)
                .byNumberOfLines(0)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).offset(JobsWidth(24));
                    make.left.equalTo(self.contentView).offset(JobsWidth(24));
                    make.right.equalTo(self.contentView).offset(-JobsWidth(24));
                });
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        @jobs_weakify(self)
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.detailSubTitleText())
                .byFont(UIFontWeightRegularSize(JobsWidth(13)))
                .byTextCor(JobsSecondaryLabelColor)
                .byNumberOfLines(0)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(8));
                    make.left.right.equalTo(self.titleLab);
                });
        });
    };return _subTitleLab;
}

-(UIView *)previewView{
    if (!_previewView) {
        @jobs_weakify(self)
        _previewView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.subTitleLab.mas_bottom).offset(JobsWidth(28));
                    make.left.equalTo(self.contentView).offset(JobsWidth(24));
                    make.right.equalTo(self.contentView).offset(-JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(220));
                    make.bottom.equalTo(self.contentView).offset(-JobsWidth(24));
                });
            view.layer.byCornerRadius(JobsWidth(8));
            view.layer.byMasksToBounds(YES);
        });
    };return _previewView;
}

-(BaseLabel *)demoLabel{
    if (!_demoLabel) {
        @jobs_weakify(self)
        _demoLabel = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            if (self.demoModel.richText) {
                label.byAttributedString(self.demoAttributedText());
            }else if (self.demoModel.scrollLabelDemo){
                label.byText(self.demoPlainText())
                    .byTextCor(JobsRandomCor(1))
                    .byFont(UIFontWeightRegularSize(JobsWidth(13)));
            }else{
                label.byText(self.demoPlainText())
                    .byTextCor(JobsWhiteColor)
                    .byFont(UIFontWeightRegularSize(JobsWidth(13)));
            }
            label.byBgColor(self.demoModel.scrollLabelDemo ? JobsCyanColor : JobsRedColor)
                .addOn(self.previewView);
            self.makeDemoControlConstraintsByView(label);
        });
    };return _demoLabel;
}

-(BaseButton *)demoButton{
    if (!_demoButton) {
        @jobs_weakify(self)
        _demoButton = BaseButton.jobsInit()
            .byBgColor(JobsBrownColor)
            .addOn(self.previewView)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.center.equalTo(self.previewView);
                if (self.demoModel.showingType == UILabelShowingType_03) {
                    make.height.mas_equalTo(JobsWidth(32));
                }else if (self.demoModel.showingType == UILabelShowingType_05){
                    CGFloat width = self.demoModel.manualNewline || self.demoModel.richText ? JobsMainScreen_WIDTH() - JobsWidth(96) : JobsWidth(120);
                    make.size.mas_equalTo(CGSizeMake(width, JobsWidth(76)));
                }else{
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(100), JobsWidth(20)));
                }
            });
        if (self.demoModel.richText) {
            _demoButton.jobsResetBtnNormalAttributedTitle(self.demoAttributedText())
                .byTitleLabel(^(UILabel *label) {
                    label.byNumberOfLines(0);
                });
        }else{
            _demoButton.jobsResetBtnTitle(self.demoPlainText())
                .jobsResetBtnTitleCor(JobsWhiteColor)
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(JobsWidth(13)))
                .byTitleLabel(^(UILabel *label) {
                    label.byNumberOfLines(self.demoModel.showingType == UILabelShowingType_05 ? 0 : 1);
                });
        }
    };return _demoButton;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN TestLabelDetailVC
-(JobsRetTestLabelDetailVCByBOOLBlock _Nonnull)byDidApplyShowingType{
    @jobs_weakify(self)
    return ^__kindof TestLabelDetailVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setDidApplyShowingType:data];
        return self;
    };
}

-(JobsRetTestLabelDetailVCByRACDisposableBlock _Nonnull)byScrollDisposable{
    @jobs_weakify(self)
    return ^__kindof TestLabelDetailVC * _Nullable(RACDisposable * _Nullable data){
        @jobs_strongify(self)
        [self setScrollDisposable:data];
        return self;
    };
}

-(JobsRetTestLabelDetailVCByTestLabelDemoModelBlock _Nonnull)byDemoModel{
    @jobs_weakify(self)
    return ^__kindof TestLabelDetailVC * _Nullable(TestLabelDemoModel * _Nullable data){
        @jobs_strongify(self)
        [self setDemoModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END TestLabelDetailVC
@end

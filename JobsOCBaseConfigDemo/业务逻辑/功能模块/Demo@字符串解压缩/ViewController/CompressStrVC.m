//
//  CompressStrVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CompressStrVC.h"

@interface CompressStrVC ()

Prop_strong()UIView *contentCardView;
Prop_strong()UIScrollView *contentScrollView;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *algorithmTitleLab;
Prop_strong()UILabel *algorithmValueLab;
Prop_strong()UILabel *sourceTitleLab;
Prop_strong()UITextView *sourceTextView;
Prop_strong()UILabel *compressedInfoTitleLab;
Prop_strong()UILabel *compressedInfoValueLab;
Prop_strong()UILabel *compressedStringTitleLab;
Prop_strong()UILabel *compressedStringValueLab;
Prop_strong()UILabel *resultTitleLab;
Prop_strong()UILabel *resultValueLab;
Prop_strong()UIButton *refreshBtn;
Prop_copy()NSString *demoText;
Prop_copy()NSString *compressedBase64Str;

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
    (void)self.contentScrollView;
    (void)self.contentCardView;
    (void)self.titleLab;
    (void)self.algorithmTitleLab;
    (void)self.algorithmValueLab;
    (void)self.sourceTitleLab;
    (void)self.sourceTextView;
    (void)self.compressedInfoTitleLab;
    (void)self.compressedInfoValueLab;
    (void)self.compressedStringTitleLab;
    (void)self.compressedStringValueLab;
    (void)self.resultTitleLab;
    (void)self.resultValueLab;
    (void)self.refreshBtn;
}

-(void)refreshCompressResult{
    NSString *sourceText = self.inputTextForCompress;
    NSData *sourceData = sourceText.UTF8Encoding;
    NSData *data = sourceText.compress;
    NSString *base64Str = [data base64EncodedStringWithOptions:0] ? : @"";
    NSString *decompressStr = data.decompressToStr ? : @"";
    CGFloat ratio = sourceData.length ? ((CGFloat)data.length / (CGFloat)sourceData.length) * 100.0 : 0;
    self.compressedBase64Str = base64Str;
    self.compressedInfoValueLab.byText([NSString stringWithFormat:@"原始 UTF8 NSData 长度：%lu bytes\n压缩后 NSData 长度：%lu bytes\nBase64 字符数：%lu\n压缩率：%.2f%%",
                                        (unsigned long)sourceData.length,
                                        (unsigned long)data.length,
                                        (unsigned long)base64Str.length,
                                        ratio]);
    self.compressedStringValueLab.byText(base64Str);
    self.resultValueLab.byText(decompressStr);
    JobsLog(@"压缩后的数据: %@",data);
    JobsLog(@"解压后的字符串: %@",decompressStr);
}

-(NSString *)inputTextForCompress{
    NSString *inputText = self.sourceTextView.text ? : @"";
    NSString *trimText = [inputText stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (!trimText.length) {
        self.sourceTextView.byText(self.demoText);
        return self.demoText;
    };return inputText;
}

-(NSString *)compressAlgorithmText{
    return @"压缩：NSString -> UTF8 NSData -> NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:NO:error: -> Base64 字符串"
           @"\n解压：NSData -> NSKeyedUnarchiver unarchivedObjectOfClass:NSData -> UTF8 NSString";
}

-(void)copyCompressedStringByLongPress:(UILongPressGestureRecognizer *)gesture{
    if (gesture.state != UIGestureRecognizerStateBegan) return;
    if (!self.compressedBase64Str.length) return;
    self.compressedBase64Str.pasteboard();
}
#pragma mark —— lazyLoad
-(UIScrollView *)contentScrollView{
    if (!_contentScrollView) {
        _contentScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byShowsVerticalScrollIndicator(NO)
                .byAlwaysBounceVertical(YES)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
        if (@available(iOS 11.0, *)) {
            _contentScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    };return _contentScrollView;
}

-(UIView *)contentCardView{
    if (!_contentCardView) {
        _contentCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsWhiteColor)
                .addOn(self.contentScrollView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentScrollView).offset(JobsWidth(24));
                    make.left.equalTo(self.contentScrollView).offset(JobsWidth(20));
                    make.width.equalTo(self.view).offset(JobsWidth(-40));
                    make.bottom.equalTo(self.contentScrollView).offset(JobsWidth(-24));
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

-(UILabel *)algorithmTitleLab{
    if (!_algorithmTitleLab) {
        _algorithmTitleLab = [self sectionTitleLabByText:@"压缩算法".tr
                                                     top:self.titleLab.mas_bottom
                                                  offset:JobsWidth(22)];
    };return _algorithmTitleLab;
}

-(UILabel *)algorithmValueLab{
    if (!_algorithmValueLab) {
        _algorithmValueLab = [self sectionValueLabByTop:self.algorithmTitleLab.mas_bottom
                                                offset:JobsWidth(8)];
        _algorithmValueLab.byText(self.compressAlgorithmText);
    };return _algorithmValueLab;
}

-(UILabel *)sourceTitleLab{
    if (!_sourceTitleLab) {
        _sourceTitleLab = [self sectionTitleLabByText:@"原始字符串".tr
                                                 top:self.algorithmValueLab.mas_bottom
                                              offset:JobsWidth(22)];
    };return _sourceTitleLab;
}

-(UITextView *)sourceTextView{
    if (!_sourceTextView) {
        _sourceTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            textView
                .byText(self.demoText)
                .byTextCor(HEXCOLOR(0x1E2A36))
                .byFont(UIFontWeightRegularSize(13))
                .byTextContainerInset(UIEdgeInsetsMake(JobsWidth(8), JobsWidth(10), JobsWidth(8), JobsWidth(10)))
                .byLineFragmentPadding(0)
                .byBgColor(HEXCOLOR(0xF3F6FA))
                .addOn(self.contentCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.sourceTitleLab.mas_bottom).offset(JobsWidth(8));
                    make.left.right.equalTo(self.titleLab);
                    make.height.mas_equalTo(JobsWidth(88));
                });
        });
        _sourceTextView.layer.byCornerRadius(JobsWidth(8));
        _sourceTextView.layer.masksToBounds = YES;
    };return _sourceTextView;
}

-(UILabel *)compressedInfoTitleLab{
    if (!_compressedInfoTitleLab) {
        _compressedInfoTitleLab = [self sectionTitleLabByText:@"压缩信息".tr
                                                         top:self.sourceTextView.mas_bottom
                                                      offset:JobsWidth(18)];
    };return _compressedInfoTitleLab;
}

-(UILabel *)compressedInfoValueLab{
    if (!_compressedInfoValueLab) {
        _compressedInfoValueLab = [self sectionValueLabByTop:self.compressedInfoTitleLab.mas_bottom
                                                      offset:JobsWidth(8)];
    };return _compressedInfoValueLab;
}

-(UILabel *)compressedStringTitleLab{
    if (!_compressedStringTitleLab) {
        _compressedStringTitleLab = [self sectionTitleLabByText:@"压缩字符串（Base64，长按复制）".tr
                                                           top:self.compressedInfoValueLab.mas_bottom
                                                        offset:JobsWidth(18)];
    };return _compressedStringTitleLab;
}

-(UILabel *)compressedStringValueLab{
    if (!_compressedStringValueLab) {
        @jobs_weakify(self)
        _compressedStringValueLab = [self sectionValueLabByTop:self.compressedStringTitleLab.mas_bottom
                                                        offset:JobsWidth(8)];
        _compressedStringValueLab
            .byUserInteractionEnabled(YES)
            .addLongPressGR(^(__kindof UILongPressGestureRecognizer * _Nullable data) {
                @jobs_strongify(self)
                [self copyCompressedStringByLongPress:data];
            });
    };return _compressedStringValueLab;
}

-(UILabel *)resultTitleLab{
    if (!_resultTitleLab) {
        _resultTitleLab = [self sectionTitleLabByText:@"解压后".tr
                                                 top:self.compressedStringValueLab.mas_bottom
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
                    [self.view endEditing:YES];
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

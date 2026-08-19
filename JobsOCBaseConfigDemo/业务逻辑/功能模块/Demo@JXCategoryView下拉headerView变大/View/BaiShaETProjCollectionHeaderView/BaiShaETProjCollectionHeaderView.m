//
//  BaiShaETProjCollectionHeaderView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaiShaETProjCollectionHeaderView.h"

@interface BaiShaETProjCollectionHeaderView ()
/// UI
Prop_strong()UIButton *userHeaderBtn;
Prop_strong()UIProgressView *progressView;
Prop_strong()UILabel *leftLab;
Prop_strong()UILabel *rightLab;
Prop_strong()JobsAnimationLabel *animationLab;
/// Data
Prop_strong()NSMutableArray <NSString *>*richTextMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;
Prop_strong()NSMutableArray <NSMutableArray <NSString *>*>*richTextMutArr2;
Prop_strong()NSMutableArray <NSMutableArray <JobsRichTextConfig *>*>*richTextConfigMutArr2;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN BaiShaETProjCollectionHeaderView
@interface BaiShaETProjCollectionHeaderView (JobsPropertyDSLSetterAutogen_a6b4637f41)
-(void)setIsZoom:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END BaiShaETProjCollectionHeaderView

@implementation BaiShaETProjCollectionHeaderView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
/// UIViewModelProtocol
@synthesize imageViewFrame = _imageViewFrame;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(BaiShaETProjCollectionHeaderView.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_collectionHeaderViewOnceToken = 0;
        static_collectionHeaderView = nil;
    };
}

static BaiShaETProjCollectionHeaderView *static_collectionHeaderView = nil;
static dispatch_once_t static_collectionHeaderViewOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(BaiShaETProjCollectionHeaderView.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_collectionHeaderViewOnceToken, ^{
            static_collectionHeaderView = BaiShaETProjCollectionHeaderView.new;
        });return static_collectionHeaderView;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaiShaETProjCollectionHeaderView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaiShaETProjCollectionHeaderView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScrollWithContentOffsetY:(CGFloat)contentOffsetY {
    jobsByCGFloatBlock action = ((jobsByCGFloatBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaiShaETProjCollectionHeaderView.class, @selector(jobsScrollViewDidScrollWithContentOffsetY)))(self, @selector(jobsScrollViewDidScrollWithContentOffsetY));
    if (action) action(contentOffsetY);
}

-(jobsByCGFloatBlock _Nonnull)jobsScrollViewDidScrollWithContentOffsetY{
    @jobs_weakify(self)
    return ^(CGFloat contentOffsetY){
        @jobs_strongify(self)
        if (!self) return;
            if (self.isZoom) {
        //        CGRect frame = self.imageViewFrame;
        //        frame.size.height -= contentOffsetY;
        //        frame.origin.y = contentOffsetY;
        //        self.imageView.frame = frame;
            }
    };
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsRedColor);
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model);
        MakeDataNull
        self.userHeaderBtn.byVisible(YES);
        self.progressView.byVisible(YES);
        self.animationLab.byVisible(YES);
        self.leftLab.byVisible(YES);
        self.rightLab.byVisible(YES);
        self.tableView.byShow(self);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(190));
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaiShaETProjCollectionHeaderView.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 1;
    };
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(JobsWidth(58) / self.dataMutArr.count);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsBaseTableViewCell.cellStyleValue1ByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .byContentViewBgCor(HEXCOLOR(0xFFFCF7))
        .byTextLabelTextCor(HEXCOLOR(0x757575))
        .byTextLabelFrameOffsetY(JobsWidth(-2))
        .byDetailTextLabelOffsetY(JobsWidth(-2))
        .byTextLabelFont(UIFontWeightRegularSize(16))
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .JobsBlock1(^(id _Nullable data) {
        }).byBgColor(HEXCOLOR(0xFFFCF7));
}
#pragma mark —— lazyLoad
-(UIButton *)userHeaderBtn{
    if (!_userHeaderBtn) {
        @jobs_weakify(self)
        UIImage *avatarImage = @"默认头像".img;
        _userHeaderBtn = UIButton.jobsInit()
        .jobsResetBtnTitle(self.jobsCurrentUserInfo().userName
                                         .add(JobsSpace)
                                         .add(@"VIP".jobsTr().add(JobsSpace).add(@"0")))
        .jobsResetBtnImage(avatarImage)
        .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
        .jobsResetBtnTitleFont(UIFontWeightBoldSize(16))
        .makeBtnTitleByShowingType(UILabelShowingType_05)
        .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTop, JobsWidth(12))
        .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
            model.byJobsWidth(1.f)
                 .byLayerCor(HEXCOLOR(0xEEE2C8))
                 .byCornerRadiusValue(avatarImage.size.height / 2);
        }))
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(JobsWidth(43));
        });
        JobsLog(@"%@",_userHeaderBtn.jobsTitleForNormalState());
    };return _userHeaderBtn;
}

-(UIProgressView *)progressView{
    if (!_progressView) {
        @jobs_weakify(self)
        _progressView = jobsMakeProgressView(^(__kindof UIProgressView * _Nullable progressView) {
            @jobs_strongify(self)
            [progressView
                .byProgressTintColor(HEXCOLOR(0xAE8330))
                .byTrackTintColor(HEXCOLOR(0xEEE2C8))
                .byProgressViewStyle(UIProgressViewStyleDefault)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.height.mas_equalTo(JobsWidth(4));
                    make.width.mas_equalTo(JobsWidth(343));
                    make.centerX.equalTo(self);
                    make.top.equalTo(self.userHeaderBtn.mas_bottom).offset(JobsWidth(58));
                }) animateWithDuration:1 progress:0.8];
        });
    };return _progressView;
}

-(JobsAnimationLabel *)animationLab{
    if (!_animationLab) {
        _animationLab = JobsAnimationLabel.new
            .byTextCor(JobsLabelColor)
            .byValue(12)
            .byLastValue(19.93);
        @jobs_weakify(self)
        [_animationLab animationTextStartValue:_animationLab.value
                                      endValue:_animationLab.lastValue
                                      duration:1.0
                                      complete:^(UILabel *label, CGFloat value) {
            @jobs_strongify(self)
            if (self.richTextMutArr.count > 2) [self.richTextMutArr removeObjectAtIndex:1];
            [self.richTextMutArr insertObject:[NSString stringWithFormat:@"%f", value] atIndex:1];
            label.byAttributedString([self richTextWithDataConfigMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.byFont(UIFontWeightRegularSize(12))
                         .byTextCor(JobsLabelColor)
                         .byTargetString(self.richTextMutArr[0]);
                }))
                .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.byFont(UIFontWeightBoldSize(18))
                         .byTextCor(JobsLabelColor)
                         .byTargetString(self.richTextMutArr[1]);
                }))
                .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.byFont(UIFontWeightRegularSize(12))
                         .byTextCor(JobsLabelColor)
                         .byTargetString(self.richTextMutArr[2]);
                }));
            })paragraphStyle:nil])
                .byValue(value)
                .byLastValue(label.value * 3);
        }];
        _animationLab.addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.bottom.equalTo(self.progressView).offset(JobsWidth(-12));
                make.left.equalTo(self.progressView);
            });
    };return _animationLab;
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        @jobs_weakify(self)
        _leftLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"Lv".jobsTr().add(@" ").add(@"0"))
            .byTextCor(JobsSecondaryLabelColor)
            .byFont(UIFontWeightRegularSize(12))
            .byTextAlignment(NSTextAlignmentCenter)
            .makeLabelByShowingType(UILabelShowingType_03)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.equalTo(self.animationLab);
                make.top.equalTo(self.animationLab.mas_bottom).offset(JobsWidth(22));
                make.height.mas_equalTo(JobsWidth(12));
            });
        });
    };return _leftLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        @jobs_weakify(self)
        _rightLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"Lv".jobsTr().add(@" ").add(@"1"))
                .byTextCor(JobsSecondaryLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontWeightRegularSize(12))
                .makeLabelByShowingType(UILabelShowingType_03)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.right.equalTo(self).offset(JobsWidth(-16));
                    make.top.equalTo(self.animationLab.mas_bottom).offset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(12));
                });
        });
    };return _rightLab;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byRegisterTableViewClass(nil)
                .bySeparatorColor(HEXCOLOR(0xEEEEEE))
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byShowsVerticalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.centerX.equalTo(self);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(58)));
                    make.bottom.equalTo(self).offset(JobsWidth(-24));
                });
        });
    };return _tableView;
}

-(NSMutableArray<NSString *> *)richTextMutArr{
    if (!_richTextMutArr) {
        _richTextMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(@"當前晉級進度".jobsTr()).add(JobsSpace.add(JobsPercent));
        });
    };return _richTextMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                @jobs_strongify(self)
                data1.textModel.byText(@"當前存款".jobsTr());
                data1.subTextModel.attributedTitle = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr2[0]
                                                                        paragraphStyle:nil];
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                @jobs_strongify(self)
                data1.textModel.byText(@"當前流水".jobsTr());
                data1.subTextModel.attributedTitle = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr2[1]
                                                                        paragraphStyle:nil];
            }));
        });
    };return _dataMutArr;
}

-(NSMutableArray<NSMutableArray<NSString *>*>*)richTextMutArr2{
    if (!_richTextMutArr2) {
        _richTextMutArr2 = jobsMakeMutArr(^(__kindof NSMutableArray <NSMutableArray<NSString *>*>*_Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data1) {
                data1.add(@"7.00 ").add(@"/ ".add(@"40,000.00"));
            }))
            .add(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data1) {
                data1.add(@"1.00 ").add(@"/ ".add(@"20,000.00"));
            }));
        });
    };return _richTextMutArr2;
}

-(NSMutableArray<NSMutableArray<JobsRichTextConfig *> *> *)richTextConfigMutArr2{
    if (!_richTextConfigMutArr2) {
        @jobs_weakify(self)
        _richTextConfigMutArr2 = jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data1) {
                data1
                    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data2) {
                        @jobs_strongify(self)
                        data2.byFont(UIFontWeightRegularSize(12))
                             .byTextCor(JobsLabelColor)
                             .byTargetString(self.richTextMutArr2[0][0]);
                    }))
                    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data2) {
                        @jobs_strongify(self)
                        data2.byFont(UIFontWeightBoldSize(12))
                             .byTextCor(JobsLabelColor)
                             .byTargetString(self.richTextMutArr2[0][1]);
                    }));
            }))
            .add(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data1) {
                data1
                    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data2) {
                        @jobs_strongify(self)
                        data2.byFont(UIFontWeightRegularSize(12))
                             .byTextCor(JobsLabelColor)
                             .byTargetString(self.richTextMutArr2[1][0]);
                    }))
                    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data2) {
                        @jobs_strongify(self)
                        data2.byFont(UIFontWeightBoldSize(12))
                             .byTextCor(JobsLabelColor)
                             .byTargetString(self.richTextMutArr2[1][1]);
                    }));
            }));
        });
    };return _richTextConfigMutArr2;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN BaiShaETProjCollectionHeaderView
-(JobsRetBaiShaETProjCollectionHeaderViewByBOOLBlock _Nonnull)byZoom{
    @jobs_weakify(self)
    return ^__kindof BaiShaETProjCollectionHeaderView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsZoom:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END BaiShaETProjCollectionHeaderView
@end

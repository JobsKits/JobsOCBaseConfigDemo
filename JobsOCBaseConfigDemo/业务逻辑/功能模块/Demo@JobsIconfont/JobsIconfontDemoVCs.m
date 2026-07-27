//
//  JobsIconfontDemoVCs.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月25日，星期六.
//

#import "JobsIconfontDemoVCs.h"

static NSString *const JobsIconfontDemoCellID = @"JobsIconfontDemoCell";
static NSString *const JobsIconfontReuseCellID = @"JobsIconfontReuseCell";

@implementation JobsIconfontDemoBaseVC
-(NSString *)demoTitle{
    return @"JobsIconfont";
}

-(void)loadView{
    [super loadView];
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(self.demoTitle.tr)
                .byFont(UIFontWeightRegularSize(17))
                .byTextCor(JobsLabelColor);
        })
        .byBgCor(JobsSystemBackgroundColor)
        .byNavBgCor(JobsSystemBackgroundColor);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
}

@end

@interface JobsIconfontDemoListVC ()

Prop_strong()UITableView *listView;
Prop_strong()NSArray <NSDictionary *> *rows;

@end

@implementation JobsIconfontDemoListVC
-(NSString *)demoTitle{
    return @"JobsIconfont 全功能封装";
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.listView.byVisible(YES);
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.rows.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(82);
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsIconfontDemoCellID];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:JobsIconfontDemoCellID];
    }
    NSDictionary *row = self.rows[indexPath.row];
    cell.imageView.image = [JobsIconfontManager.shared iconImageForGlyph:[row[@"glyph"] integerValue]
                                                                    size:CGSizeMake(34, 34)
                                                                   color:UIColor.systemBlueColor];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(row[@"title"])
                .byFont(UIFontWeightSemiboldSize(16))
                .byTextCor(JobsLabelColor);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(row[@"subtitle"])
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(JobsSecondaryLabelColor);
        })
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    Class cls = self.rows[indexPath.row][@"class"];
    self.comingToPushVCByRequestParams(cls.new,nil);
}
#pragma mark —— LazyLoad
-(UITableView *)listView{
    if (!_listView) {
        _listView = [[UITableView alloc] initWithFrame:CGRectZero
                                                 style:UITableViewStyleInsetGrouped];
        _listView.byDelegate(self)
            .byDataSource(self)
            .byRowHeight(JobsWidth(82))
            .byBgColor(JobsSystemBackgroundColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.left.right.bottom.equalTo(self.view);
            });
    };return _listView;
}

-(NSArray<NSDictionary *> *)rows{
    if (!_rows) {
        _rows = @[
            @{
                @"title": @"远程图片与错误兜底",
                @"subtitle": @"先显示本地图标字体占位图，成功替换；错误 URL 保持兜底图",
                @"class": JobsIconfontRemoteImageDemoVC.class,
                @"glyph": @(JobsIconfontGlyphPicture)
            },
            @{
                @"title": @"列表复用与防串图",
                @"subtitle": @"自动取消旧任务，并按资源 ID 丢弃过期回调",
                @"class": JobsIconfontReuseListDemoVC.class,
                @"glyph": @(JobsIconfontGlyphSwitcher)
            },
            @{
                @"title": @"缓存命中、清理与重载",
                @"subtitle": @"自动加载两次观察缓存，再一键清理并强制重载",
                @"class": JobsIconfontCacheDemoVC.class,
                @"glyph": @(JobsIconfontGlyphSort)
            },
            @{
                @"title": @"Icon Font / Unicode / UIImage",
                @"subtitle": @"业务只使用语义枚举，字体名和 Unicode 藏在框架内",
                @"class": JobsIconfontGlyphDemoVC.class,
                @"glyph": @(JobsIconfontGlyphComponent)
            },
            @{
                @"title": @"阿里妈妈文字字体",
                @"subtitle": @"CoreText 动态注册字体，不要求配置 UIAppFonts",
                @"class": JobsIconfontTextFontDemoVC.class,
                @"glyph": @(JobsIconfontGlyphVerified)
            }
        ];
    };return _rows;
}

@end

@interface JobsIconfontRemoteImageDemoVC ()

Prop_strong()UISegmentedControl *segmentedControl;
Prop_strong()UIImageView *iconView;
Prop_strong()UILabel *statusLabel;
Prop_strong()UIButton *reloadButton;
Prop_strong()UIButton *forceReloadButton;
Prop_strong()NSArray <JobsIconfontRemoteAsset>*assets;

-(void)loadSelectedAsset:(BOOL)forceRefresh;

@end

@implementation JobsIconfontRemoteImageDemoVC
-(NSString *)demoTitle{
    return @"远程图片与错误兜底";
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.segmentedControl.hidden = NO;
    self.iconView.hidden = NO;
    self.statusLabel.hidden = NO;
    self.reloadButton.hidden = NO;
    self.forceReloadButton.hidden = NO;
    [self loadSelectedAsset:NO];
}

-(void)selectionChanged:(UISegmentedControl *)sender{
    [self loadSelectedAsset:NO];
}

-(void)reloadButtonTap:(UIButton *)sender{
    [self loadSelectedAsset:NO];
}

-(void)forceReloadButtonTap:(UIButton *)sender{
    [self loadSelectedAsset:YES];
}

-(void)loadSelectedAsset:(BOOL)forceRefresh{
    NSInteger index = MAX(0,MIN(self.segmentedControl.selectedSegmentIndex,
                                (NSInteger)self.assets.count - 1));
    JobsIconfontRemoteAsset asset = self.assets[index];
    @jobs_weakify(self)
    [self.iconView byJobsIconfontAsset:asset
                           targetSize:CGSizeMake(320, 220)
                         forceRefresh:forceRefresh
                           completion:^(JobsIconfontLoadResult * _Nonnull result) {
        @jobs_strongify(self)
        switch (result.stage) {
            case JobsIconfontLoadStagePlaceholder:
                self.statusLabel.byText([NSString stringWithFormat:@"已显示本地占位图，正在加载 %@…",
                                         [JobsIconfontManager.shared titleForRemoteAsset:asset]]);
                break;
            case JobsIconfontLoadStageSuccess:
                self.statusLabel.byText([NSString stringWithFormat:@"加载成功｜%@｜%@",
                                         result.loaderName,
                                         result.isCacheHit ? @"缓存命中" : @"网络返回"]);
                break;
            case JobsIconfontLoadStageFailure:
                self.statusLabel.byText(@"URL 无效或网络失败｜继续显示框架内置兜底图");
                break;
        }
    }];
}
#pragma mark —— LazyLoad
-(NSArray<JobsIconfontRemoteAsset> *)assets{
    if (!_assets) {
        _assets = @[
            JobsIconfontRemoteAssetLogo,
            JobsIconfontRemoteAssetUsageGuide,
            JobsIconfontRemoteAssetInvalidURL
        ];
    };return _assets;
}

-(UISegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        NSMutableArray *titles = NSMutableArray.array;
        for (JobsIconfontRemoteAsset asset in self.assets) {
            [titles addObject:[JobsIconfontManager.shared titleForRemoteAsset:asset]];
        }
        _segmentedControl = [UISegmentedControl.alloc initWithItems:titles];
        _segmentedControl.selectedSegmentIndex = 0;
        [_segmentedControl addTarget:self
                              action:@selector(selectionChanged:)
                    forControlEvents:UIControlEventValueChanged];
        _segmentedControl.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(20));
            make.left.equalTo(self.view).offset(JobsWidth(16));
            make.right.equalTo(self.view).inset(JobsWidth(16));
        });
    };return _segmentedControl;
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = UIImageView.new
            .byContentMode(UIViewContentModeScaleAspectFit)
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(JobsWidth(16))
            .byClipsToBounds(YES)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.segmentedControl.mas_bottom).offset(JobsWidth(24));
                make.centerX.equalTo(self.view);
                make.width.equalTo(self.view).multipliedBy(0.78);
                make.height.mas_equalTo(JobsWidth(220));
            });
    };return _iconView;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = UILabel.new
            .byText(@"等待加载")
            .byFont(UIFontWeightMediumSize(14))
            .byTextCor(JobsSecondaryLabelColor)
            .byTextAlignment(NSTextAlignmentCenter)
            .byNumberOfLines(0)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.iconView.mas_bottom).offset(JobsWidth(16));
                make.left.equalTo(self.view).offset(JobsWidth(24));
                make.right.equalTo(self.view).inset(JobsWidth(24));
            });
    };return _statusLabel;
}

-(UIButton *)reloadButton{
    if (!_reloadButton) {
        @jobs_weakify(self)
        _reloadButton = UIButton.new
            .byTitle(@"普通重载")
            .byTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(UIColor.systemBlueColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(10))
            .onClickBy(^(__kindof UIButton * _Nullable button) {
                [weak_self reloadButtonTap:button];
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.statusLabel.mas_bottom).offset(JobsWidth(22));
                make.left.equalTo(self.view).offset(JobsWidth(24));
                make.height.mas_equalTo(JobsWidth(48));
            });
    };return _reloadButton;
}

-(UIButton *)forceReloadButton{
    if (!_forceReloadButton) {
        @jobs_weakify(self)
        _forceReloadButton = UIButton.new
            .byTitle(@"忽略缓存重载")
            .byTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(UIColor.systemOrangeColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(10))
            .onClickBy(^(__kindof UIButton * _Nullable button) {
                [weak_self forceReloadButtonTap:button];
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.width.height.equalTo(self.reloadButton);
                make.left.equalTo(self.reloadButton.mas_right).offset(JobsWidth(12));
                make.right.equalTo(self.view).inset(JobsWidth(24));
            });
    };return _forceReloadButton;
}

@end

@interface JobsIconfontReuseCell : UITableViewCell

Prop_strong()UIImageView *iconView;
Prop_strong()UILabel *titleLabel;
Prop_strong()UILabel *stateLabel;

-(instancetype)byAsset:(JobsIconfontRemoteAsset)asset
                   row:(NSInteger)row;

@end

@implementation JobsIconfontReuseCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.iconView.hidden = NO;
        self.titleLabel.hidden = NO;
        self.stateLabel.hidden = NO;
    };return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    [self.iconView byCancelJobsIconfontLoad];
    self.stateLabel.byText(@"已取消旧任务");
}

-(instancetype)byAsset:(JobsIconfontRemoteAsset)asset
                   row:(NSInteger)row{
    self.titleLabel.byText([NSString stringWithFormat:@"Row %ld｜%@",
                            (long)row + 1,
                            [JobsIconfontManager.shared titleForRemoteAsset:asset]]);
    @jobs_weakify(self)
    [self.iconView byJobsIconfontAsset:asset
                           targetSize:CGSizeMake(50, 50)
                         forceRefresh:NO
                           completion:^(JobsIconfontLoadResult * _Nonnull result) {
        @jobs_strongify(self)
        switch (result.stage) {
            case JobsIconfontLoadStagePlaceholder:
                self.stateLabel.byText(@"本地占位图");
                break;
            case JobsIconfontLoadStageSuccess:
                self.stateLabel.byText([NSString stringWithFormat:@"%@｜%@",
                                        result.loaderName,
                                        result.isCacheHit ? @"缓存" : @"网络"]);
                break;
            case JobsIconfontLoadStageFailure:
                self.stateLabel.byText(@"失败兜底");
                break;
        }
    }];return self;
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = UIImageView.new
            .byContentMode(UIViewContentModeScaleAspectFit)
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(JobsWidth(10))
            .byClipsToBounds(YES)
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).offset(JobsWidth(16));
                make.centerY.equalTo(self.contentView);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(50),JobsWidth(50)));
            });
    };return _iconView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = UILabel.new
            .byFont(UIFontWeightSemiboldSize(15))
            .byTextCor(JobsLabelColor)
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self.iconView.mas_right).offset(JobsWidth(14));
                make.right.equalTo(self.contentView).inset(JobsWidth(16));
                make.centerY.equalTo(self.contentView).offset(-JobsWidth(10));
            });
    };return _titleLabel;
}

-(UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = UILabel.new
            .byFont(UIFontWeightRegularSize(12))
            .byTextCor(JobsSecondaryLabelColor)
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.titleLabel);
                make.top.equalTo(self.titleLabel.mas_bottom).offset(JobsWidth(4));
            });
    };return _stateLabel;
}

@end

@interface JobsIconfontReuseListDemoVC ()

Prop_strong()UITableView *reuseTableView;
Prop_strong()NSArray <JobsIconfontRemoteAsset>*assets;

@end

@implementation JobsIconfontReuseListDemoVC
-(NSString *)demoTitle{
    return @"列表复用与防串图";
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.reuseTableView.byVisible(YES);
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return 80;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(74);
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsIconfontReuseCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsIconfontReuseCellID];
    if (!cell) {
        cell = [JobsIconfontReuseCell.alloc initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:JobsIconfontReuseCellID];
    };return [cell byAsset:self.assets[indexPath.row % self.assets.count]
                       row:indexPath.row];
}

-(UITableView *)reuseTableView{
    if (!_reuseTableView) {
        _reuseTableView = [UITableView.alloc initWithFrame:CGRectZero
                                                    style:UITableViewStylePlain];
        _reuseTableView.byDelegate(self)
            .byDataSource(self)
            .byRowHeight(JobsWidth(74))
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.left.right.bottom.equalTo(self.view);
            });
    };return _reuseTableView;
}

-(NSArray<JobsIconfontRemoteAsset> *)assets{
    if (!_assets) {
        _assets = @[
            JobsIconfontRemoteAssetLogo,
            JobsIconfontRemoteAssetFontBanner,
            JobsIconfontRemoteAssetUsageGuide,
            JobsIconfontRemoteAssetInvalidURL
        ];
    };return _assets;
}

@end

@interface JobsIconfontCacheDemoVC ()

Prop_strong()UIImageView *iconView;
Prop_strong()UILabel *statusLabel;
Prop_strong()UIButton *clearButton;
Prop_assign()BOOL automaticSecondLoadPending;

-(void)loadImageForceRefresh:(BOOL)forceRefresh
                       phase:(NSString *)phase;

@end

@implementation JobsIconfontCacheDemoVC
-(NSString *)demoTitle{
    return @"缓存命中、清理与重载";
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.automaticSecondLoadPending = YES;
    self.iconView.hidden = NO;
    self.statusLabel.hidden = NO;
    self.clearButton.hidden = NO;
    [self loadImageForceRefresh:YES
                          phase:@"首次网络加载"];
}

-(void)clearButtonTap:(UIButton *)sender{
    self.statusLabel.byText(@"正在统一清理缓存…");
    @jobs_weakify(self)
    [JobsIconfontManager.shared clearImageCache:^{
        @jobs_strongify(self)
        [self loadImageForceRefresh:YES
                              phase:@"清理后的强制重载"];
    }];
}

-(void)loadImageForceRefresh:(BOOL)forceRefresh
                       phase:(NSString *)phase{
    @jobs_weakify(self)
    [self.iconView byJobsIconfontAsset:JobsIconfontRemoteAssetLogo
                           targetSize:CGSizeMake(220, 220)
                         forceRefresh:forceRefresh
                           completion:^(JobsIconfontLoadResult * _Nonnull result) {
        @jobs_strongify(self)
        switch (result.stage) {
            case JobsIconfontLoadStagePlaceholder:
                self.statusLabel.byText([NSString stringWithFormat:@"%@｜先显示占位图",phase]);
                break;
            case JobsIconfontLoadStageSuccess:{
                self.statusLabel.byText([NSString stringWithFormat:@"%@｜%@｜%@",
                                         phase,
                                         result.loaderName,
                                         result.isCacheHit ? @"缓存命中" : @"网络返回"]);
                if (!self.automaticSecondLoadPending) break;
                self.automaticSecondLoadPending = NO;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                             (int64_t)(0.7 * NSEC_PER_SEC)),
                               dispatch_get_main_queue(), ^{
                    [self loadImageForceRefresh:NO
                                          phase:@"自动第二次加载"];
                });
            }break;
            case JobsIconfontLoadStageFailure:
                self.statusLabel.byText([NSString stringWithFormat:@"%@｜失败兜底",phase]);
                break;
        }
    }];
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = UIImageView.new
            .byContentMode(UIViewContentModeScaleAspectFit)
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(JobsWidth(16))
            .byClipsToBounds(YES)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(28));
                make.centerX.equalTo(self.view);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(220),JobsWidth(220)));
            });
    };return _iconView;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = UILabel.new
            .byText(@"首次加载准备中")
            .byFont(UIFontWeightMediumSize(15))
            .byTextCor(JobsLabelColor)
            .byTextAlignment(NSTextAlignmentCenter)
            .byNumberOfLines(0)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.iconView.mas_bottom).offset(JobsWidth(20));
                make.left.equalTo(self.view).offset(JobsWidth(24));
                make.right.equalTo(self.view).inset(JobsWidth(24));
            });
    };return _statusLabel;
}

-(UIButton *)clearButton{
    if (!_clearButton) {
        @jobs_weakify(self)
        _clearButton = UIButton.new
            .byTitle(@"清空缓存并自动重载")
            .byTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(UIColor.systemRedColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(10))
            .onClickBy(^(__kindof UIButton * _Nullable button) {
                [weak_self clearButtonTap:button];
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.statusLabel.mas_bottom).offset(JobsWidth(24));
                make.left.equalTo(self.view).offset(JobsWidth(36));
                make.right.equalTo(self.view).inset(JobsWidth(36));
                make.height.mas_equalTo(JobsWidth(50));
            });
    };return _clearButton;
}

@end

@interface JobsIconfontGlyphDemoVC ()

Prop_strong()UITableView *glyphTableView;

@end

@implementation JobsIconfontGlyphDemoVC
-(NSString *)demoTitle{
    return @"Icon Font / Unicode / UIImage";
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.glyphTableView.byVisible(YES);
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(64);
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsIconfontDemoCellID];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:JobsIconfontDemoCellID];
    }
    JobsIconfontGlyph glyph = (JobsIconfontGlyph)indexPath.row;
    cell.imageView.image = [JobsIconfontManager.shared iconImageForGlyph:glyph
                                                                    size:CGSizeMake(38, 38)
                                                                   color:UIColor.systemIndigoColor];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText([JobsIconfontManager.shared titleForGlyph:glyph])
                .byFont(UIFontWeightSemiboldSize(16));
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"语义枚举 → UILabel / UIButton / UIImage")
                .byFont(UIFontWeightRegularSize(12));
        });
}

-(UITableView *)glyphTableView{
    if (!_glyphTableView) {
        _glyphTableView = [UITableView.alloc initWithFrame:CGRectZero
                                                    style:UITableViewStyleInsetGrouped];
        _glyphTableView.byDelegate(self)
            .byDataSource(self)
            .byRowHeight(JobsWidth(64))
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.left.right.bottom.equalTo(self.view);
            });
    };return _glyphTableView;
}

@end

@interface JobsIconfontTextFontDemoVC ()

Prop_strong()UILabel *sampleLabel;
Prop_strong()UILabel *sizeLabel;
Prop_strong()UISlider *slider;
Prop_strong()UILabel *fallbackLabel;

@end

@implementation JobsIconfontTextFontDemoVC
-(NSString *)demoTitle{
    return @"阿里妈妈文字字体";
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.sampleLabel.hidden = NO;
    self.sizeLabel.hidden = NO;
    self.slider.hidden = NO;
    self.fallbackLabel.hidden = NO;
}

-(void)sizeChanged:(UISlider *)sender{
    CGFloat size = round(sender.value);
    [self.sampleLabel byJobsIconfontTextSize:size];
    self.sizeLabel.byText([NSString stringWithFormat:@"字号：%ld",(long)size]);
}

-(UILabel *)sampleLabel{
    if (!_sampleLabel) {
        _sampleLabel = UILabel.new
            .byText(@"阿里妈妈·智造字\nAI 让设计更有温度\n012345678")
            .byTextCor(JobsLabelColor)
            .byTextAlignment(NSTextAlignmentCenter)
            .byNumberOfLines(0)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(48));
                make.left.equalTo(self.view).offset(JobsWidth(20));
                make.right.equalTo(self.view).inset(JobsWidth(20));
            });
        [_sampleLabel byJobsIconfontTextSize:34];
    };return _sampleLabel;
}

-(UILabel *)sizeLabel{
    if (!_sizeLabel) {
        _sizeLabel = UILabel.new
            .byText(@"字号：34")
            .byFont(UIFontWeightMediumSize(14))
            .byTextCor(JobsSecondaryLabelColor)
            .byTextAlignment(NSTextAlignmentCenter)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.sampleLabel.mas_bottom).offset(JobsWidth(36));
                make.left.right.equalTo(self.sampleLabel);
            });
    };return _sizeLabel;
}

-(UISlider *)slider{
    if (!_slider) {
        _slider = UISlider.new;
        _slider.minimumValue = 18;
        _slider.maximumValue = 52;
        _slider.value = 34;
        [_slider addTarget:self
                    action:@selector(sizeChanged:)
          forControlEvents:UIControlEventValueChanged];
        _slider.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.sizeLabel.mas_bottom).offset(JobsWidth(18));
            make.left.equalTo(self.view).offset(JobsWidth(36));
            make.right.equalTo(self.view).inset(JobsWidth(36));
        });
    };return _slider;
}

-(UILabel *)fallbackLabel{
    if (!_fallbackLabel) {
        _fallbackLabel = UILabel.new
            .byText(@"字体缺失时，JobsIconfont 自动回退系统字体")
            .byFont(UIFontWeightRegularSize(14))
            .byTextCor(JobsTertiaryLabelColor)
            .byTextAlignment(NSTextAlignmentCenter)
            .byNumberOfLines(0)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.slider.mas_bottom).offset(JobsWidth(32));
                make.left.right.equalTo(self.sampleLabel);
            });
    };return _fallbackLabel;
}

@end

//
//  JobsLinkageMenuViewDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsLinkageMenuViewDemoVC.h"

@interface JobsLinkageMenuDemoContentView : UIView

-(instancetype)initWithSectionTitle:(NSString *)sectionTitle
                          menuTitle:(NSString *)menuTitle;

@end

@implementation JobsLinkageMenuDemoContentView{
    NSString *_sectionTitle;
    NSString *_menuTitle;
    NSMutableArray<UIView *> *_cards;
    NSMutableArray<UILabel *> *_iconLabels;
    NSMutableArray<UILabel *> *_titleLabels;
    NSMutableArray<UILabel *> *_subtitleLabels;
}

-(instancetype)initWithSectionTitle:(NSString *)sectionTitle
                          menuTitle:(NSString *)menuTitle{
    if (self = [super initWithFrame:CGRectZero]) {
        _sectionTitle = sectionTitle;
        _menuTitle = menuTitle;
        _cards = NSMutableArray.array;
        _iconLabels = NSMutableArray.array;
        _titleLabels = NSMutableArray.array;
        _subtitleLabels = NSMutableArray.array;
        self.byBgColor(JobsSecondarySystemBackgroundColor);
        for (NSInteger i = 0; i < 5; i++) {
            UIView *card = [self cardAtIndex:i];
            [_cards addObject:card];
            card.addOn(self);
        }
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat cardX = JobsWidth(16);
    CGFloat cardW = MAX(0, CGRectGetWidth(self.bounds) - cardX * 2);
    CGFloat y = JobsWidth(16);
    for (UIView *card in _cards) {
        card.byFrame(CGRectMake(cardX, y, cardW, JobsWidth(96)));
        y += JobsWidth(112);
    }
}

-(UIView *)cardAtIndex:(NSInteger)index{
    UIView *card = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view.byBgColor(JobsTertiarySystemBackgroundColor);
    });
    card.byLayer(^(__kindof CALayer * _Nullable layer) {
        layer
            .byCornerRadius(JobsWidth(12))
            .byShadowColor(UIColor.blackColor.CGColor)
            .byShadowOpacity(0.15)
            .byShadowOffset(CGSizeMake(0, 3))
            .byShadowRadius(6);
    });
    UILabel *iconLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(@"✉")
            .byTextCor(UIColor.whiteColor)
            .byFont(UIFontBoldSystemFontOfSize(34))
            .byTextAlignment(NSTextAlignmentCenter)
            .byBgColor(UIColor.systemOrangeColor)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(JobsWidth(8))
                    .byMasksToBounds(YES);
            })
            .addOn(card);
    });
    [_iconLabels addObject:iconLabel];
    UILabel *titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText([NSString stringWithFormat:@"%@ - %@ 活动 %ld", _sectionTitle, _menuTitle, (long)index + 1])
            .byTextCor(UIColor.labelColor)
            .byFont(UIFontBoldSystemFontOfSize(18))
            .byNumberOfLines(2)
            .addOn(card);
    });
    [_titleLabels addObject:titleLabel];
    UILabel *subtitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(@"神秘彩金等你来拿".tr)
            .byTextCor(JobsSecondaryLabelColor)
            .byFont(UIFontSystemFontOfSize(15))
            .addOn(card);
    });
    [_subtitleLabels addObject:subtitleLabel];
    [iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(card).offset(JobsWidth(16));
        make.centerY.equalTo(card);
        make.size.mas_equalTo(CGSizeMake(JobsWidth(58), JobsWidth(58)));
    }];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconLabel.mas_right).offset(JobsWidth(16));
        make.right.equalTo(card).offset(-JobsWidth(14));
        make.top.equalTo(card).offset(JobsWidth(20));
    }];
    [subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(titleLabel);
        make.top.equalTo(titleLabel.mas_bottom).offset(JobsWidth(6));
    }];
    return card;
}

@end

@interface JobsLinkageMenuViewDemoVC ()

Prop_strong()UISegmentedControl *modeControl;
Prop_strong()UILabel *callbackLabel;
Prop_strong()JobsLinkageMenuView *linkageView;
Prop_strong()NSArray<NSString *> *menuTitles;

@end

@implementation JobsLinkageMenuViewDemoVC
-(void)dealloc{
    JobsRemoveNotification(self);
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
            data
                .byText(@"首页联动切换子页面".tr)
                .byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(JobsSystemBackgroundColor)
        .byNavBgCor(JobsSystemBackgroundColor);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.modeControl.byAlpha(1);
    self.callbackLabel.byAlpha(1);
    [self rebuildLinkageView];
    @jobs_weakify(self)
    [self addNotificationName:JobsThemeDidChangeNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        [self rebuildLinkageView];
    }];
}

-(void)rebuildLinkageView{
    self.linkageView.byRemove();
    self.linkageView = nil;
    JobsLinkageMenuViewConfig *config = JobsLinkageMenuViewConfig.new;
    config.DEFAULT_MENU_ITEM_HEIGHT = JobsWidth(78);
    config.MENU_ITEM_HEIGHT_MAP = @{@4: @(JobsWidth(96))};
    config.MENU_ITEM_CORNER_RADIUS = 0;
    config.BOTTOMVIEW_WIDTH = JobsWidth(4);
    config.BOTTOMVIEW_HEIGHT = JobsWidth(56);
    config.LINEVIEW_WIDTH = 1;
    config.ANIMATION_TIME = 0.22;
    if (self.modeControl.jobs_selectedSegmentIndex == 0) {
        config.MENU_WIDTH = JobsWidth(96);
    } else if (self.modeControl.jobs_selectedSegmentIndex == 1) {
        config.CONTENT_WIDTH = JobsWidth(260);
    } else {
        config.MENU_RATIO = 0.26;
    }
    @jobs_weakify(self)
    config.noContentClickBlock = ^(id payloadObj) {
        @jobs_strongify(self)
        NSDictionary *payload = [payloadObj isKindOfClass:NSDictionary.class] ? payloadObj : @{};
        NSString *title = payload[@"title"] ?: @"未命名菜单";
        self.callbackLabel.byText([NSString stringWithFormat:@"点击了没有内容区的菜单：%@", title]);
        toastBy(self.callbackLabel.text);
    };
    config.menuClickBlock = ^(id payloadObj) {
        @jobs_strongify(self)
        NSDictionary *payload = [payloadObj isKindOfClass:NSDictionary.class] ? payloadObj : @{};
        NSString *title = payload[@"title"] ?: @"";
        if (title.length) self.callbackLabel.byText([NSString stringWithFormat:@"当前菜单：%@", title]);
    };
    self.linkageView = [[JobsLinkageMenuView alloc] initWithFrame:CGRectZero
                                                        btnConfig:self.buttonModel
                                            linkageMenuViewConfig:config];
    self.linkageView
        .byBgColor(JobsSecondarySystemBackgroundColor)
        .addOn(self.view);
    [self.linkageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.callbackLabel.mas_bottom).offset(JobsWidth(8));
    }];
    self.linkageView.jobsRichViewByModel(nil);
}

-(UIButtonModel *)buttonModel{
    NSArray<UIImage *> *normalImages = [self imageArrayWithColor:JobsSecondaryLabelColor];
    NSArray<UIImage *> *normalBackgrounds = [self imageArrayWithColor:JobsTertiarySystemBackgroundColor];
    NSArray<UIImage *> *selectedBackgrounds = [self imageArrayWithColor:RGBA_COLOR(255, 0.94 * 255.0, 0.84 * 255.0, 1)];
    NSMutableArray<UIView *> *contents = NSMutableArray.array;
    for (NSInteger i = 0; i < self.menuTitles.count - 1; i++) {
        [contents addObject:[[JobsLinkageMenuDemoContentView alloc] initWithSectionTitle:@"活动"
                                                                               menuTitle:self.menuTitles[i]]];
    };return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
        data.byNormal_titles(self.menuTitles)
            .byNormal_images(normalImages)
            .byNormal_backgroundImages(normalBackgrounds)
            .bySelected_backgroundImages(selectedBackgrounds)
            .byImagePaddings(@[@4, @4, @4, @4, @4, @4, @4, @4])
            .byTitleCor(JobsSecondaryLabelColor)
            .bySelectedTitleCor(UIColor.systemOrangeColor)
            .byData(contents)
            .byImagePlacement(NSDirectionalRectEdgeTop);
    });
}

-(NSArray<UIImage *> *)imageArrayWithColor:(UIColor *)color{
    UIImage *image = [self imageWithColor:color];
    return @[image, image, image, image, image, image, image, image];
}

-(UIImage *)imageWithColor:(UIColor *)color{
    CGSize size = CGSizeMake(1, 1);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image ?: jobsMakeImage();
}
#pragma mark —— Action
-(void)modeChanged:(UISegmentedControl *)sender{
    [self rebuildLinkageView];
}
#pragma mark —— LazyLoad
-(UISegmentedControl *)modeControl{
    if (!_modeControl) {
        @jobs_weakify(self)
        _modeControl = jobsMakeSegmentedControl(@[@"菜单固定", @"内容固定", @"比例"], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(0)
                .onJobsChange(^(__kindof UIControl * _Nullable control) {
                    [weak_self modeChanged:(UISegmentedControl *)control];
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
                    make.height.mas_equalTo(JobsWidth(34));
                });
        });
    };return _modeControl;
}

-(UILabel *)callbackLabel{
    if (!_callbackLabel) {
        _callbackLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"当前菜单：日常.1".tr)
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontSystemFontOfSize(13))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.top.equalTo(self.modeControl.mas_bottom).offset(JobsWidth(8));
                    make.height.mas_equalTo(JobsWidth(20));
                });
        });
    };return _callbackLabel;
}

-(NSArray<NSString *> *)menuTitles{
    if (!_menuTitles) {
        _menuTitles = @[@"日常.1", @"新人.1", @"电子.1", @"体育.1", @"棋牌.1", @"真人.1", @"捕鱼.1", @"钱包教程.1"];
    };return _menuTitles;
}

@end

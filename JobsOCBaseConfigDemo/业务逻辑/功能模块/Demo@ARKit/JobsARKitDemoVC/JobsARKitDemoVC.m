//
//  JobsARKitDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

#import "JobsARKitDemoVC.h"

@interface JobsARKitDemoVC ()

Prop_strong() JobsARKitScene *laboratory;
Prop_strong() UIScrollView *scroll;
Prop_strong() UIStackView *content;
Prop_strong() UIView *sceneHost;
Prop_strong() UILabel *statusLabel;
Prop_strong() UILabel *countLabel;
Prop_strong() NSMutableDictionary<NSString *, UILabel *> *textLabels;
Prop_strong() NSMutableDictionary<NSString *, UIButton *> *buttons;
Prop_copy() NSString *statusKey;
Prop_assign() NSUInteger planeCount;
Prop_assign() NSUInteger modelCount;

@end

@implementation JobsARKitDemoVC

-(void)viewDidLoad {
    [super viewDidLoad];
    self.textLabels = [NSMutableDictionary dictionary];
    self.buttons = [NSMutableDictionary dictionary];
    [NSUserDefaults.standardUserDefaults removeObjectForKey:@"JobsARKit.language"];
    self.statusKey = @"ready";
    self.laboratory = [JobsARKitScene new];
    @jobs_weakify(self)
    self.laboratory.onChange = ^(NSString *key, NSUInteger planes, NSUInteger objects) {
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        self.statusKey = key;
        self.planeCount = planes;
        self.modelCount = objects;
        [self renderStatus];
        [self attachScene];
    };
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
    [self buildContent];
    self.laboratory.modelIndex = 2;
    [self.laboratory showPreview];
    [self.laboratory placeAtPoint:CGPointZero];
    [self renderText];
    [self applySavedAppearance];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(themeDidChange:) name:JobsThemeDidChangeNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(languageDidChange:) name:语言切换 object:nil];
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self applySavedAppearance];
    [self.laboratory resume];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.laboratory pause];
}

-(void)didBecomeActive:(NSNotification *)notification {
    if (self.viewIfLoaded.window && !self.presentedViewController) {
        [self.laboratory resume];
    }
}

-(void)didEnterBackground:(NSNotification *)notification {
    [self.laboratory pause];
}

-(void)themeDidChange:(NSNotification *)notification {
    [self refreshButtonAppearance];
}

-(NSString *)text:(NSString *)key {
    NSString *language = LanMgr.languageCodeByAppLanguage(LanMgr.language);
    if ([language hasPrefix:@"zh"] && ![JobsARKitText.languageCodes containsObject:language]) {
        language = [language containsString:@"Hant"] || [language containsString:@"TW"] || [language containsString:@"HK"] ? @"zh-Hant" : @"zh-Hans";
    }
    if (![JobsARKitText.languageCodes containsObject:language]) {
        language = [language componentsSeparatedByString:@"-"].firstObject;
    }
    return [JobsARKitText text:key language:language ?: @"en"];
}

-(UILabel *)labelForKey:(NSString *)key size:(CGFloat)size {
    UILabel *result = jobsMakeLabel(^(__kindof UILabel *label) {
        label
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(size)])
            .byNumberOfLines(0)
            .byAdjustsFontForContentSizeCategory(YES)
            .byTextColor(JobsLabelColor);
    });
    self.textLabels[key] = result;
    return result;
}

-(UIButton *)buttonForKey:(NSString *)key {
    @jobs_weakify(self)
    UIButton *result = jobsMakeButton(^(__kindof UIButton *button) {
        button
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(14))
            .jobsResetBtnTitleCor(JobsLabelColor)
            .jobsResetBtnBgCor(JobsTertiarySystemBackgroundColor)
            .jobsResetBtnCornerRadiusValue(12)
            .byTitleLabel(^(__kindof UILabel *label) {
                label
                    .byNumberOfLines(0)
                    .byTextAlignment(NSTextAlignmentCenter)
                    .byAdjustsFontForContentSizeCategory(YES);
            })
            .onClickBy(^(UIButton *sender) {
                @jobs_strongify(self)
                if (self) {
                    [self performAction:key];
                }
            })
            .byAccessibilityIdentifier([@"jobs.arkit." stringByAppendingString:([@[@"cube", @"sphere", @"robot"] containsObject:key] ? [@"model." stringByAppendingString:key] : key)])
            .byAdd(^(MASConstraintMaker *make) {
                make.height.greaterThanOrEqualTo(@48).priority(999);
            });
    });
    self.buttons[key] = result;
    return result;
}

-(UIStackView *)rowForKeys:(NSArray<NSString *> *)keys {
    UIStackView *row = jobsMakeStackView(^(__kindof UIStackView *stack) {
        stack
            .byAxis(UILayoutConstraintAxisHorizontal)
            .byDistribution(UIStackViewDistributionFillEqually)
            .byAlignment(UIStackViewAlignmentFill)
            .bySpacing(8);
    });
    for (NSString *key in keys) {
        row.byAddArrangedSubview([self buttonForKey:key]);
    }
    return row;
}

-(void)buildContent {
    @jobs_weakify(self)
    self.scroll = jobsMakeScrollView(^(__kindof UIScrollView *scroll) {
        @jobs_strongify(self)
        scroll
            .byAlwaysBounceVertical(YES)
            .byContentInset(UIEdgeInsetsMake(16, 0, 30, 0))
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
                make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            });
    });
    self.content = jobsMakeStackView(^(__kindof UIStackView *stack) {
        @jobs_strongify(self)
        stack
            .byAxis(UILayoutConstraintAxisVertical)
            .bySpacing(14)
            .byAlignment(UIStackViewAlignmentFill)
            .addOn(self.scroll)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.scroll).insets(UIEdgeInsetsMake(0, 18, 0, 18));
                make.width.equalTo(self.scroll).offset(-36);
            });
    });
    [self labelForKey:@"title" size:30].byFont(UIFontWeightBoldSize(30));
    self.content
        .byAddArrangedSubview(self.textLabels[@"title"])
        .byAddArrangedSubview([self labelForKey:@"intro" size:15])
        .byAddArrangedSubview([self rowForKeys:@[@"theme"]]);
    self.sceneHost = jobsMakeView(^(__kindof UIView *host) {
        host
            .byBgColor(RGB_COLOR(14, 23, 36))
            .byCornerRadius(20)
            .byClipsToBounds(YES)
            .byAccessibilityElement(YES)
            .byAccessibilityIdentifier(@"jobs.arkit.scene")
            .byAdd(^(MASConstraintMaker *make) {
                make.height.equalTo(@300);
            });
    });
    UITapGestureRecognizer *tap = jobsMakeTapGesture(nil);
    [tap addTarget:self action:@selector(tappedScene:)];
    self.sceneHost.byAddGestureRecognizer(tap);
    self.statusLabel = [self labelForKey:@"status" size:14];
    self.statusLabel.byAccessibilityIdentifier(@"jobs.arkit.status");
    self.countLabel = [self labelForKey:@"counts" size:12];
    self.countLabel.byAccessibilityIdentifier(@"jobs.arkit.counts");
    self.content
        .byAddArrangedSubview(self.sceneHost)
        .byAddArrangedSubview(self.statusLabel)
        .byAddArrangedSubview(self.countLabel)
        .byAddArrangedSubview([self rowForKeys:@[@"start", @"preview"]])
        .byAddArrangedSubview([self rowForKeys:@[@"cube", @"sphere", @"robot"]])
        .byAddArrangedSubview([self rowForKeys:@[@"smaller", @"rotate", @"larger"]])
        .byAddArrangedSubview([self rowForKeys:@[@"clear", @"reset"]])
        .byAddArrangedSubview([self rowForKeys:@[@"retry", @"settings"]])
        .byAddArrangedSubview([self labelForKey:@"guide" size:15])
        .byAddArrangedSubview([self labelForKey:@"pipeline" size:14]);
    [self attachScene];
}

-(void)attachScene {
    UIView *scene = self.laboratory.view;
    if (scene.superview == self.sceneHost) {
        return;
    }
    for (UIView *view in self.sceneHost.subviews) {
        view.byRemoveFromSuperview();
    }
    scene.addOn(self.sceneHost).byAdd(^(MASConstraintMaker *make) {
        make.edges.equalTo(self.sceneHost);
    });
}

-(void)tappedScene:(UITapGestureRecognizer *)gesture {
    [self.laboratory placeAtPoint:[gesture locationInView:self.laboratory.view]];
}

-(void)renderText {
    for (NSString *key in self.textLabels) {
        if (![key isEqualToString:@"status"] && ![key isEqualToString:@"counts"]) {
            self.textLabels[key].byText([self text:key]);
        }
    }
    for (NSString *key in self.buttons) {
        self.buttons[key]
            .jobsResetBtnTitle([self text:key])
            .byAccessibilityLabel([self text:key]);
    }
    self.byTitle([self text:@"title"]);
    self.byGKNavTitle([self text:@"title"]);
    self.backBtnCategory.jobsResetBtnTitle(@"返回".jobsTr());
    [self.backBtnCategory sizeToFit];
    self.backBtnCategory.bySize(CGSizeMake(MAX(44, CGRectGetWidth(self.backBtnCategory.bounds)), 44));
    [self renderStatus];
    [self refreshModelSelection];
}

-(void)renderStatus {
    self.statusLabel.byText([self text:self.statusKey]);
    self.countLabel.byText([NSString stringWithFormat:@"%@  %lu / %lu", [self text:@"counts"], (unsigned long)self.planeCount, (unsigned long)self.modelCount]);
    self.countLabel.byAccessibilityValue([NSString stringWithFormat:@"planes:%lu;models:%lu", (unsigned long)self.planeCount, (unsigned long)self.modelCount]);
    self.sceneHost.byAccessibilityValue(self.laboratory.selectionDescription);
    BOOL denied = [self.statusKey isEqualToString:@"cameraDenied"];
    self.buttons[@"settings"].byHidden(!denied);
}

-(void)refreshModelSelection {
    NSArray *keys = @[@"cube", @"sphere", @"robot"];
    for (NSUInteger index = 0; index < keys.count; index++) {
        self.buttons[keys[index]].bySelected(index == self.laboratory.modelIndex);
    }
    [self refreshButtonAppearance];
}

-(void)refreshButtonAppearance {
    JobsThemeCenter *center = JobsThemeCenter.shared;
    UIColor *foreground = center.resolvedColorForKey(JobsThemeColorKeyTextPrimary);
    UIColor *background = center.resolvedColorForKey(JobsThemeColorKeyBackgroundTertiary);
    NSArray *models = @[@"cube", @"sphere", @"robot"];
    for (NSString *key in self.buttons) {
        BOOL selected = [models containsObject:key] && [models indexOfObject:key] == self.laboratory.modelIndex;
        // UIButtonConfiguration 会保存文字 transformer 的颜色；主题变更时重建该配置。
        self.buttons[key]
            .jobsResetBtnTitleCor(selected ? JobsWhiteColor : foreground)
            .jobsResetBtnBgCor(selected ? RGB_COLOR(16, 125, 109) : background)
            .jobsResetBtnTitle([self text:key])
            .bySetNeedsUpdateConfiguration()
            .byUpdateConfiguration();
    }
}

-(void)performAction:(NSString *)key {
    if ([key isEqualToString:@"start"] || [key isEqualToString:@"retry"]) {
        [self.laboratory start];
    } else if ([key isEqualToString:@"preview"]) {
        [self.laboratory showPreview];
    } else if ([key isEqualToString:@"reset"]) {
        [self.laboratory reset];
    } else if ([key isEqualToString:@"clear"]) {
        [self.laboratory clear];
    } else if ([key isEqualToString:@"rotate"]) {
        [self.laboratory rotate];
    } else if ([key isEqualToString:@"smaller"] || [key isEqualToString:@"larger"]) {
        [self.laboratory resizeBy:[key isEqualToString:@"smaller"] ? 0.8 : 1.25];
    } else if ([@[@"cube", @"sphere", @"robot"] containsObject:key]) {
        self.laboratory.modelIndex = [@[@"cube", @"sphere", @"robot"] indexOfObject:key];
        [self refreshModelSelection];

    } else if ([key isEqualToString:@"theme"]) {
        [self chooseAppearance];
    } else if ([key isEqualToString:@"settings"]) {
        [UIApplication.sharedApplication openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
    }
}

-(void)languageDidChange:(NSNotification *)notification {
    [self renderText];
}

-(void)chooseAppearance {
    @jobs_weakify(self)
    JobsAlertModel *model = jobsMakeAlertModel(^(JobsAlertModel *item) {
        item.byAlertControllerTitle([self text:@"theme"]).byPreferredStyle(UIAlertControllerStyleAlert);
    });
    UIAlertController *alert = JobsMakeAlertControllerBy(model);
    NSArray *keys = @[@"system", @"light", @"dark"];
    for (NSUInteger index = 0; index < keys.count; index++) {
        JobsAlertModel *item = jobsMakeAlertModel(^(JobsAlertModel *item) {
            item.byAlertActionTitle([self text:keys[index]])
                .byAlertActionBlock(^(__unused UIAlertAction *action) {
                    @jobs_strongify(self)
                    if (!self) {
                        return;
                    }
                    [NSUserDefaults.standardUserDefaults setInteger:index forKey:@"JobsARKit.appearance"];
                    [self applySavedAppearance];
                });
        });
        alert.add(JobsMakeAlertActionBy(item));
    }
    JobsAlertModel *cancel = jobsMakeAlertModel(^(JobsAlertModel *item) {
        item.byAlertActionTitle([self text:@"cancel"]).byAlertActionStyle(UIAlertActionStyleCancel);
    });
    self.comingToPresentVC(alert.add(JobsMakeAlertActionBy(cancel)));
}

-(void)applySavedAppearance {
    if (![NSUserDefaults.standardUserDefaults objectForKey:@"JobsARKit.appearance"]) {
        return;
    }
    NSInteger appearance = [NSUserDefaults.standardUserDefaults integerForKey:@"JobsARKit.appearance"];
    UIUserInterfaceStyle style = appearance == 1 ? UIUserInterfaceStyleLight : (appearance == 2 ? UIUserInterfaceStyleDark : UIUserInterfaceStyleUnspecified);
    UIUserInterfaceStyle systemStyle = self.view.window.windowScene.traitCollection.userInterfaceStyle;
    JobsThemeCenter.shared.setStyle((style == UIUserInterfaceStyleDark || (style == UIUserInterfaceStyleUnspecified && systemStyle == UIUserInterfaceStyleDark)) ? JobsThemeStyleDark : JobsThemeStyleLight);
    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
        if ([scene isKindOfClass:UIWindowScene.class]) {
            for (UIWindow *window in ((UIWindowScene *)scene).windows) {
                window.byOverrideUserInterfaceStyle(style);
            }
        }
    }
    [self refreshButtonAppearance];
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if ([NSUserDefaults.standardUserDefaults integerForKey:@"JobsARKit.appearance"] == 0 && self.viewIfLoaded.window) {
        [self applySavedAppearance];
    }
}

@end

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
Prop_strong() UILabel *stepsLabel;
Prop_strong() UILabel *pendingLabel;
Prop_strong() UILabel *currentLabel;
Prop_strong() UILabel *crosshairLabel;
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
    [NSUserDefaults.standardUserDefaults removeObjectForKey:@"JobsARKit.appearance"];
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
    [self.laboratory showPreview];
    [self renderText];
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
            .bySpacing(12)
            .byAlignment(UIStackViewAlignmentFill)
            .addOn(self.scroll)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.scroll).insets(UIEdgeInsetsMake(0, 18, 0, 18));
                make.width.equalTo(self.scroll).offset(-36);
            });
    });
    [self labelForKey:@"title" size:26].byFont(UIFontWeightBoldSize(26));
    self.stepsLabel = [self labelForKey:@"stepsPreview" size:14];
    self.statusLabel = [self labelForKey:@"status" size:15];
    self.statusLabel.byAccessibilityIdentifier(@"jobs.arkit.status");
    self.pendingLabel = [self labelForKey:@"pendingNone" size:16];
    self.pendingLabel
        .byFont(UIFontWeightSemiboldSize(16))
        .byAccessibilityIdentifier(@"jobs.arkit.pending");
    self.currentLabel = [self labelForKey:@"currentEmpty" size:14];
    self.currentLabel.byAccessibilityIdentifier(@"jobs.arkit.current");
    self.countLabel = [self labelForKey:@"counts" size:12];
    self.countLabel.byAccessibilityIdentifier(@"jobs.arkit.counts");
    self.sceneHost = jobsMakeView(^(__kindof UIView *host) {
        host
            .byBgColor(RGB_COLOR(14, 23, 36))
            .byCornerRadius(20)
            .byClipsToBounds(YES)
            .byAccessibilityElement(YES)
            .byAccessibilityIdentifier(@"jobs.arkit.scene")
            .byAdd(^(MASConstraintMaker *make) {
                make.height.equalTo(@260);
            });
    });
    self.crosshairLabel = jobsMakeLabel(^(__kindof UILabel *label) {
        @jobs_strongify(self)
        label
            .byText(@"＋")
            .byFont(UIFontWeightRegularSize(34))
            .byTextColor(JobsWhiteColor)
            .byTextAlignment(NSTextAlignmentCenter)
            .byLayer(^(__kindof CALayer *layer) {
                layer.byZPosition(2);
            })
            .addOn(self.sceneHost)
            .byAdd(^(MASConstraintMaker *make) {
                make.center.equalTo(self.sceneHost);
                make.size.mas_equalTo(CGSizeMake(44, 44));
            });
    });
    UITapGestureRecognizer *tap = jobsMakeTapGesture(nil);
    [tap addTarget:self action:@selector(tappedScene:)];
    self.sceneHost.byAddGestureRecognizer(tap);
    self.content
        .byAddArrangedSubview(self.textLabels[@"title"])
        .byAddArrangedSubview([self rowForKeys:@[@"preview", @"start"]])
        .byAddArrangedSubview(self.stepsLabel)
        .byAddArrangedSubview(self.pendingLabel)
        .byAddArrangedSubview([self rowForKeys:@[@"cube", @"sphere", @"robot"]])
        .byAddArrangedSubview(self.statusLabel)
        .byAddArrangedSubview([self rowForKeys:@[@"place"]])
        .byAddArrangedSubview(self.sceneHost)
        .byAddArrangedSubview(self.currentLabel)
        .byAddArrangedSubview([self labelForKey:@"adjustTitle" size:16])
        .byAddArrangedSubview([self labelForKey:@"adjustGuide" size:14])
        .byAddArrangedSubview([self rowForKeys:@[@"smaller", @"rotate", @"larger"]])
        .byAddArrangedSubview([self rowForKeys:@[@"clear", @"reset"]])
        .byAddArrangedSubview(self.countLabel)
        .byAddArrangedSubview([self rowForKeys:@[@"retry", @"settings"]])
        .byAddArrangedSubview([self labelForKey:@"aboutTitle" size:18])
        .byAddArrangedSubview([self labelForKey:@"intro" size:15])
        .byAddArrangedSubview([self labelForKey:@"pipeline" size:14]);
    [self attachScene];
}

-(void)attachScene {
    UIView *scene = self.laboratory.view;
    if (scene.superview == self.sceneHost) {
        return;
    }
    for (UIView *view in self.sceneHost.subviews) {
        if (view != self.crosshairLabel) {
            view.byRemoveFromSuperview();
        }
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
            .jobsResetBtnTitle([self buttonTextForKey:key])
            .byAccessibilityLabel([self buttonTextForKey:key]);
    }
    self.byTitle([self text:@"title"]);
    self.byGKNavTitle([self text:@"title"]);
    self.backBtnCategory.jobsResetBtnTitle(@"返回".jobsTr());
    [self.backBtnCategory sizeToFit];
    self.backBtnCategory.bySize(CGSizeMake(MAX(44, CGRectGetWidth(self.backBtnCategory.bounds)), 44));
    [self renderStatus];
    [self refreshModelSelection];
}

-(NSString *)buttonTextForKey:(NSString *)key {
    if ([key isEqualToString:@"preview"]) {
        return [self text:@"modePreview"];
    }
    if ([key isEqualToString:@"start"]) {
        return [self text:@"modeAR"];
    }
    if ([key isEqualToString:@"place"]) {
        return [self text:self.laboratory.previewing ? @"addPreview" : @"placeAR"];
    }
    if ([key isEqualToString:@"reset"]) {
        return [self text:self.laboratory.previewing ? @"resetPractice" : @"resetAR"];
    }
    if ([key isEqualToString:@"retry"]) {
        return [self text:@"scanAgain"];
    }
    return [self text:key];
}

-(NSString *)currentGuideKey {
    if (self.laboratory.previewing) {
        return self.modelCount ? @"guidePreviewReady" : @"guidePreviewEmpty";
    }
    NSDictionary<NSString *, NSString *> *guides = @{
        @"unsupported": @"guideUnsupported", @"cameraDenied": @"guideCameraDenied",
        @"trackingInitializing": @"guideInitializing", @"relocalizing": @"guideInitializing",
        @"limited": @"guideInitializing", @"trackingMotion": @"guideMotion",
        @"trackingFeatures": @"guideFeatures", @"interrupted": @"guideInterrupted",
        @"failed": @"guideFailed", @"paused": @"guidePaused", @"ready": @"guideStart"
    };
    if (guides[self.statusKey]) {
        return guides[self.statusKey];
    }
    if (self.laboratory.canPlaceAtCenter) {
        return @"guidePlaceReady";
    }
    return self.planeCount ? @"guideAim" : @"guideScanning";
}

-(void)renderStatus {
    BOOL previewing = self.laboratory.previewing;
    BOOL selected = self.laboratory.modelIndex < 3;
    BOOL hasCurrentModel = self.laboratory.selectedModelIndex < 3;
    NSArray *models = @[@"cube", @"sphere", @"robot"];
    self.stepsLabel.byText([self text:previewing ? @"stepsPreview" : @"stepsAR"]);
    self.statusLabel.byText([self text:[self currentGuideKey]]);
    self.pendingLabel.byText(selected
        ? [NSString stringWithFormat:[self text:@"pendingModel"], [self text:models[self.laboratory.modelIndex]]]
        : [self text:@"pendingNone"]);
    self.currentLabel.byText(hasCurrentModel
        ? [NSString stringWithFormat:[self text:@"currentModel"], [self text:models[self.laboratory.selectedModelIndex]]]
        : [self text:@"currentEmpty"]);
    self.countLabel.byText(previewing
        ? [NSString stringWithFormat:[self text:@"previewCount"], (unsigned long)self.modelCount]
        : [NSString stringWithFormat:[self text:@"realCount"], (unsigned long)self.planeCount, (unsigned long)self.modelCount]);
    self.countLabel.byAccessibilityValue([NSString stringWithFormat:@"planes:%lu;models:%lu", (unsigned long)self.planeCount, (unsigned long)self.modelCount]);
    self.sceneHost.byAccessibilityValue(self.laboratory.selectionDescription);
    self.crosshairLabel
        .byTextColor(self.laboratory.canPlaceAtCenter ? RGB_COLOR(56, 224, 181) : JobsWhiteColor)
        .byHidden(previewing);
    self.buttons[@"place"].byEnabled(self.laboratory.canPlaceAtCenter);
    for (NSString *key in @[@"smaller", @"rotate", @"larger", @"clear"]) {
        self.buttons[key].byEnabled(hasCurrentModel);
    }
    BOOL denied = [self.statusKey isEqualToString:@"cameraDenied"];
    self.buttons[@"settings"].byHidden(!denied);
    self.buttons[@"retry"].byHidden(previewing || [self.statusKey isEqualToString:@"unsupported"]);
    [self refreshModelSelection];
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
        UIButton *button = self.buttons[key];
        BOOL selected = ([models containsObject:key] && [models indexOfObject:key] == self.laboratory.modelIndex)
            || ([key isEqualToString:@"preview"] && self.laboratory.previewing)
            || ([key isEqualToString:@"start"] && !self.laboratory.previewing);
        BOOL primary = [key isEqualToString:@"place"];
        button
            .jobsResetBtnTitleCor((selected || (primary && button.jobs_isEnabled)) ? JobsWhiteColor : foreground)
            .jobsResetBtnBgCor((selected || (primary && button.jobs_isEnabled)) ? RGB_COLOR(16, 125, 109) : background)
            .jobsResetBtnTitle([self buttonTextForKey:key])
            .byAccessibilityLabel([self buttonTextForKey:key])
            .bySetNeedsUpdateConfiguration()
            .byUpdateConfiguration()
            .byAlpha(button.jobs_isEnabled ? 1 : 0.45);
    }
}

-(void)performAction:(NSString *)key {
    if ([key isEqualToString:@"start"] || [key isEqualToString:@"retry"]) {
        if (self.laboratory.previewing || [key isEqualToString:@"retry"]) {
            [self.laboratory start];
        }
    } else if ([key isEqualToString:@"preview"]) {
        if (!self.laboratory.previewing) {
            [self.laboratory showPreview];
        }
    } else if ([key isEqualToString:@"place"]) {
        CGRect bounds = self.laboratory.view.bounds;
        [self.laboratory placeAtPoint:CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds))];
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
        [self renderStatus];

    } else if ([key isEqualToString:@"settings"]) {
        [UIApplication.sharedApplication openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
    }
}

-(void)languageDidChange:(NSNotification *)notification {
    [self renderText];
}


@end

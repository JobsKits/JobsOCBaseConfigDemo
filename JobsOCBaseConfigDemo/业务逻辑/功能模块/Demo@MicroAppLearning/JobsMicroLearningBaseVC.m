//
//  JobsMicroLearningBaseVC.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroLearningBaseVC.h"

@interface JobsMicroLearningBaseVC ()

Prop_strong()UIScrollView *learningScroll;
Prop_strong(readwrite)UIStackView *learningStack;
Prop_strong(readwrite)UILabel *learningStatus;

-(JobsRetStrByVoidBlock _Nonnull)learningTitle;
-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction;
-(jobsByVoidBlock _Nonnull)buildLearningContent;
-(jobsByViewBlock _Nonnull)appendLearningView;
-(jobsByStrBlock _Nonnull)reportLearningStatus;

@end

@implementation JobsMicroLearningBaseVC

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMicroLearningBaseVC.class, @selector(jobsLearningLoadView)))(self, @selector(jobsLearningLoadView));
    if (action) {
        action();
    }
}

-(jobsByVoidBlock _Nonnull)jobsLearningLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }

        [super loadView];
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel *data) {
                data.byText(@"返回");
            })
            .byTextModelBlock(^(__kindof UITextModel *data) {
                data.byText(self.learningTitle());
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMicroLearningBaseVC.class, @selector(jobsLearningViewDidLoad)))(self, @selector(jobsLearningViewDidLoad));
    if (action) {
        action();
    }
}

-(jobsByVoidBlock _Nonnull)jobsLearningViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }

        [super viewDidLoad];
        self.makeNavByAlpha(1);
        // 宿主装配导航后再绑定业务标题，避免默认类名覆盖学习页名称。
        self.viewModel.byTextModelBlock(^(__kindof UITextModel *data) {
            data
                .byText(self.learningTitle())
                .byFont(UIFontWeightSemiboldSize(17))
                .byTextCor(JobsLabelColor);
        });
        self.gk_navTitleViewBy(self.viewModel);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self->_learningScroll = jobsMakeScrollView(^(UIScrollView *scroll) {
            scroll
                .byAlwaysBounceVertical(YES)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
        self->_learningStack = jobsMakeStackView(^(UIStackView *stack) {
            stack
                .byAxis(UILayoutConstraintAxisVertical)
                .byAlignment(UIStackViewAlignmentFill)
                .byDistribution(UIStackViewDistributionFill)
                .bySpacing(12)
                .addOn(self.learningScroll)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.learningScroll).inset(16);
                    make.width.equalTo(self.learningScroll).offset(-32);
                });
        });
        self.appendLearningView([self learningLabelWithText:self.learningIntroduction() secondary:YES]);
        self->_learningStatus = [self learningLabelWithText:@"准备就绪。先看说明，再点击下面的操作。" secondary:NO];
        self->_learningStatus
            .byAccessibilityIdentifier(@"lab.status")
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(10)
            .byClipsToBounds(YES);
        self.appendLearningView(self->_learningStatus);
        self.buildLearningContent();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)learningTitle{
    return ^NSString *{
        return @"微应用工程学习";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction{
    return ^NSString *{
        return @"每页只验证一个能力，真实边界和生产接入点写在对应源码注释。";
    };
}

-(jobsByVoidBlock _Nonnull)buildLearningContent{
    return ^{};
}

-(jobsByViewBlock _Nonnull)appendLearningView{
    @jobs_weakify(self)
    return ^(UIView *view) {
        @jobs_strongify(self)
        if (self && view) {
            self.learningStack.byAddArrangedSubview(view);
        }
    };
}

-(jobsByStrBlock _Nonnull)reportLearningStatus{
    @jobs_weakify(self)
    return ^(NSString *text) {
        @jobs_strongify(self)
        if (self) {
            self.learningStatus.byText(text ?: @"没有结果，请重试。");
        }
    };
}

-(UILabel *)learningLabelWithText:(NSString *)text secondary:(BOOL)secondary{
    UILabel *label = jobsMakeLabel(^(UILabel *label) {
        label
            .byText(text)
            .byTextCor(JobsLabelColor)
            .byFont(UIFontWeightRegularSize(15))
            .byNumberOfLines(0);
    });
    if (secondary) {
        // 按宿主有效主题更新；浅色页 / 深色页均保证摘要仍可读。
        [JobsThemeCenter.shared bindObject:label
                                     slot:@"JobsMicroLearning.secondaryText"
                                    apply:^(__kindof NSObject *object, JobsThemeCenter *center) {
            ((UILabel *)object).byTextCor(center.darkMode ? RGB_COLOR(185, 185, 191) : RGB_COLOR(90, 90, 96));
        }];
    }
    return label;
}

-(UIButton *)learningButtonWithTitle:(NSString *)title identifier:(NSString *)identifier action:(jobsByBtnBlock)action{
    UIButton *button = jobsMakeButton(^(UIButton *button) {
        button
            .jobsResetBtnTitle(title)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(RGB_COLOR(20, 77, 142))
            .jobsResetBtnCornerRadiusValue(10)
            .onClickBy(action)
            .byAccessibilityIdentifier(identifier);
    });
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(48);
    }];
    return button;
}

-(UITextField *)learningFieldWithText:(NSString *)text placeholder:(NSString *)placeholder identifier:(NSString *)identifier{
    UITextField *field = jobsMakeTextField(^(UITextField *field) {
        field
            .byText(text)
            .byBorderStyle(UITextBorderStyleRoundedRect)
            .byTextCor(JobsLabelColor)
            .byFont(UIFontWeightRegularSize(15))
            .byAccessibilityIdentifier(identifier)
            .byBgColor(JobsSecondarySystemBackgroundColor);
    });
    [JobsThemeCenter.shared bindObject:field
                                 slot:@"JobsMicroLearning.placeholder"
                                apply:^(__kindof NSObject *object, JobsThemeCenter *center) {
        UIColor *color = center.darkMode ? RGB_COLOR(185, 185, 191) : RGB_COLOR(90, 90, 96);
        ((UITextField *)object).byAttributedPlaceholder(JobsAttributedStringByAttributes(placeholder, @{NSForegroundColorAttributeName:color}));
    }];
    [field mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
    }];
    return field;
}

-(NSURL *)learningResourceWithName:(NSString *)name directory:(NSString *)directory{
    NSURL *bundle = [NSBundle.mainBundle URLForResource:@"JobsMicroLearning" withExtension:@"bundle"];
    NSURL *root = directory.length ? [bundle URLByAppendingPathComponent:directory isDirectory:YES] : bundle;
    return root ? [root URLByAppendingPathComponent:name] : nil;
}

@end

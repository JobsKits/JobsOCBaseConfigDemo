//
//  JobsMicroLearningBaseVC.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroLearningBaseVC.h"

static char JobsMicroLearningWebContentSizeContext;

@interface JobsMicroLearningBaseVC ()

Prop_strong()UIScrollView *learningScroll;
Prop_strong(readwrite)UIStackView *learningStack;
Prop_strong(readwrite)UILabel *learningStatus;
Prop_strong()NSMutableArray<WKWebView *> *learningWebViews;
Prop_weak()WKWebView *sizingWebView;
Prop_strong()NSURL *sizingEntryURL;
Prop_assign()NSUInteger webSizingGeneration;
Prop_assign()BOOL webSizingInFlight;
Prop_assign()BOOL webSizingPending;
Prop_assign()CGFloat lastWebWidth;
Prop_strong()id contentSizeCategoryObserver;

-(JobsRetStrByVoidBlock _Nonnull)learningTitle;
-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction;
-(jobsByVoidBlock _Nonnull)buildLearningContent;
-(jobsByViewBlock _Nonnull)appendLearningView;
-(jobsByStrBlock _Nonnull)reportLearningStatus;
-(jobsByWKWebViewBlock _Nonnull)updateLearningWebHeight;
-(jobsByVoidBlock _Nonnull)jobsLearningViewDidLayoutSubviews;

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
                .byKeyboardDismissMode(UIScrollViewKeyboardDismissModeInteractive)
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
        self->_contentSizeCategoryObserver = [NSNotificationCenter.defaultCenter addObserverForName:UIContentSizeCategoryDidChangeNotification
                                                                                             object:nil
                                                                                              queue:NSOperationQueue.mainQueue
                                                                                         usingBlock:^(NSNotification *notification) {
            (void)notification;
            // 字号缩小不一定改变 WK contentSize，等网页更新后主动重测正文。
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (self) {
                    self.refreshLearningWebLayout();
                }
            });
        }];
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
            self.refreshLearningWebLayout();
        }
    };
}

-(jobsByWKWebViewBlock _Nonnull)appendLearningWebView{
    @jobs_weakify(self)
    return ^(WKWebView *webView) {
        @jobs_strongify(self)
        if (!self || !webView || [self.learningWebViews containsObject:webView]) {
            return;
        }
        if (!self.learningWebViews) {
            self->_learningWebViews = jobsMakeMutArr(nil);
        }
        // 自有本地网页随内容撑开，远程网页则保留独立可滚动视口。
        webView.scrollView
            .byScrollEnabled(NO)
            .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
        self.appendLearningView(webView);
        [webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
        }];
        [self.learningWebViews addObject:webView];
        [webView.scrollView addObserver:self
                            forKeyPath:@"contentSize"
                               options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                               context:&JobsMicroLearningWebContentSizeContext];
    };
}

-(void)configureLearningWebView:(WKWebView *)webView localEntryURL:(NSURL *)entryURL{
    _webSizingGeneration++;
    _webSizingInFlight = NO;
    _webSizingPending = NO;
    _sizingWebView = webView;
    _sizingEntryURL = entryURL.isFileURL ? entryURL.URLByStandardizingPath : nil;
    webView.scrollView.byScrollEnabled(!_sizingEntryURL);
    if (!_sizingEntryURL) {
        [webView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(300);
        }];
    }
    self.refreshLearningWebLayout();
}

-(jobsByVoidBlock _Nonnull)refreshLearningWebLayout{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (self && self.sizingWebView) {
            self.updateLearningWebHeight(self.sizingWebView);
        }
    };
}

-(jobsByWKWebViewBlock _Nonnull)updateLearningWebHeight{
    @jobs_weakify(self)
    return ^(WKWebView *webView) {
        @jobs_strongify(self)
        if (!self || !webView || webView != self.sizingWebView || !self.sizingEntryURL ||
            !webView.URL.isFileURL || ![webView.URL.URLByStandardizingPath.path isEqualToString:self.sizingEntryURL.path] ||
            !(webView.bounds.size.width > 0)) {
            return;
        }
        if (self.webSizingInFlight) {
            self->_webSizingPending = YES;
            return;
        }
        self->_webSizingInFlight = YES;
        NSUInteger generation = self.webSizingGeneration;
        // contentSize 至少等于 WK 视口高度；测 body 的自然高度才能在内容缩短后回收留白。
        [webView evaluateJavaScript:@"(()=>{const body=document.body;if(!body)return null;const style=getComputedStyle(body);return {height:body.getBoundingClientRect().height+(parseFloat(style.marginTop)||0)+(parseFloat(style.marginBottom)||0),width:window.innerWidth}})()"
                 completionHandler:^(id result, NSError *error) {
            @jobs_strongify(self)
            if (!self || generation != self.webSizingGeneration || webView != self.sizingWebView) {
                return;
            }
            self->_webSizingInFlight = NO;
            BOOL pending = self.webSizingPending;
            self->_webSizingPending = NO;
            NSDictionary *metrics = [result isKindOfClass:NSDictionary.class] ? result : nil;
            CGFloat height = [metrics[@"height"] isKindOfClass:NSNumber.class] ? [metrics[@"height"] doubleValue] + 1 : 0;
            CGFloat width = [metrics[@"width"] isKindOfClass:NSNumber.class] ? [metrics[@"width"] doubleValue] : 0;
            BOOL trusted = webView.URL.isFileURL && [webView.URL.URLByStandardizingPath.path isEqualToString:self.sizingEntryURL.path];
            BOOL matchingWidth = width > webView.bounds.size.width - 1 && width < webView.bounds.size.width + 1;
            if (!error && trusted && matchingWidth && height > 0 && height < CGFLOAT_MAX &&
                (height > webView.bounds.size.height + 0.5 || height < webView.bounds.size.height - 0.5)) {
                [webView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(height);
                }];
            }
            if (pending) {
                self.refreshLearningWebLayout();
            }
        }];
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMicroLearningBaseVC.class, @selector(jobsLearningViewDidLayoutSubviews)))(self, @selector(jobsLearningViewDidLayoutSubviews));
    if (action) {
        action();
    }
}

-(jobsByVoidBlock _Nonnull)jobsLearningViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [super viewDidLayoutSubviews];
        CGFloat width = self.sizingWebView.bounds.size.width;
        if (width > 0 && width != self.lastWebWidth) {
            self->_lastWebWidth = width;
            self.refreshLearningWebLayout();
        }
    };
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context{
    if (context == &JobsMicroLearningWebContentSizeContext) {
        for (WKWebView *webView in self.learningWebViews) {
            if (webView.scrollView == object) {
                self.updateLearningWebHeight(webView);
                break;
            }
        }
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
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
            .makeNewLineShows(YES)
            .byTitleLabel(^(UILabel *label) {
                label
                    .byLineBreakMode(NSLineBreakByWordWrapping)
                    .byTextAlignment(NSTextAlignmentCenter);
            })
            .onClickBy(action)
            .byAccessibilityIdentifier(identifier);
    });
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_greaterThanOrEqualTo(48);
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

-(void)dealloc{
    if (_contentSizeCategoryObserver) {
        [NSNotificationCenter.defaultCenter removeObserver:_contentSizeCategoryObserver];
    }
    for (WKWebView *webView in _learningWebViews) {
        [webView.scrollView removeObserver:self forKeyPath:@"contentSize" context:&JobsMicroLearningWebContentSizeContext];
    }
}

@end

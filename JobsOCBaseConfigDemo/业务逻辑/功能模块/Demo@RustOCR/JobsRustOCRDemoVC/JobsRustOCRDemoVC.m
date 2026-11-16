//
//  JobsRustOCRDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import "JobsRustOCRDemoVC.h"

@interface JobsRustOCRDemoVC ()

Prop_strong()UIScrollView *pageScrollView;
Prop_strong()UIView *pageContentView;
Prop_strong()UIStackView *inputActionsView;
Prop_strong()UIStackView *recognitionActionsView;
Prop_copy()NSString *actionsLayoutSignature;
Prop_strong()UIImageView *previewView;
Prop_strong()UILabel *informationLabel;
Prop_strong()UILabel *statusLabel;
Prop_strong()UILabel *resultTitleLabel;
Prop_strong()UITextView *resultView;
Prop_strong()UISegmentedControl *formatControl;
Prop_strong()UIButton *sampleButton;
Prop_strong()UIButton *photoButton;
Prop_strong()UIButton *cameraButton;
Prop_strong()UIButton *recognizeButton;
Prop_strong()UIButton *cancelButton;
Prop_strong()UIButton *copyButton;
Prop_strong()UIImagePickerController *cameraPicker;
Prop_strong()UIImage *selectedImage;
Prop_copy()NSDictionary *recognitionResult;
Prop_copy()NSString *statusKey;
Prop_copy()NSString *failureDetail;
Prop_assign()BOOL recognizing;
Prop_assign()NSUInteger requestGeneration;
Prop_assign()NSUInteger inputGeneration;
Prop_assign()CGFloat resultHeight;

@end

@implementation JobsRustOCRDemoVC

-(void)dealloc{
    JobsRemoveNotification(self);
    [JobsThemeCenter.shared unbindObject:self slot:@"JobsRustOCR.presentation"];
    if (_recognizing) {
#if JOBS_RUST_OCR_AVAILABLE
        [JobsRustOCR cancel];
#endif
    }
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
#if JOBS_RUST_OCR_AVAILABLE
    self.selectedImage = [JobsRustOCR sampleImage];
#else
    self.selectedImage = nil;
#endif
#if JOBS_RUST_OCR_AVAILABLE
    self.statusKey = @"OCR：选择图片后开始识别";
#else
    self.statusKey = @"OCR：SDK 尚未就绪";
#endif
    self.inputActionsView.byAlpha(1);
    self.recognitionActionsView.byAlpha(1);
    self.previewView.byImage(self.selectedImage);
    self.informationLabel.byAlpha(1);
    self.statusLabel.byAlpha(1);
    self.sampleButton.byAlpha(1);
    self.photoButton.byAlpha(1);
    self.cameraButton.byAlpha(1);
    self.recognizeButton.byAlpha(1);
    self.cancelButton.byAlpha(1);
    self.copyButton.byAlpha(1);
    self.resultTitleLabel.byAlpha(1);
    self.formatControl.byAlpha(1);
    self.resultView.byAlpha(1);
    @jobs_weakify(self)
    [self addNotificationName:语言切换 block:^(id weakSelf, id arg) {
        @jobs_strongify(self)
        [self refreshPresentation];
    }];
    [self addNotificationName:JobsThemeDidChangeNotification block:^(id weakSelf, id arg) {
        @jobs_strongify(self)
        [self refreshPresentation];
    }];
    [self addNotificationName:UIContentSizeCategoryDidChangeNotification block:^(id weakSelf, id arg) {
        @jobs_strongify(self)
        [self refreshPresentation];
    }];
    [self addNotificationName:UIApplicationDidEnterBackgroundNotification block:^(id weakSelf, id arg) {
        @jobs_strongify(self)
        if (self.recognizing) {
            [self cancelRecognition];
        }
    }];
    [JobsThemeCenter.shared bindObject:self
                                 slot:@"JobsRustOCR.presentation"
                                apply:^(__kindof JobsRustOCRDemoVC *object, JobsThemeCenter *center) {
        [object refreshPresentation];
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self refreshBackButtonTitle];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.isMovingFromParentViewController || self.navigationController.isBeingDismissed) {
        self.inputGeneration += 1;
        [self cancelRecognition];
    }
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.updateActionLayout();
    self.updateResultHeight();
}

-(void)refreshPresentation{
    if (!self.isViewLoaded) {
        return;
    }
    self.byGKNavTitle(@"Rust 离线 OCR".jobsTr());
    [self refreshBackButtonTitle];
    self.view.byBgColor(JobsSystemBackgroundColor);
#if JOBS_RUST_OCR_AVAILABLE
    NSString *version = [JobsRustOCR coreVersion];
#else
    NSString *version = @"OCR：SDK 尚未就绪".jobsTr();
#endif
    UIColor *informationColor = JobsThemeCenter.shared.isDarkMode ? HEXCOLOR(0xB9C2CF) : HEXCOLOR(0x535B68);
    self.informationLabel.byText([NSString stringWithFormat:@"%@\nRust %@", @"OCR：所有识别均在本机完成".jobsTr(), version])
        .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(13)])
        .byTextCor(informationColor);
    self.statusLabel.byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightMediumSize(14)])
        .byTextCor(JobsLabelColor);
    self.resultView.byTextCor(JobsLabelColor)
        .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(16)])
        .byBgColor(JobsSecondarySystemBackgroundColor);
    self.previewView.byBgColor(JobsSecondarySystemBackgroundColor);
    self.resultTitleLabel.byText(@"OCR：识别结果".jobsTr())
        .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(17)])
        .byTextCor(JobsLabelColor);
    self.sampleButton.jobsResetBtnTitle(@"OCR：样本".jobsTr());
    self.photoButton.jobsResetBtnTitle(@"OCR：相册".jobsTr());
    self.cameraButton.jobsResetBtnTitle(@"OCR：拍照".jobsTr());
    self.recognizeButton.jobsResetBtnTitle(@"OCR：开始识别".jobsTr());
    self.cancelButton.jobsResetBtnTitle(@"取消".jobsTr());
    self.copyButton.jobsResetBtnTitle(@"OCR：复制".jobsTr());
    self.sampleButton.byEnabled(!self.recognizing);
    self.photoButton.byEnabled(!self.recognizing);
    self.cameraButton.byEnabled(!self.recognizing);
    self.recognizeButton.byEnabled(!self.recognizing && self.selectedImage != nil);
    self.cancelButton.byEnabled(self.recognizing);
    for (UIButton *button in @[self.sampleButton, self.photoButton, self.cameraButton, self.cancelButton]) {
        [self styleButton:button primary:NO];
    }
    [self styleButton:self.recognizeButton primary:YES];
    [self.formatControl setTitle:@"OCR：文字".jobsTr() forSegmentAtIndex:0];
    [self.formatControl setTitle:@"JSON" forSegmentAtIndex:1];
    UIColor *segmentForeground = JobsThemeCenter.shared.resolvedColorForKey(JobsThemeColorKeyTextPrimary);
    UIColor *segmentBackground = JobsThemeCenter.shared.resolvedColorForKey(JobsThemeColorKeyBackgroundPrimary);
    self.formatControl.backgroundColor = JobsThemeCenter.shared.resolvedColorForKey(JobsThemeColorKeyBackgroundSecondary);
    self.formatControl.selectedSegmentTintColor = segmentForeground;
    UIFont *segmentFont = [UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightMediumSize(14)];
    [self.formatControl setTitleTextAttributes:@{NSForegroundColorAttributeName:segmentForeground, NSFontAttributeName:segmentFont}
                                    forState:UIControlStateNormal];
    [self.formatControl setTitleTextAttributes:@{NSForegroundColorAttributeName:segmentBackground, NSFontAttributeName:segmentFont}
                                    forState:UIControlStateSelected];
    if (self.recognitionResult) {
        NSArray *lines = self.recognitionResult[@"lines"] ?: @[];
        NSNumber *elapsed = self.recognitionResult[@"elapsed_ms"] ?: @0;
        self.statusLabel.byText([NSString stringWithFormat:@"%@ · %.0f ms · %@", @"OCR：识别完成".jobsTr(), elapsed.doubleValue, @(lines.count)]);
    } else if (self.failureDetail.length) {
        self.statusLabel.byText([NSString stringWithFormat:@"%@\n%@", self.statusKey.jobsTr(), self.failureDetail]);
    } else {
        self.statusLabel.byText(self.statusKey.jobsTr());
    }
    [self renderResult];
    self.jobs_ensureDemoThemeButton();
}

-(void)styleButton:(UIButton *)button primary:(BOOL)primary{
    BOOL emphasized = primary && button.enabled;
    JobsThemeCenter *center = JobsThemeCenter.shared;
    UIColor *foreground = center.resolvedColorForKey(emphasized ? JobsThemeColorKeyBackgroundPrimary : JobsThemeColorKeyTextPrimary);
    UIColor *background = center.resolvedColorForKey(emphasized ? JobsThemeColorKeyTextPrimary : JobsThemeColorKeyBackgroundSecondary);
    UIColor *border = center.resolvedColorForKey(emphasized ? JobsThemeColorKeyTextPrimary : JobsThemeColorKeyTextSecondary);
    button.jobsResetBtnTitleFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(14)])
        .jobsResetBtnTitleCor(foreground)
        .jobsResetBtnBgCor(background)
        .jobsResetBtnLayerBorderCor(border)
        .jobsResetBtnLayerBorderWidth(emphasized ? 0 : 0.8)
        .byAlpha(1);
}

-(void)refreshBackButtonTitle{
    UIBarButtonItem *item = self.gk_navLeftBarButtonItem ?: self.gk_navLeftBarButtonItems.firstObject;
    if ([item.customView isKindOfClass:UIButton.class]) {
        ((UIButton *)item.customView)
            .jobsResetBtnTitle(@"返回".jobsTr())
            .byAccessibilityLabel(@"返回".jobsTr())
            .byAccessibilityIdentifier(@"jobs.ocr.back");
    }
}

-(void)renderResult{
    NSString *text = self.recognitionResult[@"text"];
    if (self.formatControl.selectedSegmentIndex == 1 && self.recognitionResult) {
        NSError *error = nil;
        NSData *json = [NSJSONSerialization dataWithJSONObject:self.recognitionResult
                                                     options:NSJSONWritingPrettyPrinted | NSJSONWritingSortedKeys
                                                       error:&error];
        text = json ? [NSString.alloc initWithData:json encoding:NSUTF8StringEncoding] : error.localizedDescription;
    }
    self.resultView.byText(text.length ? text : @"OCR：暂无文字，请选择清晰图片并重新识别".jobsTr());
    self.copyButton.byEnabled(self.recognitionResult != nil && text.length > 0);
    [self styleButton:self.copyButton primary:NO];
    [self.resultView invalidateIntrinsicContentSize];
    self.updateResultHeight();
}

-(jobsByVoidBlock)updateActionLayout{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        CGFloat width = CGRectGetWidth(self.previewView.bounds);
        if (width <= 0) {
            return;
        }
        UIFont *font = [UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(14)];
        NSArray<UIButton *> *buttons = @[self.sampleButton, self.photoButton, self.cameraButton,
                                        self.recognizeButton, self.cancelButton, self.copyButton];
        NSMutableArray<NSString *> *titles = NSMutableArray.array;
        for (UIButton *button in buttons) {
            [titles addObject:button.configuration.title ?: button.currentTitle ?: @""];
        }
        NSString *signature = [NSString stringWithFormat:@"%.1f/%.1f/%@", width, font.pointSize, [titles componentsJoinedByString:@"|"]];
        if ([signature isEqualToString:self.actionsLayoutSignature]) {
            return;
        }
        self.actionsLayoutSignature = signature;
        CGFloat equalWidth = (width - 16) / 3;
        BOOL verticalInputs = NO;
        for (NSString *title in [titles subarrayWithRange:NSMakeRange(0, 3)]) {
            if ([title sizeWithAttributes:@{NSFontAttributeName:font}].width + 16 > equalWidth) {
                verticalInputs = YES;
            }
        }
        self.inputActionsView.byAxis(verticalInputs ? UILayoutConstraintAxisVertical : UILayoutConstraintAxisHorizontal);
        CGFloat inputWidth = verticalInputs ? width : equalWidth;
        CGFloat inputHeight = 44;
        for (NSString *title in [titles subarrayWithRange:NSMakeRange(0, 3)]) {
            CGRect bounds = [title boundingRectWithSize:CGSizeMake(MAX(1, inputWidth - 16), CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName:font}
                                               context:nil];
            inputHeight = MAX(inputHeight, ceil(bounds.size.height) + 16);
        }
        for (UIButton *button in @[self.sampleButton, self.photoButton, self.cameraButton]) {
            [button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(inputHeight);
            }];
        }
        CGFloat startWidth = MIN(width, MAX(164, ceil([titles[3] sizeWithAttributes:@{NSFontAttributeName:font}].width) + 24));
        CGFloat cancelWidth = MIN(width, MAX(88, ceil([titles[4] sizeWithAttributes:@{NSFontAttributeName:font}].width) + 24));
        BOOL verticalActions = startWidth + cancelWidth + 8 > width;
        self.recognitionActionsView.byAxis(verticalActions ? UILayoutConstraintAxisVertical : UILayoutConstraintAxisHorizontal)
            .byAlignment(verticalActions ? UIStackViewAlignmentLeading : UIStackViewAlignmentFill);
        CGFloat actionHeight = 46;
        for (NSUInteger index = 3; index < 5; index++) {
            CGFloat buttonWidth = index == 3 ? startWidth : cancelWidth;
            CGRect bounds = [titles[index] boundingRectWithSize:CGSizeMake(MAX(1, buttonWidth - 16), CGFLOAT_MAX)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:font}
                                                       context:nil];
            actionHeight = MAX(actionHeight, ceil(bounds.size.height) + 16);
        }
        [self.recognizeButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(startWidth);
            make.height.mas_equalTo(actionHeight);
        }];
        [self.cancelButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(cancelWidth);
            make.height.mas_equalTo(actionHeight);
        }];
        CGFloat copyWidth = MIN(width * 0.55, MAX(88, ceil([titles[5] sizeWithAttributes:@{NSFontAttributeName:font}].width) + 16));
        CGRect copyBounds = [titles[5] boundingRectWithSize:CGSizeMake(MAX(1, copyWidth - 16), CGFLOAT_MAX)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:font}
                                                  context:nil];
        CGRect titleBounds = [self.resultTitleLabel.text boundingRectWithSize:CGSizeMake(MAX(1, width - copyWidth - 8), CGFLOAT_MAX)
                                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                                  attributes:@{NSFontAttributeName:self.resultTitleLabel.font}
                                                                     context:nil];
        [self.copyButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(copyWidth);
            make.height.mas_equalTo(MAX(44, ceil(MAX(copyBounds.size.height + 16, titleBounds.size.height))));
        }];
        [self.formatControl mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(MAX(40, ceil(font.lineHeight) + 16));
        }];
    };
}

-(jobsByVoidBlock)updateResultHeight{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        CGFloat width = CGRectGetWidth(self.resultView.bounds);
        if (width <= 0) {
            return;
        }
        CGFloat height = MAX(140, ceil([self.resultView sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)].height));
        if (fabs(height - self.resultHeight) < 0.5) {
            return;
        }
        self.resultHeight = height;
        [self.resultView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];
    };
}

-(void)useSample{
#if JOBS_RUST_OCR_AVAILABLE
    [self replaceImage:[JobsRustOCR sampleImage]];
#endif
}

-(void)replaceImage:(UIImage *)image{
    [self cancelRecognition];
    self.selectedImage = image;
    self.recognitionResult = nil;
    self.failureDetail = nil;
#if JOBS_RUST_OCR_AVAILABLE
    self.statusKey = @"OCR：选择图片后开始识别";
#else
    self.statusKey = @"OCR：SDK 尚未就绪";
#endif
    self.previewView.byImage(image);
    [self refreshPresentation];
}

-(void)choosePhoto{
    PHPickerConfiguration *configuration = [PHPickerConfiguration.alloc init];
    configuration.filter = PHPickerFilter.imagesFilter;
    configuration.selectionLimit = 1;
    PHPickerViewController *picker = [PHPickerViewController.alloc initWithConfiguration:configuration];
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

-(jobsByVoidBlock)takePhoto{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (self.recognizing || self.presentedViewController) {
            return;
        }
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            @"OCR：设备无法使用摄像头".jobsTr().toast();
            return;
        }
        AVAuthorizationStatus authorization = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authorization == AVAuthorizationStatusAuthorized) {
            self.presentCamera();
        } else if (authorization == AVAuthorizationStatusNotDetermined) {
            NSUInteger generation = ++self.inputGeneration;
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    @jobs_strongify(self)
                    if (!self || generation != self.inputGeneration || !self.view.window || self.presentedViewController ||
                        (self.navigationController && self.navigationController.topViewController != self)) {
                        return;
                    }
                    if (granted) {
                        self.presentCamera();
                    } else {
                        @"OCR：请在设置中允许访问相机".jobsTr().toast();
                    }
                });
            }];
        } else {
            @"OCR：请在设置中允许访问相机".jobsTr().toast();
        }
    };
}

-(jobsByVoidBlock)presentCamera{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        self.cameraPicker = jobsMakeImagePickerController(^(__kindof UIImagePickerController *picker) {
            @jobs_strongify(self)
            picker.bySourceType(UIImagePickerControllerSourceTypeCamera)
                .byAllowsEditing(NO)
                .byDelegate(self);
        });
        self.cameraPicker.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:self.cameraPicker animated:YES completion:nil];
    };
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    @jobs_weakify(self)
    [picker dismissViewControllerAnimated:YES completion:^{
        @jobs_strongify(self)
        self.cameraPicker = nil;
        if (image) {
            [self replaceImage:image];
        } else {
            @"OCR：相机照片读取失败".jobsTr().toast();
        }
    }];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    @jobs_weakify(self)
    [picker dismissViewControllerAnimated:YES completion:^{
        @jobs_strongify(self)
        self.cameraPicker = nil;
    }];
}

-(void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results{
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSItemProvider *provider = results.firstObject.itemProvider;
    if (![provider canLoadObjectOfClass:UIImage.class]) {
        return;
    }
    NSUInteger generation = ++self.requestGeneration;
    @jobs_weakify(self)
    [provider loadObjectOfClass:UIImage.class completionHandler:^(id<NSItemProviderReading> object, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (!self || generation != self.requestGeneration) {
                return;
            }
            if ([object isKindOfClass:UIImage.class]) {
                [self replaceImage:(UIImage *)object];
            } else {
                self.statusKey = @"OCR：图片读取失败";
                self.failureDetail = error.localizedDescription;
                [self refreshPresentation];
            }
        });
    }];
}

-(void)runRecognition{
    if (self.recognizing || !self.selectedImage) {
        return;
    }
    self.recognizing = YES;
    self.recognitionResult = nil;
    self.failureDetail = nil;
    self.statusKey = @"OCR：正在识别，请稍候";
    NSUInteger generation = ++self.requestGeneration;
    [self refreshPresentation];
    @jobs_weakify(self)
#if JOBS_RUST_OCR_AVAILABLE
    [JobsRustOCR recognizeImage:self.selectedImage completion:^(NSDictionary *result, NSError *error) {
        @jobs_strongify(self)
        if (!self || generation != self.requestGeneration) {
            return;
        }
        self.recognizing = NO;
        self.recognitionResult = error ? nil : result;
        self.statusKey = error ? @"OCR：识别失败，可重新尝试" : @"OCR：识别完成";
        self.failureDetail = error.localizedDescription;
        [self refreshPresentation];
    }];
#else
    self.recognizing = NO;
    self.statusKey = @"OCR：SDK 尚未就绪";
    [self refreshPresentation];
#endif
}

-(void)cancelRecognition{
    self.requestGeneration += 1;
    if (self.recognizing) {
#if JOBS_RUST_OCR_AVAILABLE
        [JobsRustOCR cancel];
#endif
        self.recognizing = NO;
        self.statusKey = @"OCR：已取消识别";
        self.failureDetail = nil;
        [self refreshPresentation];
    }
}

-(void)copyResult{
    if (!self.recognitionResult || !self.copyButton.enabled) {
        return;
    }
    UIPasteboard.generalPasteboard.string = self.resultView.text;
    @"OCR：结果已复制".jobsTr().toast();
}

#pragma mark —— lazyLoad

-(UIScrollView *)pageScrollView{
    if (!_pageScrollView) {
        _pageScrollView = jobsMakeScrollView(^(__kindof UIScrollView *scrollView) {
            scrollView.byAlwaysBounceVertical(YES)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
        }).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        });
        _pageScrollView.accessibilityIdentifier = @"jobs.ocr.page";
    }
    return _pageScrollView;
}

-(UIView *)pageContentView{
    if (!_pageContentView) {
        _pageContentView = jobsMakeView(^(__kindof UIView *view) {
            view.byAccessibilityIdentifier(@"jobs.ocr.content");
        }).addOn(self.pageScrollView).byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.pageScrollView);
            make.width.equalTo(self.pageScrollView);
        });
    }
    return _pageContentView;
}

-(UIStackView *)inputActionsView{
    if (!_inputActionsView) {
        _inputActionsView = jobsMakeStackView(^(__kindof UIStackView *stack) {
            stack.byAxis(UILayoutConstraintAxisHorizontal)
                .byAlignment(UIStackViewAlignmentFill)
                .byDistribution(UIStackViewDistributionFillEqually)
                .bySpacing(8);
        }).addOn(self.pageContentView).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.previewView.mas_bottom).offset(12);
            make.left.right.equalTo(self.previewView);
        });
        [_inputActionsView addArrangedSubview:self.sampleButton];
        [_inputActionsView addArrangedSubview:self.photoButton];
        [_inputActionsView addArrangedSubview:self.cameraButton];
    }
    return _inputActionsView;
}

-(UIStackView *)recognitionActionsView{
    if (!_recognitionActionsView) {
        _recognitionActionsView = jobsMakeStackView(^(__kindof UIStackView *stack) {
            stack.byAxis(UILayoutConstraintAxisHorizontal)
                .byAlignment(UIStackViewAlignmentFill)
                .bySpacing(8);
        }).addOn(self.pageContentView).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputActionsView.mas_bottom).offset(12);
            make.left.equalTo(self.previewView);
            make.right.lessThanOrEqualTo(self.previewView);
        });
        [_recognitionActionsView addArrangedSubview:self.recognizeButton];
        [_recognitionActionsView addArrangedSubview:self.cancelButton];
    }
    return _recognitionActionsView;
}

-(UIImageView *)previewView{
    if (!_previewView) {
        _previewView = jobsMakeImageView(^(__kindof UIImageView *view) {
            view.byContentMode(UIViewContentModeScaleAspectFit);
        }).addOn(self.pageContentView).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.pageContentView).offset(12);
            make.left.right.equalTo(self.pageContentView).inset(16);
            make.height.equalTo(self.view.mas_height).multipliedBy(0.23).priority(750);
            make.height.greaterThanOrEqualTo(@180);
            make.height.lessThanOrEqualTo(@240);
        });
        _previewView.accessibilityIdentifier = @"jobs.ocr.preview";
    }
    return _previewView;
}

-(UILabel *)informationLabel{
    if (!_informationLabel) {
        _informationLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byNumberOfLines(0)
                .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(13)]);
        }).addOn(self.pageContentView).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.statusLabel.mas_bottom).offset(6);
            make.left.right.equalTo(self.previewView);
        });
    }
    return _informationLabel;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byNumberOfLines(0)
                .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightMediumSize(14)]);
        }).addOn(self.pageContentView).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.recognitionActionsView.mas_bottom).offset(12);
            make.left.right.equalTo(self.previewView);
        });
        _statusLabel.accessibilityIdentifier = @"jobs.ocr.status";
    }
    return _statusLabel;
}

-(UILabel *)resultTitleLabel{
    if (!_resultTitleLabel) {
        _resultTitleLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byNumberOfLines(0)
                .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(17)]);
        }).addOn(self.pageContentView).byAdd(^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.copyButton);
            make.left.equalTo(self.previewView);
            make.right.lessThanOrEqualTo(self.copyButton.mas_left).offset(-8);
        });
    }
    return _resultTitleLabel;
}

-(UIButton *)buttonWithIdentifier:(NSString *)identifier action:(jobsByBtnBlock)action{
    UIButton *button = jobsMakeButton(^(__kindof UIButton *button) {
        button.jobsResetBtnTitleFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(14)])
            .jobsResetBtnCornerRadiusValue(10)
            .jobsUpdateButtonConfigurationBy(^(UIButtonConfiguration *configuration) {
                configuration.byContentInsets(NSDirectionalEdgeInsetsMake(8, 8, 8, 8))
                    .byTitleLineBreakMode(NSLineBreakByWordWrapping);
            })
            .onClickBy(action);
    });
    button.accessibilityIdentifier = identifier;
    return button;
}

-(UIButton *)sampleButton{
    if (!_sampleButton) {
        @jobs_weakify(self)
        _sampleButton = [self buttonWithIdentifier:@"jobs.ocr.sample" action:^(UIButton *button) {
            @jobs_strongify(self)
            [self useSample];
        }].byAdd(^(MASConstraintMaker *make) {
            make.height.mas_equalTo(44);
        });
    }
    return _sampleButton;
}

-(UIButton *)photoButton{
    if (!_photoButton) {
        @jobs_weakify(self)
        _photoButton = [self buttonWithIdentifier:@"jobs.ocr.photo" action:^(UIButton *button) {
            @jobs_strongify(self)
            [self choosePhoto];
        }].byAdd(^(MASConstraintMaker *make) {
            make.height.mas_equalTo(44);
        });
    }
    return _photoButton;
}

-(UIButton *)cameraButton{
    if (!_cameraButton) {
        @jobs_weakify(self)
        _cameraButton = [self buttonWithIdentifier:@"jobs.ocr.camera" action:^(UIButton *button) {
            @jobs_strongify(self)
            self.takePhoto();
        }].byAdd(^(MASConstraintMaker *make) {
            make.height.mas_equalTo(44);
        });
    }
    return _cameraButton;
}

-(UIButton *)recognizeButton{
    if (!_recognizeButton) {
        @jobs_weakify(self)
        _recognizeButton = [self buttonWithIdentifier:@"jobs.ocr.recognize" action:^(UIButton *button) {
            @jobs_strongify(self)
            [self runRecognition];
        }].byAdd(^(MASConstraintMaker *make) {
            make.width.mas_equalTo(164);
            make.height.mas_equalTo(46);
        });
    }
    return _recognizeButton;
}

-(UIButton *)cancelButton{
    if (!_cancelButton) {
        @jobs_weakify(self)
        _cancelButton = [self buttonWithIdentifier:@"jobs.ocr.cancel" action:^(UIButton *button) {
            @jobs_strongify(self)
            [self cancelRecognition];
        }].byAdd(^(MASConstraintMaker *make) {
            make.width.mas_equalTo(88);
            make.height.mas_equalTo(46);
        });
    }
    return _cancelButton;
}

-(UIButton *)copyButton{
    if (!_copyButton) {
        @jobs_weakify(self)
        _copyButton = [self buttonWithIdentifier:@"jobs.ocr.copy" action:^(UIButton *button) {
            @jobs_strongify(self)
            [self copyResult];
        }].addOn(self.pageContentView).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.informationLabel.mas_bottom).offset(16);
            make.right.equalTo(self.previewView);
            make.width.mas_equalTo(132);
            make.height.mas_equalTo(44);
        });
    }
    return _copyButton;
}

-(UISegmentedControl *)formatControl{
    if (!_formatControl) {
        _formatControl = jobsMakeSegmentedControl(@[@"", @"JSON"], ^(__kindof UISegmentedControl *control) {
            control.bySelectedSegmentIndex(0);
        }).addOn(self.pageContentView).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.copyButton.mas_bottom).offset(8);
            make.left.right.equalTo(self.previewView);
            make.height.mas_equalTo(40);
        });
        [_formatControl addTarget:self action:@selector(renderResult) forControlEvents:UIControlEventValueChanged];
    }
    return _formatControl;
}

-(UITextView *)resultView{
    if (!_resultView) {
        _resultView = jobsMakeTextView(^(__kindof UITextView *view) {
            view.byEditable(NO)
                .bySelectable(YES)
                .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(16)])
                .byTextContainerInset(UIEdgeInsetsMake(12, 12, 12, 12))
                .byScrollEnabled(NO);
        }).addOn(self.pageContentView).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.formatControl.mas_bottom).offset(8);
            make.left.right.equalTo(self.previewView);
            make.bottom.equalTo(self.pageContentView).offset(-20);
            make.height.mas_equalTo(140);
        });
        _resultView.accessibilityIdentifier = @"jobs.ocr.result";
    }
    return _resultView;
}

@end

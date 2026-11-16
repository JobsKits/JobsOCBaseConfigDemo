//
//  JobsRustOCRDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import "JobsRustOCRDemoVC.h"

@interface JobsRustOCRDemoVC ()

Prop_strong()UIImageView *previewView;
Prop_strong()UILabel *informationLabel;
Prop_strong()UILabel *statusLabel;
Prop_strong()UITextView *resultView;
Prop_strong()UISegmentedControl *formatControl;
Prop_strong()UIButton *sampleButton;
Prop_strong()UIButton *photoButton;
Prop_strong()UIButton *recognizeButton;
Prop_strong()UIButton *cancelButton;
Prop_strong()UIButton *copyButton;
Prop_strong()UIImage *selectedImage;
Prop_copy()NSDictionary *recognitionResult;
Prop_copy()NSString *statusKey;
Prop_copy()NSString *failureDetail;
Prop_assign()BOOL recognizing;
Prop_assign()NSUInteger requestGeneration;

@end

@implementation JobsRustOCRDemoVC

-(void)dealloc{
    JobsRemoveNotification(self);
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
    self.previewView.byImage(self.selectedImage);
    self.informationLabel.byAlpha(1);
    self.statusLabel.byAlpha(1);
    self.sampleButton.byAlpha(1);
    self.photoButton.byAlpha(1);
    self.recognizeButton.byAlpha(1);
    self.cancelButton.byAlpha(1);
    self.copyButton.byAlpha(1);
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
    [self addNotificationName:UIApplicationDidEnterBackgroundNotification block:^(id weakSelf, id arg) {
        @jobs_strongify(self)
        if (self.recognizing) {
            [self cancelRecognition];
        }
    }];
    [self refreshPresentation];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self refreshBackButtonTitle];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.isMovingFromParentViewController || self.navigationController.isBeingDismissed) {
        [self cancelRecognition];
    }
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
    self.informationLabel.byText([NSString stringWithFormat:@"%@\nRust %@", @"OCR：所有识别均在本机完成".jobsTr(), version])
        .byTextCor(JobsSecondaryLabelColor);
    self.statusLabel.byTextCor(JobsLabelColor);
    self.resultView.byTextCor(JobsLabelColor)
        .byBgColor(JobsSecondarySystemBackgroundColor);
    self.sampleButton.jobsResetBtnTitle(@"OCR：内置样本".jobsTr());
    self.photoButton.jobsResetBtnTitle(@"OCR：选择照片".jobsTr());
    self.recognizeButton.jobsResetBtnTitle(@"OCR：开始识别".jobsTr());
    self.cancelButton.jobsResetBtnTitle(@"取消".jobsTr());
    self.copyButton.jobsResetBtnTitle(@"OCR：复制结果".jobsTr());
    for (UIButton *button in @[self.sampleButton, self.photoButton, self.recognizeButton, self.cancelButton, self.copyButton]) {
        button.jobsResetBtnTitleCor(JobsLabelColor)
            .jobsResetBtnBgCor(JobsSecondarySystemBackgroundColor);
    }
    self.sampleButton.byEnabled(!self.recognizing);
    self.photoButton.byEnabled(!self.recognizing);
    self.recognizeButton.byEnabled(!self.recognizing && self.selectedImage != nil);
    self.cancelButton.byEnabled(self.recognizing);
    self.copyButton.byEnabled(self.recognitionResult != nil);
    [self.formatControl setTitle:@"OCR：文字".jobsTr() forSegmentAtIndex:0];
    [self.formatControl setTitle:@"JSON" forSegmentAtIndex:1];
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
    if (!self.recognitionResult) {
        return;
    }
    UIPasteboard.generalPasteboard.string = self.resultView.text;
    @"OCR：结果已复制".jobsTr().toast();
}

#pragma mark —— lazyLoad

-(UIImageView *)previewView{
    if (!_previewView) {
        _previewView = jobsMakeImageView(^(__kindof UIImageView *view) {
            view.byContentMode(UIViewContentModeScaleAspectFit);
        }).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(12);
            make.left.right.equalTo(self.view).inset(16);
            make.height.equalTo(self.view.mas_height).multipliedBy(0.23);
        });
        _previewView.accessibilityIdentifier = @"jobs.ocr.preview";
    }
    return _previewView;
}

-(UILabel *)informationLabel{
    if (!_informationLabel) {
        _informationLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byNumberOfLines(0).byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(13)]);
        }).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.previewView.mas_bottom).offset(8);
            make.left.right.equalTo(self.previewView);
        });
    }
    return _informationLabel;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byNumberOfLines(0).byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(14)]);
        }).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.informationLabel.mas_bottom).offset(8);
            make.left.right.equalTo(self.previewView);
        });
        _statusLabel.accessibilityIdentifier = @"jobs.ocr.status";
    }
    return _statusLabel;
}

-(UIButton *)buttonWithIdentifier:(NSString *)identifier action:(jobsByBtnBlock)action{
    UIButton *button = jobsMakeButton(^(__kindof UIButton *button) {
        button.jobsResetBtnTitleFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightSemiboldSize(14)])
            .jobsResetBtnCornerRadiusValue(10)
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
        }].addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.statusLabel.mas_bottom).offset(8);
            make.left.equalTo(self.previewView);
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
        }].addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.height.width.equalTo(self.sampleButton);
            make.left.equalTo(self.sampleButton.mas_right).offset(8);
            make.right.equalTo(self.previewView);
        });
    }
    return _photoButton;
}

-(UIButton *)recognizeButton{
    if (!_recognizeButton) {
        @jobs_weakify(self)
        _recognizeButton = [self buttonWithIdentifier:@"jobs.ocr.recognize" action:^(UIButton *button) {
            @jobs_strongify(self)
            [self runRecognition];
        }].addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.sampleButton.mas_bottom).offset(8);
            make.left.width.equalTo(self.sampleButton);
            make.height.mas_equalTo(44);
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
        }].addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.height.equalTo(self.recognizeButton);
            make.left.width.equalTo(self.photoButton);
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
        }].addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.recognizeButton.mas_bottom).offset(8);
            make.left.width.equalTo(self.sampleButton);
            make.height.mas_equalTo(44);
        });
    }
    return _copyButton;
}

-(UISegmentedControl *)formatControl{
    if (!_formatControl) {
        _formatControl = jobsMakeSegmentedControl(@[@"", @"JSON"], ^(__kindof UISegmentedControl *control) {
            control.bySelectedSegmentIndex(0);
        }).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.height.equalTo(self.copyButton);
            make.left.width.equalTo(self.photoButton);
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
                .byTextContainerInset(UIEdgeInsetsMake(12, 12, 12, 12));
        }).addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.copyButton.mas_bottom).offset(8);
            make.left.right.equalTo(self.previewView);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-12);
            make.height.greaterThanOrEqualTo(@80).priority(999);
        });
        _resultView.accessibilityIdentifier = @"jobs.ocr.result";
    }
    return _resultView;
}

@end

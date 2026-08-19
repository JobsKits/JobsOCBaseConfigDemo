//
//  JobsScreenshotProtectionView.m
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsScreenshotProtectionView.h"

@interface JobsScreenshotProtectionView ()

Prop_strong()UITextField *secureTextField;
Prop_strong(readwrite)UIView *contentView;
Prop_assign(readwrite,getter=isProtectionAvailable)BOOL protectionAvailable;

-(jobsByVoidBlock _Nonnull)configureSecureContainer;
-(JobsRetViewByVoidBlock _Nonnull)secureCanvasView;
-(JobsRetIDByIDBlock _Nonnull)byContentView;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsScreenshotProtectionView
@interface JobsScreenshotProtectionView (JobsPropertyDSLSetterAutogen_2e31597917)
-(void)setProtectionAvailable:(BOOL)data;
-(void)setProtectionEnabled:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsScreenshotProtectionView

@implementation JobsScreenshotProtectionView

-(JobsRetIDByIDBlock _Nonnull)byContentView{
    @jobs_weakify(self)
    return ^id(UIView *contentView){
        @jobs_strongify(self)
        self.contentView = contentView;
        return self;
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.configureSecureContainer();
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.configureSecureContainer();
    };return self;
}

-(BOOL)isProtectionEnabled{
    return self.secureTextField.isSecureTextEntry && self.isProtectionAvailable;
}

-(void)setProtectionEnabled:(BOOL)protectionEnabled{
    self.secureTextField.bySecureTextEntry(protectionEnabled && self.isProtectionAvailable);
}

-(jobsByVoidBlock _Nonnull)configureSecureContainer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byBgColor(JobsClearColor)
            .byClipsToBounds(YES);
        self.secureTextField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byText(@" ")
                .byTextCor(JobsClearColor)
                .byBorderStyle(UITextBorderStyleNone)
                .bySecureTextEntry(YES)
                .byTintColor(JobsClearColor)
                .byBgColor(JobsClearColor)
                .byUserInteractionEnabled(YES);
        });
        [self addSubview:self.secureTextField];
        [self.secureTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [self.secureTextField layoutIfNeeded];

        UIView *secureCanvasView = self.secureCanvasView();
        self.byContentView(jobsMakeView(^(__unused __kindof UIView * _Nullable view) {}));
        if (secureCanvasView) {
            secureCanvasView.byBgColor(JobsClearColor)
                .byUserInteractionEnabled(YES);
            [secureCanvasView addSubview:self.contentView];
            [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(secureCanvasView);
            }];
            self.byProtectionAvailable(YES);
        }else{
            [self addSubview:self.contentView];
            [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
            self.secureTextField.bySecureTextEntry(NO);
            self.byProtectionAvailable(NO);
        }
    };
}

-(JobsRetViewByVoidBlock _Nonnull)secureCanvasView{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        for (UIView *subview in self.secureTextField.subviews) {
            if ([NSStringFromClass(subview.class) containsString:@"CanvasView"]) return subview;
        };return self.secureTextField.subviews.firstObject;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsScreenshotProtectionView
-(JobsRetJobsScreenshotProtectionViewByBOOLBlock _Nonnull)byProtectionAvailable{
    @jobs_weakify(self)
    return ^__kindof JobsScreenshotProtectionView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setProtectionAvailable:data];
        return self;
    };
}

-(JobsRetJobsScreenshotProtectionViewByBOOLBlock _Nonnull)byProtectionEnabled{
    @jobs_weakify(self)
    return ^__kindof JobsScreenshotProtectionView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setProtectionEnabled:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsScreenshotProtectionView
@end

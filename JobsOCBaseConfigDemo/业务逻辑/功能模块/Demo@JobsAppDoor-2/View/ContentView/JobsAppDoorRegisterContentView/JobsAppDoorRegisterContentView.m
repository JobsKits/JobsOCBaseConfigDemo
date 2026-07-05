//
//  JobsAppDoorRegisterContentView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorRegisterContentView.h"

@class JobsAppDoorDoorInputViewBaseStyle;

@interface JobsAppDoorRegisterContentView ()
/// UI
Prop_strong()BaseButton *backToLoginBtn;// 返回登录
Prop_strong()UILabel *titleLab;// 标题
Prop_strong()BaseButton *sendBtn;// 注册按钮
/// Data
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*registerDoorInputViewBaseStyleModelMutArr;
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*registerDoorInputViewBaseStyleMutArr;

@end

@implementation JobsAppDoorRegisterContentView

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark —— Lifecycle
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(Cor1);
//        @jobs_weakify(self)
        [self addNotificationName:@"textFieldTag"
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
//            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:UITextField.class]){
                UITextField *b = notification.object;
                JobsLog(@"木头 = %@",b.requestParams);
            }JobsLog(@"通知传递过来的 = %@",notification.object);
        }];
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self refreshRegisterLayout];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark —— JobsDoorInputViewProtocol
-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)getAppDoorInputViewBaseStyle{
    return self.registerDoorInputViewBaseStyleMutArr;
}
#pragma mark —— BaseViewProtocol
/// 外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.backToLoginBtn.byAlpha(0.7f);
        self.titleLab.byAlpha(1);
        self.makeInputView();
        self.sendBtn.byAlpha(1);
        [self refreshRegisterLayout];
    };
}
#pragma mark —— 一些私有化方法
-(CGFloat)registerSideRailWidth{
    return RegisterBtnWidth;
}

-(CGFloat)registerFormLeft{
    return self.registerSideRailWidth + JobsWidth(20);
}

-(CGFloat)registerFormWidth{
    return MAX(JobsWidth(180), self.width - self.registerSideRailWidth - JobsWidth(40));
}

-(CGFloat)registerFormCenterX{
    return self.registerFormLeft + self.registerFormWidth / 2;
}

-(void)refreshRegisterLayout{
    if (self.width <= 0 || self.height <= 0) return;

    CGFloat sideRailWidth = self.registerSideRailWidth;
    CGFloat formLeft = self.registerFormLeft;
    CGFloat formWidth = self.registerFormWidth;
    CGFloat formCenterX = self.registerFormCenterX;

    self.backToLoginBtn.frame = CGRectMake(0, 0, sideRailWidth, self.height);

    [self.titleLab sizeToFit];
    self.titleLab.centerX = formCenterX;
    self.titleLab.top = JobsWidth(20);

    [self.registerDoorInputViewBaseStyleMutArr enumerateObjectsUsingBlock:^(JobsAppDoorInputViewBaseStyle * _Nonnull obj,
                                                                            NSUInteger idx,
                                                                            BOOL * _Nonnull stop) {
        obj.sizer = CGSizeMake(formWidth, ThingsHeight);
        obj.x = formLeft;
        if (idx == 0) {
            obj.top = self.titleLab.bottom + JobsWidth(20);
        }else{
            JobsAppDoorInputViewBaseStyle *lastObj = self.registerDoorInputViewBaseStyleMutArr[idx - 1];
            obj.top = lastObj.bottom + InputViewOffset;
        }
        obj.layer.cornerRadius = ThingsHeight / 2;
        obj.layer.masksToBounds = YES;
        obj.byAlpha(1);
    }];

    self.sendBtn.frame = CGRectMake(formLeft,
                                    self.height - JobsWidth(20) - ThingsHeight,
                                    formWidth,
                                    ThingsHeight);

    self.backToLoginBtn.byAlpha(.7f);
    self.titleLab.byAlpha(1);
    self.sendBtn.byAlpha(1);

    [self bringSubviewToFront:self.backToLoginBtn];
    [self bringSubviewToFront:self.titleLab];
    [self.registerDoorInputViewBaseStyleMutArr enumerateObjectsUsingBlock:^(JobsAppDoorInputViewBaseStyle * _Nonnull obj,
                                                                            NSUInteger idx,
                                                                            BOOL * _Nonnull stop) {
        [self bringSubviewToFront:obj];
    }];
    [self bringSubviewToFront:self.sendBtn];
}

-(jobsByVoidBlock _Nonnull)makeInputView{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if (self.registerDoorInputViewBaseStyleMutArr.count) return;
        for (int i = 0; i < self.registerDoorInputViewBaseStyleModelMutArr.count; i++) {
            JobsAppDoorInputViewBaseStyle *inputViewBaseStyle = nil;
            {
                if (i == 0 || i == 1 || i == 2) {
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_3.class);
                }else if (i == 3){
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_1.class);
                }else if (i == 4){
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_4.class);
                }
            }
            if (!inputViewBaseStyle) continue;
            inputViewBaseStyle.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);//进数据
            [self addSubview:inputViewBaseStyle];
        }
        [self refreshRegisterLayout];
        [self layoutIfNeeded];
    };
}

-(JobsRetAppDoorInputViewBaseStyleByClassBlock _Nonnull)dk{
    return ^JobsAppDoorInputViewBaseStyle *_Nullable(Class _Nonnull cls){
        if ([cls isSubclassOfClass:JobsAppDoorInputViewBaseStyle.class]) {
            JobsAppDoorInputViewBaseStyle *inputView = cls.new;
            [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
            @jobs_weakify(self)
            [inputView actionObjBlock:^(id data) {
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(data);
            }];return inputView;
        };return nil;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)backToLoginBtn{
    if (!_backToLoginBtn) {
        @jobs_weakify(self)
        _backToLoginBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
            .jobsResetImagePadding(JobsWidth(8))
            .jobsResetBtnImage(@"AppDoorBackLogin".img ? : @"Lock".img)
            .jobsResetBtnTitleCor(Cor1)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .jobsResetBtnTitle(Title1)
            .byTitleLabel(^(UILabel *label) {
                label.byNumberOfLines(0);
            })
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                self.byEndEditing(YES);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self);
        self.byLayoutIfNeeded();
    };return _backToLoginBtn;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(Title6)
                .byTextCor(JobsWhiteColor)
                .byFont(UIFontWeightRegularSize(20))
                .bySizeToFit()
                .addOn(self)
                .byCenterX((self.width + self.backToLoginBtn.width) / 2)
                .byTop(20);
        });
    };return _titleLab;
}

-(UIButton *)sendBtn{
    if (!_sendBtn) {
        @jobs_weakify(self)
        _sendBtn = (BaseButton *)BaseButton.jobsInit()
            .bgColorBy(JobsSystemPinkColor.colorWithAlphaComponentBy(0.7))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(16))
            .jobsResetBtnTitle(Title6)
            .jobsResetBtnCornerRadiusValue(ThingsHeight / 2)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                [self endEditing:YES];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .buttonAutoWidthByFont()
            .addOn(self);
    };return _sendBtn;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)registerDoorInputViewBaseStyleModelMutArr{
    if (!_registerDoorInputViewBaseStyleModelMutArr) {
        _registerDoorInputViewBaseStyleModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            UIImage *userIcon = @"用户名称".img ? : @"用户名".img;
            UIImage *lockIcon = @"Lock".img ? : @"codeDecode".img;
            UIImage *verifyIcon = @"AppDoorVerifyCode".img ? : @"验证ICON".img ? : lockIcon;
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 用户名) {
                用户名.leftViewIMG = userIcon;
                用户名.placeholder = @"用户名";
                用户名.isShowDelBtn = YES;
                用户名.isShowSecurityBtn = NO;
                用户名.returnKeyType = UIReturnKeyDone;
                用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
                用户名.leftViewMode = UITextFieldViewModeAlways;
            }));
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码.leftViewIMG = lockIcon;
                密码.placeholder = @"密码";
                密码.isShowDelBtn = YES;
                密码.isShowSecurityBtn = YES;
                密码.returnKeyType = UIReturnKeyDone;
                密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                密码.selectedSecurityBtnIMG = @"codeEncode".img;//闭眼
                密码.unSelectedSecurityBtnIMG = @"codeDecode".img;//开眼
                密码.leftViewMode = UITextFieldViewModeAlways;
            }));
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 确认密码) {
                确认密码.leftViewIMG = lockIcon;
                确认密码.placeholder = @"确认密码";
                确认密码.isShowDelBtn = YES;
                确认密码.isShowSecurityBtn = YES;
                确认密码.returnKeyType = UIReturnKeyDone;
                确认密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                确认密码.selectedSecurityBtnIMG = @"codeEncode".img;//闭眼
                确认密码.unSelectedSecurityBtnIMG =@"codeDecode".img;//开眼
                确认密码.leftViewMode = UITextFieldViewModeAlways;
            }));
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 手机验证码) {
                手机验证码.leftViewIMG = verifyIcon;
                手机验证码.placeholder = @"手机验证码";
                手机验证码.isShowDelBtn = YES;
                手机验证码.isShowSecurityBtn = NO;
                手机验证码.returnKeyType = UIReturnKeyDone;
                手机验证码.keyboardAppearance = UIKeyboardAppearanceAlert;
                手机验证码.leftViewMode = UITextFieldViewModeAlways;
            }));
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 图形验证码) {
                图形验证码.leftViewIMG = verifyIcon;
                图形验证码.placeholder = @"图形验证码";
                图形验证码.isShowDelBtn = YES;
                图形验证码.isShowSecurityBtn = NO;
                图形验证码.returnKeyType = UIReturnKeyDone;
                图形验证码.keyboardAppearance = UIKeyboardAppearanceAlert;
                图形验证码.leftViewMode = UITextFieldViewModeAlways;
            }));
        });
    };return _registerDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)registerDoorInputViewBaseStyleMutArr{
    if (!_registerDoorInputViewBaseStyleMutArr) {
        _registerDoorInputViewBaseStyleMutArr = NSMutableArray.array;
    };return _registerDoorInputViewBaseStyleMutArr;
}

@end

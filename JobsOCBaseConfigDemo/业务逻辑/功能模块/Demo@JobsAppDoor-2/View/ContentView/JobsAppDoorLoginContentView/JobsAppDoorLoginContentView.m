//
//  JobsAppDoorLoginContentView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorLoginContentView.h"

@interface JobsAppDoorLoginContentView ()
/// UI
Prop_strong()BaseButton *toRegisterBtn;/// 去注册
Prop_strong()UILabel *titleLab;/// 标题
Prop_strong()BaseButton *abandonLoginBtn;/// 返回首页按钮
Prop_strong()BaseButton *sendBtn;/// 登录
Prop_strong()BaseButton *storeCodeBtn;/// 记住密码
Prop_strong()BaseButton *findCodeBtn;/// 忘记密码
/// Data
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*loginDoorInputViewBaseStyleModelMutArr;
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*loginDoorInputViewBaseStyleMutArr;

@end

@implementation JobsAppDoorLoginContentView

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
    [self refreshLoginLayout];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark —— 一些私有化方法
-(CGFloat)loginSideRailWidth{
    return btnWidth;
}

-(CGFloat)loginFormWidth{
    return MAX(JobsWidth(180), self.width - self.loginSideRailWidth - JobsWidth(40));
}

-(CGFloat)loginFormCenterX{
    return JobsWidth(20) + self.loginFormWidth / 2;
}

-(void)refreshLoginLayout{
    if (self.width <= 0 || self.height <= 0) return;

    CGFloat sideRailWidth = self.loginSideRailWidth;
    CGFloat formWidth = self.loginFormWidth;
    CGFloat formLeft = JobsWidth(20);
    CGFloat formCenterX = self.loginFormCenterX;

    self.toRegisterBtn.frame = CGRectMake(self.width - sideRailWidth, 0, sideRailWidth, self.height);

    [self.titleLab sizeToFit];
    self.titleLab.centerX = formCenterX;
    self.titleLab.top = JobsWidth(20);

    [self.loginDoorInputViewBaseStyleMutArr enumerateObjectsUsingBlock:^(JobsAppDoorInputViewBaseStyle * _Nonnull obj,
                                                                         NSUInteger idx,
                                                                         BOOL * _Nonnull stop) {
        obj.sizer = CGSizeMake(formWidth, ThingsHeight);
        obj.x = formLeft;
        if (idx == 0) {
            obj.top = self.titleLab.bottom + JobsWidth(20);
        }else{
            JobsAppDoorInputViewBaseStyle *lastObj = self.loginDoorInputViewBaseStyleMutArr[idx - 1];
            obj.top = lastObj.bottom + InputViewOffset;
        }
        obj.layer.cornerRadius = ThingsHeight / 2;
        obj.layer.masksToBounds = YES;
        obj.byAlpha(1);
    }];

    self.sendBtn.frame = CGRectMake(formLeft,
                                    self.height - JobsWidth(60) - ThingsHeight,
                                    formWidth,
                                    ThingsHeight);

    [self.abandonLoginBtn.titleLabel sizeToFit];
    self.abandonLoginBtn.sizer = CGSizeMake(MAX(JobsWidth(90), self.abandonLoginBtn.titleLabel.width + JobsWidth(20)),
                                            JobsWidth(20));
    self.abandonLoginBtn.centerX = formCenterX;
    self.abandonLoginBtn.bottom = self.height - JobsWidth(28);

    JobsAppDoorInputViewBaseStyle *lastInputView = self.loginDoorInputViewBaseStyleMutArr.lastObject;
    if (lastInputView) {
        self.storeCodeBtn.frame = CGRectMake(lastInputView.x + JobsWidth(17),
                                             lastInputView.bottom + JobsWidth(22),
                                             JobsWidth(112),
                                             JobsWidth(28));
        self.findCodeBtn.frame = CGRectMake(lastInputView.right - JobsWidth(118) - JobsWidth(17),
                                            lastInputView.bottom + JobsWidth(22),
                                            JobsWidth(118),
                                            JobsWidth(28));
    }

    self.toRegisterBtn.byAlpha(.7f);
    self.titleLab.byAlpha(1);
    self.abandonLoginBtn.byAlpha(1);
    self.sendBtn.byAlpha(1);
    self.storeCodeBtn.byAlpha(1);
    self.findCodeBtn.byAlpha(1);

    [self bringSubviewToFront:self.toRegisterBtn];
    [self bringSubviewToFront:self.titleLab];
    [self.loginDoorInputViewBaseStyleMutArr enumerateObjectsUsingBlock:^(JobsAppDoorInputViewBaseStyle * _Nonnull obj,
                                                                         NSUInteger idx,
                                                                         BOOL * _Nonnull stop) {
        [self bringSubviewToFront:obj];
    }];
    [self bringSubviewToFront:self.storeCodeBtn];
    [self bringSubviewToFront:self.findCodeBtn];
    [self bringSubviewToFront:self.sendBtn];
    [self bringSubviewToFront:self.abandonLoginBtn];
}

-(void)makeInputView{
    if (self.loginDoorInputViewBaseStyleMutArr.count) return;
    for (int i = 0; i < self.loginDoorInputViewBaseStyleModelMutArr.count; i++) {
        JobsAppDoorInputViewBaseStyle_3 *inputView = JobsAppDoorInputViewBaseStyle_3.new;
        [self.loginDoorInputViewBaseStyleMutArr addObject:inputView];
        inputView.jobsRichViewByModel(self.loginDoorInputViewBaseStyleModelMutArr[i]);
        @jobs_weakify(self)
        [inputView actionObjBlock:^(id data) {
            @jobs_strongify(self)
            if (self.objBlock) self.objBlock(data);//data：监测输入字符回调 和 激活的textField
        }];

        [self addSubview:inputView];
    }
    [self refreshLoginLayout];
    [self layoutIfNeeded];// 这句话不加，不刷新界面，placeHolder会出现异常
}
#pragma mark —— JobsDoorInputViewProtocol
-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)getAppDoorInputViewBaseStyle{
    return self.loginDoorInputViewBaseStyleMutArr;
}
#pragma mark —— BaseViewProtocol
/// 外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.toRegisterBtn.byAlpha(.7f);
        self.titleLab.byAlpha(1);
        [self makeInputView];
        self.abandonLoginBtn.byAlpha(1);
        self.sendBtn.byAlpha(1);
        self.storeCodeBtn.byAlpha(1);
        self.findCodeBtn.byAlpha(1);
        [self refreshLoginLayout];
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)toRegisterBtn{
    if (!_toRegisterBtn) {
        @jobs_weakify(self)
        _toRegisterBtn = BaseButton.initByStyleTop(Title12,
                                                   UIFontWeightMediumSize(13),
                                                   nil,
                                                   @"AppDoorBackLogin".img ? : @"Lock".img,
                                                   JobsWidth(8))
        .makeNewLineShows(YES)
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            [self endEditing:YES];
            if (self.objBlock) self.objBlock(x);
        })
        .onLongPressGestureBy(^(id data){
            JobsLog(@"");
        })
        .bgColorBy(JobsBlackColor)
        .addOn(self);
    };return _toRegisterBtn;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(Title7)
                .byTextCor(JobsWhiteColor)
                .byFont(JobsFontRegular(JobsWidth(20)))
                .addOn(self)
                .bySizeToFit()
                .byCenterX((self.width - self.toRegisterBtn.width) / 2)
                .byTop(JobsWidth(20));
        });
    };return _titleLab;
}

-(BaseButton *)abandonLoginBtn{
    if (!_abandonLoginBtn) {
        @jobs_weakify(self)
        _abandonLoginBtn = BaseButton
            .initByStyle1(Title4,
                          UIFontWeightSemiboldSize(15),
                          JobsWhiteColor)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .bgColorBy(JobsBlackColor)
            .buttonAutoWidthByFont()
            .addOn(self);
    };return _abandonLoginBtn;
}

-(BaseButton *)sendBtn{
    if (!_sendBtn) {
        @jobs_weakify(self)
        _sendBtn = BaseButton
            .initByStyle1(Title7,
                          UIFontWeightSemiboldSize(15),
                          JobsWhiteColor)
            .cornerRadiusValueBy(ThingsHeight / 2)
            .bgColorBy(JobsSystemPinkColor.colorWithAlphaComponentBy(.7f))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toastBy(x.titleForNormalState);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self);
        _sendBtn.refresh();
    };return _sendBtn;
}
/// 记住登录成功的账号和密码
-(BaseButton *)storeCodeBtn{
    if (!_storeCodeBtn) {
        @jobs_weakify(self)
        _storeCodeBtn = BaseButton
            .initByStyleLeft(Title5,
                             UIFontWeightRegularSize(12),
                             JobsWhiteColor,
                             @"记住密码".img,
                             JobsWidth(3))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);

                x.selected = !x.selected;
                x.selected ?
                    x.jobsResetBtnImage(@"记住密码".img) :
                    x.jobsResetBtnImage(@"没有记住密码".img);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .makeBtnTitleByShowingType(UILabelShowingType_04)
            .byTitleLabel(^(UILabel *label) {
                label.byNumberOfLines(1);
                label.lineBreakMode = NSLineBreakByTruncatingTail;
                label.adjustsFontForContentSizeCategory = YES;
                label.adjustsFontSizeToFitWidth = YES;
                label.minimumScaleFactor = 0.75f;
            })
            .bySelected(YES) // 默认记住密码
            .addOn(self)
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button.enabled = YES;
                button.userInteractionEnabled = YES;
                button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                button.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading,JobsWidth(6));
            });
        self.byLayoutIfNeeded();
    };return _storeCodeBtn;
}

-(BaseButton *)findCodeBtn{
    if (!_findCodeBtn) {
        @jobs_weakify(self)
        _findCodeBtn = BaseButton
            .initByStyle1(Title3,
                          UIFontWeightRegularSize(12),
                          Cor4)
            .jobsResetBtnImage(@"AppDoorQuestion".img ? : @"codeDecode".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .makeBtnTitleByShowingType(UILabelShowingType_04)
            .byTitleLabel(^(UILabel *label) {
                label.byNumberOfLines(1);
                label.adjustsFontForContentSizeCategory = YES;
                label.adjustsFontSizeToFitWidth = YES;
                label.minimumScaleFactor = 0.75f;
            })
            .addOn(self)
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
                button.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading,JobsWidth(5));
            });
    };return _findCodeBtn;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)loginDoorInputViewBaseStyleModelMutArr{
    if (!_loginDoorInputViewBaseStyleModelMutArr) {
        _loginDoorInputViewBaseStyleModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            UIImage *userIcon = @"用户名称".img ? : @"用户名".img;
            UIImage *lockIcon = @"Lock".img ? : @"codeDecode".img;
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 用户名) {
                用户名.leftViewIMG = userIcon;
                用户名.placeholder = @"用户名";
                用户名.isShowDelBtn = YES;
                用户名.isShowSecurityBtn = NO;
                用户名.returnKeyType = UIReturnKeyDone;
                用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
                用户名.leftViewMode = UITextFieldViewModeAlways;
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码.leftViewIMG = lockIcon;
                密码.placeholder = @"密码";
                密码.isShowDelBtn = YES;
                密码.isShowSecurityBtn = YES;
                密码.selectedSecurityBtnIMG = @"codeEncode".img;//闭眼
                密码.unSelectedSecurityBtnIMG =@"codeDecode".img;//开眼
                密码.returnKeyType = UIReturnKeyDone;
                密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                密码.leftViewMode = UITextFieldViewModeAlways;
            }));
        });
    };return _loginDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)loginDoorInputViewBaseStyleMutArr{
    if (!_loginDoorInputViewBaseStyleMutArr) {
        _loginDoorInputViewBaseStyleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {

        });
    };return _loginDoorInputViewBaseStyleMutArr;
}

@end

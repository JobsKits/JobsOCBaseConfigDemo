//
//  JobsStepView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsStepView.h"

@interface JobsStepView ()

Prop_assign()VerificationStatus status;
Prop_strong(null_resettable)UIColor *leftLabHighlightBgCor;
Prop_strong(null_resettable)UIColor *rightLabHighlightBgCor;
Prop_strong(null_resettable)UIColor *leftLabNormalBgCor;
Prop_strong(null_resettable)UIColor *rightLabNormalBgCor;
Prop_assign()CGFloat leftViewWidth;
Prop_assign()CGFloat rightViewWidth;
Prop_assign()CGFloat btnOffset;
Prop_assign()CGFloat firstBtnLeftOffset;
Prop_assign()CGFloat offset;/// 值越大 = 按钮之间的距离越小
Prop_strong()NSMutableArray <__kindof BaseButton *>*btnMutArr;
Prop_strong()NSMutableArray <__kindof UIButtonModel *>*btnModelMutArr;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsStepView
@interface JobsStepView (JobsPropertyDSLSetterAutogen_bd4ffafa57)
-(void)setBtnModelMutArr:(NSMutableArray <__kindof UIButtonModel *>* _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsStepView

@implementation JobsStepView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStepView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStepView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <__kindof UIButtonModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.byBtnModelMutArr(model);
        self.makeBtn(self.status);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(400), JobsWidth(62));
    };
}
#pragma mark —— 一些公有方法
/// 值越大 = 按钮之间的距离越小
-(JobsRetStepViewByCGFloatBlock _Nonnull)byOffset{
    @jobs_weakify(self)
    return ^ __kindof JobsStepView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.offset = data;
        return self;
    };
}
/// 设置左边线长度
-(JobsRetStepViewByCGFloatBlock _Nonnull)byLeftViewWidth{
    @jobs_weakify(self)
    return ^ __kindof JobsStepView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.leftViewWidth = data;
        return self;
    };
}
/// 设置右边线长度
-(JobsRetStepViewByCGFloatBlock _Nonnull)byRightViewWidth{
    @jobs_weakify(self)
    return ^ __kindof JobsStepView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.rightViewWidth = data;
        return self;
    };
}
/// 设置按钮之间的距离
-(JobsRetStepViewByCGFloatBlock _Nonnull)byBtnOffset{
    @jobs_weakify(self)
    return ^ __kindof JobsStepView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.btnOffset = data;
        return self;
    };
}
/// 设置第一个按钮距离父视图左边的距离
-(JobsRetStepViewByCGFloatBlock _Nonnull)byFirstBtnLeftOffset{
    @jobs_weakify(self)
    return ^ __kindof JobsStepView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.firstBtnLeftOffset = data;
        return self;
    };
}
/// 设置左边线（高亮）颜色
-(JobsRetStepViewByColorBlock _Nonnull)byLeftLabHighlightBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsStepView *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.leftLabHighlightBgCor = cor;
        return self;
    };
}
/// 设置左边线（普通）颜色
-(JobsRetStepViewByColorBlock _Nonnull)byLeftLabNormalBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsStepView *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.leftLabNormalBgCor = cor;
        return self;
    };
}
/// 设置右边线（高亮）颜色
-(JobsRetStepViewByColorBlock _Nonnull)byRightLabHighlightBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsStepView *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.rightLabHighlightBgCor = cor;
        return self;
    };
}
/// 设置右边线（普通）颜色
-(JobsRetStepViewByColorBlock _Nonnull)byRightLabNormalBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsStepView *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.rightLabNormalBgCor = cor;
        return self;
    };
}
/// 设置当前显示状态
-(JobsRetStepViewByNSIntegerBlock _Nonnull)byStatus{
    @jobs_weakify(self)
    return ^__kindof JobsStepView *_Nullable(VerificationStatus status){
        @jobs_strongify(self)
        self.status = status;
        return self;
    };
}

+(JobsRetBtnModelByStrAndImagesBlock _Nonnull)makeButtonModelBy{
    return ^__kindof UIButtonModel *_Nullable(__kindof NSString *_Nullable title,
                                              UIImage *_Nullable image,
                                              UIImage *_Nullable highlightImage){
        return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.byTitle(title)
                 .byTitleCor(JobsSecondaryLabelColor)
                 .bySelectedTitleCor(JobsLabelColor)
                 .byTitleFont(pingFangHKRegular(JobsWidth(14)))
                 .byNormalImage(image)
                 .byHighlightImage(highlightImage)
                 .byImagePlacement(NSDirectionalRectEdgeTop)
                 .byImagePadding(JobsWidth(8))
                 .byRoundingCorners(UIRectCornerAllCorners)
                 .byBaseBackgroundColor(JobsClearColor);
        });
    };
}
#pragma mark —— 一些私有方法
-(jobsByNSIntegerBlock _Nonnull)makeBtn{
    @jobs_weakify(self)
    return ^(VerificationStatus status){
        @jobs_strongify(self)
        int f = 0;
        for (UIButtonModel *buttonModel in self.btnModelMutArr) {
            /// 数据源创建按钮
            BaseButton *btn = BaseButton.initByButtonModel(buttonModel);
            btn.addOn(self).byAdd(^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.height.mas_equalTo(self.viewSizeByModel(nil).height);
            });self.refresh();
            if(self.btnMutArr.count){
                UIView *view = self.btnMutArr.lastObject;
                CGFloat d = ((self.viewSizeByModel(nil).width - btn.width * self.btnModelMutArr.count - self.offset) / (self.btnModelMutArr.count - 1));
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(view.mas_right).offset(self.btnOffset ? : d);
                }];
            }else{
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(self.firstBtnLeftOffset);
                }];
            }
            if(self.btnMutArr.count){
                if (f == self.btnModelMutArr.count - 1){
                    self.makeLeftLabBy(btn);
                }else{
                    self.makeLeftLabBy(btn);
                    self.makeRightLabBy(btn);
                }
            }else{
                self.makeRightLabBy(btn);
            }
            self.btnMutArr.add(btn);
            f++;
        }
        for (NSInteger i = 0; i <= status; i++) {
            if (i < self.btnMutArr.count) {
                self.btnMutArr[i].jobsResetImage(self.btnModelMutArr[i].highlightImage);
                self.btnMutArr[i].jobsResetBtnTitleCor(self.btnModelMutArr[i].selectedTitleCor);
                if(self.btnMutArr[i].leftLab) self.btnMutArr[i].leftLab.byBgColor(self.leftLabHighlightBgCor);
                if(self.btnMutArr[i].rightLab) self.btnMutArr[i].rightLab.byBgColor(self.rightLabHighlightBgCor);
            }
        }
    };
}

-(JobsRetLabelByBtnBlock _Nonnull)makeRightLabBy{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIButton *_Nullable btn){
        return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byLabelBlock(^(__kindof UILabel * _Nullable data) {
                    btn.rightLab = data;
                })
                .byBgColor(self.rightLabNormalBgCor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerY.equalTo(btn.imageView);
                    make.left.equalTo(btn.mas_right);
                    make.height.mas_equalTo(1);
                    make.width.mas_equalTo(self.rightViewWidth);
                });
        });
    };
}

-(JobsRetLabelByBtnBlock _Nonnull)makeLeftLabBy{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIButton *_Nullable btn){
        return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byLabelBlock(^(__kindof UILabel * _Nullable data) {
                    btn.leftLab = data;
                })
                .byBgColor(self.leftLabNormalBgCor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerY.equalTo(btn.imageView);
                    make.right.equalTo(btn.mas_left);
                    make.height.mas_equalTo(1);
                    make.width.mas_equalTo(self.leftViewWidth);
                });
        });
    };
}
#pragma mark —— lazyLoad
-(NSMutableArray<BaseButton *> *)btnMutArr{
    if(!_btnMutArr){
        _btnMutArr = NSMutableArray.array;
    };return _btnMutArr;
}

-(NSMutableArray<UIButtonModel *> *)btnModelMutArr{
    if(!_btnModelMutArr){
        _btnModelMutArr = NSMutableArray.array;
    };return _btnModelMutArr;
}

-(CGFloat)leftViewWidth{
    if(!_leftViewWidth){
        _leftViewWidth = JobsWidth(80);
    };return _leftViewWidth;
}

-(CGFloat)rightViewWidth{
    if(!_rightViewWidth){
        _rightViewWidth = JobsWidth(80);
    };return _rightViewWidth;
}

-(UIColor *)leftLabHighlightBgCor{
    if(!_leftLabHighlightBgCor){
        _leftLabHighlightBgCor = JobsWhiteColor;
    };return _leftLabHighlightBgCor;
}

-(UIColor *)rightLabHighlightBgCor{
    if(!_rightLabHighlightBgCor){
        _rightLabHighlightBgCor = JobsWhiteColor;
    };return _rightLabHighlightBgCor;
}

-(UIColor *)leftLabNormalBgCor{
    if(!_leftLabNormalBgCor){
        _leftLabNormalBgCor = JobsGrayColor;
    };return _leftLabNormalBgCor;
}

-(UIColor *)rightLabNormalBgCor{
    if(!_rightLabNormalBgCor){
        _rightLabNormalBgCor = JobsGrayColor;
    };return _rightLabNormalBgCor;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsStepView
-(JobsRetJobsStepViewByNSMutableArrayUIButtonModelBlock _Nonnull)byBtnModelMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsStepView * _Nullable(NSMutableArray <__kindof UIButtonModel *>* _Nullable data){
        @jobs_strongify(self)
        [self setBtnModelMutArr:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsStepView
@end

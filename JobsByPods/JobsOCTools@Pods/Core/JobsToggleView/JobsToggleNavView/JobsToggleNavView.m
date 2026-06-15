//
//  JobsToggleNavView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsToggleNavView.h"

@interface JobsToggleNavView ()
/// UI
Prop_strong()__kindof UIView *sliderView;
/// Data
Prop_assign()NSUInteger current_index;
Prop_strong()NSMutableArray <UIButtonModel *>*buttonModels;

@end

@implementation JobsToggleNavView
JobsToggleNavViewProtocolSynthesize
-(void)dealloc{
    JobsLog(@"");
}
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
//    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
//                                        cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <UIButtonModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.buttonModels = model;
        if(self.buttonsArray.count) {
            for (__kindof UIButton *btn in self.buttonsArray) {
                [btn removeFromSuperview];
            }[self.buttonsArray removeAllObjects];
        }
        __block CGFloat btnRight = 0;
        for (int i = 0 ; i < self.buttonModels.count ; i++) {
            UIButtonModel *buttonModel = self.buttonModels[i];
            BaseButton *button = BaseButton
                .initByButtonModel(buttonModel)
                .byFrame(jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel *_Nullable data) {
                    @jobs_strongify(self)
                    data.byJobsWidth(jobs3TO(buttonModel.jobsWidth,self.buttonWidth))
                        .byJobsHeight(jobs3TO(buttonModel.jobsHeight,self.height));
                    if(i == 0){
                        btnRight = data.jobsWidth;
                        buttonModel.byJobsRight(btnRight);
                        data.byJobsX(0);
                    }else{
                        btnRight += (data.jobsWidth + self.btn_each_offset * i);
                        buttonModel.byJobsRight(btnRight);
                        UIButtonModel *buttonModel2 = self.buttonModels[i - 1];/// 上一个
                        CGFloat d = jobs3TO(buttonModel2.jobsWidth,self.buttonWidth);
                        buttonModel.byJobsX((d + self.btn_each_offset) * i);
                        data.byJobsX(buttonModel2.jobsRight + self.btn_each_offset);
                    }
                    data.byJobsY(0);
                }));
            
//            UIButtonModel *buttonModel = self.buttonModels[i];
//            BaseButton *button = BaseButton.jobsInit()
//                .bgColorBy(buttonModel.baseBackgroundColor)
//                .jobsResetImagePlacement(buttonModel.imagePlacement)
//                .jobsResetImagePadding(buttonModel.imagePadding)
//                .jobsResetBtnImage(buttonModel.normalImage)
//                .jobsResetBtnBgImage(buttonModel.backgroundImage)
//                .jobsResetBtnTitleCor(buttonModel.titleCor)
//                .jobsResetBtnTitleFont(buttonModel.titleFont)
//                .jobsResetBtnTitle(buttonModel.title)
//                .onClickBy(buttonModel.onClickBlock)
//                .onLongPressGestureBy(buttonModel.onLongPressGestureEventBlock)
//                .byFrame(jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
//                    @jobs_strongify(self)
//                    data.jobsX = i * self.buttonWidth + (i ? self.btn_each_offset : 0);
//                    data.jobsY = 0;
//                    data.jobsWidth = jobs3TO(self.buttonModels[i].jobsWidth,self.buttonWidth);
//                    data.jobsHeight = jobs3TO(self.buttonModels[i].jobsHeight,self.height);
//                }));
            button.index = i;
            self.buttonsArray.add(button);
            self.addSubview(button);
        }
        self.current_index = 0;
        self.sliderView.byAlpha(1);

        /// 设置按钮为选中状态
        self.buttonsArray[0].selected = YES;
        /// 重设按钮纯文本标题
        self.buttonsArray[0].jobsResetBtnTitle(Jobs3TO(self.buttonModels[0].selectedTitle,
                                                       self.buttonModels[0].title));
        /// 重设按钮纯文本标题字体
        self.buttonsArray[0].jobsResetTitleFont(Jobs3TO(self.buttonModels[0].selectedTitleFont,
                                                        self.buttonModels[0].titleFont));
        /// 重设按钮纯文本标题文字颜色
        self.buttonsArray[0].jobsResetBtnTitleCor(Jobs3TO(self.buttonModels[0].selectedTitleCor,
                                                          self.buttonModels[0].titleCor));
        /// 重设按钮图片
        self.buttonsArray[0].jobsResetBtnImage(Jobs3TO(self.buttonModels[0].highlightImage,
                                                       self.buttonModels[0].normalImage));
        /// 重设按钮背景图片
        self.buttonsArray[0].jobsResetBtnBgImage(Jobs3TO(self.buttonModels[0].highlightBackgroundImage,
                                                         self.buttonModels[0].backgroundImage));
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(340), JobsWidth(500));
    };
}

-(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
//        return self.class.viewSizeByModel(nil);
        return CGSizeMake(JobsWidth(410), JobsWidth(280));
    };
}
#pragma mark —— 一些私有方法
-(CGFloat)buttonWidth{
    return (self.width - (self.buttonModels.count - 1) * self.btn_each_offset) / self.buttonModels.count;
}
#pragma mark —— 一些公有方法
/// 核心方法：拖动和点击的逻辑，都归属于这个方法
-(jobsByNSIntegerBlock _Nonnull)selectingOneTagByIndex{
    @jobs_weakify(self)
    return ^(NSInteger index){
        @jobs_strongify(self)
        /// 纠错
        if(index > self.buttonsArray.count - 1) index = self.buttonsArray.count - 1;
        if(index < 0) index = 0;
        
        JobsLog(@"当前选择：%lu",(unsigned long)index);
        self.current_index = index;
        /// 全部还原
        int t = 0;
        for (UIButton *subButton in self.buttonsArray) {
            subButton.selected = NO;
            /// 重设按钮纯文本标题
            subButton.jobsResetBtnTitle(self.buttonModels[t].title);
            /// 重设按钮纯文本标题字体
            subButton.jobsResetTitleFont(self.buttonModels[t].titleFont);
            /// 重设按钮纯文本标题文字颜色
            subButton.jobsResetBtnTitleCor(self.buttonModels[t].titleCor);
            /// 重设按钮图片
            subButton.jobsResetBtnImage(self.buttonModels[t].normalImage);
            /// 重设按钮背景图片
            subButton.jobsResetBtnBgImage(self.buttonModels[t].backgroundImage);
            t+=1;
        }
        UIButton *currentBtn = self.buttonsArray[index];
        currentBtn.selected = YES;
    
        self.sliderView.resetCenterX(currentBtn.centerX);
        /// 重设按钮纯文本标题
        currentBtn.jobsResetBtnTitle(Jobs3TO(self.buttonModels[index].selectedTitle,
                                             self.buttonModels[index].title));
        /// 重设按钮纯文本标题字体
        currentBtn.jobsResetTitleFont(Jobs3TO(self.buttonModels[index].selectedTitleFont,
                                              self.buttonModels[index].titleFont));
        /// 重设按钮纯文本标题文字颜色
        currentBtn.jobsResetBtnTitleCor(Jobs3TO(self.buttonModels[index].selectedTitleCor,
                                                self.buttonModels[index].titleCor));
        /// 重设按钮图片
        currentBtn.jobsResetBtnImage(Jobs3TO(self.buttonModels[index].highlightImage,
                                             self.buttonModels[index].normalImage));
        /// 重设按钮背景图片
        currentBtn.jobsResetBtnBgImage(Jobs3TO(self.buttonModels[index].highlightBackgroundImage,
                                               self.buttonModels[index].backgroundImage));
    };
}
#pragma mark —— lazyLoad
-(UIView *)sliderView{
    if(!_sliderView){
        @jobs_weakify(self)
        _sliderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .bySize(CGSizeMake(self.sliderW, self.sliderH))
                .byCenterX(self.buttonWidth / 2)
                .byY(self.height - self.sliderH)
                .byBgColor(self.sliderColor)
                .addOn(self);
        });
    };return _sliderView;
}

-(NSMutableArray<__kindof UIButton *> *)buttonsArray{
    if(!_buttonsArray){
        _buttonsArray = NSMutableArray.array;
    };return _buttonsArray;
}

-(UIColor *)sliderColor{
    if(!_sliderColor){
        _sliderColor = JobsRedColor;
    };return _sliderColor;
}

-(CGFloat)sliderH{
    if(!_sliderH){
        _sliderH = JobsWidth(30);
    };return _sliderH;
}

-(CGFloat)sliderW{
    if(!_sliderW){
        _sliderW = JobsWidth(1);
    };return _sliderW;
}

-(UIButtonModel *)buttonModel{
    if(!_buttonModel){
        _buttonModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.byButtonConfiguration(nil)
                 .byBackgroundConfiguration(nil)
                 .byButtonConfigurationTitleAlignment(UIButtonConfigurationTitleAlignmentAutomatic)
                 .byTextAlignment(NSTextAlignmentCenter)
                 .bySubTextAlignment(NSTextAlignmentCenter)
                 .byNormalImage(nil)
                 .byHighlightImage(nil)
                 .byAttributedTitle(nil)
                 .bySelectedAttributedTitle(nil)
                 .byAttributedSubTitle(nil)
                 .byTitle(nil)
                 .bySubTitle(nil)
                 .byTitleFont(bayonRegular(JobsWidth(16)))
                 .bySubTitleFont(nil)
                 .byTitleCor(@"#ABABAB".cor)
                 .bySubTitleCor(nil)
                 .byTitleLineBreakMode(NSLineBreakByWordWrapping)
                 .bySubtitleLineBreakMode(NSLineBreakByWordWrapping)
                 .byBaseBackgroundColor(JobsWhiteColor)
                 .byBackgroundImage(nil)
                 .byImagePadding(JobsWidth(0))
                 .byTitlePadding(JobsWidth(0))
                 .byImagePlacement(NSDirectionalRectEdgeNone)
                 .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentCenter)
                 .byContentVerticalAlignment(UIControlContentVerticalAlignmentCenter)
                 .byContentInsets(jobsSameDirectionalEdgeInsets(0))
                 .byCornerRadiusValue(JobsWidth(0))
                 .byRoundingCorners(UIRectCornerAllCorners)
                 .byRoundingCornersRadii(CGSizeZero)
                 .byLayerBorderCor(nil)
                 .byBorderWidth(JobsWidth(0))
                 .byPrimaryAction(nil)
                 .byLongPressGestureEventBlock(nil)
                 .byClickEventBlock(nil);
        });
    };return _buttonModel;
}
//@synthesize buttonModels = _buttonModels;
//-(NSMutableArray<UIButtonModel *> *)buttonModels{
//    if(!_buttonModels){
//        _buttonModels = NSMutableArray.array;
//    };return _buttonModels;
//}

@end

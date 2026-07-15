//
//  MsgEditBoardView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MsgEditBoardView.h"

@interface MsgEditBoardView ()
/// UI
Prop_strong()UIButton *allChooseBtn;
Prop_strong()UIButton *markToReadBtn;
Prop_strong()UIButton *deleteBtn;
/// Data

-(jobsByVoidBlock _Nonnull)setupStyle;

@end

@implementation MsgEditBoardView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_msgEditBoardViewOnceToken = 0;
    static_msgEditBoardView = nil;
}

static MsgEditBoardView *static_msgEditBoardView = nil;
static dispatch_once_t static_msgEditBoardViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_msgEditBoardViewOnceToken, ^{
        static_msgEditBoardView = MsgEditBoardView.new;
    });return static_msgEditBoardView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.setupStyle();
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.setupStyle();
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.setupStyle();
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        MakeDataNull
        self.allChooseBtn.byAlpha(1);
        self.deleteBtn.byAlpha(1);
        self.markToReadBtn.byAlpha(1);
    };
}
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewChangeYByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(50) + JobsBottomSafeAreaHeight();
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(),
                          MsgEditBoardView.viewChangeYByModel(nil));
    };
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetFrameByIDBlock _Nonnull)viewFrameByModel{
    return ^CGRect(id _Nullable data){
        return CGRectMake(0,
                          JobsMainScreen_HEIGHT(),
                          MsgEditBoardView.viewSizeByModel(nil).width,
                          MsgEditBoardView.viewSizeByModel(nil).height);
    };
}
#pragma mark —— 一些公有方法
-(jobsByVoidBlock _Nonnull)setupStyle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        self.byBgColor(JobsWhiteColor);
        self.layer
            .byShadowColor(RGBA_COLOR(39, 50, 68, 0.12).CGColor)
            .byShadowOpacity(1)
            .byShadowOffset(CGSizeMake(0, JobsWidth(-4)))
            .byShadowRadius(JobsWidth(12));
    };
}

-(void)appearByView:(UIView * _Nonnull)view{
    @jobs_weakify(self)
    [UIView animateWithDuration:.5f
                     animations:^{
        @jobs_strongify(self)
        CGRect rect = MsgEditBoardView.viewFrameByModel(nil);
        rect.origin.y -= MsgEditBoardView.viewChangeYByModel(nil);
        self.byFrame(rect);
        view.addSubview(self);
    } completion:nil];
}

-(void)disappearByView:(UIView * _Nullable)view{
    @jobs_weakify(self)
    [UIView animateWithDuration:.5f
                     animations:^{
        @jobs_strongify(self)
        self.byFrame(MsgEditBoardView.viewFrameByModel(nil));
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        [self removeFromSuperview];
    }];
}

-(UIButton *)getAllChooseBtn{
    return _allChooseBtn;
}

-(UIButton *)getMarkToReadBtn{
    return _markToReadBtn;
}

-(UIButton *)getDeleteBtn{
    return _deleteBtn;
}
#pragma mark —— lazyLoad
-(UIButton *)allChooseBtn{
    if (!_allChooseBtn) {
        @jobs_weakify(self)
        _allChooseBtn = UIButton.jobsInit()
        .bgColorBy(HEXCOLOR(0xF6F7FB))
        .jobsResetBtnImage(@"按钮未选中".img)
        .selectedStateImageBy(@"按钮已选中".img)
        .jobsResetBtnTitleCor(HEXCOLOR(0x273244))
        .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
        .jobsResetBtnTitle(@"全選".tr)
        .selectedStateTitleBy(@"取消".tr)
        .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading,JobsWidth(8))
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objBlock) self.objBlock(x);
        })
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(84), JobsWidth(32)));
            make.left.equalTo(self).offset(JobsWidth(16));
            make.top.equalTo(self).offset(JobsWidth(10));
        });
        _allChooseBtn.layer.byCornerRadius(JobsWidth(16)).byMasksToBounds(YES);
    };return _allChooseBtn;
}

-(UIButton *)markToReadBtn{
    if (!_markToReadBtn) {
        @jobs_weakify(self)
        _markToReadBtn = UIButton.jobsInit()
        .bgColorBy(HEXCOLOR(0xFFF4DD))
        .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
        .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
        .jobsResetBtnTitle(@"標記為已讀".tr)
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objBlock) self.objBlock(x);
        })
        .enabledBlock(NO)
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.allChooseBtn);
            make.right.equalTo(self.deleteBtn.mas_left).offset(JobsWidth(-10));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(92), JobsWidth(32)));
        });
        _markToReadBtn.layer.byCornerRadius(JobsWidth(16)).byMasksToBounds(YES);
    };return _markToReadBtn;
}

-(UIButton *)deleteBtn{
    if (!_deleteBtn) {
        @jobs_weakify(self)
        _deleteBtn = UIButton.jobsInit()
        .bgColorBy(HEXCOLOR(0xFFF0F3))
        .jobsResetBtnTitle(@"删除".tr)
        .jobsResetBtnTitleCor(HEXCOLOR(0xEB677F))
        .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objBlock) self.objBlock(x);
        })
        .enabledBlock(NO)
        .makeBtnTitleByShowingType(UILabelShowingType_03)
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.allChooseBtn);
            make.right.equalTo(self).offset(JobsWidth(-18));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(64), JobsWidth(32)));
        });
        _deleteBtn.layer.byCornerRadius(JobsWidth(16)).byMasksToBounds(YES);
    };return _deleteBtn;
}

@end

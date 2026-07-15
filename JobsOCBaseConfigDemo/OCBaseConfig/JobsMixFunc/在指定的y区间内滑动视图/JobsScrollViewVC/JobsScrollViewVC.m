//
//  JobsScrollViewVC.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsScrollViewVC.h"

@interface JobsScrollViewVC ()

Prop_strong()UIView *jobsView;
Prop_strong()UIView *usageCardView;
Prop_strong()UILabel *usageTitleLab;
Prop_strong()UILabel *usageDescLab;
Prop_strong()UILabel *topAnchorLab;
Prop_strong()UILabel *bottomAnchorLab;
Prop_strong()JobsScrollYView *scrollYView;
Prop_strong()UILabel *dragHintLab;

@end

@implementation JobsScrollViewVC
-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"JobsScrollViewVC")
                .byFont(UIFontWeightRegularSize(18))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(HEXCOLOR(0xF3F6FA))
        .byNavBgCor(HEXCOLOR(0xF3F6FA));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF3F6FA));
    self.makeNavByAlpha(1);
    self.jobsView.byAlpha(1);
    self.usageCardView.byAlpha(1);
    self.usageTitleLab.byAlpha(1);
    self.usageDescLab.byAlpha(1);
    self.topAnchorLab.byAlpha(1);
    self.bottomAnchorLab.byAlpha(1);
    self.scrollYView.byAlpha(1);
    self.dragHintLab.byAlpha(1);
}
#pragma mark —— 一些私有方法
-(CGFloat)jobs_scrollTopAnchorY{
    [self.view layoutIfNeeded];
    CGRect topAnchorFrame = [self.topAnchorLab.superview convertRect:self.topAnchorLab.frame
                                                              toView:self.view];
    return CGRectGetMaxY(topAnchorFrame);
}

-(CGFloat)jobs_scrollBottomAnchorY{
    [self.view layoutIfNeeded];
    CGRect bottomAnchorFrame = [self.jobsView.superview convertRect:self.jobsView.frame
                                                             toView:self.view];
    return CGRectGetMaxY(bottomAnchorFrame);
}

-(void)jobs_resetScrollYViewY:(CGFloat)y
                     animated:(BOOL)animated{
    if(!_scrollYView) return;
    CGFloat topY = [self jobs_scrollTopAnchorY];
    CGFloat bottomY = [self jobs_scrollBottomAnchorY];
    CGFloat targetY = MIN(MAX(y, topY), bottomY);
    if(animated){
        [UIView animateWithDuration:0.3
                         animations:^{
            self->_scrollYView.y = targetY;
        }];
    }else{
        _scrollYView.y = targetY;
    }
}

#pragma mark —— lazyLoad
-(UIView *)jobsView{
    if(!_jobsView){
        _jobsView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsRandomColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view);
                    make.height.mas_equalTo(初始位置 - 终点位置);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                });
        });
    };return _jobsView;
}

-(UIView *)usageCardView{
    if(!_usageCardView){
        _usageCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor([UIColor colorWithWhite:0 alpha:.18f])
                .byCornerRadius(JobsWidth(14))
                .byClipsToBounds(YES)
                .addOn(self.jobsView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.jobsView).offset(JobsWidth(16));
                    make.right.equalTo(self.jobsView).offset(-JobsWidth(16));
                    make.top.equalTo(self.jobsView).offset(JobsWidth(24));
                });
        });
    };return _usageCardView;
}

-(UILabel *)usageTitleLab{
    if(!_usageTitleLab){
        _usageTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"JobsScrollViewVC")
                .byFont(UIFontWeightBoldSize(JobsWidth(18)))
                .byTextCor(JobsWhiteColor)
                .byTextAlignment(NSTextAlignmentLeft)
                .byNumberOfLines(1)
                .byBgColor(JobsClearColor)
                .addOn(self.usageCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.usageCardView).offset(JobsWidth(14));
                    make.right.equalTo(self.usageCardView).offset(-JobsWidth(14));
                    make.top.equalTo(self.usageCardView).offset(JobsWidth(12));
                    make.height.mas_equalTo(JobsWidth(24));
                });
        });
    };return _usageTitleLab;
}

-(UILabel *)usageDescLab{
    if(!_usageDescLab){
        _usageDescLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"演示“只允许在指定 y 区间内上下滑动”的吸附效果：拖拽绿色区域，上滑释放会吸附到最高点，下滑释放会回到底部初始位置。".tr)
                .byFont(UIFontWeightRegularSize(JobsWidth(13)))
                .byTextCor([JobsWhiteColor colorWithAlphaComponent:.82f])
                .byTextAlignment(NSTextAlignmentLeft)
                .byNumberOfLines(0)
                .byBgColor(JobsClearColor)
                .addOn(self.usageCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.usageTitleLab);
                    make.top.equalTo(self.usageTitleLab.mas_bottom).offset(JobsWidth(8));
                    make.bottom.equalTo(self.usageCardView).offset(-JobsWidth(14));
                });
        });
    };return _usageDescLab;
}

-(UILabel *)topAnchorLab{
    if(!_topAnchorLab){
        _topAnchorLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"最高点：上滑后吸附到这里".tr)
                .byFont(UIFontWeightMediumSize(JobsWidth(12)))
                .byTextCor(JobsWhiteColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1)
                .byBgColor([UIColor colorWithWhite:1 alpha:.16f])
                .byCornerRadius(JobsWidth(12))
                .byClipsToBounds(YES)
                .addOn(self.jobsView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.jobsView).offset(JobsWidth(16));
                    make.right.equalTo(self.jobsView).offset(-JobsWidth(16));
                    make.top.equalTo(self.usageCardView.mas_bottom).offset(JobsWidth(12));
                    make.height.mas_equalTo(JobsWidth(28));
                });
        });
    };return _topAnchorLab;
}

-(UILabel *)bottomAnchorLab{
    if(!_bottomAnchorLab){
        _bottomAnchorLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"最低点：下滑释放回到初始位置".tr)
                .byFont(UIFontWeightMediumSize(JobsWidth(12)))
                .byTextCor(JobsWhiteColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1)
                .byBgColor([UIColor colorWithWhite:1 alpha:.16f])
                .byCornerRadius(JobsWidth(12))
                .byClipsToBounds(YES)
                .addOn(self.jobsView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.height.equalTo(self.topAnchorLab);
                    make.bottom.equalTo(self.jobsView).offset(-JobsWidth(16));
                });
        });
    };return _bottomAnchorLab;
}

-(JobsScrollYView *)scrollYView{
    if(!_scrollYView){
        _scrollYView = JobsScrollYView.new;
        _scrollYView.byBgColor(JobsGreenColor);
        [self.view addSubview:_scrollYView];
        [self.view layoutIfNeeded];
        _scrollYView.x = 0;
        _scrollYView.y = [self jobs_scrollBottomAnchorY];// 锚点1（最低点）
        _scrollYView.sizer = _scrollYView.viewSizeByModel(nil);
        _scrollYView.jobsRichViewByModel(nil);
        @jobs_weakify(self)
        [_scrollYView actionObjBlock:^(JobsScrollYView *data) {
            @jobs_strongify(self)
            CGFloat topY = [self jobs_scrollTopAnchorY];
            CGFloat bottomY = [self jobs_scrollBottomAnchorY];
            /// 向下滑动为正
            if(data.jobsPoint.y > 0){
                [self jobs_resetScrollYViewY:bottomY
                                    animated:YES];
                return;
            }
            /// 向上滑动为负
            if(data.jobsPoint.y < 0){
                [self jobs_resetScrollYViewY:topY
                                    animated:YES];
                return;
            }
            CGFloat middleY = (topY + bottomY) / 2.0;
            [self jobs_resetScrollYViewY:self->_scrollYView.y <= middleY ? topY : bottomY
                                animated:YES];
        }];
    };return _scrollYView;
}

-(UILabel *)dragHintLab{
    if(!_dragHintLab){
        _dragHintLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"按住绿色区域上下拖动\n上滑吸顶，下滑回到底部".tr)
                .byFont(UIFontWeightMediumSize(JobsWidth(15)))
                .byTextCor(JobsWhiteColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .byBgColor([UIColor colorWithWhite:0 alpha:.18f])
                .byCornerRadius(JobsWidth(16))
                .byClipsToBounds(YES)
                .addOn(self.scrollYView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.scrollYView).offset(JobsWidth(16));
                    make.right.equalTo(self.scrollYView).offset(-JobsWidth(16));
                    make.top.equalTo(self.scrollYView).offset(JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(64));
                });
        });
    };return _dragHintLab;
}

@end

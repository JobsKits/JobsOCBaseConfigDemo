//
//  JobsCommentTitleHeaderView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCommentTitleHeaderView.h"

@interface JobsCommentTitleHeaderView ()
/// UI
Prop_strong()UIView *indicatorView;
Prop_strong()UILabel *titleLab;
Prop_strong()UIButton *cancelBtn;

@end

@implementation JobsCommentTitleHeaderView

-(instancetype)init{
    if (self = [super init]) {

    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        super.jobsRichViewByModel(model);
        self.byBgColor(JobsWhiteColor);
        self.indicatorView.byAlpha(1);
        self.titleLab.byAlpha(1);
        self.cancelBtn.byAlpha(1);
    };
}
#pragma mark —— lazyLoad
-(UIView *)indicatorView{
    if (!_indicatorView) {
        _indicatorView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(HEXCOLOR(0xD8DDE8))
                .byCornerRadius(JobsWidth(2))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self).offset(JobsWidth(8));
                    make.centerX.equalTo(self);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(36), JobsWidth(4)));
                });
        });
    };return _indicatorView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"评论".tr)
                .byTextCor(HEXCOLOR(0x111827))
                .byFont(UIFontWeightMediumSize(18))
            .bySizeToFit()
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.centerY.equalTo(self).offset(JobsWidth(4));
            });
        });
    };return _titleLab;
}

-(UIButton *)cancelBtn{
    if(!_cancelBtn){
        @jobs_weakify(self)
        _cancelBtn = BaseButton
            .initByBackgroundImage(@"删除".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.titleLab);
                make.right.equalTo(self).offset(-JobsWidth(10));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(34), JobsWidth(34)));
            });
    };return _cancelBtn;
}

@end

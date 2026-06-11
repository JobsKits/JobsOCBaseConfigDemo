//
//  JobsCommentTitleHeaderView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCommentTitleHeaderView.h"

@interface JobsCommentTitleHeaderView ()
/// UI
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
        self.titleLab.byAlpha(1);
        self.cancelBtn.byAlpha(1);
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"评论".tr)
                .byTextCor(@"#999999".cor)
                .byFont(UIFontWeightRegularSize(18));
            label.bySizeToFit();
            label.byAddTo(self, ^(MASConstraintMaker *make) {
                make.center.equalTo(self);
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
            .byAddTo(self, ^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.right.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(40, 40));
            });
    };return _cancelBtn;
}

@end

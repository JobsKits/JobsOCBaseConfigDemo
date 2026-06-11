//
//  JobsAdNoticeView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAdNoticeView.h"

@interface JobsAdNoticeView ()

Prop_strong()UILabel *adNoticeLab;

@end

@implementation JobsAdNoticeView

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsCyanColor);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.adNoticeLab.byAlpha(1);
    };
}

+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), 30);
    };
}
#pragma mark —— lazyLoad
-(UILabel *)adNoticeLab{
    if (!_adNoticeLab) {
        @jobs_weakify(self)
        _adNoticeLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"Jobs安全聊天，为您的聊天加密护航".tr)
                .byTextCor(JobsRedColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontWeightRegularSize(JobsWidth(12)))
                .byBgColor(JobsClearColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
        });
    };return _adNoticeLab;
}

@end

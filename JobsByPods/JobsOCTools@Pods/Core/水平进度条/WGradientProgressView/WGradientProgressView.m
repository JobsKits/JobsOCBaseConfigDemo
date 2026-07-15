//
//  WGradientProgressView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "WGradientProgressView.h"

@interface WGradientProgressView ()

Prop_strong()UILabel *titleLab;
Prop_strong()UIImageView *imgV;

@end

@implementation WGradientProgressView
static dispatch_once_t dispatchOnce;
- (instancetype)init{
    if (self = [super init]) {
        dispatchOnce = 0;
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    @jobs_weakify(self)
    dispatch_once(&dispatchOnce, ^{
        @jobs_strongify(self)
        if (self.img) self.imgV.jobsVisible = YES;
        self.titleLab.jobsVisible = YES;
    });
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            UIView *containerView = self.img ? self.imgV : self;
            label
                .byText(self.titleStr)
                .byTextCor(self.titleColor)
                .byFont(self.titleFont)
            .bySizeToFit()
            .addOn(containerView)
            .byAdd(^(MASConstraintMaker *make) {
                make.center.equalTo(containerView);
            });
        });
    };return _titleLab;
}

-(UIImageView *)imgV{
    if (!_imgV) {
        @jobs_weakify(self)
        _imgV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(self.img)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
        });
    };return _imgV;
}

-(UIFont *)titleFont{
    if (!_titleFont) {
        _titleFont = UIFontWeightRegularSize(JobsWidth(6.5));
    };return _titleFont;
}

-(UIColor *)titleColor{
    if (!_titleColor) {
        _titleColor = JobsRedColor;
    };return _titleColor;
}

-(void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    _titleLab.byText(_titleStr);
//    [self.titleLab sizeToFit];
}

@end

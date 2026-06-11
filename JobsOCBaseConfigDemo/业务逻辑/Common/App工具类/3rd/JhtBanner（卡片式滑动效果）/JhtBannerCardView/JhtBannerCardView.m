//
//  JhtBannerCardView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JhtBannerCardView.h"

@interface JhtBannerCardView ()

@end

@implementation JhtBannerCardView
///
+(JobsReturnJhtBannerCardViewByFrameBlock _Nonnull)initByFrame{
    return ^JhtBannerCardView *_Nullable(CGRect frame){
        return [JhtBannerCardView.alloc initWithFrame:frame];
    };
}
/// 这里只用init方法行不通
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.cardLab.byAlpha(1);
        self.cardImageView.byAlpha(1);
        /// 覆盖在mainImageView上的view（蒙板）
        self.coverView.byAlpha(1);
        self.cornerCutToCircleWithCornerRadius(8.f);
    };return self;
}
#pragma mark —— LazyLoad
- (UIImageView *)cardImageView {
    if (!_cardImageView) {
        @jobs_weakify(self)
        _cardImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byUserInteractionEnabled(YES)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });

            self->_cardLab = nil;/// removeFromSuperview 和 alpha = 0 都没有办法达到 nil 的效果
        });
    };return _cardImageView;
}

-(UILabel *)cardLab{
    if (!_cardLab) {
        @jobs_weakify(self)
        _cardLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byTextAlignment(NSTextAlignmentCenter)
                .byUserInteractionEnabled(YES);
            /// 确定 _cardLab 宽度,使字体大小自适应
            label.adjustsFontSizeToFitWidth = YES;
            label.minimumScaleFactor = 0.1;/// 设置允许文本显示的最小字体
            label.byAddTo(self, ^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            });self->_cardImageView = nil;/// removeFromSuperview 和 alpha = 0 都没有办法达到nil的效果
        });
    };return _cardLab;
}

-(UIView *)coverView{
    if (!_coverView){
        @jobs_weakify(self)
        _coverView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
//            view.backgroundColor = JobsWhiteColor;
            view.byAddTo(self, ^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            });
        });
    };return _coverView;
}

@end

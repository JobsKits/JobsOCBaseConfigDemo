//
//  LZTabBarItem.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LZTabBarItem.h"

static NSInteger defaultTag = 100000;

@interface LZTabBarItem ()

Prop_strong()UIImageView *iconImageView;
Prop_strong()UILabel *titleLabel;

@end

@implementation LZTabBarItem
#define JobsLZTabBarItemDSL(_name_, _blockType_, _dataType_, _property_) \
-(_blockType_ _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof LZTabBarItem *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}
JobsLZTabBarItemDSL(Icon, JobsRetLZTabBarItemByStrBlock, NSString *_Nullable, icon)
JobsLZTabBarItemDSL(Title, JobsRetLZTabBarItemByStrBlock, NSString *_Nullable, title)
JobsLZTabBarItemDSL(TitleColor, JobsRetLZTabBarItemByCorBlock, UIColor *_Nullable, titleColor)
JobsLZTabBarItemDSL(Type, JobsRetLZTabBarItemByTypeBlock, LZTabBarItemType, type)
JobsLZTabBarItemDSL(Delegate, JobsRetLZTabBarItemByDelegateBlock, id<LZTabBarItemDelegate> _Nullable, delegate)
#undef JobsLZTabBarItemDSL
- (instancetype)init {
    if (self = [super init]) {
        self.byUserInteractionEnabled(YES);
        self.addGesture((jobsMakeTapGesture(^(UITapGestureRecognizer * _Nullable gesture) {
            /// 这里写手势的配置
        })).gestureActionBy(^{
            /// 这里写手势的触发
            if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarItem:didSelectIndex:)]) {
                [self.delegate tabBarItem:self didSelectIndex:self.tag - defaultTag];
            }
        }));
    };return self;
}

- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LZTabBarItem.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super layoutSubviews];
            CGFloat space = 6.0;
            switch (self.type) {
                /// 处理 LZTabBarItemTypeDefault 分支
                case LZTabBarItemTypeDefault: {
                    CGFloat iconHeight = (CGRectGetHeight(self.frame) - space * 3) * 2 / 3.0 ;
                    self.iconImageView.frame = CGRectMake(space,
                                                          space,
                                                          CGRectGetWidth(self.frame) - 2 * space,
                                                          iconHeight);
                    self.titleLabel.frame = CGRectMake(space,
                                                       CGRectGetMaxY(self.iconImageView.frame) + space,
                                                       CGRectGetWidth(self.frame) - 2 * space,
                                                       iconHeight / 2.0);
                }break;
                /// 处理 LZTabBarItemTypeImage 分支
                case LZTabBarItemTypeImage: {
                    self.iconImageView.frame = CGRectMake(space,
                                                          space,
                                                          CGRectGetWidth(self.frame) - 2 * space,
                                                          CGRectGetHeight(self.frame) - 2 * space);
                }break;
                /// 处理 LZTabBarItemTypeText 分支
                case LZTabBarItemTypeText: {
                    self.titleLabel.frame = CGRectMake(space,
                                                       space,
                                                       CGRectGetWidth(self.frame) - 2 * space,
                                                       CGRectGetHeight(self.frame) - 2 * space);
                }break;
                /// 未匹配已知分支时执行兜底处理
                default:
                    break;
            }
        //    if (self.icon.length > 0 && self.title.length > 0) {
        //
        //        CGFloat iconHeight = (CGRectGetHeight(self.frame) - space * 3)*2/3.0 ;
        //        self.iconImageView.frame = CGRectMake(space, space, CGRectGetWidth(self.frame) - 2 * space, iconHeight);
        //        self.titleLabel.frame = CGRectMake(space, CGRectGetMaxY(self.iconImageView.frame) + space, CGRectGetWidth(self.frame) - 2*space, iconHeight/2.0);
        //    } else if (self.icon.length > 0 && self.title.length <= 0) {
        //
        //        self.iconImageView.frame = CGRectMake(space, space, CGRectGetWidth(self.frame) - 2*space, CGRectGetHeight(self.frame) - 2*space);
        //    } else if (self.title.length > 0 && self.icon.length <= 0) {
        //
        //        self.titleLabel.frame = CGRectMake(space, space, CGRectGetWidth(self.frame) - 2*space, CGRectGetHeight(self.frame) - 2*space);
        //    }
    };
}

-(void)setTag:(NSInteger)tag{
    jobsByNSIntegerBlock action = ((jobsByNSIntegerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LZTabBarItem.class, @selector(jobsSetTag)))(self, @selector(jobsSetTag));
    if (action) action(tag);
}

-(jobsByNSIntegerBlock _Nonnull)jobsSetTag{
    @jobs_weakify(self)
    return ^(NSInteger tag){
        @jobs_strongify(self)
        if (!self) return;
        [super setTag:tag + defaultTag];
    };
}

- (void)setIcon:(NSString *)icon {
    _icon = icon;
    self.iconImageView.byImage(icon.img);
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.byText(title);
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.byTextCor(titleColor);
}
#pragma mark —— lazyLoad
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        @jobs_weakify(self)
        _iconImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.byContentMode(UIViewContentModeScaleAspectFit);
            self.addSubview(imageView);
        });
    };return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        @jobs_weakify(self)
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontSystemFontOfSize(10))
                .byNumberOfLines(0)
                .byTextCor(JobsSecondaryLabelColor)
            .addOn(self);
        });
    };return _titleLabel;
}

@end

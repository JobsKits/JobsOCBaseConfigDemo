//
//  XDTextBtnView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "XDTextBtnView.h"

@interface XDTextBtnView ()

Prop_assign()CGFloat maxX;
Prop_assign(readwrite)CGFloat maxY;
Prop_assign()NSInteger lastIndex;
Prop_strong()NSMutableArray <NSString *> *selectArr;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN XDTextBtnView
@interface XDTextBtnView (JobsPropertyDSLSetterAutogen_6d75815caf)
-(void)setLastIndex:(NSInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END XDTextBtnView

@implementation XDTextBtnView
#define kAllBtnMaxWidth (self.bounds.size.width - self.marginX * 2)

static NSInteger const kXDTextBtnViewBtnTagPlus = 90000000;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.btnHeight = 30.0;
        self.marginX = 15.0;
        self.btnMarginX = 10.0;
        self.marginY = 15.0;
        self.textFontSize = 15.0;
        self.lastIndex = -1;
        self.isSingle = YES;
        self.selectArr = [NSMutableArray array];
    };return self;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
}

- (void)setBtnHeight:(CGFloat)btnHeight
{
    _btnHeight = btnHeight;
}

- (void)setMarginX:(CGFloat)marginX
{
    _marginX = marginX;
}

- (void)setTextArr:(NSArray<NSString *> *)textArr
{
    @jobs_weakify(self)
    _textArr = textArr;
    for (int i = 0; i < textArr.count; i ++) {
        NSString *text = textArr[i];
        CGFloat textWidth = [text boundingRectWithSize:CGSizeMake(kAllBtnMaxWidth, self.btnHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:UIFontWeightRegularSize(self.textFontSize + 0.5)} context:nil].size.width;
        CGFloat btnWidth = textWidth + self.marginX * 2;
        CGFloat btnX = self.maxX + self.marginX;
        CGFloat btnY = self.maxY;
        if (btnX > kAllBtnMaxWidth - btnWidth) {
            btnX = self.marginX;
            btnY = btnY + self.marginY + self.btnHeight;
        }
        UIButton *btn = (UIButton *)UIButton.jobsInit()
            .jobsResetBtnTitle(text)
            .byTitleLabel(^(UILabel *label) {
                label.byFont(UIFontSystemFontOfSize(self.textFontSize));
            })
            .onClickBy(^(__kindof UIButton * _Nullable button) {
                weak_self.btnAction(button);
            })
            .byTag(kXDTextBtnViewBtnTagPlus + i)
            .byLayer(^(CALayer *layer) {
                if (self.borderWidth > 0 && self.borderColor) {
                    layer
                        .byBorderWidth(self.borderWidth)
                        .byBorderColor(self.borderColor.CGColor);
                }
                if (self.cornerRadius > 0) {
                    layer.byCornerRadius(self.cornerRadius);
                }
            })
            .byViewBlock(^(__kindof UIView *view) {
                self.unSelectBtn((UIButton *)view);
            })
            .byFrame(CGRectMake(btnX, btnY, btnWidth, self.btnHeight))
            .addOn(self);
        self.maxX = CGRectGetMaxX(btn.frame);
        self.maxY = CGRectGetMinY(btn.frame);
    }
    if (textArr.count > 0) {
        self.maxY = self.maxY + self.btnHeight;
    }
}

- (void)setDefultIndexArr:(NSArray<NSString *> *)defultIndexArr
{
    _defultIndexArr = defultIndexArr;
    for (int i = 0; i < defultIndexArr.count; i ++) {
        if (i > defultIndexArr.count - 1) {
            break;
        }
        NSString *index = defultIndexArr[i];
        UIButton *btn = [self viewWithTag:index.integerValue + kXDTextBtnViewBtnTagPlus];
        self.btnAction(btn);
    }
}

-(jobsByBtnBlock _Nonnull)btnAction{
    @jobs_weakify(self)
    return ^(UIButton * btn){
        @jobs_strongify(self)
        if (!self) return;
        NSInteger index = btn.tag - kXDTextBtnViewBtnTagPlus;
        if (self.isSingle) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(XDTextBtnViewClickIndex:lastClickIndex:)]) {
                [self.delegate XDTextBtnViewClickIndex:index lastClickIndex:self.lastIndex];
            }
            UIButton *lastBtn = [self viewWithTag:self.lastIndex + kXDTextBtnViewBtnTagPlus];
            self.unSelectBtn(lastBtn);
            self.selectBtn(btn);
            self.byLastIndex(index);
        } else {
            NSString *indexStr = [NSString stringWithFormat:@"%ld", index];
            if (self.selectArr.count == 0) {
                [self.selectArr addObject:indexStr];
                self.selectBtn(btn);
            } else if ([self.selectArr containsObject:indexStr]) {
                //包含 移除
                [self.selectArr removeObject:indexStr];
                self.unSelectBtn(btn);
            } else {
                //不包含 添加
                [self.selectArr addObject:indexStr];
                self.selectBtn(btn);
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(XDTextBtnViewSelectIndexes:)]) {
                [self.delegate XDTextBtnViewSelectIndexes:self.selectArr];
            }
        }
    };
}

-(jobsByBtnBlock _Nonnull)selectBtn{
    @jobs_weakify(self)
    return ^(UIButton * btn){
        @jobs_strongify(self)
        if (!self) return;
        if (self.selectBackgroundColor) {
            btn.byBgColor(self.selectBackgroundColor);
        }
        if (self.selectTextColor) {
            btn.normalStateTitleColorBy(self.selectTextColor);
        }
    };
}

-(jobsByBtnBlock _Nonnull)unSelectBtn{
    @jobs_weakify(self)
    return ^(UIButton * btn){
        @jobs_strongify(self)
        if (!self) return;
        if (self.backgroundColor) {
            btn.byBgColor(self.backgroundColor);
        }
        if (self.textColor) {
            btn.normalStateTitleColorBy(self.textColor);
        }
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN XDTextBtnView
-(JobsRetXDTextBtnViewByNSIntegerBlock _Nonnull)byLastIndex{
    @jobs_weakify(self)
    return ^__kindof XDTextBtnView * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setLastIndex:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END XDTextBtnView
@end

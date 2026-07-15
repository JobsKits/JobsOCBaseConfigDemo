//
//  UITextView+IndicateWordLimit.m
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITextView+IndicateWordLimit.h"

@implementation UITextView (IndicateWordLimit)
#pragma mark —— Prop_strong()UILabel *indicateWordLimitLab;
JobsKey(_indicateWordLimitLab)
@dynamic indicateWordLimitLab;
-(UILabel *)indicateWordLimitLab{
    UILabel *IndicateWordLimitLab = Jobs_getAssociatedObject(_indicateWordLimitLab);
    if (!IndicateWordLimitLab) {
        @jobs_weakify(self)
        IndicateWordLimitLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(RGB_COLOR(132, 134, 140))
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontWeightMediumSize(10))
                .byText([NSString stringWithFormat:@"   %ld / %ld   ",self.currentWordNum,self.wordLimitNum])
                .makeLabelByShowingType(UILabelShowingType_03)
                .byLabelBlock(^(__kindof UILabel * _Nullable data) {
                    Jobs_setAssociatedRETAIN_NONATOMIC(_indicateWordLimitLab, data)
                })
                .addOn(self)
                .byRight(self.width - self.offsetX)
                .byBottom(self.height - self.offsetY);
        });
    };return IndicateWordLimitLab;
}

-(void)setIndicateWordLimitLab:(UILabel *)indicateWordLimitLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_indicateWordLimitLab, indicateWordLimitLab)
}
#pragma mark —— Prop_assign()NSInteger currentWordNum;//当前输入的字符数
JobsKey(_currentWordNum)
@dynamic currentWordNum;
-(NSInteger)currentWordNum{
    return [Jobs_getAssociatedObject(_currentWordNum) integerValue];
}

-(void)setCurrentWordNum:(NSInteger)currentWordNum{
    self.indicateWordLimitLab.byText([NSString stringWithFormat:@"   %ld / %ld   ",currentWordNum,self.wordLimitNum]);
    self.indicateWordLimitLab.makeLabelByShowingType(UILabelShowingType_03);
    Jobs_setAssociatedRETAIN_NONATOMIC(_currentWordNum, @(currentWordNum))
}
#pragma mark —— Prop_assign()NSInteger wordimitNum;//字符输入上限
JobsKey(_wordLimitNum)
@dynamic wordLimitNum;
-(NSInteger)wordLimitNum{
    NSInteger WordLimitNum = [Jobs_getAssociatedObject(_wordLimitNum) integerValue];
    if (!WordLimitNum) {
        WordLimitNum = 500;
        Jobs_setAssociatedRETAIN_NONATOMIC(_wordLimitNum, @(WordLimitNum))
    };return WordLimitNum;
}

-(void)setWordLimitNum:(NSInteger)wordLimitNum{
    Jobs_setAssociatedRETAIN_NONATOMIC(_wordLimitNum, @(wordLimitNum))
}
#pragma mark —— Prop_assign()CGFloat offsetX;
JobsKey(_offsetX)
@dynamic offsetX;
-(CGFloat)offsetX{
    CGFloat OffsetX = [Jobs_getAssociatedObject(_offsetX) floatValue];
    if (!OffsetX) {
        OffsetX = JobsWidth(19.1);
        Jobs_setAssociatedRETAIN_NONATOMIC(_offsetX, @(OffsetX))
    };return OffsetX;
}

-(void)setOffsetX:(CGFloat)offsetX{
    Jobs_setAssociatedRETAIN_NONATOMIC(_offsetX, @(offsetX))
}
#pragma mark —— Prop_assign()CGFloat offsetY;
JobsKey(_offsetY)
@dynamic offsetY;
-(CGFloat)offsetY{
    CGFloat OffsetY = [Jobs_getAssociatedObject(_offsetY) floatValue];
    if (!OffsetY) {
        OffsetY = JobsWidth(13.1);
        Jobs_setAssociatedRETAIN_NONATOMIC(_offsetY, @(OffsetY))
    };return OffsetY;
}

-(void)setOffsetY:(CGFloat)offsetY{
    Jobs_setAssociatedRETAIN_NONATOMIC(_offsetY, @(offsetY))
}

@end

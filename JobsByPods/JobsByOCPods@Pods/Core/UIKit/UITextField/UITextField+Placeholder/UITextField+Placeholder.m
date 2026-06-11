//
//  UITextField+Placeholder.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITextField+Placeholder.h"

@implementation UITextField (Placeholder)
/// UITextModelProtocol
UITextModelProtocol_dynamic
/// 修改Placeholder亦可以通过富文本来完成
-(__kindof NSAttributedString *)_defaultAttributedPlaceholder{
    return self.richTextWithDataConfigMutArr(self.titleAttributedDataMutArr);
}

-(UILabel *)placeholderLabel{
    if (isNull(self.placeholder)) self.placeholder = JobsSpace;
    Ivar ivar = class_getInstanceVariable(UITextField.class, "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self, ivar);
    return placeholderLabel.byNumberOfLines(0);// 默认折行处理
}
#pragma mark —— Prop_strong()UIColor *placeholderColor;
JobsKey(_placeholderColor)
-(UIColor *)placeholderColor{
    UIColor *PlaceholderColor = Jobs_getAssociatedObject(_placeholderColor);
    if (!PlaceholderColor) {
        PlaceholderColor = self.textColor;
        self.placeholderLabel.byTextCor(PlaceholderColor);
        Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderColor, PlaceholderColor)
    };return PlaceholderColor;
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    self.placeholderLabel.byTextCor(placeholderColor);
    Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderColor, placeholderColor)
}
#pragma mark —— Prop_strong()UIFont *placeholderFont;
JobsKey(_placeholderFont)
-(UIFont *)placeholderFont{
    UIFont *PlaceholderFont = Jobs_getAssociatedObject(_placeholderFont);
    if (!PlaceholderFont) {
        PlaceholderFont = self.font;
        self.placeholderLabel.byFont(PlaceholderFont);
        Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderFont, PlaceholderFont)
    };return PlaceholderFont;
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    self.placeholderLabel.byFont(placeholderFont);
    Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderFont, placeholderFont)
}
#pragma mark —— Prop_strong()NSMutableArray <JobsRichTextConfig *>*titleAttributedDataMutArr;
JobsKey(_titleAttributedDataMutArr)
-(NSMutableArray<JobsRichTextConfig *> *)titleAttributedDataMutArr{
    NSMutableArray *TitleAttributedDataMutArr = Jobs_getAssociatedObject(_titleAttributedDataMutArr);
    if (!TitleAttributedDataMutArr) {
        @jobs_weakify(self)
        TitleAttributedDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray *_Nullable data) {
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig *_Nullable config) {
                @jobs_strongify(self)
                config.byTargetString(self.placeholder)
                      .byFont(UIFontWeightRegularSize(10))
                      .byTextCor(JobsBlueColor);
//                config.underlineStyle;
//                config.paragraphStyle;
//                config.urlStr;
                config.byRange(NSMakeRange(0, self.placeholder.length));
            }));
        });Jobs_setAssociatedRETAIN_NONATOMIC(_titleAttributedDataMutArr, TitleAttributedDataMutArr)
    };return TitleAttributedDataMutArr;
}

-(void)setTitleAttributedDataMutArr:(NSMutableArray<JobsRichTextConfig *> *)titleAttributedDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_titleAttributedDataMutArr, titleAttributedDataMutArr)
}
#pragma mark —— @property(nonatomic,strong,nullable)NSAttributedString *attributedText API_AVAILABLE(ios(6.0));
JobsKey(_attributedText)
-(NSAttributedString *)attributedText{
    NSAttributedString *AttributedText = Jobs_getAssociatedObject(_attributedText);
    if(!AttributedText){
        AttributedText = self.richTextWithDataConfigMutArr(self.titleAttributedDataMutArr);
    }Jobs_setAssociatedRETAIN_NONATOMIC(_attributedText, AttributedText)
    return AttributedText;
}

@end

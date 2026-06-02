//
//  JobsRichTextConfig.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_INLINE NSMutableParagraphStyle *_Nonnull jobsMakeParagraphStyle(jobsByMutableParagraphStyleBlock _Nonnull block){
    NSMutableParagraphStyle *data = NSMutableParagraphStyle.alloc.init;
    /**

     常见的属性及说明
     alignment               对齐方式，取值枚举常量 NSTextAlignment
     firstLineHeadIndent     首行缩进，取值 float
     headIndent              缩进，取值 float
     tailIndent              尾部缩进，取值 float
     ineHeightMultiple       可变行高,乘因数，取值 float
     maximumLineHeight       最大行高，取值 float
     minimumLineHeight       最小行高，取值 float
     lineSpacing             行距，取值 float
     paragraphSpacing        段距，取值 float
     paragraphSpacingBefore  段首空间，取值 float

     baseWritingDirection    句子方向，取值枚举常量 NSWritingDirection
     lineBreakMode           断行方式，取值枚举常量 NSLineBreakMode
     hyphenationFactor       连字符属性，在iOS，唯一支持的值分别为0和1

     */
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_BEGIN
/// 富文本4要素：文字信息、文字颜色、段落、字体
@interface JobsRichTextConfig : NSObject

Prop_copy()NSString *targetString;/// 作用文字
Prop_strong()UIFont *font;/// 添加字体
Prop_strong()UIColor *textCor;/// 添加文字颜色
Prop_strong()UIColor *textBgCor;/// 添加文字背景颜色
Prop_assign()NSUnderlineStyle underlineStyle;/// 添加下划线
Prop_strong()UIColor *underlineCor;/// 添加下划线的颜色
Prop_strong(null_resettable)NSMutableParagraphStyle *paragraphStyle;/// 添加段落样式
Prop_copy()NSString *urlStr;/// 添加链接可点击
Prop_assign()NSRange range;/// 设置作用域

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsRichTextConfig *_Nonnull jobsMakeRichTextConfig(jobsByRichTextConfigBlock _Nonnull block){
    JobsRichTextConfig *data = JobsRichTextConfig.alloc.init;
    if (block) block(data);
    return data;
}
/**

     /// 默认文本段落样式
     -(NSMutableParagraphStyle *)defaultParagraphStyle{
         return jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
             data.alignment = NSTextAlignmentJustified;
             data.paragraphSpacing = 0;/// 段距，取值 float
             data.paragraphSpacingBefore = 0;/// 段首空间，取值 float
             data.firstLineHeadIndent = 0.0;/// 首行缩进，取值 float
             data.headIndent = 0.0;/// 整体缩进(首行除外)，取值 float
             data.lineSpacing = 0;/// 行距，取值 float
         });
     }

     @synthesize attributedTitle = _attributedTitle;
     -(NSAttributedString *)attributedTitle{
         if (!_attributedTitle) {
             @jobs_weakify(self)
             _attributedTitle = self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
                 data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                     @jobs_strongify(self)
                     data1.font = UIFontWeightRegularSize(JobsWidth(12));
                     data1.textCor = JobsBlueColor;
                     data1.targetString = @"编译器自动管理内存地址".tr.add(JobsNewline);
                     data1.textBgCor = JobsBrownColor;
                     data1.paragraphStyle = self.defaultParagraphStyle;
                 }))
                 .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                     data1.font = UIFontWeightSemiboldSize(JobsWidth(13));
                     data1.textCor = JobsWhiteColor;
                     data1.targetString = @"让程序员更加专注于".tr.add(JobsNewline);
                     data1.textBgCor = JobsBrownColor;
                     data1.paragraphStyle = self.defaultParagraphStyle;
                 }))
                 .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                     @jobs_strongify(self)
                     data1.font = UIFontWeightUltraLightSize(JobsWidth(14));
                     data1.textCor = JobsGreenColor;
                     data1.targetString = @"APP的业务。".tr;
                     data1.textBgCor = JobsBrownColor;
                     data1.paragraphStyle = self.defaultParagraphStyle;
                 }));
             }));
         }return _attributedTitle;
     }
 */

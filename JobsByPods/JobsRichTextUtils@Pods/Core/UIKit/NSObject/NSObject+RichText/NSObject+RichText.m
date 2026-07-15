//
//  NSObject+RichText.m
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+RichText.h"
#import <JobsRichTextUtils/NSMutableArray+Extra.h>
#import <JobsRichTextUtils/UIColor+Extra.h>
#import <JobsRichTextUtils/NSString+Extra.h>

@implementation NSObject (RichText)
/// 调用示例：对外输出 NSMutableArray <JobsRichTextConfig *>*
-(NSMutableArray <JobsRichTextConfig *>*)makeRichTextConfigMutArr{
    return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
            data1.byFont(UIFontWeightRegularSize(10.6))
                 .byTextCor(RGB_SAMECOLOR(115))
                 .byTargetString(@"我是第一段文字".tr);
        }));
        data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
            data1.font = UIFontWeightRegularSize(10.6);;
            data1.textCor = [UIColor gradientCorDataMutArr:jobsMakeMutArr(^(NSMutableArray <UIColor *>*_Nullable data) {
                data.add(RGB_COLOR(247, 131, 97));
                data.add(RGB_COLOR(245, 75, 100));
            })
                                                 startPoint:CGPointZero
                                                   endPoint:CGPointZero
                                                     opaque:NO
                                            targetViewRect:jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable model) {
                model.byJobsWidth(JobsWidth(400))
                     .byJobsHeight(JobsWidth(1));
            })];
            data1.byTargetString(@"我是第二段文字".tr);
        }));
    });;
}
/// 整合输出富文本，作用于lable.attributedText
/// @param richTextDataConfigMutArr 富文本的配置集合,对该纯文本字符串的释义
/// @param paragraphStyle 段落样式
-(NSMutableAttributedString *_Nullable)richTextWithDataConfigMutArr:(NSArray <JobsRichTextConfig *>*_Nonnull)richTextDataConfigMutArr
                                                     paragraphStyle:(NSMutableParagraphStyle *_Nullable)paragraphStyle{
    if (!paragraphStyle) {
        paragraphStyle = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
            data.byAlignment(NSTextAlignmentLeft); //❤️文本对齐方式 左右对齐（两边对齐）,textAlignment属性失效❤️
        });
    }
    /// 设置段落样式
    NSMutableAttributedString *attributedString = self.richTextWithDataConfigMutArr(richTextDataConfigMutArr);
    attributedString.addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel *_Nullable data) {
        data.byValue(paragraphStyle)
            .byRange(NSMakeRange(0, attributedString.string.length));
    }));return attributedString;
}
/// 利用 NSArray <JobsRichTextConfig *>* 形成富文本
-(JobsRetAttributedStringByRichTextConfigArrayBlock _Nonnull)richTextWithDataConfigMutArr{
    /// richTextDataConfigMutArr 富文本的配置集合,对该纯文本字符串的释义
    /// JobsRichTextConfig：富文本里面单个字符单元的配置
    return ^NSMutableAttributedString *_Nullable(NSArray <JobsRichTextConfig *>*_Nullable arr) {
        NSString *resultString = @"";
        /// 先拼接字符串
        for (JobsRichTextConfig *config in arr) {
            if (config.targetString) {
                resultString = resultString.add(config.targetString);
                JobsLog(@"resultString = %@",resultString);
            }
        }
        JobsLog(@"resultString = %@",resultString);
        NSMutableAttributedString *attrString = JobsMutAttributedString(resultString);
        if (!arr || !arr.count) return attrString;
        ///  因为NSArray <JobsRichTextConfig *>* 是动态。进方法以后为固定，那么以此计算真正的range
        NSUInteger currentFrontLocation = 0;/// 当前位置（前）
        for (JobsRichTextConfig *config in arr) {
            config.byRange(NSMakeRange(currentFrontLocation, config.targetString.length));
            currentFrontLocation += config.targetString.length;
        }
        for (JobsRichTextConfig *config in arr){
            /// 添加字体 & 设置作用域
            if (config.font) {
                attrString.addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                    data.byValue(config.font)
                        .byRange(config.range);
                }));
            }
            /// 添加文字颜色 & 设置作用域
            if (config.textCor) {
                attrString.addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                    data.byValue(config.textCor)
                        .byRange(config.range);
                }));
            }
            /// 添加下划线 & 设置作用域
            if (config.underlineStyle) {
                attrString.addUnderlineStyleAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                    data.byValue(@(config.underlineStyle))
                        .byRange(config.range);
                }));
            }
            /// 设置下划线的颜色
            if (config.underlineCor) {
                attrString.addUnderlineColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                    data.byValue(config.underlineCor)
                        .byRange(config.range);
                }));
            }
            /// 添加段落样式 & 设置作用域
            if (config.paragraphStyle) {
                attrString.addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                    data.byValue(config.paragraphStyle)
                        .byRange(config.range);
                }));
            }
            /// 添加链接 & 设置作用域
            if (config.urlStr) {
                attrString.addLinkAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                    data.byValue(config.urlStr)
                        .byRange(config.range);
                }));
            }
        };return attrString;
    };
}
/// 字符串中划线
-(JobsRetAttributedStringByStrBlock _Nonnull)jobsHorizontalCentralLineation{
    return ^__kindof NSAttributedString *_Nullable(NSString *data) {
        return JobsMutAttributedStringByAttributes(data,jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable dic) {
            [dic setValue:@(NSUnderlineStyleSingle) forKey:NSStrikethroughStyleAttributeName];
        })
                                             );
    };
}
/// 字符串下划线
-(JobsRetAttributedStringByStrBlock _Nonnull)jobsHorizontalBottomLineation{
    return ^__kindof NSAttributedString *_Nullable(NSString *data) {
        return JobsMutAttributedStringByAttributes(data,jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable dic) {
            [dic setValue:@(NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
        }));
    };
}

@end

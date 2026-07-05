//
//  JobsRichTextConfig.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsRichTextConfig.h"

@implementation JobsRichTextConfig
#pragma mark —— default
-(NSMutableParagraphStyle *)paragraphStyle{
    if (!_paragraphStyle) {
        _paragraphStyle = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
            /// JobsModel 是底层模型 Pod，不能反向依赖 JobsOCDSL。
            data.lineSpacing = JobsWidth(10);/// 行间距
            data.paragraphSpacing = JobsWidth(20);/// 段落间距
            data.alignment = NSTextAlignmentLeft;/// 对齐方式
            data.firstLineHeadIndent = JobsWidth(30);/// 指定段落开始的缩进像素
            data.headIndent = JobsWidth(10);/// 调整全部文字的缩进像素
        });
    };return _paragraphStyle;
}

-(NSString *)urlStr{
    if (!_urlStr) {
//        _urlStr = @"www.google.com";
    };return _urlStr;
}

@end

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
            data
                .byLineSpacing(JobsWidth(10))
                .byParagraphSpacing(JobsWidth(20))
                .byAlignment(NSTextAlignmentLeft)
                .byFirstLineHeadIndent(JobsWidth(30))
                .byHeadIndent(JobsWidth(10));
        });
    };return _paragraphStyle;
}

-(NSString *)urlStr{
    if (!_urlStr) {
//        _urlStr = @"www.google.com";
    };return _urlStr;
}

@end

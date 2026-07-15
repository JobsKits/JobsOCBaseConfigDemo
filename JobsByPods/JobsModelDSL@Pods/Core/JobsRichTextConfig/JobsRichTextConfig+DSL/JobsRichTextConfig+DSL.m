//
//  JobsRichTextConfig+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsRichTextConfig+DSL.h"

@implementation JobsRichTextConfig (DSL)
-(JobsRetJobsRichTextConfigByStrBlock _Nonnull)byTargetString{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.targetString = data;
        return self;
    };
}

-(JobsRetJobsRichTextConfigByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetJobsRichTextConfigByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(JobsRetJobsRichTextConfigByCorBlock _Nonnull)byTextBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.textBgCor = data;
        return self;
    };
}

-(JobsRetJobsRichTextConfigByNSUnderlineStyleBlock _Nonnull)byUnderlineStyle{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nullable(NSUnderlineStyle data) {
        @jobs_strongify(self)
        self.underlineStyle = data;
        return self;
    };
}

-(JobsRetJobsRichTextConfigByCorBlock _Nonnull)byUnderlineCor{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.underlineCor = data;
        return self;
    };
}

-(JobsRetJobsRichTextConfigByNSMutableParagraphStylePointerBlock _Nonnull)byParagraphStyle{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nullable(NSMutableParagraphStyle * _Nullable data) {
        @jobs_strongify(self)
        self.paragraphStyle = data;
        return self;
    };
}

-(JobsRetJobsRichTextConfigByStrBlock _Nonnull)byUrlStr{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.urlStr = data;
        return self;
    };
}

-(JobsRetJobsRichTextConfigByNSRangeBlock _Nonnull)byRange{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nullable(NSRange data) {
        @jobs_strongify(self)
        self.range = data;
        return self;
    };
}

@end

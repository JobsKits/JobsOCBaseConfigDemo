//
//  JobsRichTextConfig+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsRichTextConfig+DSL.h"

@implementation JobsRichTextConfig (DSL)

#pragma mark —— 来自 JobsRichTextConfig
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSString * data))byTargetString{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.targetString = data;
        return self;
    };
}

-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(UIFont * data))byFont{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(UIColor * data))byTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(UIColor * data))byTextBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.textBgCor = data;
        return self;
    };
}

-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSUnderlineStyle data))byUnderlineStyle{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nonnull(NSUnderlineStyle data) {
        @jobs_strongify(self)
        self.underlineStyle = data;
        return self;
    };
}

-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(UIColor * data))byUnderlineCor{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.underlineCor = data;
        return self;
    };
}

-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSMutableParagraphStyle * data))byParagraphStyle{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nonnull(NSMutableParagraphStyle * data) {
        @jobs_strongify(self)
        self.paragraphStyle = data;
        return self;
    };
}

-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSString * data))byUrlStr{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.urlStr = data;
        return self;
    };
}

-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSRange data))byRange{
    @jobs_weakify(self)
    return ^__kindof JobsRichTextConfig *_Nonnull(NSRange data) {
        @jobs_strongify(self)
        self.range = data;
        return self;
    };
}

@end

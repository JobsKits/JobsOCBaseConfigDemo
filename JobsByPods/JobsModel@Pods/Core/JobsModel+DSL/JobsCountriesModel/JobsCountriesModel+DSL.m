//
//  JobsCountriesModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsCountriesModel+DSL.h"

@implementation JobsCountriesModel (DSL)

#pragma mark —— 来自 JobsCountriesModel
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byAbbr{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.abbr = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byChinese{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.chinese = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byCode{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.code = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byEnglish{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.english = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))bySpell{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.spell = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byState{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.state = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byFrench{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.french = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byItalian{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.italian = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))bySpanish{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.spanish = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byJapanese{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.japanese = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byRussian{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.russian = data;
        return self;
    };
}

-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byGermen{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.germen = data;
        return self;
    };
}

@end

//
//  JobsCountriesModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsCountriesModel+DSL.h"

@implementation JobsCountriesModel (DSL)

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byAbbr{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.abbr = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byChinese{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.chinese = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byCode{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.code = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byEnglish{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.english = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)bySpell{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.spell = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byState{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.state = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byFrench{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.french = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byItalian{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.italian = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)bySpanish{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.spanish = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byJapanese{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.japanese = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byRussian{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.russian = data;
        return self;
    };
}

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byGermen{
    @jobs_weakify(self)
    return ^__kindof JobsCountriesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.germen = data;
        return self;
    };
}
@end

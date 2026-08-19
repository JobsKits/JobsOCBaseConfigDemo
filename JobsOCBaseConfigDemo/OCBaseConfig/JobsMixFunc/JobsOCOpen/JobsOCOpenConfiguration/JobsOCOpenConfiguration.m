//
//  JobsOCOpenConfiguration.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCOpenConfiguration.h"

#import "NSString+Sys.h"

@implementation JobsOCOpenConfiguration
+(JobsRetIDByVoidBlock _Nonnull)config{
    return ^id{
        return [[self alloc] init];
    };
}

-(instancetype)init{
    return [self initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
}

-(instancetype)initWithURL:(NSURL *_Nullable)url{
    if (self = [super init]) {
        self.byURL(url ?: [NSURL URLWithString:@"http://www.baidu.com"]);
        self.byMode(JobsOCOpenModeInApp);
        self.byAnimated(YES);
    };return self;
}

+(JobsRetURLByStrBlock _Nonnull)jobsURLWithString{
    return ^NSURL *_Nullable(NSString *_Nullable string){
        if (![string isKindOfClass:NSString.class]) return nil;
        NSString *trimmed = string.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
        if (!trimmed.length) return nil;
        NSURL *directURL = [NSURL URLWithString:trimmed];
        if (directURL.scheme.length) return directURL;
        NSString *prepared = [trimmed containsString:@"://"] ? trimmed : [@"https://" stringByAppendingString:trimmed];
        NSURL *preparedURL = [NSURL URLWithString:prepared];
        if (preparedURL) return preparedURL;
        NSString *encoded = [prepared stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLFragmentAllowedCharacterSet];
        return encoded.length ? [NSURL URLWithString:encoded] : nil;
    };
}

-(JobsRetJobsOCOpenConfigurationByNSURLBlock _Nonnull)byURL{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(NSURL *_Nullable url){
        @jobs_strongify(self)
        [self setUrl:url];
        return self;
    };
}

-(JobsRetJobsOCOpenConfigurationByNSStringBlock _Nonnull)byURLString{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(NSString *_Nullable urlString){
        @jobs_strongify(self)
        self.byURL(JobsOCOpenConfiguration.jobsURLWithString(urlString));
        return self;
    };
}

-(JobsRetJobsOCOpenConfigurationByJobsOCOpenModeBlock _Nonnull)byMode{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(JobsOCOpenMode mode){
        @jobs_strongify(self)
        [self setMode:mode];
        return self;
    };
}

-(JobsRetJobsOCOpenConfigurationByNSStringBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(NSString *_Nullable title){
        @jobs_strongify(self)
        [self setPageTitle:title];
        return self;
    };
}

-(JobsRetJobsOCOpenConfigurationByBOOLBlock _Nonnull)byAnimated{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(BOOL animated){
        @jobs_strongify(self)
        [self setAnimated:animated];
        return self;
    };
}

-(JobsRetJobsOCOpenConfigurationByjobsByBOOLBlockBlock _Nonnull)byCompletion{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(jobsByBOOLBlock _Nullable completion){
        @jobs_strongify(self)
        [self setCompletion:completion];
        return self;
    };
}

@end

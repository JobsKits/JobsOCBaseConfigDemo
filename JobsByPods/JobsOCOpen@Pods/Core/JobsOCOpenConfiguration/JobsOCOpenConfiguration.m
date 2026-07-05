//
//  JobsOCOpenConfiguration.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCOpenConfiguration.h"
#import <JobsOCOpen/NSString+Sys.h>

@implementation JobsOCOpenConfiguration

+(instancetype)config{
    return [[self alloc] init];
}

-(instancetype)init{
    return [self initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
}

-(instancetype)initWithURL:(NSURL *_Nullable)url{
    if (self = [super init]) {
        self.url = url ?: [NSURL URLWithString:@"http://www.baidu.com"];
        self.mode = JobsOCOpenModeInApp;
        self.animated = YES;
    };return self;
}

+(NSURL *_Nullable)jobsURLWithString:(NSString *_Nullable)string{
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
}

-(JobsOCOpenConfiguration *_Nonnull(^)(NSURL *_Nullable))byURL{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(NSURL *_Nullable url){
        @jobs_strongify(self)
        self.url = url;
        return self;
    };
}

-(JobsOCOpenConfiguration *_Nonnull(^)(NSString *_Nullable))byURLString{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(NSString *_Nullable urlString){
        @jobs_strongify(self)
        self.url = [JobsOCOpenConfiguration jobsURLWithString:urlString];
        return self;
    };
}

-(JobsOCOpenConfiguration *_Nonnull(^)(JobsOCOpenMode))byMode{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(JobsOCOpenMode mode){
        @jobs_strongify(self)
        self.mode = mode;
        return self;
    };
}

-(JobsOCOpenConfiguration *_Nonnull(^)(NSString *_Nullable))byTitle{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(NSString *_Nullable title){
        @jobs_strongify(self)
        self.pageTitle = title;
        return self;
    };
}

-(JobsOCOpenConfiguration *_Nonnull(^)(BOOL))byAnimated{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(BOOL animated){
        @jobs_strongify(self)
        self.animated = animated;
        return self;
    };
}

-(JobsOCOpenConfiguration *_Nonnull(^)(jobsByBOOLBlock _Nullable))byCompletion{
    @jobs_weakify(self)
    return ^JobsOCOpenConfiguration *_Nonnull(jobsByBOOLBlock _Nullable completion){
        @jobs_strongify(self)
        self.completion = completion;
        return self;
    };
}

@end

//
//  JobsOCSplashConfiguration.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashConfiguration.h"

@interface JobsOCSplashConfiguration ()

Prop_assign() JobsOCSplashContentType contentType;
Prop_copy(nullable) NSString *resourceName;
Prop_copy(nullable) NSString *fileExtension;
Prop_strong(nullable) NSURL *remoteURL;
Prop_strong() NSBundle *bundle;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCSplashConfiguration
@interface JobsOCSplashConfiguration (JobsPropertyDSLSetterAutogen_016043250e)
-(void)setBundle:(NSBundle * _Nullable)data;
-(void)setContentType:(JobsOCSplashContentType)data;
-(void)setFileExtension:(NSString * _Nullable)data;
-(void)setOnSkip:(JobsOCSplashSkipBlock)data;
-(void)setRemoteURL:(NSURL * _Nullable)data;
-(void)setResourceName:(NSString * _Nullable)data;
-(void)setUsesCustomSkipButtonFrame:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCSplashConfiguration

@implementation JobsOCSplashConfiguration
+(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)localImage{
    return ^__kindof JobsOCSplashConfiguration *(NSString * name){
        return [self localImage:name bundle:NSBundle.mainBundle];
    };
}

+(__kindof JobsOCSplashConfiguration *)localImage:(NSString *)name bundle:(NSBundle *)bundle {
    return [self configWithType:JobsOCSplashContentTypeLocalImage resourceName:name fileExtension:nil remoteURL:nil bundle:bundle];
}

+(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)localGIF{
    return ^__kindof JobsOCSplashConfiguration *(NSString * name){
        return [self localGIF:name bundle:NSBundle.mainBundle];
    };
}

+(__kindof JobsOCSplashConfiguration *)localGIF:(NSString *)name bundle:(NSBundle *)bundle {
    return [self configWithType:JobsOCSplashContentTypeLocalGIF resourceName:name fileExtension:nil remoteURL:nil bundle:bundle];
}

+(JobsRetJobsOCSplashConfigurationByNSURLBlock _Nonnull)remoteImage{
    return ^__kindof JobsOCSplashConfiguration *(NSURL * URL){
        return [self configWithType:JobsOCSplashContentTypeRemoteImage resourceName:nil fileExtension:nil remoteURL:URL bundle:NSBundle.mainBundle];
    };
}

+(__kindof JobsOCSplashConfiguration *)localVideo:(NSString *)name fileExtension:(NSString *)fileExtension bundle:(NSBundle *)bundle {
    return [self configWithType:JobsOCSplashContentTypeLocalVideo resourceName:name fileExtension:fileExtension remoteURL:nil bundle:bundle ?: NSBundle.mainBundle];
}

+(JobsRetJobsOCSplashConfigurationByNSURLBlock _Nonnull)remoteVideo{
    return ^__kindof JobsOCSplashConfiguration *(NSURL * URL){
        return [self remoteVideo:URL fallbackLocalVideo:nil fileExtension:nil bundle:nil];
    };
}

+(__kindof JobsOCSplashConfiguration *)remoteVideo:(NSURL *)URL
                               fallbackLocalVideo:(NSString *)name
                                     fileExtension:(NSString *)fileExtension
                                            bundle:(NSBundle *)bundle {
    return [self configWithType:JobsOCSplashContentTypeRemoteVideo
                  resourceName:name
                 fileExtension:fileExtension
                     remoteURL:URL
                        bundle:bundle ?: NSBundle.mainBundle];
}

+(__kindof JobsOCSplashConfiguration *)configWithType:(JobsOCSplashContentType)type
                                        resourceName:(NSString *)resourceName
                                       fileExtension:(NSString *)fileExtension
                                           remoteURL:(NSURL *)remoteURL
                                              bundle:(NSBundle *)bundle {
    JobsOCSplashConfiguration *configuration = JobsOCSplashConfiguration.alloc.init;
    configuration.byContentType(type);
    configuration.byResourceName(resourceName);
    configuration.byFileExtension(fileExtension);
    configuration.byRemoteURL(remoteURL);
    configuration.byBundle(bundle ?: NSBundle.mainBundle);
    return configuration;
}

-(instancetype)init {
    if (self = [super init]) {
        _bundle = NSBundle.mainBundle;
        _skipButtonVisible = YES;
        _skipButtonInsets = UIEdgeInsetsMake(12, 16, 12, 16);
        _contentMode = UIViewContentModeScaleAspectFill;
        _videoGravity = AVLayerVideoGravityResizeAspectFill;
        _tapAction = JobsOCSplashAction.openURL([NSURL URLWithString:@"https://www.baidu.com"]);
        _shakeAction = JobsOCSplashAction.openURL([NSURL URLWithString:@"https://www.baidu.com"]);
    };return self;
}

-(id)copyWithZone:(NSZone *)zone {
    JobsOCSplashConfiguration *configuration = [[JobsOCSplashConfiguration allocWithZone:zone] init];
    configuration.byContentType(self.contentType);
    configuration.byResourceName(self.resourceName);
    configuration.byFileExtension(self.fileExtension);
    configuration.byRemoteURL(self.remoteURL);
    configuration.byBundle(self.bundle);
    configuration.byCountdownSeconds(self.countdownSeconds);
    configuration.byLanguageCode(self.languageCode);
    configuration.bySkipButtonVisible(self.skipButtonVisible);
    configuration.bySkipButtonFrame(self.skipButtonFrame);
    configuration.byUsesCustomSkipButtonFrame(self.usesCustomSkipButtonFrame);
    configuration.bySkipButtonInsets(self.skipButtonInsets);
    configuration.byContentMode(self.contentMode);
    configuration.byVideoGravity(self.videoGravity);
    configuration.byTapAction([self.tapAction copy]);
    configuration.byShakeAction([self.shakeAction copy]);
    configuration.byOnSkip(self.onSkip);
    return configuration;
}

-(JobsRetJobsOCSplashConfigurationByNSNumberBlock _Nonnull)byCountdownSeconds {
    return ^JobsOCSplashConfiguration *(NSNumber *_Nullable data) {
        self.countdownSeconds = data ? @(MAX(0, data.integerValue)) : nil;
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)byLanguageCode {
    return ^JobsOCSplashConfiguration *(NSString *_Nullable data) {
        self.languageCode = data;
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByBOOLBlock _Nonnull)bySkipButtonVisible {
    return ^JobsOCSplashConfiguration *(BOOL data) {
        self.skipButtonVisible = data;
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByCGRectBlock _Nonnull)bySkipButtonFrame {
    return ^JobsOCSplashConfiguration *(CGRect data) {
        self.skipButtonFrame = data;
        self.usesCustomSkipButtonFrame = YES;
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByUIEdgeInsetsBlock _Nonnull)bySkipButtonInsets {
    return ^JobsOCSplashConfiguration *(UIEdgeInsets data) {
        self.skipButtonInsets = data;
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByUIViewContentModeBlock _Nonnull)byContentMode {
    return ^JobsOCSplashConfiguration *(UIViewContentMode data) {
        self.contentMode = data;
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByAVLayerVideoGravityBlock _Nonnull)byVideoGravity {
    return ^JobsOCSplashConfiguration *(AVLayerVideoGravity data) {
        self.videoGravity = data;
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByJobsOCSplashActionBlock _Nonnull)byTapAction {
    return ^JobsOCSplashConfiguration *(JobsOCSplashAction *data) {
        self.tapAction = data ?: JobsOCSplashAction.none();
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByJobsOCSplashActionBlock _Nonnull)byShakeAction {
    return ^JobsOCSplashConfiguration *(JobsOCSplashAction *data) {
        self.shakeAction = data ?: JobsOCSplashAction.none();
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByJobsOCSplashSkipBlockBlock _Nonnull)bySkip {
    return ^JobsOCSplashConfiguration *(JobsOCSplashSkipBlock _Nullable data) {
        self.onSkip = data;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCSplashConfiguration
-(JobsRetJobsOCSplashConfigurationByBOOLBlock _Nonnull)byUsesCustomSkipButtonFrame{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashConfiguration * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setUsesCustomSkipButtonFrame:data];
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByJobsOCSplashContentTypeBlock _Nonnull)byContentType{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashConfiguration * _Nullable(JobsOCSplashContentType data){
        @jobs_strongify(self)
        [self setContentType:data];
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByJobsOCSplashSkipBlockBlock _Nonnull)byOnSkip{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashConfiguration * _Nullable(JobsOCSplashSkipBlock data){
        @jobs_strongify(self)
        [self setOnSkip:data];
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByNSBundleBlock _Nonnull)byBundle{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashConfiguration * _Nullable(NSBundle * _Nullable data){
        @jobs_strongify(self)
        [self setBundle:data];
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)byFileExtension{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashConfiguration * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setFileExtension:data];
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)byResourceName{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashConfiguration * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setResourceName:data];
        return self;
    };
}

-(JobsRetJobsOCSplashConfigurationByNSURLBlock _Nonnull)byRemoteURL{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashConfiguration * _Nullable(NSURL * _Nullable data){
        @jobs_strongify(self)
        [self setRemoteURL:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCSplashConfiguration
@end

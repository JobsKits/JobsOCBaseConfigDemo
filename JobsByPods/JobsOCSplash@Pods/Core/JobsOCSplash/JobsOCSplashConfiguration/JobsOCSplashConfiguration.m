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

@implementation JobsOCSplashConfiguration
+(__kindof JobsOCSplashConfiguration *)localImage:(NSString *)name {
    return [self localImage:name bundle:NSBundle.mainBundle];
}

+(__kindof JobsOCSplashConfiguration *)localImage:(NSString *)name bundle:(NSBundle *)bundle {
    return [self configWithType:JobsOCSplashContentTypeLocalImage resourceName:name fileExtension:nil remoteURL:nil bundle:bundle];
}

+(__kindof JobsOCSplashConfiguration *)localGIF:(NSString *)name {
    return [self localGIF:name bundle:NSBundle.mainBundle];
}

+(__kindof JobsOCSplashConfiguration *)localGIF:(NSString *)name bundle:(NSBundle *)bundle {
    return [self configWithType:JobsOCSplashContentTypeLocalGIF resourceName:name fileExtension:nil remoteURL:nil bundle:bundle];
}

+(__kindof JobsOCSplashConfiguration *)remoteImage:(NSURL *)URL {
    return [self configWithType:JobsOCSplashContentTypeRemoteImage resourceName:nil fileExtension:nil remoteURL:URL bundle:NSBundle.mainBundle];
}

+(__kindof JobsOCSplashConfiguration *)localVideo:(NSString *)name fileExtension:(NSString *)fileExtension bundle:(NSBundle *)bundle {
    return [self configWithType:JobsOCSplashContentTypeLocalVideo resourceName:name fileExtension:fileExtension remoteURL:nil bundle:bundle ?: NSBundle.mainBundle];
}

+(__kindof JobsOCSplashConfiguration *)remoteVideo:(NSURL *)URL {
    return [self remoteVideo:URL fallbackLocalVideo:nil fileExtension:nil bundle:nil];
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
    configuration.contentType = type;
    configuration.resourceName = resourceName;
    configuration.fileExtension = fileExtension;
    configuration.remoteURL = remoteURL;
    configuration.bundle = bundle ?: NSBundle.mainBundle;
    return configuration;
}

-(instancetype)init {
    if (self = [super init]) {
        _bundle = NSBundle.mainBundle;
        _skipButtonVisible = YES;
        _skipButtonInsets = UIEdgeInsetsMake(12, 16, 12, 16);
        _contentMode = UIViewContentModeScaleAspectFill;
        _videoGravity = AVLayerVideoGravityResizeAspectFill;
        _tapAction = [JobsOCSplashAction openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
        _shakeAction = [JobsOCSplashAction openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    };return self;
}

-(id)copyWithZone:(NSZone *)zone {
    JobsOCSplashConfiguration *configuration = [[JobsOCSplashConfiguration allocWithZone:zone] init];
    configuration.contentType = self.contentType;
    configuration.resourceName = self.resourceName;
    configuration.fileExtension = self.fileExtension;
    configuration.remoteURL = self.remoteURL;
    configuration.bundle = self.bundle;
    configuration.countdownSeconds = self.countdownSeconds;
    configuration.languageCode = self.languageCode;
    configuration.skipButtonVisible = self.skipButtonVisible;
    configuration.skipButtonFrame = self.skipButtonFrame;
    configuration.usesCustomSkipButtonFrame = self.usesCustomSkipButtonFrame;
    configuration.skipButtonInsets = self.skipButtonInsets;
    configuration.contentMode = self.contentMode;
    configuration.videoGravity = self.videoGravity;
    configuration.tapAction = [self.tapAction copy];
    configuration.shakeAction = [self.shakeAction copy];
    configuration.onSkip = self.onSkip;
    return configuration;
}

-(JobsOCSplashConfiguration *(^)(NSNumber *_Nullable))byCountdownSeconds {
    return ^JobsOCSplashConfiguration *(NSNumber *_Nullable data) {
        self.countdownSeconds = data ? @(MAX(0, data.integerValue)) : nil;
        return self;
    };
}

-(JobsOCSplashConfiguration *(^)(NSString *_Nullable))byLanguageCode {
    return ^JobsOCSplashConfiguration *(NSString *_Nullable data) {
        self.languageCode = data;
        return self;
    };
}

-(JobsOCSplashConfiguration *(^)(BOOL))bySkipButtonVisible {
    return ^JobsOCSplashConfiguration *(BOOL data) {
        self.skipButtonVisible = data;
        return self;
    };
}

-(JobsOCSplashConfiguration *(^)(CGRect))bySkipButtonFrame {
    return ^JobsOCSplashConfiguration *(CGRect data) {
        self.skipButtonFrame = data;
        self.usesCustomSkipButtonFrame = YES;
        return self;
    };
}

-(JobsOCSplashConfiguration *(^)(UIEdgeInsets))bySkipButtonInsets {
    return ^JobsOCSplashConfiguration *(UIEdgeInsets data) {
        self.skipButtonInsets = data;
        return self;
    };
}

-(JobsOCSplashConfiguration *(^)(UIViewContentMode))byContentMode {
    return ^JobsOCSplashConfiguration *(UIViewContentMode data) {
        self.contentMode = data;
        return self;
    };
}

-(JobsOCSplashConfiguration *(^)(AVLayerVideoGravity))byVideoGravity {
    return ^JobsOCSplashConfiguration *(AVLayerVideoGravity data) {
        self.videoGravity = data;
        return self;
    };
}

-(JobsOCSplashConfiguration *(^)(JobsOCSplashAction *))byTapAction {
    return ^JobsOCSplashConfiguration *(JobsOCSplashAction *data) {
        self.tapAction = data ?: JobsOCSplashAction.none;
        return self;
    };
}

-(JobsOCSplashConfiguration *(^)(JobsOCSplashAction *))byShakeAction {
    return ^JobsOCSplashConfiguration *(JobsOCSplashAction *data) {
        self.shakeAction = data ?: JobsOCSplashAction.none;
        return self;
    };
}

-(JobsOCSplashConfiguration *(^)(JobsOCSplashSkipBlock _Nullable))bySkip {
    return ^JobsOCSplashConfiguration *(JobsOCSplashSkipBlock _Nullable data) {
        self.onSkip = data;
        return self;
    };
}

@end

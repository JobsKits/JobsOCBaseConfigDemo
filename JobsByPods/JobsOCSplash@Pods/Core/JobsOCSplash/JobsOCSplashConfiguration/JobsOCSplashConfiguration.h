//
//  JobsOCSplashConfiguration.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashConfiguration_h
#define JobsOCSplashConfiguration_h

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCSplash/JobsOCSplashAction.h>)
#import <JobsOCSplash/JobsOCSplashAction.h>
#else
#import "JobsOCSplashAction.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsOCSplashContentType) {
    JobsOCSplashContentTypeLocalImage,
    JobsOCSplashContentTypeLocalGIF,
    JobsOCSplashContentTypeRemoteImage,
    JobsOCSplashContentTypeLocalVideo,
    JobsOCSplashContentTypeRemoteVideo
};

@interface JobsOCSplashConfiguration : NSObject<NSCopying>

Prop_assign(readonly) JobsOCSplashContentType contentType;
Prop_copy(nullable, readonly) NSString *resourceName;
Prop_copy(nullable, readonly) NSString *fileExtension;
Prop_strong(nullable, readonly) NSURL *remoteURL;
Prop_strong(readonly) NSBundle *bundle;
Prop_strong(nullable) NSNumber *countdownSeconds;
Prop_copy(nullable) NSString *languageCode;
Prop_assign() BOOL skipButtonVisible;
Prop_assign() CGRect skipButtonFrame;
Prop_assign() BOOL usesCustomSkipButtonFrame;
Prop_assign() UIEdgeInsets skipButtonInsets;
Prop_assign() UIViewContentMode contentMode;
Prop_copy() AVLayerVideoGravity videoGravity;
Prop_strong() JobsOCSplashAction *tapAction;
Prop_strong() JobsOCSplashAction *shakeAction;
Prop_copy(nullable) JobsOCSplashSkipBlock onSkip;

+(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)localImage;
+(__kindof JobsOCSplashConfiguration *)localImage:(NSString *)name bundle:(NSBundle *)bundle;
+(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)localGIF;
+(__kindof JobsOCSplashConfiguration *)localGIF:(NSString *)name bundle:(NSBundle *)bundle;
+(JobsRetJobsOCSplashConfigurationByNSURLBlock _Nonnull)remoteImage;
+(__kindof JobsOCSplashConfiguration *)localVideo:(NSString *)name fileExtension:(NSString *_Nullable)fileExtension bundle:(NSBundle *_Nullable)bundle;
+(JobsRetJobsOCSplashConfigurationByNSURLBlock _Nonnull)remoteVideo;
+(__kindof JobsOCSplashConfiguration *)remoteVideo:(NSURL *)URL
                               fallbackLocalVideo:(NSString *_Nullable)name
                                     fileExtension:(NSString *_Nullable)fileExtension
                                            bundle:(NSBundle *_Nullable)bundle;
-(JobsRetJobsOCSplashConfigurationByNSNumberBlock _Nonnull)byCountdownSeconds;
-(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)byLanguageCode;
-(JobsRetJobsOCSplashConfigurationByBOOLBlock _Nonnull)bySkipButtonVisible;
-(JobsRetJobsOCSplashConfigurationByCGRectBlock _Nonnull)bySkipButtonFrame;
-(JobsRetJobsOCSplashConfigurationByUIEdgeInsetsBlock _Nonnull)bySkipButtonInsets;
-(JobsRetJobsOCSplashConfigurationByUIViewContentModeBlock _Nonnull)byContentMode;
-(JobsRetJobsOCSplashConfigurationByAVLayerVideoGravityBlock _Nonnull)byVideoGravity;
-(JobsRetJobsOCSplashConfigurationByJobsOCSplashActionBlock _Nonnull)byTapAction;
-(JobsRetJobsOCSplashConfigurationByJobsOCSplashActionBlock _Nonnull)byShakeAction;
-(JobsRetJobsOCSplashConfigurationByJobsOCSplashSkipBlockBlock _Nonnull)bySkip;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCSplashConfiguration
-(JobsRetJobsOCSplashConfigurationByBOOLBlock _Nonnull)byUsesCustomSkipButtonFrame;
-(JobsRetJobsOCSplashConfigurationByJobsOCSplashContentTypeBlock _Nonnull)byContentType;
-(JobsRetJobsOCSplashConfigurationByJobsOCSplashSkipBlockBlock _Nonnull)byOnSkip;
-(JobsRetJobsOCSplashConfigurationByNSBundleBlock _Nonnull)byBundle;
-(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)byFileExtension;
-(JobsRetJobsOCSplashConfigurationByNSStringBlock _Nonnull)byResourceName;
-(JobsRetJobsOCSplashConfigurationByNSURLBlock _Nonnull)byRemoteURL;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCSplashConfiguration
@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashConfiguration_h */

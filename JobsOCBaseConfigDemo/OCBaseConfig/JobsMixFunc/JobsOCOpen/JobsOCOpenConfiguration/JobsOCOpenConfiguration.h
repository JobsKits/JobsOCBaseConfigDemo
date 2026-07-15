//
//  JobsOCOpenConfiguration.h
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCOPENCONFIGURATION_5E32B96E67
#define JOBS_HEADER_GUARD_JOBSOCOPENCONFIGURATION_5E32B96E67

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

typedef NS_ENUM(NSUInteger, JobsOCOpenMode) {
    JobsOCOpenModeInApp = 0,
    JobsOCOpenModeExternalBrowser
};

typedef NS_ENUM(NSUInteger, JobsOCOpenResult) {
    JobsOCOpenResultOpened = 0,
    JobsOCOpenResultCannotOpen,
    JobsOCOpenResultInvalidInput
};

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCOpenConfiguration : NSObject

Prop_strong(nullable) NSURL *url;
Prop_assign() JobsOCOpenMode mode;
Prop_copy(nullable) NSString *pageTitle;
Prop_assign() BOOL animated;
Prop_copy(nullable) jobsByBOOLBlock completion;

+(instancetype)config;
+(NSURL *_Nullable)jobsURLWithString:(NSString *_Nullable)string;
-(instancetype)initWithURL:(NSURL *_Nullable)url;
-(JobsOCOpenConfiguration *_Nonnull(^)(NSURL *_Nullable url))byURL;
-(JobsOCOpenConfiguration *_Nonnull(^)(NSString *_Nullable urlString))byURLString;
-(JobsOCOpenConfiguration *_Nonnull(^)(JobsOCOpenMode mode))byMode;
-(JobsOCOpenConfiguration *_Nonnull(^)(NSString *_Nullable title))byTitle;
-(JobsOCOpenConfiguration *_Nonnull(^)(BOOL animated))byAnimated;
-(JobsOCOpenConfiguration *_Nonnull(^)(jobsByBOOLBlock _Nullable completion))byCompletion;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCOPENCONFIGURATION_5E32B96E67 */

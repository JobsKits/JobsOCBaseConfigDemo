//
//  JobsOCSplashAction.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashAction_h
#define JobsOCSplashAction_h

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

NS_ASSUME_NONNULL_BEGIN

@class JobsOCSplashVC;

typedef NS_ENUM(NSUInteger, JobsOCSplashActionType) {
    JobsOCSplashActionTypeNone,
    JobsOCSplashActionTypeOpenURL,
    JobsOCSplashActionTypeCustom
};

@interface JobsOCSplashAction : NSObject<NSCopying>

Prop_assign(readonly) JobsOCSplashActionType type;
Prop_strong(nullable, readonly) NSURL *URL;
Prop_copy(nullable, readonly) JobsOCSplashActionBlock customBlock;
Prop_assign() BOOL opensExternally;

+(JobsRetJobsOCSplashActionByVoidBlock _Nonnull)none;
+(JobsRetJobsOCSplashActionByNSURLBlock _Nonnull)openURL;
+(JobsRetJobsOCSplashActionByJobsOCSplashActionBlockBlock _Nonnull)custom;
-(JobsRetJobsOCSplashActionByActionTypeBlock _Nonnull)byType;
-(JobsRetJobsOCSplashActionByNSURLBlock _Nonnull)byURL;
-(JobsRetJobsOCSplashActionByJobsOCSplashActionBlockBlock _Nonnull)byCustomBlock;
-(JobsRetJobsOCSplashActionByBOOLBlock _Nonnull)byOpensExternally;
-(JobsOCSplashActionBlock _Nonnull)performWithSplashVC;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashAction_h */

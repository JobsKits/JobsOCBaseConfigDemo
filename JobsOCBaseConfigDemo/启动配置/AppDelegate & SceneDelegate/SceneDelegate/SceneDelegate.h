//
//  SceneDelegate.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/11/16.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "AppDelegate.h"
#import "NSObject+Extras.h"
#import "AppDelegate+TabBarCtr.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

API_AVAILABLE(ios(13.0))

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

#import "JobsDefineProperty.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

Prop_strong()UIWindow *window;
Prop_strong()UIWindowScene *windowScene;

-(JobsRetSceneDelegateByWindowBlock _Nonnull)jobsSetWindow;
-(JobsRetSceneDelegateByWindowSceneBlock _Nonnull)jobsSetWindowScene;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN SceneDelegate
-(JobsRetSceneDelegateByWindowBlock _Nonnull)byWindow;
-(JobsRetSceneDelegateByWindowSceneBlock _Nonnull)byWindowScene;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END SceneDelegate
@end

#pragma clang diagnostic pop

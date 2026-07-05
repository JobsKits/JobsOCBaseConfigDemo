//
//  JobsOCSplashAction.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashAction_h
#define JobsOCSplashAction_h

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

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

+(__kindof JobsOCSplashAction *)none;
+(__kindof JobsOCSplashAction *)openURL:(NSURL *)URL;
+(__kindof JobsOCSplashAction *)custom:(JobsOCSplashActionBlock)block;
-(JobsOCSplashAction *(^)(BOOL data))byOpensExternally;
-(void)performWithSplashVC:(__kindof JobsOCSplashVC *)splashVC;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashAction_h */

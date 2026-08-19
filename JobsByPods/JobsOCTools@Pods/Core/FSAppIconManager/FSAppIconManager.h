//
//  FSAppIconManager.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_FSAPPICONMANAGER_0CD2031E8A
#define JOBS_HEADER_GUARD_FSAPPICONMANAGER_0CD2031E8A

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

@interface FSAppIconManager : NSObject
/**

     Returns the name of the icon currently in use.
     * If ``, the primary application icon is being used. Or the current system version is not supported.
     @return IconName
 */
+ (JobsRetStrByVoidBlock _Nonnull)getCurrentAppIconName;
/**

     Check whether the current device supports changing icon
     @return result, YES or NO
 */
+ (JobsRetBOOLByVoidBlock _Nonnull)canChangeAppIcon;
/**
 Change the icon

 * Pass `nil` to use the primary application icon. The completion handler will be invoked asynchronously on an arbitrary background queue; be sure to dispatch back to the main queue before doing any further UI work.
 @param iconName iconName
 @param completionHandler error or nil
 */
+ (void)changeAppIconWithIconName:(NSString *_Nullable)iconName
                completionHandler:(nullable void (^)(NSError *_Nullable error))completionHandler NS_EXTENSION_UNAVAILABLE("Extensions may not have alternate icons");

@end
/**

     - (IBAction)changeAppIcon:(id)sender {
         BOOL canChangeAppIcon = [FSAppIconManager canChangeAppIcon];
         JobsLog(@"canChangeAppIcon value: %@", canChangeAppIcon?@"YES":@"NO");
         if (!canChangeAppIcon) {
             return;
         }
         [FSAppIconManager changeAppIconWithIconName:@"male" completionHandler:^(NSError * _Nullable error) {
             JobsLog(@"error: %@", error);
         }];
     }

 */
#endif /* JOBS_HEADER_GUARD_FSAPPICONMANAGER_0CD2031E8A */

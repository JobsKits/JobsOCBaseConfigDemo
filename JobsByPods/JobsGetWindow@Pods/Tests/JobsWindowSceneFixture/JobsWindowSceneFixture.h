//
//  JobsWindowSceneFixture.h
//  JobsGetWindow
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSWINDOWSCENEFIXTURE_H
#define JOBS_TEST_JOBSWINDOWSCENEFIXTURE_H

#import <UIKit/UIKit.h>

@interface JobsWindowSceneFixture : NSObject

@property(nonatomic,copy)NSArray<UIWindow *> *windows;
@property(nonatomic,assign)UISceneActivationState activationState;
@property(nonatomic,copy)NSString *persistentIdentifier;
@property(nonatomic,strong,readonly)JobsWindowSceneFixture *session;

@end

#endif /* JOBS_TEST_JOBSWINDOWSCENEFIXTURE_H */

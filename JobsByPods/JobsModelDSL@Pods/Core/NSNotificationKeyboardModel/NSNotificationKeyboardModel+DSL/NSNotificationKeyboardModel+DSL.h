//
//  NSNotificationKeyboardModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NSNOTIFICATIONKEYBOARDMODEL_DSL_2702BDABCE1214F7
#define JOBS_HEADER_GUARD_NSNOTIFICATIONKEYBOARDMODEL_DSL_2702BDABCE1214F7

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

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

@interface NSNotificationKeyboardModel (DSL)

-(JobsRetNSNotificationKeyboardModelByFrameBlock _Nonnull)byBeginFrame;
-(JobsRetNSNotificationKeyboardModelByFrameBlock _Nonnull)byEndFrame;
-(JobsRetNSNotificationKeyboardModelByCGFloatBlock _Nonnull)byKeyboardOffsetY;
-(JobsRetNSNotificationKeyboardModelByStrBlock _Nonnull)byNotificationName;
-(JobsRetNSNotificationKeyboardModelByDicBlock _Nonnull)byUserInfo;
-(JobsRetNSNotificationKeyboardModelByIDBlock _Nonnull)byAnObject;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSNOTIFICATIONKEYBOARDMODEL_DSL_2702BDABCE1214F7 */

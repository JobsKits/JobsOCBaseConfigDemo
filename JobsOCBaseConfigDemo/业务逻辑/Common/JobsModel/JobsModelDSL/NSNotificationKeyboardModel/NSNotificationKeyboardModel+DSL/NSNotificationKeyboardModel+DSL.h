//
//  NSNotificationKeyboardModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NSNOTIFICATIONKEYBOARDMODEL_DSL_2702BDABCE1214F7
#define JOBS_HEADER_GUARD_NSNOTIFICATIONKEYBOARDMODEL_DSL_2702BDABCE1214F7

#import "JobsModel.h"

#import "JobsBlock.h"

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

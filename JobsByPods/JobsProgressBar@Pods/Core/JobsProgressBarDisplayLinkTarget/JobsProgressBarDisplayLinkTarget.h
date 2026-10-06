//
//  JobsProgressBarDisplayLinkTarget.h
//  JobsProgressBar
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsProgressBar.h"

/// 通过回调隔开 RunLoop 与进度条的强引用链。
@interface JobsProgressBarDisplayLinkTarget : NSObject

Prop_copy(nullable)jobsByCADisplayLinkBlock action;
-(JobsRetIDByIDBlock _Nonnull)byAction;
-(void)tick:(CADisplayLink *)displayLink;

@end

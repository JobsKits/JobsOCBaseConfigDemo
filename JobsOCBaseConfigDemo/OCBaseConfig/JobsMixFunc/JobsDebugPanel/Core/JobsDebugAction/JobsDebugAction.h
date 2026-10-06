//
//  JobsDebugAction.h
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#pragma once
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

#if DEBUG
NS_ASSUME_NONNULL_BEGIN

@interface JobsDebugAction : NSObject

Prop_copy(readonly)NSString *title;
Prop_strong(readonly,nullable)UIImage *image;
Prop_copy(readonly,nullable)JobsDebugActionHandler handler;
-(JobsRetDebugActionByStringBlock _Nonnull)byTitle;
-(JobsRetDebugActionByImageBlock _Nonnull)byImage;
-(JobsRetDebugActionByHandlerBlock _Nonnull)byAction;

@end

NS_ASSUME_NONNULL_END
#endif


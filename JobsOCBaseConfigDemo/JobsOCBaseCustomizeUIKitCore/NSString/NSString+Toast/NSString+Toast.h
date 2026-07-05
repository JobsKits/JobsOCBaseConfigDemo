//
//  NSString+Toast.h
//  JobsOCTimer
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_TOAST_870132DECC
#define JOBS_HEADER_GUARD_NSSTRING_TOAST_870132DECC

#pragma once

#import <Foundation/Foundation.h>

#import "JobsLanMgr.h"

#import "WHToastExtra.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Toast)

-(jobsByVoidBlock _Nonnull)toast;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_TOAST_870132DECC */

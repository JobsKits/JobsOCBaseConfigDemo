//
//  JobsDebugPanelProbeRequest.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#pragma once
#import <UIKit/UIKit.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<JobsAPIs/JobsAPIs.h>)
#import <JobsAPIs/JobsAPIs.h>
#else
#import "JobsAPIs.h"
#endif

#if DEBUG
@interface JobsDebugPanelProbeRequest : YTKRequest
@end
#endif


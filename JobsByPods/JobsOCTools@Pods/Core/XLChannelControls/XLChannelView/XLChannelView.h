//
//  XLChannelView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLCHANNELVIEW_8343C61D57
#define JOBS_HEADER_GUARD_XLCHANNELVIEW_8343C61D57

#import <UIKit/UIKit.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

@interface XLChannelView : UIView

Prop_strong()NSMutableArray *enabledTitles;
Prop_strong()NSMutableArray *disabledTitles;

-(void)reloadData;

@end
#endif /* JOBS_HEADER_GUARD_XLCHANNELVIEW_8343C61D57 */

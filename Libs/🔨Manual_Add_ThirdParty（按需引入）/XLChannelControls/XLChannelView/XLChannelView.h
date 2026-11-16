//
//  XLChannelView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLCHANNELVIEW_8343C61D57
#define JOBS_HEADER_GUARD_XLCHANNELVIEW_8343C61D57

#import <UIKit/UIKit.h>

#import "JobsLanMgr.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

@interface XLChannelView : UIView

Prop_strong()NSMutableArray *enabledTitles;
Prop_strong()NSMutableArray *disabledTitles;

-(void)reloadData;

@end
#endif /* JOBS_HEADER_GUARD_XLCHANNELVIEW_8343C61D57 */

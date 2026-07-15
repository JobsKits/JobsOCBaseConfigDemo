//
//  XLChannelHeader.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLCHANNELHEADER_FB34EC7301
#define JOBS_HEADER_GUARD_XLCHANNELHEADER_FB34EC7301

#import <UIKit/UIKit.h>

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

@interface XLChannelHeader : UICollectionReusableView

Prop_copy()NSString *title;
Prop_copy()NSString *subTitle;

@end
#endif /* JOBS_HEADER_GUARD_XLCHANNELHEADER_FB34EC7301 */

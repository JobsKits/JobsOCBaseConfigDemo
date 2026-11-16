//
//  GXCardItemDemoCell.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_GXCARDITEMDEMOCELL_6E5E085779
#define JOBS_HEADER_GUARD_GXCARDITEMDEMOCELL_6E5E085779

#import <UIKit/UIKit.h>
#import "GXCardView.h"

#import "JobsDefines.h"

@interface GXCardItemDemoCell : GXCardViewCell

Prop_weak()IBOutlet UILabel *numberLabel;
Prop_weak()IBOutlet UILabel *leftLabel;
Prop_weak()IBOutlet UILabel *rightLabel;

@end
#endif /* JOBS_HEADER_GUARD_GXCARDITEMDEMOCELL_6E5E085779 */

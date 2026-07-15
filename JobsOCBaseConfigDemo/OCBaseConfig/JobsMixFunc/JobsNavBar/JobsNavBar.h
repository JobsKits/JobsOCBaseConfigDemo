//
//  JobsNavBar.h
//  JobsNavBar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSNAVBAR_F4E4DD0B91
#define JOBS_HEADER_GUARD_JOBSNAVBAR_F4E4DD0B91

#import <UIKit/UIKit.h>
#import "JobsNavBarConfig.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
@class BaseButton;

@interface JobsNavBar : UIImageView
<
BaseProtocol,
RACProtocol,
BaseViewProtocol
>

Prop_strong()JobsNavBarConfig *navBarConfig;
Prop_strong(readonly)BaseButton *backBtn;
Prop_strong(readonly)UILabel *titleLab;
Prop_strong(readonly)BaseButton *closeBtn;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavBar *_Nonnull jobsMakeNavBar(jobsByNavBarBlock _Nonnull block){
    JobsNavBar *data = JobsNavBar.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSNAVBAR_F4E4DD0B91 */

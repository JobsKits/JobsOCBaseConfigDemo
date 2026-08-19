//
//  JobsSwiftParityDemoBaseVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

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

NS_ASSUME_NONNULL_BEGIN

@interface JobsSwiftParityDemoBaseVC : BaseViewController

Prop_strong()UIScrollView *parityScrollView;
Prop_strong()UIView *contentView;
Prop_strong()UILabel *introLab;
Prop_strong()UIView *previewView;
Prop_strong()UIImageView *previewImageView;
Prop_strong()UILabel *previewTitleLab;
Prop_strong()UIButton *primaryActionBtn;
Prop_strong()UILabel *statusLab;

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle;
-(JobsRetStrByVoidBlock _Nonnull)demoDescription;
-(JobsRetStrByVoidBlock _Nonnull)demoIconName;
-(JobsRetStrByVoidBlock _Nonnull)primaryActionTitle;
-(jobsByVoidBlock _Nonnull)configureDemo;
-(jobsByVoidBlock _Nonnull)performPrimaryAction;
-(jobsByStrBlock _Nonnull)updateStatus;

@end

NS_ASSUME_NONNULL_END

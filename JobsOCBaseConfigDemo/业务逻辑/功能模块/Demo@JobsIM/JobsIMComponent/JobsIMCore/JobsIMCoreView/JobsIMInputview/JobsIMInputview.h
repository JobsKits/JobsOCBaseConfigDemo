//
//  JobsIMInputview.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsIMDefine.h"
#import "JobsByOCPods.h"
#import "JobsLanMgr.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsIMInputview : BaseView
<
UITextFieldDelegate
>

Prop_strong()ZYTextField *inputTextField;

-(jobsByStrBlock _Nonnull)someChangeUIBy;

@end

NS_ASSUME_NONNULL_END

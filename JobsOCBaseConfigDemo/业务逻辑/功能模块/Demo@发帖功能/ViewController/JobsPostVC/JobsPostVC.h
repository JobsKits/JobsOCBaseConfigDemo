//
//  JobsShootingVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 9/26/23.
//

#import "BaseViewController.h"
#import "JobsPostDelView.h"
#import "JobsTextView.h"
#import "JobsUserModel.h"
#import "JobsDefineProperty.h"

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

#if __has_include(<HXPhotoPicker/HXPhotoPicker.h>)
#import <HXPhotoPicker/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsPostVC : BaseViewController
<
HXPhotoViewDelegate
,UITextViewDelegate
>

@end

NS_ASSUME_NONNULL_END

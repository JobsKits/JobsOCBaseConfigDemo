//
//  JobsScreenshotProtectionView.h
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsScreenshotProtectionView : UIView

Prop_strong(readonly)UIView *contentView;
Prop_assign(readonly,getter=isProtectionAvailable)BOOL protectionAvailable;
Prop_assign(getter=isProtectionEnabled)BOOL protectionEnabled;

@end

NS_ASSUME_NONNULL_END

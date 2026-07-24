//
//  JobsGIFRefreshView.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <ImageIO/ImageIO.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>)
#import <JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>
#else
#import "JobsRefreshAnimatorProtocol.h"
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

/// GIF 刷新插件，支持资源名、文件路径和 NSData。
@interface JobsGIFRefreshView : UIView<JobsRefreshAnimatorProtocol>

Prop_assign()CGSize indicatorSize;

-(instancetype)initWithGIFNamed:(NSString *)name;
-(instancetype)initWithGIFPath:(NSString *)path;
-(instancetype)initWithGIFData:(NSData *)data;
-(instancetype)byStart;
-(instancetype)byPause;
-(instancetype)byResume;
-(instancetype)byStop;

@end

NS_ASSUME_NONNULL_END

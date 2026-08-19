//
//  UIButtonModel+UIViewModelProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <objc/runtime.h>

#import <Foundation/Foundation.h>
#import "NSString+Extra.h"

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UIButtonModel (UIViewModelProtocol)<UIViewModelProtocol>

-(JobsRetStrByVoidBlock _Nonnull)jobsNormalImageURLString;
-(JobsRetURLByVoidBlock _Nonnull)jobsNormalImageURL;
-(JobsRetStrByVoidBlock _Nonnull)jobsNormalBgImageURLString;
-(JobsRetURLByVoidBlock _Nonnull)jobsNormalBgImageURL;

@end

NS_ASSUME_NONNULL_END

//
//  NSObject+AppTools.h
//  JobsAppTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_APPTOOLS_D21EC877E4
#define JOBS_HEADER_GUARD_NSOBJECT_APPTOOLS_D21EC877E4

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsOCDSL.h"

#import "JobsStringUtilsHeader.h"

#import "JobsDefines.h"

#import "JobsModelDSL.h"

NS_ASSUME_NONNULL_BEGIN

@class UIButtonModel;

@interface NSObject (AppTools)<AppToolsProtocol>

-(UIButtonModel *)makeBackBtnModel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_APPTOOLS_D21EC877E4 */

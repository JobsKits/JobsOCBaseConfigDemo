//
//  NSURLRequest+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_11B529D2E2
#define JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_11B529D2E2

#pragma once

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (Extra)

+(JobsRetURLRequestByURLBlock _Nonnull)initBy;
/// 打印NSURLRequest有效内容，并转化为NSMutableURLRequest对外输出
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)print;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_11B529D2E2 */

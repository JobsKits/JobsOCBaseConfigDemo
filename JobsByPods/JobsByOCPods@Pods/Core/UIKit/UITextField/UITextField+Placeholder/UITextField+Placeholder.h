//
//  UITextField+Placeholder.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITEXTFIELD_PLACEHOLDER_80A378BFEB
#define JOBS_HEADER_GUARD_UITEXTFIELD_PLACEHOLDER_80A378BFEB

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSMutableArray+Extra.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsRichTextUtils/JobsRichTextUtils.h>)
#import <JobsRichTextUtils/JobsRichTextUtils.h>
#else
#import "JobsRichTextUtils.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 修改UITextField.Placeholder
@interface UITextField (Placeholder)<UITextModelProtocol,AppToolsProtocol>

-(UILabel *)placeholderLabel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTFIELD_PLACEHOLDER_80A378BFEB */

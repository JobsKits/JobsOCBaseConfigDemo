//
//  PhilippinesIDTypeModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef PhilippinesIDTypeModel_h
#define PhilippinesIDTypeModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/BaseModel.h>

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesIDTypeModel : BaseModel

Prop_assign()NSInteger ID;
Prop_copy()NSString *name;

@end

NS_ASSUME_NONNULL_END

#endif /* PhilippinesIDTypeModel_h */

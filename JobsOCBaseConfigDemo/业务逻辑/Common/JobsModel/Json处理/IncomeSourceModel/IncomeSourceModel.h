//
//  IncomeSourceModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef IncomeSourceModel_h
#define IncomeSourceModel_h

#import <Foundation/Foundation.h>
#import "BaseModel.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface IncomeSourceModel : BaseModel

Prop_copy()NSString *ID;
Prop_copy()NSString *name;

@end

NS_ASSUME_NONNULL_END

#endif /* IncomeSourceModel_h */

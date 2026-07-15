//
//  PhilippinesModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef PhilippinesModel_h
#define PhilippinesModel_h

#import <Foundation/Foundation.h>
#import "IncomeSourceModel.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesModel : IncomeSourceModel

Prop_assign()NSInteger state_id;
Prop_copy()NSString *state_name;

@end

NS_ASSUME_NONNULL_END

#endif /* PhilippinesModel_h */

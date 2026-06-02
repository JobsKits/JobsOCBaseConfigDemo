//
//  PhilippinesModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "IncomeSourceModel.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesModel : IncomeSourceModel

Prop_assign()NSInteger state_id;
Prop_copy()NSString *state_name;

@end

NS_ASSUME_NONNULL_END

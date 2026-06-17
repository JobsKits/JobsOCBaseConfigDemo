//
//  UIViewModel+App.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/5/7.
//

#import "UIViewModel.h"
#import "JobsDefineEnums.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewModel (App)

Prop_assign()DataSourceType dataSourceType;
Prop_assign()KYCStatus kycStatus;

@end

NS_ASSUME_NONNULL_END

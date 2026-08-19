//
//  PhilippinesIDTypeModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef PhilippinesIDTypeModel_h

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#define PhilippinesIDTypeModel_h

#import <Foundation/Foundation.h>
#import "BaseModel.h"

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesIDTypeModel : BaseModel

Prop_assign()NSInteger ID;
Prop_copy()NSString *name;

@end

NS_ASSUME_NONNULL_END

#endif /* PhilippinesIDTypeModel_h */

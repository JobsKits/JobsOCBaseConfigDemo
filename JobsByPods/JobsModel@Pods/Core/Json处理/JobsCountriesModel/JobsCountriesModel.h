//
//  JobsCountriesModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsCountriesModel_h
#define JobsCountriesModel_h

#import <Foundation/Foundation.h>

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

@interface JobsCountriesModel : NSObject

Prop_copy()NSString *abbr;
Prop_copy()NSString *chinese;
Prop_copy()NSString *code;
Prop_copy()NSString *english;
Prop_copy()NSString *spell;
Prop_copy()NSString *state;
Prop_copy()NSString *french;
Prop_copy()NSString *italian;
Prop_copy()NSString *spanish;
Prop_copy()NSString *japanese;
Prop_copy()NSString *russian;
Prop_copy()NSString *germen;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsCountriesModel_h */

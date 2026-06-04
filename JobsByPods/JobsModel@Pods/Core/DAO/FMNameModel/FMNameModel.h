//
//  FMNameModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef FMNameModel_h
#define FMNameModel_h

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FMNameModel : NSObject

Prop_strong()__kindof UITextField *firstNameTF;
Prop_strong()__kindof UITextField *middleNameTF;
Prop_strong()__kindof UITextField *lastNameTF;
Prop_strong()__kindof UITextField *idTypeTF;
Prop_strong()__kindof UITextField *idNumberTF;

Prop_copy()NSString *firstName;
Prop_copy()NSString *middleName;
Prop_copy()NSString *lastName;
Prop_copy()NSString *idType;
Prop_copy()NSString *idNumber;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FMNameModel *_Nonnull jobsMakeNameModel(jobsByNameModelBlock _Nonnull block){
    FMNameModel *data = FMNameModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* FMNameModel_h */

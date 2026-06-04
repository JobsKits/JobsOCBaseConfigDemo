//
//  FMNameModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"

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

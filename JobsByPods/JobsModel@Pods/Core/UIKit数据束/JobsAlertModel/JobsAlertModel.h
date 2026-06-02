//
//  JobsAlertModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsAlertModel_h
#define JobsAlertModel_h

#import <UIKit/UIKit.h>
#import <JobsModel/BaseModel.h>

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

@interface JobsAlertModel : BaseModel
/// UIAlertController
Prop_copy()NSString *alertControllerTitle;
Prop_copy()NSString *message;
Prop_assign()UIAlertControllerStyle preferredStyle;/// UIAlertControllerStyleAlert
/// UIAlertAction（普通的）
Prop_copy()NSString *alertActionTitle;
Prop_assign()UIAlertActionStyle alertActionStyle;/// UIAlertActionStyleDefault
Prop_copy()jobsByAlertActionBlock alertActionBlock;
/// UIAlertAction（取消）
Prop_copy()NSString *cancelAlertActionTitle;
Prop_assign()UIAlertActionStyle cancelAlertActionStyle;/// UIAlertActionStyleCancel
Prop_copy()jobsByAlertActionBlock cancelAlertActionBlock;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsAlertModel *_Nonnull jobsMakeAlertModel(jobsByAlertModelBlock _Nonnull block){
    JobsAlertModel *data = JobsAlertModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JobsAlertModel_h */

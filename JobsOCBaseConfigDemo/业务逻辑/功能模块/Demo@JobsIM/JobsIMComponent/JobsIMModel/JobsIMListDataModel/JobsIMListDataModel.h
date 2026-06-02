//
//  JobsIMListDataModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "UIImage+YBGIF.h"
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

@interface JobsIMListDataModel : NSObject

Prop_copy()NSString *usernameStr;
Prop_copy()NSString *contentStr;
Prop_copy()NSString *timeStr;
Prop_strong()UIImage *userHeaderIMG;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsIMListDataModel *_Nonnull jobsMakeIMListDataModel(jobsByIMListDataModelBlock _Nonnull block){
    JobsIMListDataModel *data = JobsIMListDataModel.alloc.init;
    if (block) block(data);
    return data;
}

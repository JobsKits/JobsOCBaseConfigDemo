//
//  JobsImageModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsImageModel_h
#define JobsImageModel_h

#import <UIKit/UIKit.h>
#import <JobsModel/BaseModel.h>

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

@interface JobsImageModel : BaseModel

Prop_strong(nullable)UIImage *image;
Prop_strong(nullable)NSDictionary *info;
Prop_strong(nullable)NSDictionary *timeDic;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsImageModel *_Nonnull jobsMakeImageModel(jobsByImageModelBlock _Nonnull block){
    JobsImageModel *data = JobsImageModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JobsImageModel_h */

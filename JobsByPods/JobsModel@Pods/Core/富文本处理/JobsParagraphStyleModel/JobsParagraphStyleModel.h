//
//  JobsParagraphStyleModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsParagraphStyleModel_h
#define JobsParagraphStyleModel_h

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

@interface JobsParagraphStyleModel : NSObject

Prop_strong()id value;
Prop_assign()NSRange range;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsParagraphStyleModel *_Nonnull jobsMakeParagraphStyleModel(jobsByParagraphStyleModelBlock _Nonnull block){
    JobsParagraphStyleModel *data = JobsParagraphStyleModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JobsParagraphStyleModel_h */

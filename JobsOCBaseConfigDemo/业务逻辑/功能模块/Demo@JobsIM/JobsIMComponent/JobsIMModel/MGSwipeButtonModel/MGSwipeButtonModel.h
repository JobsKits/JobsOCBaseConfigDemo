//
//  MGSwipeButtonModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

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

@interface MGSwipeButtonModel : NSObject

Prop_strong()UIImage *IconIMG;
Prop_strong()UIColor *bgCor;
Prop_copy()NSString *titleStr;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof MGSwipeButtonModel *_Nonnull jobsMakeMGSwipeButtonModel(jobsByMGSwipeButtonModelBlock _Nonnull block){
    MGSwipeButtonModel *data = MGSwipeButtonModel.alloc.init;
    if (block) block(data);
    return data;
}

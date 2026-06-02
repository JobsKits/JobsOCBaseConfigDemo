//
//  JobsFileModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsFileModel_h
#define JobsFileModel_h

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

@interface JobsFileModel : NSObject

Prop_assign()NSInteger ID; // 文件ID
Prop_copy()NSString *fileName; // 文件名
Prop_strong()NSData *file; // 传输的文件

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsFileModel *_Nonnull jobsMakeFileModel(jobsByFileModelBlock _Nonnull block){
    JobsFileModel *data = JobsFileModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JobsFileModel_h */

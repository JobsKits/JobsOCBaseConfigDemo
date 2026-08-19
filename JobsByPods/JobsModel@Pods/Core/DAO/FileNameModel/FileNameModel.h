//
//  FileNameModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef FileNameModel_h
#define FileNameModel_h

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

@interface FileNameModel : NSObject

Prop_copy()NSString *name;
Prop_copy()NSString *type;

-(JobsRetFileNameModelByStrBlock _Nonnull)byName;
-(JobsRetFileNameModelByStrBlock _Nonnull)byType;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FileNameModel *_Nonnull
jobsMakeFileNameModel(jobsByFileNameModelBlock _Nonnull block){
    FileNameModel *data = FileNameModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* FileNameModel_h */

//
//  FileNameModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef FileNameModel_h
#define FileNameModel_h

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileNameModel : NSObject

Prop_copy()NSString *name;
Prop_copy()NSString *type;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FileNameModel *_Nonnull
jobsMakeFileNameModel(jobsByFileNameModelBlock _Nonnull block){
    FileNameModel *data = FileNameModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* FileNameModel_h */

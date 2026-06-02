//
//  FileNameModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileNameModel : NSObject

Prop_copy()NSString *name;
Prop_copy()NSString *type;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FileNameModel *_Nonnull
jobsMakeFileNameModel(void(^_Nonnull block)(__kindof FileNameModel *_Nullable model)){
    FileNameModel *data = FileNameModel.alloc.init;
    if (block) block(data);
    return data;
}

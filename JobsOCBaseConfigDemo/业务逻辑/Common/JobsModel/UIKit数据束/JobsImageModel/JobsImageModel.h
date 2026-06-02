//
//  JobsImageModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
#import "DefineProperty.h"

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

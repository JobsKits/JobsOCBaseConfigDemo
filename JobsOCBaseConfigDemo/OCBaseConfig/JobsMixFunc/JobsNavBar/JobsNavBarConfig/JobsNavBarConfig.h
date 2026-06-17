//
//  JobsNavBarConfig.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/24/24.
//

#import <Foundation/Foundation.h>
#import "UIButtonModel.h"
#import "UIViewModel.h"
#import "JobsBlock.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
extern JobsNavBarConfig *static_navBarConfig;
@interface JobsNavBarConfig : UIViewModel

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavBarConfig *_Nonnull jobsMakeNavBarConfig(jobsByNavBarConfigBlock _Nonnull block){
    JobsNavBarConfig *data = JobsNavBarConfig.alloc.init;
    if (block) block(data);
    return data;
}

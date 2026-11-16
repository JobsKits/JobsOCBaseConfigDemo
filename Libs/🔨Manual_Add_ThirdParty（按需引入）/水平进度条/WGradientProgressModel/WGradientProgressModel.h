//
//  WGradientProgressModel.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_WGRADIENTPROGRESSMODEL_542C295CA6
#define JOBS_HEADER_GUARD_WGRADIENTPROGRESSMODEL_542C295CA6

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface WGradientProgressModel : NSObject

Prop_assign()CGFloat progress;
Prop_strong(nonnull)CAGradientLayer *__block gradLayer;// 通过改变layer的宽度来实现进度 运动员

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof WGradientProgressModel *_Nonnull jobsMakeWGradientProgressModel(jobsByWGradientProgressModelBlock _Nonnull block){
    WGradientProgressModel *data = WGradientProgressModel.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_WGRADIENTPROGRESSMODEL_542C295CA6 */

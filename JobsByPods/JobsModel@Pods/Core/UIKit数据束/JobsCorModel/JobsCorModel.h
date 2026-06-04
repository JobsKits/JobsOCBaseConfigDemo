//
//  JobsCorModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsCorModel_h
#define JobsCorModel_h

#import <Foundation/Foundation.h>
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

@interface JobsCorModel : BaseModel

Prop_assign()CGFloat red;
Prop_assign()CGFloat green;
Prop_assign()CGFloat blue;
Prop_assign()CGFloat alpha;

Prop_assign()CGFloat hue;
Prop_assign()CGFloat saturation;
Prop_assign()CGFloat brightness;

Prop_copy()NSString *corStr; // 十六进制字符串

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsCorModel *_Nonnull jobsMakeCorModel(jobsByCorModelBlock _Nonnull block){
    JobsCorModel *data = JobsCorModel.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIColor *_Nonnull jobsMakeCor(jobsByCorModelBlock _Nonnull block){
    JobsCorModel *data = JobsCorModel.alloc.init;
    if (block) block(data);
    return [UIColor colorWithRed:data.red
                           green:data.green
                            blue:data.blue
                           alpha:data.alpha];
}

NS_INLINE __kindof UIColor *_Nonnull jobsMakeCor2(jobsByCorModelBlock _Nonnull block){
    JobsCorModel *data = JobsCorModel.alloc.init;
    if (block) block(data);
    return [UIColor colorWithHue:data.hue
                      saturation:data.saturation
                      brightness:data.brightness
                           alpha:data.alpha];
}

#endif /* JobsCorModel_h */

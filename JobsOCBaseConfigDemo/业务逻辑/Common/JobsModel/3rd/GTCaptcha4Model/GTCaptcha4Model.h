//
//  GTCaptcha4Model.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#pragma once

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "JobsDefineProperty.h"
#import "GTCaptcha4ResultModel.h"

#if __has_include(<GTCaptcha4/GTCaptcha4.h>)
#import <GTCaptcha4/GTCaptcha4.h>
#else
#import "GTCaptcha4.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GTCaptcha4Model : BaseModel

Prop_strong()GTCaptcha4Session *captcha4Session;
Prop_strong()GTCaptcha4ResultModel *result;
Prop_copy()NSString *status;
Prop_strong()GTC4Error *error;
Prop_weak()__kindof UIView *targetView;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof GTCaptcha4Model *_Nonnull jobsMakeGTCaptcha4Model(jobsByGTCaptcha4ModelBlock _Nonnull block){
    GTCaptcha4Model *data = GTCaptcha4Model.alloc.init;
    if (block) block(data);
    return data;
}

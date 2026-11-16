//
//  JobsOCGraphicCaptchaView+DSL.m
//  JobsOCGraphicCaptcha
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "JobsOCGraphicCaptchaView+DSL.h"

@implementation JobsOCGraphicCaptchaView (DSL)

-(JobsRetOCGraphicCaptchaViewByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaView *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.font = font;
        return self;
    };
}

@end

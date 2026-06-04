//
//  JobsCorModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsCorModel+DSL.h"

@implementation JobsCorModel (DSL)

-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byRed{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.red = data;
        return self;
    };
}

-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byGreen{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.green = data;
        return self;
    };
}

-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byBlue{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.blue = data;
        return self;
    };
}

-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.alpha = data;
        return self;
    };
}

-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byHue{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.hue = data;
        return self;
    };
}

-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)bySaturation{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.saturation = data;
        return self;
    };
}

-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byBrightness{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.brightness = data;
        return self;
    };
}

-(JobsRetJobsCorModelByStrBlock _Nonnull)byCorStr{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.corStr = data;
        return self;
    };
}
@end

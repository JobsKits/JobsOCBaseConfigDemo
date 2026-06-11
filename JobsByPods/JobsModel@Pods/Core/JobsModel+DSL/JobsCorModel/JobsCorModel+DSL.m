//
//  JobsCorModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsCorModel+DSL.h"

@implementation JobsCorModel (DSL)

#pragma mark —— 来自 JobsCorModel
-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byRed{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.red = data;
        return self;
    };
}

-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byGreen{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.green = data;
        return self;
    };
}

-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byBlue{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.blue = data;
        return self;
    };
}

-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byAlpha{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.alpha = data;
        return self;
    };
}

-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byHue{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.hue = data;
        return self;
    };
}

-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))bySaturation{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.saturation = data;
        return self;
    };
}

-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byBrightness{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.brightness = data;
        return self;
    };
}

-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(NSString * data))byCorStr{
    @jobs_weakify(self)
    return ^__kindof JobsCorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.corStr = data;
        return self;
    };
}

@end

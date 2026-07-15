//
//  HXPhotoConfiguration+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "HXPhotoConfiguration+DSL.h"

@implementation HXPhotoConfiguration (DSL)
-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byType{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.type = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByStringBlock _Nonnull)byLocalFileName{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.localFileName = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)byShowOriginalBytes{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showOriginalBytes = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)byShowOriginalBytesLoading{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showOriginalBytesLoading = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByNSIntegerBlock _Nonnull)byVideoMaximumSelectDuration{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.videoMaximumSelectDuration = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byLimitVideoSize{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.limitVideoSize = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)bySelectVideoLimitSize{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.selectVideoLimitSize = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)bySelectVideoBeyondTheLimitTimeAutoEdit{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.selectVideoBeyondTheLimitTimeAutoEdit = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)bySpecialModeNeedHideVideoSelectBtn{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.specialModeNeedHideVideoSelectBtn = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byVideoMaxNum{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.videoMaxNum = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byMaxNum{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.maxNum = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byPhotoMaxNum{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.photoMaxNum = data;
        return self;
    };
}

-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)bySelectTogether{
    @jobs_weakify(self)
    return ^__kindof HXPhotoConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.selectTogether = data;
        return self;
    };
}

@end

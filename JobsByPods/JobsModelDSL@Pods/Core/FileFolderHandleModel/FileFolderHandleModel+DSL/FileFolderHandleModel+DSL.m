//
//  FileFolderHandleModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "FileFolderHandleModel+DSL.h"

@implementation FileFolderHandleModel (DSL)

-(JobsRetFileFolderHandleModelByAVAssetPointerBlock _Nonnull)byAsset{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nullable(AVAsset * _Nullable data) {
        @jobs_strongify(self)
        self.asset = data;
        return self;
    };
}

-(JobsRetFileFolderHandleModelByAVAudioMixPointerBlock _Nonnull)byAudioMix{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nullable(AVAudioMix * _Nullable data) {
        @jobs_strongify(self)
        self.audioMix = data;
        return self;
    };
}

-(JobsRetFileFolderHandleModelByDicBlock _Nonnull)byInfo{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nullable(NSDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.info = data;
        return self;
    };
}

-(JobsRetFileFolderHandleModelByDataBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nullable(NSData * _Nullable data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(JobsRetFileFolderHandleModelByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

@end

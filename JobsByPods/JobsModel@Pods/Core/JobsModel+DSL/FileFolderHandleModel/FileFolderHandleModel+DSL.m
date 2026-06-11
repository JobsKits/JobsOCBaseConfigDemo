//
//  FileFolderHandleModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "FileFolderHandleModel+DSL.h"

@implementation FileFolderHandleModel (DSL)

#pragma mark —— 来自 FileFolderHandleModel
-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(AVAsset * data))byAsset{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nonnull(AVAsset * data) {
        @jobs_strongify(self)
        self.asset = data;
        return self;
    };
}

-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(AVAudioMix * data))byAudioMix{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nonnull(AVAudioMix * data) {
        @jobs_strongify(self)
        self.audioMix = data;
        return self;
    };
}

-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(NSDictionary * data))byInfo{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nonnull(NSDictionary * data) {
        @jobs_strongify(self)
        self.info = data;
        return self;
    };
}

-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(NSData * data))byData{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nonnull(NSData * data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(__kindof FileFolderHandleModel *_Nonnull (^ _Nonnull)(UIImage * data))byImage{
    @jobs_weakify(self)
    return ^__kindof FileFolderHandleModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

@end

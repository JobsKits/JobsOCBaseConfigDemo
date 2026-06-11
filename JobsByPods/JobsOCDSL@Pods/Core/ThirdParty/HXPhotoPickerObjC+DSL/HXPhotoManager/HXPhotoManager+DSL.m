//
//  HXPhotoManager+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "HXPhotoManager+DSL.h"

@implementation HXPhotoManager (DSL)

-(JobsRetHXPhotoManagerByConfigurationBlock _Nonnull)byConfiguration{
    @jobs_weakify(self)
    return ^__kindof HXPhotoManager *_Nullable(jobsByHXPhotoConfigurationBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self.configuration);
        return self;
    };
}

@end

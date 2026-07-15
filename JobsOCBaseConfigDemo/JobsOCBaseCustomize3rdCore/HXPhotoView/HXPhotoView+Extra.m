//
//  HXPhotoView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "HXPhotoView+Extra.h"

@implementation HXPhotoView (Extra)
+(JobsRetHXPhotoViewByPhotoMgrBlock _Nonnull)initBy{
    return ^HXPhotoView *_Nullable(HXPhotoManager *_Nullable manager){
        return [HXPhotoView photoManager:manager];
    };
}

@end

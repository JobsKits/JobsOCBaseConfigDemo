//
//  WeakTarget.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "WeakTarget.h"

@implementation WeakTarget
+(JobsRetWeakTargetByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof WeakTarget *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

+(JobsRetWeakTargetByIDBlock _Nonnull)withTarget{
    return ^__kindof WeakTarget *_Nullable(id _Nullable target){
        WeakTarget *w = WeakTarget.new;
        return w.byTarget(target);
    };
}

@end

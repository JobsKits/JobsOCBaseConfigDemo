//
//  NSPointerArray+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2025年5月27日，星期二.
//

#import "NSPointerArray+Extra.h"

@implementation NSPointerArray (Extra)

-(JobsRetPointerByNSUIntegerBlock _Nonnull)pointerByIndex{
    @jobs_weakify(self)
    return ^void *_Nullable(NSUInteger index){
        @jobs_strongify(self)
        return [self pointerAtIndex:index];
    };
}

-(JobsRetPointerArrayByPointerBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^__kindof NSPointerArray *_Nullable(void *_Nullable pointer){
        @jobs_strongify(self)
        [self addPointer:pointer];
        return self;
    };
}

-(JobsRetPointerArrayByNSUIntegerBlock _Nonnull)removePointerBy{
    @jobs_weakify(self)
    return ^__kindof NSPointerArray *_Nullable(NSUInteger index){
        @jobs_strongify(self)
        [self removePointerAtIndex:index];
        return self;
    };
}

@end

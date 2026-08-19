//
//  CGAffineTransform+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "CGAffineTransform+DSL.h"

@implementation NSValue (JobsCGAffineTransformDSL)
+(JobsRetValueByVoidBlock _Nonnull)byCGAffineTransformIdentity{
    return ^NSValue *_Nullable(void){
        return [NSValue valueWithCGAffineTransform:CGAffineTransformIdentity];
    };
}

+(JobsRetValueByAffineTransformBlock _Nonnull)byCGAffineTransform{
    return ^NSValue *_Nullable(CGAffineTransform data){
        return [NSValue valueWithCGAffineTransform:data];
    };
}

+(JobsRetValueByPointBlock _Nonnull)byCGAffineTransformMakeTranslation{
    return ^NSValue *_Nullable(CGPoint data){
        return [NSValue valueWithCGAffineTransform:CGAffineTransformMakeTranslation(data.x, data.y)];
    };
}

+(JobsRetValueByPointBlock _Nonnull)byCGAffineTransformMakeScale{
    return ^NSValue *_Nullable(CGPoint data){
        return [NSValue valueWithCGAffineTransform:CGAffineTransformMakeScale(data.x, data.y)];
    };
}

+(JobsRetValueByCGFloatBlock _Nonnull)byCGAffineTransformMakeRotation{
    return ^NSValue *_Nullable(CGFloat data){
        return [NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(data)];
    };
}

-(JobsRetValueByPointBlock _Nonnull)byTranslate{
    @jobs_weakify(self)
    return ^NSValue *_Nullable(CGPoint data){
        @jobs_strongify(self)
        return [NSValue valueWithCGAffineTransform:CGAffineTransformTranslate(self.byCGAffineTransformValue, data.x, data.y)];
    };
}

-(JobsRetValueByPointBlock _Nonnull)byScale{
    @jobs_weakify(self)
    return ^NSValue *_Nullable(CGPoint data){
        @jobs_strongify(self)
        return [NSValue valueWithCGAffineTransform:CGAffineTransformScale(self.byCGAffineTransformValue, data.x, data.y)];
    };
}

-(JobsRetValueByCGFloatBlock _Nonnull)byRotate{
    @jobs_weakify(self)
    return ^NSValue *_Nullable(CGFloat data){
        @jobs_strongify(self)
        return [NSValue valueWithCGAffineTransform:CGAffineTransformRotate(self.byCGAffineTransformValue, data)];
    };
}

-(JobsRetValueByAffineTransformBlock _Nonnull)byConcat{
    @jobs_weakify(self)
    return ^NSValue *_Nullable(CGAffineTransform data){
        @jobs_strongify(self)
        return [NSValue valueWithCGAffineTransform:CGAffineTransformConcat(self.byCGAffineTransformValue, data)];
    };
}

-(CGAffineTransform)byCGAffineTransformValue{
    if (strcmp(self.objCType, @encode(CGAffineTransform)) == 0) return self.CGAffineTransformValue;
    return CGAffineTransformIdentity;
}

@end

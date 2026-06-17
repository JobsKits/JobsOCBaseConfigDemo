//
//  CGAffineTransform+DSL.m
//  JobsOCBaseConfigDemo
//
#import "CGAffineTransform+DSL.h"

@implementation NSValue (JobsCGAffineTransformDSL)
+(JobsRetValueByVoidBlock)byCGAffineTransformIdentity{
    return ^NSValue *_Nullable(void){
        return [NSValue valueWithCGAffineTransform:CGAffineTransformIdentity];
    };
}

+(JobsRetValueByAffineTransformBlock)byCGAffineTransform{
    return ^NSValue *_Nullable(CGAffineTransform data){
        return [NSValue valueWithCGAffineTransform:data];
    };
}

+(JobsRetValueByPointBlock)byCGAffineTransformMakeTranslation{
    return ^NSValue *_Nullable(CGPoint data){
        return [NSValue valueWithCGAffineTransform:CGAffineTransformMakeTranslation(data.x, data.y)];
    };
}

+(JobsRetValueByPointBlock)byCGAffineTransformMakeScale{
    return ^NSValue *_Nullable(CGPoint data){
        return [NSValue valueWithCGAffineTransform:CGAffineTransformMakeScale(data.x, data.y)];
    };
}

+(JobsRetValueByCGFloatBlock)byCGAffineTransformMakeRotation{
    return ^NSValue *_Nullable(CGFloat data){
        return [NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(data)];
    };
}

-(JobsRetValueByPointBlock)byTranslate{
    @jobs_weakify(self)
    return ^NSValue *_Nullable(CGPoint data){
        @jobs_strongify(self)
        return [NSValue valueWithCGAffineTransform:CGAffineTransformTranslate(self.byCGAffineTransformValue, data.x, data.y)];
    };
}

-(JobsRetValueByPointBlock)byScale{
    @jobs_weakify(self)
    return ^NSValue *_Nullable(CGPoint data){
        @jobs_strongify(self)
        return [NSValue valueWithCGAffineTransform:CGAffineTransformScale(self.byCGAffineTransformValue, data.x, data.y)];
    };
}

-(JobsRetValueByCGFloatBlock)byRotate{
    @jobs_weakify(self)
    return ^NSValue *_Nullable(CGFloat data){
        @jobs_strongify(self)
        return [NSValue valueWithCGAffineTransform:CGAffineTransformRotate(self.byCGAffineTransformValue, data)];
    };
}

-(JobsRetValueByAffineTransformBlock)byConcat{
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

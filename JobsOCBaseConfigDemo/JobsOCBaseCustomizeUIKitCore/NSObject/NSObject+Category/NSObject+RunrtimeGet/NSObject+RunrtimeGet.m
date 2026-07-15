//
//  NSObject+RunrtimeGet.m
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+RunrtimeGet.h"

@implementation NSObject (RunrtimeGet)
-(id _Nullable)object:(NSObject *)object getIvar:(Ivar)ivar{
    return object_getIvar(object, ivar);
}

-(Ivar _Nullable)classGetInstanceVariableWithClass:(Class _Nullable)cls
                              instanceVariableName:(NSString *_Nonnull)instanceVariableName{
    if (cls && instanceVariableName) {
        instanceVariableName = [NSString stringWithFormat:@"_%@",instanceVariableName];// 必须是下划线接属性;
        const char *ivn = instanceVariableName.UTF8String;
        return class_getInstanceVariable(cls, ivn);
    }else return nil;
}

@end

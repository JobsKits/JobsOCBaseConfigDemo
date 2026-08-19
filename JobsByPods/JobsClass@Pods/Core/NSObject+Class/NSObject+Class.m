//
//  NSObject+Class.m
//  JobsClass
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Class.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN NSObject
@interface NSObject (JobsPropertyDSLSetterAutogen_f751521f51)
-(void)setDoorModel:(JobsUserModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END NSObject

@implementation NSObject (Class)
#pragma mark —— 返回并打印成员变量列表
-(JobsRetArrByVoidBlock _Nonnull)printIvarList{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(){
        @jobs_strongify(self)
        return printIvarListByObj(self);
    };
}

-(JobsRetArrByVoidBlock _Nonnull)ivarList{
    @jobs_weakify(self)
    return ^__kindof NSArray *{
        @jobs_strongify(self)
        if (!self) return nil;
        return printIvarListByObj(self);
    };
}
#pragma mark —— 返回并打印属性列表
-(JobsRetArrByVoidBlock _Nonnull)printPropertyList{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(){
        @jobs_strongify(self)
        return printPropertyListByObj(self);
    };
}
-(JobsRetArrByVoidBlock _Nonnull)propertyList{
    @jobs_weakify(self)
    return ^__kindof NSArray *{
        @jobs_strongify(self)
        if (!self) return nil;
        return printPropertyListByObj(self);
    };
}
#pragma mark —— 返回并打印方法列表
-(JobsRetArrByVoidBlock _Nonnull)printMethodList{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(){
        @jobs_strongify(self)
        return printMethodListByObj(self);
    };
}
-(JobsRetArrByVoidBlock _Nonnull)methodList{
    @jobs_weakify(self)
    return ^__kindof NSArray *{
        @jobs_strongify(self)
        if (!self) return nil;
        return printMethodListByObj(self);
    };
}
#pragma mark —— 返回并打印协议列表
-(JobsRetArrByVoidBlock _Nonnull)printProtocolList{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(){
        @jobs_strongify(self)
        return printProtocolListByObj(self);
    };
}

-(JobsRetArrByVoidBlock _Nonnull)protocolList{
    @jobs_weakify(self)
    return ^__kindof NSArray *{
        @jobs_strongify(self)
        if (!self) return nil;
        return printProtocolListByObj(self);
    };
}
/// 1、字典是hash映射，是无序的，如果需要有序则需要避开字典，所以对模型进行操作是大前提
/// 2、字典和模型的差距在于序列化
/// 3、字典化的模型里面，依据有序的（从上至下）属性名字排列，去取值，映射到数组里面
/// 4、要成为字典的Key，只需要遵循NSCopying协议
-(JobsRetArrByVoidBlock _Nonnull)readModelPropertyValueByOrder{
    @jobs_weakify(self)
    return ^__kindof NSMutableArray<__kindof NSDictionary *> *_Nullable(){
        @jobs_strongify(self)
        NSMutableArray<NSString *> *propertyListMutArr = (NSMutableArray *)self.propertyList();//有序的，从上至下
        NSMutableDictionary *mutDic = self.mj_keyValues;// 实际上需要操作的字典
        /// 对外返的数组
        NSMutableArray<__kindof NSDictionary *> *data = NSMutableArray.array;
        for (NSString *property in propertyListMutArr) {
            if (mutDic[property] && [mutDic[property] isKindOfClass:NSObject.class]) {// 防崩溃:必须取到值，且值不能是数据类型
                [data addObject:mutDic[property]];
            }
        };return data;
    };
}

-(JobsRetBOOLByIDBlock _Nonnull)isKindOfClass{
    @jobs_weakify(self)
    return ^BOOL(Class cls) {
        @jobs_strongify(self)
        return [self isKindOfClass:cls];
    };
}

-(JobsRetBOOLByIDBlock _Nonnull)isMemberOfClass{
    @jobs_weakify(self)
    return ^(Class cls) {
        @jobs_strongify(self)
        return [self isMemberOfClass:cls];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN NSObject
-(JobsRetNSObjectByJobsUserModelBlock _Nonnull)byDoorModel{
    @jobs_weakify(self)
    return ^__kindof NSObject * _Nullable(JobsUserModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END NSObject
@end

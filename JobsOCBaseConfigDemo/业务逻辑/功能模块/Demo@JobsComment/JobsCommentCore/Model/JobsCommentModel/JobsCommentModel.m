//
//  JobsCommentModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCommentModel.h"

@implementation JobsChildCommentModel
#pragma mark —— YYModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return (((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsChildCommentModel.class, @selector(jobsModelCustomPropertyMapper)))(self, @selector(jobsModelCustomPropertyMapper)))();
}

+ (JobsRetDicByVoidBlock _Nonnull)jobsModelCustomPropertyMapper{
    return ^NSDictionary *{
        return [super modelCustomPropertyMapper].mutableCopy;
    };
}
#pragma mark —— MJExtention
+(NSDictionary *)mj_replacedKeyFromPropertyName {
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return [super mj_replacedKeyFromPropertyName].mutableCopy;
}

@end

@implementation JobsFirstCommentModel
#pragma mark —— YYModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return (((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsFirstCommentModel.class, @selector(jobsModelCustomPropertyMapper)))(self, @selector(jobsModelCustomPropertyMapper)))();
}

+ (JobsRetDicByVoidBlock _Nonnull)jobsModelCustomPropertyMapper{
    return ^NSDictionary *{
        NSMutableDictionary *dict = [super modelCustomPropertyMapper].mutableCopy;
        dict[@"childDataArr"] = @"child";
        return dict;
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return (((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsFirstCommentModel.class, @selector(jobsModelContainerPropertyGenericClass)))(self, @selector(jobsModelContainerPropertyGenericClass)))();
}

+ (JobsRetDicByVoidBlock _Nonnull)jobsModelContainerPropertyGenericClass {
    return ^NSDictionary *{
        return @{
            @"childDataArr" : JobsChildCommentModel.class
        };
    };
}
#pragma mark —— MJExtention
/* 返回的字典，key为模型属性名，value为转化的字典的多级key */
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    NSMutableDictionary *dict = [super mj_replacedKeyFromPropertyName].mutableCopy;
    dict[@"childDataArr"] = @"child";
    return dict;
}

+(NSDictionary *)mj_objectClassInArray{
    return @{
        @"childDataArr" : JobsChildCommentModel.class
    };
}

@end

@implementation JobsCommentModel
#pragma mark —— YYModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return (((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsCommentModel.class, @selector(jobsModelCustomPropertyMapper)))(self, @selector(jobsModelCustomPropertyMapper)))();
}

+ (JobsRetDicByVoidBlock _Nonnull)jobsModelCustomPropertyMapper{
    return ^NSDictionary *{
        return @{
            @"listDataArr": @"list"
        };
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return (((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsCommentModel.class, @selector(jobsModelContainerPropertyGenericClass)))(self, @selector(jobsModelContainerPropertyGenericClass)))();
}

+ (JobsRetDicByVoidBlock _Nonnull)jobsModelContainerPropertyGenericClass {
    return ^NSDictionary *{
        return @{
            @"list" : JobsFirstCommentModel.class
        };
    };
}
#pragma mark —— MJExtention
/* 返回的字典，key为模型属性名，value为转化的字典的多级key */
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    NSMutableDictionary *dict = [super mj_replacedKeyFromPropertyName].mutableCopy;
    dict[@"listDataArr"] = @"list";
    return dict;
}

+(NSDictionary *)mj_objectClassInArray{
    return @{
        @"listDataArr" : JobsFirstCommentModel.class,
    };
}

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsFirstCommentCustomCofigModel
@interface JobsFirstCommentCustomCofigModel (JobsPropertyDSLSetterAutogen_d731aa0aa7)
-(void)setChildDataArr:(NSArray <JobsChildCommentModel *>* _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsFirstCommentCustomCofigModel

@implementation JobsFirstCommentCustomCofigModel
#pragma mark —— 自定义属性
-(NSInteger)preMax{
    if (_preMax == 0) {
        _preMax = 3;
    };return _preMax;
}

-(NSInteger)loadMoreDataNum{
    if (_loadMoreDataNum == 0) {
        if (self.childDataArr.count) {
            return self.childDataArr.count - self.firstShowNum;//全加载 = 数据库有的 - 默认已经显示的
        }
    };return _loadMoreDataNum;
}

-(NSInteger)firstShowNum{
    if (self.isFullShow) {
        return self.childDataArr.count;
    }else{
        return self.childDataArr.count > self.preMax ? self.preMax : self.childDataArr.count;
    }
}

-(BOOL)isFullShow{
    return NO;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsFirstCommentCustomCofigModel
-(JobsRetJobsFirstCommentCustomCofigModelByNSArrayJobsChildCommentModelBlock _Nonnull)byChildDataArr{
    @jobs_weakify(self)
    return ^__kindof JobsFirstCommentCustomCofigModel * _Nullable(NSArray <JobsChildCommentModel *>* _Nullable data){
        @jobs_strongify(self)
        [self setChildDataArr:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsFirstCommentCustomCofigModel
@end

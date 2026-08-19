//
//  JobsMsgDataModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsMsgDataModel.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsMsgDataModel
@interface JobsMsgDataModel (JobsPropertyDSLSetterAutogen_8610b76782)
-(void)setIsRead:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsMsgDataModel

@implementation JobsMsgDataModel

-(JobsRetJobsMsgDataModelByNSIntegerBlock _Nonnull)byMsgStyle{
    @jobs_weakify(self)
    return ^__kindof JobsMsgDataModel *_Nullable(NSInteger value){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setMsgStyle:value];
        return self;
    };
}

-(JobsRetJobsMsgDataModelByStrBlock _Nonnull)byTimeText{
    @jobs_weakify(self)
    return ^__kindof JobsMsgDataModel *_Nullable(NSString *_Nullable string){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setTimeText:string];
        return self;
    };
}

-(JobsRetJobsMsgDataModelByBOOLBlock _Nonnull)byIsDraw{
    @jobs_weakify(self)
    return ^__kindof JobsMsgDataModel *_Nullable(BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setIsDraw:value];
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsMsgDataModel
-(JobsRetJobsMsgDataModelByBOOLBlock _Nonnull)byRead{
    @jobs_weakify(self)
    return ^__kindof JobsMsgDataModel * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsRead:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsMsgDataModel
@end

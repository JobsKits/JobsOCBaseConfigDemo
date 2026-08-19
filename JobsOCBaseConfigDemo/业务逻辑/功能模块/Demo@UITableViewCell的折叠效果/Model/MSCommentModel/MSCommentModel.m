//
//  MSCommentModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MSCommentModel.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN MSCommentModel
@interface MSCommentModel (JobsPropertyDSLSetterAutogen_c5572260c1)
-(void)setSectionSubTitle:(NSString * _Nullable)data;
-(void)setSectionTitle:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END MSCommentModel

@implementation MSCommentModel

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN MSCommentModel
-(JobsRetMSCommentModelByNSStringBlock _Nonnull)bySectionSubTitle{
    @jobs_weakify(self)
    return ^__kindof MSCommentModel * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setSectionSubTitle:data];
        return self;
    };
}

-(JobsRetMSCommentModelByNSStringBlock _Nonnull)bySectionTitle{
    @jobs_weakify(self)
    return ^__kindof MSCommentModel * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setSectionTitle:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END MSCommentModel
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN MSCommentDetailModel
@interface MSCommentDetailModel (JobsPropertyDSLSetterAutogen_c5572260c1)
-(void)setRowTitle:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END MSCommentDetailModel

@implementation MSCommentDetailModel

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN MSCommentDetailModel
-(JobsRetMSCommentDetailModelByNSStringBlock _Nonnull)byRowTitle{
    @jobs_weakify(self)
    return ^__kindof MSCommentDetailModel * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setRowTitle:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END MSCommentDetailModel
@end


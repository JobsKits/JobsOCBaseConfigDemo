//
//  MasonryModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MasonryModel.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN MasonryModel
@interface MasonryModel (JobsPropertyDSLSetterAutogen_43053d4650)
-(void)setAxisType:(MASAxisType)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END MasonryModel

@implementation MasonryModel

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN MasonryModel
-(JobsRetMasonryModelByMASAxisTypeBlock _Nonnull)byAxisType{
    @jobs_weakify(self)
    return ^__kindof MasonryModel * _Nullable(MASAxisType data){
        @jobs_strongify(self)
        [self setAxisType:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END MasonryModel
@end

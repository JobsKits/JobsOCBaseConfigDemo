//
//  JobsAppDoorInputViewBaseStyle.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewTFModel
@interface JobsAppDoorInputViewTFModel (JobsPropertyDSLSetterAutogen_3eac988bad)
-(void)setPlaceHolder:(NSString * _Nullable)data;
-(void)setResString:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewTFModel

@implementation JobsAppDoorInputViewTFModel
-(NSString *)PlaceHolder{
    if (!_PlaceHolder) {
        _PlaceHolder = @"".jobsTr();
    };return _PlaceHolder;
}

-(NSString *)resString{
    if (!_resString) {
        _resString = @"".jobsTr();
    };return _resString;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewTFModel
-(JobsRetJobsAppDoorInputViewTFModelByNSStringBlock _Nonnull)byPlaceHolder{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewTFModel * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setPlaceHolder:data];
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewTFModelByNSStringBlock _Nonnull)byResString{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewTFModel * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setResString:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewTFModel
@end

@interface JobsAppDoorInputViewBaseStyle ()

@end

@implementation JobsAppDoorInputViewBaseStyle
-(JobsAppDoorInputViewTFModel *)textFieldInputModel{
    if (!_textFieldInputModel) {
        _textFieldInputModel = JobsAppDoorInputViewTFModel.new
            .byResString(@"".jobsTr())
            .byPlaceHolder(self.textField.placeholder);
    };return _textFieldInputModel;
}

@end

//
//  JobsAppDoorInputViewBaseStyle.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle.h"

@implementation JobsAppDoorInputViewTFModel
-(JobsRetJobsAppDoorInputViewTFModelByNSStringBlock _Nonnull)byPlaceHolder{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewTFModel *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.PlaceHolder = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewTFModelByNSStringBlock _Nonnull)byResString{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewTFModel *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.resString = data;
        return self;
    };
}

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

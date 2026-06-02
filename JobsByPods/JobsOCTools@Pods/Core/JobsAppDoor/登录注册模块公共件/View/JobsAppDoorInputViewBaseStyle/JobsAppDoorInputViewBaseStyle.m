//
//  JobsAppDoorInputViewBaseStyle.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle.h"

@implementation JobsAppDoorInputViewTFModel

-(NSString *)PlaceHolder{
    if (!_PlaceHolder) {
        _PlaceHolder = @"".tr;
    }return _PlaceHolder;
}

-(NSString *)resString{
    if (!_resString) {
        _resString = @"".tr;
    }return _resString;
}

@end

@interface JobsAppDoorInputViewBaseStyle ()
@end

@implementation JobsAppDoorInputViewBaseStyle

-(JobsAppDoorInputViewTFModel *)textFieldInputModel{
    if (!_textFieldInputModel) {
        _textFieldInputModel = JobsAppDoorInputViewTFModel.new;
        _textFieldInputModel.resString = @"".tr;
        _textFieldInputModel.PlaceHolder = self.textField.placeholder;
    }return _textFieldInputModel;
}

@end


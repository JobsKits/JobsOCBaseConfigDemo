//
//  JobsAppDoorInputViewBaseStyleModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyleModel.h"

@interface JobsAppDoorInputViewBaseStyleModel ()

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyleModel
@interface JobsAppDoorInputViewBaseStyleModel (JobsPropertyDSLSetterAutogen_1b2f4e9e5c)
-(void)setIsShowSecurityBtn:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyleModel

@implementation JobsAppDoorInputViewBaseStyleModel
UIViewModelProtocol_synthesize
- (instancetype)init{
    if (self = [super init]) {
        self.keyboardEnable = YES;
    };return self;
}

-(UIFont *)titleStrFont{
    if (!_titleStrFont) {
        _titleStrFont = UIFontWeightRegularSize(9);
    };return _titleStrFont;
}

-(UIColor *)titleStrCor{
    if (!_titleStrCor) {
        _titleStrCor = JobsWhiteColor;
    };return _titleStrCor;
}

-(UIFont *)placeholderFont{
    if (!_placeholderFont) {
        _placeholderFont = UIFontWeightRegularSize(14);
    };return _placeholderFont;
}

-(UIColor *)placeholderColor{
    if (!_placeholderColor) {
        _placeholderColor = HEXCOLOR(0x524740);
    };return _placeholderColor;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyleModel
-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byShowSecurityBtn{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsShowSecurityBtn:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyleModel
@end

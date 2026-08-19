//
//  BRPickerStyle+DSL.m
//  BRPickerViewExtra
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "BRPickerStyle+DSL.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN BRPickerStyle
@interface BRPickerStyle (JobsPropertyDSLSetterAutogen_6cf8570950)
-(void)setCancelBtnTitle:(NSString * _Nullable)data;
-(void)setDoneBtnTitle:(NSString * _Nullable)data;
-(void)setPickerColor:(UIColor * _Nullable)data;
-(void)setPickerTextColor:(UIColor * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END BRPickerStyle

@implementation BRPickerStyle (DSL)

-(JobsRetBRPickerStyleByCorBlock _Nonnull)bySeparatorColor{
    @jobs_weakify(self)
    return ^__kindof BRPickerStyle *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.separatorColor = data;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN BRPickerStyle
-(JobsRetBRPickerStyleByCorBlock _Nonnull)byPickerColor{
    @jobs_weakify(self)
    return ^__kindof BRPickerStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setPickerColor:data];
        return self;
    };
}

-(JobsRetBRPickerStyleByCorBlock _Nonnull)byPickerTextColor{
    @jobs_weakify(self)
    return ^__kindof BRPickerStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setPickerTextColor:data];
        return self;
    };
}

-(JobsRetBRPickerStyleByNSStringBlock _Nonnull)byCancelBtnTitle{
    @jobs_weakify(self)
    return ^__kindof BRPickerStyle * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setCancelBtnTitle:data];
        return self;
    };
}

-(JobsRetBRPickerStyleByNSStringBlock _Nonnull)byDoneBtnTitle{
    @jobs_weakify(self)
    return ^__kindof BRPickerStyle * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setDoneBtnTitle:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END BRPickerStyle
@end

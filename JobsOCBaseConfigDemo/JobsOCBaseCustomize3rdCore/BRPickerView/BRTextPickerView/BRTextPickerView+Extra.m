//
//  BRTextPickerView+Extra.m
//  BRPickerViewExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Updated for latest BRPickerView on 2026年5月29日，星期五.
//

#import "BRTextPickerView+Extra.h"

@implementation BRTextPickerView (Extra)
+(BRPickerViewExtraRetTextPickerViewByPickerModeBlock)initBy {
    return ^BRTextPickerView *_Nonnull(BRTextPickerMode mode) {
        return [[BRTextPickerView alloc] initWithPickerMode:mode];
    };
}

-(JobsRetBRTextPickerViewByPickerModeBlock _Nonnull)byPickerMode{
    @jobs_weakify(self)
    return ^BRTextPickerView *_Nonnull(NSInteger data){
        @jobs_strongify(self)
        self.pickerMode = (BRTextPickerMode)data;
        return self;
    };
}

-(JobsRetBRTextPickerViewByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^BRTextPickerView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetBRTextPickerViewByUIntegerBlock _Nonnull)byShowColumnNum{
    @jobs_weakify(self)
    return ^BRTextPickerView *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.showColumnNum = data;
        return self;
    };
}

-(JobsRetBRTextPickerViewByPickerStyleBlock _Nonnull)byPickerStyle{
    @jobs_weakify(self)
    return ^BRTextPickerView *_Nullable(BRPickerStyle *_Nullable data){
        @jobs_strongify(self)
        self.pickerStyle = data;
        return self;
    };
}

-(JobsRetBRTextPickerViewByArrBlock _Nonnull)byDataSourceArr{
    @jobs_weakify(self)
    return ^BRTextPickerView *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        self.dataSourceArr = data;
        return self;
    };
}

@end


// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN BRDatePickerView
@interface BRDatePickerView (JobsPropertyDSLSetterAutogen_4bbf6f1a50)
-(void)setIsAutoSelect:(BOOL)data;
-(void)setMaxDate:(NSDate * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END BRDatePickerView

@implementation BRDatePickerView (Extra)

-(JobsRetBRDatePickerViewByNSIntegerBlock _Nonnull)byPickerMode{
    @jobs_weakify(self)
    return ^BRDatePickerView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.pickerMode = (BRDatePickerMode)data;
        return self;
    };
}

-(JobsRetBRDatePickerViewByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^BRDatePickerView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetBRDatePickerViewByPickerStyleBlock _Nonnull)byPickerStyle{
    @jobs_weakify(self)
    return ^BRDatePickerView *_Nonnull(BRPickerStyle *_Nullable data){
        @jobs_strongify(self)
        self.pickerStyle = data;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN BRDatePickerView
-(JobsRetBRDatePickerViewByBOOLBlock _Nonnull)byAutoSelect{
    @jobs_weakify(self)
    return ^__kindof BRDatePickerView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsAutoSelect:data];
        return self;
    };
}
-(JobsRetBRDatePickerViewByNSDateBlock _Nonnull)byMaxDate{
    @jobs_weakify(self)
    return ^__kindof BRDatePickerView * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self setMaxDate:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END BRDatePickerView
@end

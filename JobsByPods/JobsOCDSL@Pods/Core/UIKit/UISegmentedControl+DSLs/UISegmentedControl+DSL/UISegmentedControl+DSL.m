//
//  UISegmentedControl+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UISegmentedControl+DSL.h"

@implementation UISegmentedControl (DSL)
-(NSInteger)jobs_selectedSegmentIndex{
    return self.selectedSegmentIndex;
}

-(JobsRetSegmentedControlByNSIntegerBlock _Nonnull)bySelectedSegmentIndex{
    @jobs_weakify(self)
    return ^__kindof UISegmentedControl *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.selectedSegmentIndex = data;
        return self;
    };
}

-(JobsRetSegmentedControlByBOOLBlock _Nonnull)byMomentary{
    @jobs_weakify(self)
    return ^__kindof UISegmentedControl *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.momentary = data;
        return self;
    };
}

-(JobsRetSegmentedControlByBOOLBlock _Nonnull)byApportionsSegmentWidthsByContent{
    @jobs_weakify(self)
    return ^__kindof UISegmentedControl *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.apportionsSegmentWidthsByContent = data;
        return self;
    };
}

-(JobsRetSegmentedControlByColorBlock _Nonnull)bySelectedSegmentTintColor API_AVAILABLE(ios(13.0)){
    @jobs_weakify(self)
    return ^__kindof UISegmentedControl *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.selectedSegmentTintColor = data;
        return self;
    };
}

-(JobsRetSegmentedControlByVoidBlock _Nonnull)byRemoveAllSegments{
    @jobs_weakify(self)
    return ^__kindof UISegmentedControl *_Nullable(void){
        @jobs_strongify(self)
        [self removeAllSegments];
        return self;
    };
}

@end

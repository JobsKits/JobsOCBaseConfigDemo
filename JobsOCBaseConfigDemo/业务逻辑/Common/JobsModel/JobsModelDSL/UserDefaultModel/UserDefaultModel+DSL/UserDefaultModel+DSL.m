//
//  UserDefaultModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "UserDefaultModel+DSL.h"

@implementation UserDefaultModel (DSL)
-(JobsRetUserDefaultModelByNSObjectPointerBlock _Nonnull)byObj{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nullable(__kindof NSObject <NSCoding> * _Nullable data) {
        @jobs_strongify(self)
        self.obj = data;
        return self;
    };
}

-(JobsRetUserDefaultModelByIntBlock _Nonnull)byIntValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nullable(int data) {
        @jobs_strongify(self)
        self.intValue = data;
        return self;
    };
}

-(JobsRetUserDefaultModelByFloatBlock _Nonnull)byFloatValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nullable(float data) {
        @jobs_strongify(self)
        self.floatValue = data;
        return self;
    };
}

-(JobsRetUserDefaultModelByBOOLBlock _Nonnull)byBooLValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.booLValue = data;
        return self;
    };
}

-(JobsRetUserDefaultModelByNSIntegerBlock _Nonnull)byNSIntValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.NSIntValue = data;
        return self;
    };
}

-(JobsRetUserDefaultModelByCGFloatBlock _Nonnull)byCGfloatValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CGfloatValue = data;
        return self;
    };
}

-(JobsRetUserDefaultModelByStrBlock _Nonnull)byKey{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.key = data;
        return self;
    };
}

@end

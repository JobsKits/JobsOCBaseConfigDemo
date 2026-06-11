//
//  UserDefaultModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UserDefaultModel+DSL.h"

@implementation UserDefaultModel (DSL)

#pragma mark —— 来自 UserDefaultModel
-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(__kindof NSObject <NSCoding> * data))byObj{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nonnull(__kindof NSObject <NSCoding> * data) {
        @jobs_strongify(self)
        self.obj = data;
        return self;
    };
}

-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(int data))byIntValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nonnull(int data) {
        @jobs_strongify(self)
        self.intValue = data;
        return self;
    };
}

-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(float data))byFloatValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nonnull(float data) {
        @jobs_strongify(self)
        self.floatValue = data;
        return self;
    };
}

-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(BOOL data))byBooLValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.booLValue = data;
        return self;
    };
}

-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(NSInteger data))byNSIntValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.NSIntValue = data;
        return self;
    };
}

-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(CGFloat data))byCGfloatValue{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.CGfloatValue = data;
        return self;
    };
}

-(__kindof UserDefaultModel *_Nonnull (^ _Nonnull)(NSString * data))byKey{
    @jobs_weakify(self)
    return ^__kindof UserDefaultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.key = data;
        return self;
    };
}

@end

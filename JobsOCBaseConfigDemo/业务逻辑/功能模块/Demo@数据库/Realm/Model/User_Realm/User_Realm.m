//
//  User_Realm.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "User_Realm.h"

@implementation User_Realm
-(JobsRetUser_RealmByStrBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof User_Realm *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(JobsRetUser_RealmByNSIntegerBlock _Nonnull)byAge{
    @jobs_weakify(self)
    return ^__kindof User_Realm *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.age = data;
        return self;
    };
}

@end

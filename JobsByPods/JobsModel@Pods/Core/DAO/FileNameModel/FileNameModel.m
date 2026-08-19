//
//  FileNameModel.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FileNameModel.h"

@implementation FileNameModel

-(JobsRetFileNameModelByStrBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof FileNameModel *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.name = data;
        return self;
    };
}

-(JobsRetFileNameModelByStrBlock _Nonnull)byType{
    @jobs_weakify(self)
    return ^__kindof FileNameModel *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.type = data;
        return self;
    };
}

@end

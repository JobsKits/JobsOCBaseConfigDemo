//
//  NSObject+Model.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#import "NSObject+Model.h"
#import "NSObject+UsrInfo.h"

@implementation NSObject (Model)
#pragma mark —— @property(nonatomic,strong,nullable)JobsUserModel *doorModel;
JobsKey(_loginModel)
@dynamic doorModel;
-(JobsUserModel *_Nullable)doorModel{
    return self.readUserInfoByUserName(JobsUserModel.class,用户信息);
}

-(void)setLoginModel:(JobsUserModel *_Nullable)doorModel{
    if(doorModel){
        self.jobsSaveUserInfo(doorModel,用户信息);
    }else{
        self.deleteUserInfoByUserName(用户信息);
    }
}

@end

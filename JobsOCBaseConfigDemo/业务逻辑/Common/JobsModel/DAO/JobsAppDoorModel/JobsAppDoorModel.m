//
//  JobsAppDoorModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorModel.h"
#import "NSObject+UserInfo.h"

@implementation JobsAppDoorModel

-(NSString *)userName{
    if (!_userName) {
        _userName = self.readUserNameMutArr[0];
    };return _userName;
}

@end

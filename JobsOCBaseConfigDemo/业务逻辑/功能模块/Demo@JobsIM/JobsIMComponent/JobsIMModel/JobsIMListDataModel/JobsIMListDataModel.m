//
//  JobsIMListDataModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMListDataModel.h"

@implementation JobsIMListDataModel

-(NSString *)usernameStr{
    if (!_usernameStr) {
        _usernameStr = @"未定义";
    };return _usernameStr;
}

-(NSString *)contentStr{
    if (!_contentStr) {
        _contentStr = @"未定义";
    };return _contentStr;
}

-(NSString *)timeStr{
    if (!_timeStr) {
        _timeStr = @"未定义";
    };return _timeStr;
}

-(UIImage *)userHeaderIMG{
    if (!_userHeaderIMG) {
        _userHeaderIMG = UIImage.animatedGIFByName(@"动态头像 尺寸126");
    };return _userHeaderIMG;
}

@end

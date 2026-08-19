//
//  JobsDecorationModel.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsDecorationModel.h"

@implementation JobsDecorationModel
/// 主标题
-(NSString *)title{
    if(!_title){
        _title = @"";
    };return _title;
}
/// 副标题
-(NSString *)subTitle{
    if (!_subTitle) {
        _subTitle = @"";
    };return _subTitle;
}

@end

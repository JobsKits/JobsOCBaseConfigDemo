//
//  GoodsClassModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "GoodsClassModel.h"

@implementation GoodsClassModel
TimerProtocol_synthesize_lock
AppToolsProtocol_synthesize
UIPictureAndBackGroundCorProtocol_synthesize
BaseButtonProtocol_synthesize
BaseProtocol_synthesize
UITextModelProtocol_synthesize_part2
UITextModelProtocol_synthesize_part3

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    NSMutableDictionary *dict = [super mj_replacedKeyFromPropertyName].mutableCopy;
    dict[@"idField"] = @"id";
    return dict;
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{
        @"childrenList":GoodsClassModel.class,
    };
}

-(NSMutableArray<GoodsClassModel *> *)childrenList{
    if (!_childrenList) {
        _childrenList = NSMutableArray.array;
    };return _childrenList;
}

@end

//
//  DataManager.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "DataManager.h"

@interface DataManager()

Prop_copy()NSMutableDictionary *dataInfo;

@end

@implementation DataManager
/// 数据管理对象单例
+(instancetype)sharedManager{
    JobsRetDataManagerByVoidBlock action = ((JobsRetDataManagerByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(DataManager.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetDataManagerByVoidBlock _Nonnull)jobsSharedManager{
    return ^DataManager *{
        static DataManager *sharedManager = nil;
        @synchronized(self){
            if (!sharedManager) {
                sharedManager = DataManager.new;
            }
        };return sharedManager;
    };
}
/// 保存页面数据
-(void)saveDataInfo:(__kindof NSDictionary *)info
                key:(NSString *)key {
    if(!_dataInfo.count) return;
    if(!info.count) return;
    if(isNull(key)) return;
    _dataInfo.saveDataBy(info.dataByKey(key));
}
/// 根据menuId获取相应页面的数据
-(JobsRetDicByStringBlock _Nonnull)dataInfoWithKey{
    @jobs_weakify(self)
    return ^NSDictionary *(NSString * key){
        @jobs_strongify(self)
        if (!self) return nil;
        return [_dataInfo objectForKey:key];
    };
}
#pragma mark —— lazyLoad
-(NSMutableDictionary *)dataInfo{
    if(!_dataInfo){
        _dataInfo = NSMutableDictionary.dictionary;
    };return _dataInfo;
}

@end

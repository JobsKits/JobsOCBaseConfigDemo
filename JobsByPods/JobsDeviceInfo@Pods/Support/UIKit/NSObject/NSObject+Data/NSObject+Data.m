//
//  NSObject+Data.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Data.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"

@implementation NSObject (Data)
#pragma mark —— 关于数据（MJExtension）解析
/// 对待输入参数是含字典的数组
+(JobsRetArrByArrBlock _Nonnull)byDataArr{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof NSArray <NSDictionary *>*_Nullable data){
        @jobs_strongify(self)
        return [self.class mj_objectArrayWithKeyValuesArray:data];
    };
}
/// 对待输入参数是字典
+(JobsRetIDByDicBlock _Nonnull)byDataDic{
    @jobs_weakify(self)
    return ^id _Nullable(__kindof NSDictionary *_Nullable data){
        @jobs_strongify(self)
        return [self.class mj_objectWithKeyValues:data];
    };
}
/// 万能解析
+(JobsRetIDByIDBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^id _Nullable(id _Nullable data){
        @jobs_strongify(self)
        if(KindOfDicCls(data)) return [self.class mj_objectWithKeyValues:data];
        if(KindOfArrCls(data)) return [self.class mj_objectArrayWithKeyValuesArray:data];
        return nil;
    };
}
#pragma mark —— 关于万物数据绑定
#pragma mark —— @property(nonatomic,strong,nullable)id __block data;// 绑定的数据源，数据类型id
JobsKey(_data)
@dynamic data;
-(id)data{
    return Jobs_getAssociatedObject(_data);
}

-(void)setData:(id)data{
    Jobs_setAssociatedRETAIN_NONATOMIC(_data, data)
}
#pragma mark —— UIViewModelOthersProtocol.requestParams // 绑定的数据源，数据类型id
JobsKey(_requestParams)
@dynamic requestParams;
-(id)requestParams{
    return Jobs_getAssociatedObject(_requestParams);
}

-(void)setRequestParams:(id)requestParams{
    Jobs_setAssociatedRETAIN_NONATOMIC(_requestParams, requestParams)
}

@end

#pragma clang diagnostic pop

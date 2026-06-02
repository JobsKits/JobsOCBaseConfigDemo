//
//  NSArray+Extra.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSArray+Extra.h"

@implementation NSArray (Extra)
#pragma mark —— Masonry 均匀分布的布局方式封装
/// 在指定的轴方向上，按照固定的间距分布多个视图。每个视图之间的间距是固定的，而不是视图本身的尺寸固定。
-(JobsRetArrByMasonryModelBlock _Nonnull)installByMasonryModel1{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof MasonryModel *_Nullable data){
        @jobs_strongify(self)
        [self mas_distributeViewsAlongAxis:data.axisType      // 在水平（垂直）方向上分布这些视图
                          withFixedSpacing:data.fixedSpacing  // 指定每个视图之间的固定间距
                               leadSpacing:data.leadSpacing   // 指定第一个视图与父视图左边缘（顶部）之间的距离
                               tailSpacing:data.tailSpacing]; // 指定最后一个视图与父视图右边缘（底部）之间的距离
        if(data.is_mas_makeConstraints){
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                /// 横向拉伸以均分
                if(data.axisType == MASAxisTypeHorizontal){
                    if(data.top) make.top.equalTo(@(data.top));
                    if(data.bottom) make.bottom.equalTo(@(data.bottom));
                    make.height.equalTo(@(data.height));
                }
                /// 纵向拉伸以均分
                if(data.axisType == MASAxisTypeVertical){
                    if(data.left) make.left.equalTo(@(data.left));
                    if(data.right) make.right.equalTo(@(data.right));
                    make.width.equalTo(@(data.width));
                }
            }];
        }return self;
    };
}
/// 将一组视图沿某个方向（水平或垂直）等间距分布，视图的宽度（或高度）是固定的，且视图与容器的两端没有间隔。
-(JobsRetArrByMasonryModelBlock _Nonnull)installByMasonryModel2{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof MasonryModel *_Nullable data){
        @jobs_strongify(self)
        [self mas_distributeViewsAlongAxis:data.axisType        // 在水平（垂直）方向上分布这些视图
                       withFixedItemLength:data.fixedItemLength // 设置每个视图的固定宽度或高度
                               leadSpacing:data.leadSpacing     // 指定第一个视图与父视图左边缘（顶部）之间的距离
                               tailSpacing:data.tailSpacing];   // 指定最后一个视图与父视图右边缘（底部）之间的距离
        if(data.is_mas_makeConstraints){
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                /// 横向拉伸以均分
                if(data.axisType == MASAxisTypeHorizontal){
                    if(data.top) make.top.equalTo(@(data.top));
                    if(data.bottom) make.bottom.equalTo(@(data.bottom));
                    make.height.equalTo(@(data.height));
                }
                /// 纵向拉伸以均分
                if(data.axisType == MASAxisTypeVertical){
                    if(data.left) make.left.equalTo(@(data.left));
                    if(data.right) make.right.equalTo(@(data.right));
                    make.width.equalTo(@(data.width));
                }
            }];
        }return self;
    };
}
/// 数组取值（无法关联数组的泛型）
-(JobsRetIDByUIntegerBlock _Nonnull)objectAt{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger data){
        @jobs_strongify(self)
        return [self objectAtIndex:data];
    };
}
/// 数组里面是否包含某个元素
-(JobsRetBOOLByIDBlock _Nonnull)containsObject{
    @jobs_weakify(self)
    return ^BOOL(id _Nullable data) {
        @jobs_strongify(self)
        if(!data) return NO;
        return [self containsObject:data];
    };
}

@end

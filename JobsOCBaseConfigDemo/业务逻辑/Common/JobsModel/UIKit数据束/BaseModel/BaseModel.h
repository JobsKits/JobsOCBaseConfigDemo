//
//  BaseModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#ifndef BaseModel_h
#define BaseModel_h

#import <Foundation/Foundation.h>

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#import "JobsClass.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject
<
NSCoding,// 编码
NSSecureCoding// 解码
>
#pragma mark —— MJExtension
+(__kindof NSDictionary *)mj_replacedKeyFromPropertyName;
#pragma mark —— YYModel
+(__kindof NSDictionary *)modelCustomPropertyMapper;

@end

NS_ASSUME_NONNULL_END

/*
     常用的解析方法:

     1、NSMutableArray *tags = [VideoTagModel mj_objectArrayWithKeyValuesArray:model.data]; //【对待data是数组】
     2、DDMyVipModel *myVipModel = [DDMyVipModel mj_objectWithKeyValues:data]; //【对待data是字典】
 */

/**
     例子：如果遇到【总数据Data】里面是数组,数组里面各种模型数组互相嵌套,如下所示👇

     Data = {
         msg = "success";
         data = (
             {
                 notes = "至尊永久卡，可传辈";
                 vipLevel = 4;
                 originalPrice = 29900;
                 price = 5000;
                 sid = "1";
                 seniorDetail = (
                     {
                         name = "动态优先审核";
                         icon = "";
                         code = "isDynamicCheck";
                     }
                 );
                 duration = 0;
                 name = "永久卡【限时2折】";
                 icon = "";
             }
         );
         code = 200;
     }

     设立model的时候需要把外层的 msg、code、data 一起解析

     具体的model为

     @interface DDMyVipModel : NSObject

     Prop_copy()NSString *msg;
     Prop_strong()NSArray <DDMyVipListModel *>*data;
     Prop_copy()NSString *code;

     @end

     具体代码为：[DDMyVipModel mj_objectWithKeyValues:Data];

 **/

#endif /* BaseModel_h */

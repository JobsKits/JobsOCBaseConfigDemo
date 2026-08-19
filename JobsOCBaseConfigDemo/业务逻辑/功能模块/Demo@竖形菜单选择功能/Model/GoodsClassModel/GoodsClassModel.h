//
//  GoodsClassModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GoodsClassModel : BaseModel <AppToolsProtocol,BaseButtonProtocol>

Prop_copy()NSString *idField;
Prop_copy()NSString *pid;
Prop_copy()NSString *name;
Prop_copy()NSString *level;
Prop_copy()NSString *indexs;
Prop_copy()NSString *iconUrl;
Prop_copy()NSString *showUrl;
Prop_copy()NSString *productUrl;
Prop_strong()NSMutableArray <GoodsClassModel *>*childrenList;

-(JobsRetGoodsClassModelByStrBlock _Nonnull)byIdField;
-(JobsRetGoodsClassModelByStrBlock _Nonnull)byPid;
-(JobsRetGoodsClassModelByStrBlock _Nonnull)byName;
-(JobsRetGoodsClassModelByStrBlock _Nonnull)byLevel;
-(JobsRetGoodsClassModelByStrBlock _Nonnull)byIndexs;
-(JobsRetGoodsClassModelByStrBlock _Nonnull)byIconUrl;
-(JobsRetGoodsClassModelByStrBlock _Nonnull)byShowUrl;
-(JobsRetGoodsClassModelByStrBlock _Nonnull)byProductUrl;
-(JobsRetGoodsClassModelByMutArrBlock _Nonnull)byChildrenList;
-(JobsRetGoodsClassModelByBOOLBlock _Nonnull)byJobsSelected;
-(JobsRetGoodsClassModelByImageBlock _Nonnull)byBgImage;
-(JobsRetGoodsClassModelByStrBlock _Nonnull)byTitle;
-(JobsRetGoodsClassModelByURLBlock _Nonnull)byImageUrl;
-(JobsRetGoodsClassModelByStrBlock _Nonnull)byText;
-(JobsRetGoodsClassModelByImageBlock _Nonnull)byImage;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof GoodsClassModel *_Nonnull jobsMakeGoodsClassModel(jobsByGoodsClassModelBlock _Nonnull block){
    GoodsClassModel *data = GoodsClassModel.alloc.init;
    if (block) block(data);
    return data;
}

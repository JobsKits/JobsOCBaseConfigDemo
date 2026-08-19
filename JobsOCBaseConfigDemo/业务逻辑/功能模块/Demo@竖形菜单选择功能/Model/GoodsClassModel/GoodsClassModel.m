//
//  GoodsClassModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "GoodsClassModel.h"

@implementation GoodsClassModel
#define JOBS_GOODS_CLASS_STRING_DSL(_selector_, _property_) \
-(JobsRetGoodsClassModelByStrBlock _Nonnull)_selector_{ \
    @jobs_weakify(self) \
    return ^__kindof GoodsClassModel *_Nullable(NSString *_Nullable data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JOBS_GOODS_CLASS_STRING_DSL(byIdField, idField)
JOBS_GOODS_CLASS_STRING_DSL(byPid, pid)
JOBS_GOODS_CLASS_STRING_DSL(byName, name)
JOBS_GOODS_CLASS_STRING_DSL(byLevel, level)
JOBS_GOODS_CLASS_STRING_DSL(byIndexs, indexs)
JOBS_GOODS_CLASS_STRING_DSL(byIconUrl, iconUrl)
JOBS_GOODS_CLASS_STRING_DSL(byShowUrl, showUrl)
JOBS_GOODS_CLASS_STRING_DSL(byProductUrl, productUrl)

#undef JOBS_GOODS_CLASS_STRING_DSL

-(JobsRetGoodsClassModelByMutArrBlock _Nonnull)byChildrenList{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(NSMutableArray<GoodsClassModel *> *_Nullable data){
        @jobs_strongify(self)
        self.childrenList = data;
        return self;
    };
}

-(JobsRetGoodsClassModelByBOOLBlock _Nonnull)byJobsSelected{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.jobsSelected = data;
        return self;
    };
}

-(JobsRetGoodsClassModelByImageBlock _Nonnull)byBgImage{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.bgImage = data;
        return self;
    };
}

-(JobsRetGoodsClassModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetGoodsClassModelByURLBlock _Nonnull)byImageUrl{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(NSURL *_Nullable data){
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(JobsRetGoodsClassModelByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetGoodsClassModelByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

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

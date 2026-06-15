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

-(JobsRetDecorationModelByClsBlock _Nonnull)byCls{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel * (Class _Nullable cls) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.cls = cls;
        return self;
    };
}

-(JobsRetDecorationModelByStringBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel * (NSString * _Nullable title) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.title = title;
        return self;
    };
}

-(JobsRetDecorationModelByStringBlock _Nonnull)bySubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel * (NSString * _Nullable subTitle) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.subTitle = subTitle;
        return self;
    };
}

-(JobsRetDecorationModelByIDBlock _Nonnull)byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel * (id _Nullable requestParams) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.requestParams = requestParams;
        return self;
    };
}

@end

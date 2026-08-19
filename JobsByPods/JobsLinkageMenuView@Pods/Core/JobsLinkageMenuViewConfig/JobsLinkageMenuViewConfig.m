//
//  JobsLinkageMenuViewConfig.m
//  JobsLinkageMenuView
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsLinkageMenuViewConfig.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsLinkageMenuViewConfig
@interface JobsLinkageMenuViewConfig (JobsPropertyDSLSetterAutogen_d8013ec2b7)
-(void)setANIMATION_TIME:(CGFloat)data;
-(void)setBOTTOMVIEW_HEIGHT:(CGFloat)data;
-(void)setBOTTOMVIEW_WIDTH:(CGFloat)data;
-(void)setCONTENT_WIDTH:(CGFloat)data;
-(void)setDEFAULT_MENU_ITEM_HEIGHT:(CGFloat)data;
-(void)setLINEVIEW_WIDTH:(CGFloat)data;
-(void)setMENU_ITEM_CORNER_RADIUS:(CGFloat)data;
-(void)setMENU_ITEM_HEIGHT_MAP:(NSDictionary<NSNumber *, NSNumber *> * _Nullable)data;
-(void)setMENU_RATIO:(CGFloat)data;
-(void)setMENU_WIDTH:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsLinkageMenuViewConfig

@implementation JobsLinkageMenuViewConfig
-(instancetype)init{
    if (self = [super init]) {
        _MENU_ITEM_CORNER_RADIUS = JobsWidth(8);
        _CLEAR_CONTENT_WHEN_MISSING = YES;
    };return self;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsLinkageMenuViewConfig
-(JobsRetJobsLinkageMenuViewConfigByCGFloatBlock _Nonnull)byANIMATION_TIME{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setANIMATION_TIME:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewConfigByCGFloatBlock _Nonnull)byBOTTOMVIEW_HEIGHT{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBOTTOMVIEW_HEIGHT:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewConfigByCGFloatBlock _Nonnull)byBOTTOMVIEW_WIDTH{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBOTTOMVIEW_WIDTH:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewConfigByCGFloatBlock _Nonnull)byCONTENT_WIDTH{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setCONTENT_WIDTH:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewConfigByCGFloatBlock _Nonnull)byDEFAULT_MENU_ITEM_HEIGHT{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setDEFAULT_MENU_ITEM_HEIGHT:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewConfigByCGFloatBlock _Nonnull)byLINEVIEW_WIDTH{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setLINEVIEW_WIDTH:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewConfigByCGFloatBlock _Nonnull)byMENU_ITEM_CORNER_RADIUS{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setMENU_ITEM_CORNER_RADIUS:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewConfigByCGFloatBlock _Nonnull)byMENU_RATIO{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setMENU_RATIO:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewConfigByCGFloatBlock _Nonnull)byMENU_WIDTH{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setMENU_WIDTH:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewConfigByNSDictionaryNSNumberNSNumberBlock _Nonnull)byMENU_ITEM_HEIGHT_MAP{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuViewConfig * _Nullable(NSDictionary<NSNumber *, NSNumber *> * _Nullable data){
        @jobs_strongify(self)
        [self setMENU_ITEM_HEIGHT_MAP:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsLinkageMenuViewConfig
@end

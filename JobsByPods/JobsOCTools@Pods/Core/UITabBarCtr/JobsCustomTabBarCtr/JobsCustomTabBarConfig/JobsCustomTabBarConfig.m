//
//  JobsCustomTabBarConfig.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCustomTabBarConfig.h"

@interface JobsCustomTabBarConfig ()

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsCustomTabBarConfig
@interface JobsCustomTabBarConfig (JobsPropertyDSLSetterAutogen_78b59b750b)
-(void)setTabBarBackgroundColor:(UIColor * _Nullable)data;
-(void)setTabBarBackgroundImage:(UIImage * _Nullable)data;
-(void)setTabBarHeight:(CGFloat)data;
-(void)setTabBarItemYOffsets:(NSMutableArray <__kindof NSNumber *>* _Nullable)data;
-(void)setTabBarItems:(NSMutableArray <__kindof UIButton *>* _Nullable)data;
-(void)setTabBarWidth:(CGFloat)data;
-(void)setViewControllers:(NSMutableArray <__kindof UIViewController *>* _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsCustomTabBarConfig

@implementation JobsCustomTabBarConfig
BaseButtonProtocol_synthesize
BaseProtocol_synthesize
static JobsCustomTabBarConfig *JobsCustomTabBarConfigInstance = nil;
static dispatch_once_t JobsCustomTabBarConfigOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsCustomTabBarConfig.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&JobsCustomTabBarConfigOnceToken, ^{
            if(!JobsCustomTabBarConfigInstance){
                JobsCustomTabBarConfigInstance = [super allocWithZone:NULL].init;
            }
        });return JobsCustomTabBarConfigInstance;
    };
}
/// 单例的销毁
+(jobsByVoidBlock _Nonnull)destroyInstance {
    return ^{
        JobsCustomTabBarConfigOnceToken = 0;
        JobsCustomTabBarConfigInstance = nil;
    };
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone {
    dispatch_once(&JobsCustomTabBarConfigOnceToken, ^{
        JobsCustomTabBarConfigInstance = [super allocWithZone:zone];
    });return JobsCustomTabBarConfigInstance;
}
/// 防止外部调用copy
-(instancetype)copyWithZone:(NSZone *)zone {
    return self;
}
/// 防止外部调用mutableCopy
-(instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

-(CGFloat)tabBarHeight{
    if (!_tabBarHeight) {
        _tabBarHeight = JobsTabBarHeightByBottomSafeArea(nil);
    };return _tabBarHeight;
}

-(NSMutableArray<__kindof NSNumber *> *)tabBarItemYOffsets{
    if(!_tabBarItemYOffsets){
        @jobs_weakify(self)
        _tabBarItemYOffsets = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            @jobs_strongify(self)
            for (int d = 0; d < self.tabBarItems.count; d++) {
                arr.add(@(0));
            }
        });
    };return _tabBarItemYOffsets;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsCustomTabBarConfig
-(JobsRetJobsCustomTabBarConfigByCGFloatBlock _Nonnull)byTabBarHeight{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setTabBarHeight:data];
        return self;
    };
}

-(JobsRetJobsCustomTabBarConfigByCGFloatBlock _Nonnull)byTabBarWidth{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarConfig * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setTabBarWidth:data];
        return self;
    };
}

-(JobsRetJobsCustomTabBarConfigByNSMutableArrayNSNumberBlock _Nonnull)byTabBarItemYOffsets{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarConfig * _Nullable(NSMutableArray <__kindof NSNumber *>* _Nullable data){
        @jobs_strongify(self)
        [self setTabBarItemYOffsets:data];
        return self;
    };
}

-(JobsRetJobsCustomTabBarConfigByNSMutableArrayUIButtonBlock _Nonnull)byTabBarItems{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarConfig * _Nullable(NSMutableArray <__kindof UIButton *>* _Nullable data){
        @jobs_strongify(self)
        [self setTabBarItems:data];
        return self;
    };
}

-(JobsRetJobsCustomTabBarConfigByNSMutableArrayUIViewControllerBlock _Nonnull)byViewControllers{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarConfig * _Nullable(NSMutableArray <__kindof UIViewController *>* _Nullable data){
        @jobs_strongify(self)
        [self setViewControllers:data];
        return self;
    };
}

-(JobsRetJobsCustomTabBarConfigByUIColorBlock _Nonnull)byTabBarBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarConfig * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setTabBarBackgroundColor:data];
        return self;
    };
}

-(JobsRetJobsCustomTabBarConfigByUIImageBlock _Nonnull)byTabBarBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarConfig * _Nullable(UIImage * _Nullable data){
        @jobs_strongify(self)
        [self setTabBarBackgroundImage:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsCustomTabBarConfig
@end

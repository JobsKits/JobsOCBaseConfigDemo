//
//  JobsScrollYView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsScrollYView.h"

@interface JobsScrollYView ()
<
UILocationProtocol
>

Prop_assign()CGPoint initialTouchPoint;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsScrollYView
@interface JobsScrollYView (JobsPropertyDSLSetterAutogen_fec7080685)
-(void)setInitialTouchPoint:(CGPoint)data;
-(void)setSizer:(CGSize)data;
-(void)setX:(CGFloat)data;
-(void)setY:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsScrollYView

@implementation JobsScrollYView
UILocationProtocol_synthesize
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsScrollYView.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_scrollYViewOnceToken = 0;
        static_scrollYView = nil;
    };
}

static JobsScrollYView *static_scrollYView = nil;
static dispatch_once_t static_scrollYViewOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsScrollYView.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_scrollYViewOnceToken, ^{
            static_scrollYView = JobsScrollYView.new;
        });return static_scrollYView;
    };
}
#pragma mark —— 系统初始化方法
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        @jobs_weakify(self)
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                JobsLog(@"SSS = %d",b.boolValue);
            }JobsLog(@"通知传递过来的 = %@",notification.object);
        }];
    };return self;
}

-(void)awakeFromNib{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScrollYView.class, @selector(jobsAwakeFromNib)))(self, @selector(jobsAwakeFromNib));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsAwakeFromNib{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super awakeFromNib];
    };
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScrollYView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScrollYView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
        self.setupGesture();
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
    };
}
#pragma mark —— 一些私有方法
- (jobsByVoidBlock _Nonnull)setupGesture {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byUserInteractionEnabled(YES);
        self.byWeak_target(self);
        @jobs_weakify(self)
        self.panGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id _Nullable weakSelf,
                                                                           UIPanGestureRecognizer *_Nullable sender) {
            @jobs_strongify(self)
            CGPoint translation = [sender translationInView:self.superview];
            self.byJobsPoint(translation);
            if (sender.state == UIGestureRecognizerStateBegan) {
                self.byInitialTouchPoint(self.center);
            }
            if (sender.state == UIGestureRecognizerStateChanged) {
                CGFloat maxH = JobsMainScreen_HEIGHT() / 2 + 初始位置;
                CGFloat minH = JobsMainScreen_HEIGHT() / 2 + 终点位置;
                // 计算新的位置
                CGFloat newY = self.initialTouchPoint.y + translation.y;
                // 限制在 minY 和 maxY 之间
                newY = MAX(minH, newY);
                newY = MIN(maxH, newY);
                self.byCenterPoint(CGPointMake(self.initialTouchPoint.x, newY));
            }
            if (sender.state == UIGestureRecognizerStateEnded) {
                JobsLog(@"translation = %f",translation.y);// 向上为负、向下为正
                JobsLog(@"fdfd = %f",self.center.y);//541.333328 703.666672
                // 在手势结束时，检查视图的位置并执行你想要的操作
                if(self.objBlock) self.objBlock(self);
            };return nil;
        });self.panGR.enabled = YES;
    };
}
#pragma mark —— lazyLoad

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsScrollYView
-(JobsRetJobsScrollYViewByCGFloatBlock _Nonnull)byX{
    @jobs_weakify(self)
    return ^__kindof JobsScrollYView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setX:data];
        return self;
    };
}

-(JobsRetJobsScrollYViewByCGFloatBlock _Nonnull)byY{
    @jobs_weakify(self)
    return ^__kindof JobsScrollYView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setY:data];
        return self;
    };
}

-(JobsRetJobsScrollYViewByCGPointBlock _Nonnull)byInitialTouchPoint{
    @jobs_weakify(self)
    return ^__kindof JobsScrollYView * _Nullable(CGPoint data){
        @jobs_strongify(self)
        [self setInitialTouchPoint:data];
        return self;
    };
}

-(JobsRetJobsScrollYViewByCGSizeBlock _Nonnull)bySizer{
    @jobs_weakify(self)
    return ^__kindof JobsScrollYView * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setSizer:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsScrollYView
@end

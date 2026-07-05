//
//  UIView+DSL.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+DSL.h"

JobsKey(JobsUIViewLayoutSubviewsRectCornerKey)
JobsKey(JobsUIViewLayoutSubviewsRectCornerSizeKey)
@implementation UIView (DSL)
#pragma mark —— Geometry
-(JobsRetViewByFrameBlock _Nonnull)byFrame{
    @jobs_weakify(self)
    return ^__kindof UIView * (CGRect frame){
        @jobs_strongify(self)
        self.frame = frame;
        return self;
    };
}

-(JobsRetViewByFrameBlock _Nonnull)byBounds{
    @jobs_weakify(self)
    return ^__kindof UIView * (CGRect bounds){
        @jobs_strongify(self)
        self.bounds = bounds;
        return self;
    };
}

-(JobsRetViewByCGPointBlock _Nonnull)byCenterPoint{
    @jobs_weakify(self)
    return ^__kindof UIView * (CGPoint pt){
        @jobs_strongify(self)
        self.center = pt;
        return self;
    };
}

-(JobsRetViewByCGAffineTransformBlock _Nonnull)byTransform{
    @jobs_weakify(self)
    return ^__kindof UIView * (CGAffineTransform t){
        @jobs_strongify(self)
        self.transform = t;
        return self;
    };
}

-(JobsRetViewByCATransform3DBlock _Nonnull)byTransform3D{
    @jobs_weakify(self)
    return ^__kindof UIView * (CATransform3D t3d){
        @jobs_strongify(self)
        self.transform3D = t3d;
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byContentScaleFactor{
    @jobs_weakify(self)
    return ^__kindof UIView * (CGFloat scale){
        @jobs_strongify(self)
        self.contentScaleFactor = scale;
        return self;
    };
}

-(JobsRetViewByCGPointBlock _Nonnull)byAnchorPoint{
    @jobs_weakify(self)
    return ^__kindof UIView * (CGPoint pt){
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)){
            self.anchorPoint = pt;
        };return self;
    };
}
#pragma mark —— Identity
-(JobsRetViewByNSIntegerBlock _Nonnull)byTag{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSInteger tag){
        @jobs_strongify(self)
        self.tag = tag;
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byUserInteractionEnabled{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL enabled){
        @jobs_strongify(self)
        self.userInteractionEnabled = enabled;
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byMultipleTouchEnabled{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on){
        @jobs_strongify(self)
        self.multipleTouchEnabled = on;
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byExclusiveTouch{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on){
        @jobs_strongify(self)
        self.exclusiveTouch = on;
        return self;
    };
}
#pragma mark —— Rendering
-(JobsRetViewByJobsByViewBlock _Nonnull)byViewBlock{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByViewBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self);
        return self;
    };
}

-(UIRectCorner)layoutSubviewsRectCorner{
    NSNumber *number = Jobs_getAssociatedObject(JobsUIViewLayoutSubviewsRectCornerKey);
    return number ? (UIRectCorner)number.unsignedIntegerValue : 0;
}

-(void)setLayoutSubviewsRectCorner:(UIRectCorner)layoutSubviewsRectCorner{
    Jobs_setAssociatedRETAIN_NONATOMIC(JobsUIViewLayoutSubviewsRectCornerKey, @(layoutSubviewsRectCorner))
}

-(CGSize)layoutSubviewsRectCornerSize{
    NSValue *value = Jobs_getAssociatedObject(JobsUIViewLayoutSubviewsRectCornerSizeKey);
    return value ? value.CGSizeValue : CGSizeZero;
}

-(void)setLayoutSubviewsRectCornerSize:(CGSize)layoutSubviewsRectCornerSize{
    Jobs_setAssociatedRETAIN_NONATOMIC(JobsUIViewLayoutSubviewsRectCornerSizeKey, [NSValue valueWithCGSize:layoutSubviewsRectCornerSize])
}

-(JobsRetViewByUIRectCornerBlock _Nonnull)byLayoutSubviewsRectCorner{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIRectCorner data){
        @jobs_strongify(self)
        self.layoutSubviewsRectCorner = data;
        return self;
    };
}

-(JobsRetViewByCGSizeBlock _Nonnull)byLayoutSubviewsRectCornerSize{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.layoutSubviewsRectCornerSize = data;
        return self;
    };
}

-(JobsRetViewByLayerBlock _Nonnull)byLayer{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByCALayerBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self.layer);
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UIView * (CGFloat radius){
        @jobs_strongify(self)
        self.layer.cornerRadius = radius;
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byClipsToBounds{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on){
        @jobs_strongify(self)
        self.clipsToBounds = on;
        return self;
    };
}

-(JobsRetViewByCorBlock _Nonnull)byBgColor{
    @jobs_weakify(self)
    return ^__kindof UIView * (UIColor * _Nullable color){
        @jobs_strongify(self)
        self.backgroundColor = color;
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof UIView * (CGFloat a){
        @jobs_strongify(self)
        self.alpha = a;
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL opaque){
        @jobs_strongify(self)
        self.opaque = opaque;
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byClearsContextBeforeDrawing{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on){
        @jobs_strongify(self)
        self.clearsContextBeforeDrawing = on;
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byHidden{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL hidden){
        @jobs_strongify(self)
        self.hidden = hidden;
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byJobsVisible{
    @jobs_weakify(self)
    return ^__kindof UIView * (CGFloat jobsVisible){
        @jobs_strongify(self)
        SEL selector = @selector(setJobsVisible:);
        if ([self respondsToSelector:selector]) {
            ((void (*)(id, SEL, CGFloat))objc_msgSend)(self, selector, jobsVisible);
        } else {
            self.hidden = !jobsVisible;
            self.alpha = jobsVisible;
        };return self;
    };
}

-(JobsRetViewByNSIntegerBlock _Nonnull)byContentMode{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSInteger mode){
        @jobs_strongify(self)
        self.contentMode = (UIViewContentMode)mode;
        return self;
    };
}

-(JobsRetViewByViewBlock _Nonnull)byMaskView{
    @jobs_weakify(self)
    return ^__kindof UIView * (UIView * _Nullable maskView){
        @jobs_strongify(self)
        self.maskView = maskView;
        return self;
    };
}

-(JobsRetViewByCorBlock _Nonnull)byTintColor{
    @jobs_weakify(self)
    return ^__kindof UIView * (UIColor * _Nullable color){
        @jobs_strongify(self)
        self.tintColor = color;
        return self;
    };
}

-(JobsRetViewByNSIntegerBlock _Nonnull)byTintAdjustmentMode{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSInteger mode){
        @jobs_strongify(self)
        self.tintAdjustmentMode = (UIViewTintAdjustmentMode)mode;
        return self;
    };
}
#pragma mark —— Semantics / RTL
-(JobsRetViewByNSIntegerBlock _Nonnull)bySemanticContentAttribute{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSInteger attr){
        @jobs_strongify(self)
        self.semanticContentAttribute = (UISemanticContentAttribute)attr;
        return self;
    };
}
#pragma mark —— Layout behaviors
-(JobsRetViewByBOOLBlock _Nonnull)byAutoresizesSubviews{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on){
        @jobs_strongify(self)
        self.autoresizesSubviews = on;
        return self;
    };
}

-(JobsRetViewByNSUIntegerBlock _Nonnull)byAutoresizingMask{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSUInteger mask){
        @jobs_strongify(self)
        self.autoresizingMask = (UIViewAutoresizing)mask;
        return self;
    };
}

-(JobsRetViewByUIEdgeInsetBlock _Nonnull)byLayoutMargins{
    @jobs_weakify(self)
    return ^__kindof UIView * (UIEdgeInsets insets){
        @jobs_strongify(self)
        if (@available(iOS 8.0, *)){
            self.layoutMargins = insets;
        };return self;
    };
}

-(JobsRetViewByNSDirectionalEdgeInsetsBlock _Nonnull)byDirectionalLayoutMargins{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSDirectionalEdgeInsets insets){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            self.directionalLayoutMargins = insets;
        };return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byPreservesSuperviewLayoutMargins{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on){
        @jobs_strongify(self)
        if (@available(iOS 8.0, *)){
            self.preservesSuperviewLayoutMargins = on;
        };return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byInsetsLayoutMarginsFromSafeArea{
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            self.insetsLayoutMarginsFromSafeArea = on;
        };return self;
    };
}
#pragma mark —— UIUserInterfaceStyle
-(JobsRetViewByUIUserInterfaceStyleBlock _Nonnull)byOverrideUserInterfaceStyle{
    @jobs_weakify(self)
    return ^__kindof UIView * (UIUserInterfaceStyle style){
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)){
            self.overrideUserInterfaceStyle = style;
        };return self;
    };
}
#pragma mark —— Dynamic Type limits
-(JobsRetViewByStringBlock _Nonnull)byMinimumContentSizeCategory{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSString * _Nullable category){
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)){
            self.minimumContentSizeCategory = category;
        };return self;
    };
}

-(JobsRetViewByStringBlock _Nonnull)byMaximumContentSizeCategory{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSString * _Nullable category){
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)){
            self.maximumContentSizeCategory = category;
        };return self;
    };
}
#pragma mark —— Focus
-(JobsRetViewByStringBlock _Nonnull)byFocusGroupIdentifier{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSString * _Nullable ident){
        @jobs_strongify(self)
        if (@available(iOS 14.0, *)){
            self.focusGroupIdentifier = ident;
        };return self;
    };
}

-(JobsRetViewByNSIntegerBlock _Nonnull)byFocusGroupPriority{
    @jobs_weakify(self)
    return ^__kindof UIView * (NSInteger p){
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)){
            self.focusGroupPriority = (UIFocusGroupPriority)p;
        };return self;
    };
}

-(JobsRetViewByIDBlock _Nonnull)byFocusEffect{
    @jobs_weakify(self)
    return ^__kindof UIView * (id _Nullable effect /* UIFocusEffect * */){
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)){
            self.focusEffect = (UIFocusEffect *)effect;
        };return self;
    };
}
#pragma mark —— iOS 26+ CornerConfiguration
#if defined(__IPHONE_26_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_26_0)
-(JobsRetViewByCornerConfigBlock _Nonnull)byCornerConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIView * (UICornerConfiguration * _Nullable cfg){
        @jobs_strongify(self)
        if (@available(iOS 26.0, tvOS 26.0, visionOS 1.0, *)){
            self.cornerConfiguration = cfg;
        };return self;
    };
}
#endif

#pragma mark —— Single-parameter / no-parameter methods
/// 对 UIKit API addSubview 的二次封装：附着在父视图上
-(JobsRetViewByViewBlock _Nonnull)addOn{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable superView) {
        @jobs_strongify(self)
        if (superView) [superView addSubview:self];
        return self;
    };
}
/// 对 UIKit API addSubview 的二次封装：加入子视图
-(JobsRetViewByViewBlock _Nonnull)addBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIView *_Nullable subView){
        @jobs_strongify(self)
        if (subView) [self addSubview:subView];
        return self;
    };
}
/// 对 UIKit API bringSubviewToFront 的二次封装
-(JobsRetViewByViewBlock _Nonnull)byBringSubviewToFront{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        if (subView)  [self bringSubviewToFront:subView];
        return subView;
    };
}
/// 对 UIKit API sendSubviewToBack 的二次封装
-(JobsRetViewByViewBlock _Nonnull)bySendSubviewToBack{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        if (subView)  [self sendSubviewToBack:subView];
        return subView;
    };
}
/// 对 UIKit API removeFromSuperview 的二次封装
-(JobsRetViewByVoidBlock _Nonnull)byRemove{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        [self removeFromSuperview];
        return self;
    };
}

-(JobsRetViewByGestureRecognizer _Nonnull)byAddGestureRecognizer{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIGestureRecognizer *_Nullable data){
        @jobs_strongify(self)
        if (data) [self addGestureRecognizer:data];
        return self;
    };
}

-(JobsRetViewByGestureRecognizer _Nonnull)byRemoveGestureRecognizer{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIGestureRecognizer *_Nullable data){
        @jobs_strongify(self)
        if (data) [self removeGestureRecognizer:data];
        return self;
    };
}

-(JobsRetViewByInteractionBlock _Nonnull)byAddInteraction{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(id<UIInteraction> _Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            if (data) [self addInteraction:data];
        };return self;
    };
}

-(JobsRetViewByInteractionBlock _Nonnull)byRemoveInteraction{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(id<UIInteraction> _Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            if (data) [self removeInteraction:data];
        };return self;
    };
}

-(JobsRetViewByFrameBlock _Nonnull)bySetNeedsDisplayInRect{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGRect data){
        @jobs_strongify(self)
        [self setNeedsDisplayInRect:data];
        return self;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)byRemoveFromSuperview{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void){
        @jobs_strongify(self)
        [self removeFromSuperview];
        return self;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)bySetNeedsDisplay{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void){
        @jobs_strongify(self)
        [self setNeedsDisplay];
        return self;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)bySetNeedsLayout{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void){
        @jobs_strongify(self)
        [self setNeedsLayout];
        return self;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)byLayoutIfNeeded{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void){
        @jobs_strongify(self)
        [self layoutIfNeeded];
        return self;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)bySizeToFit{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void){
        @jobs_strongify(self)
        [self sizeToFit];
        return self;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)bySetNeedsUpdateConstraints{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void){
        @jobs_strongify(self)
        [self setNeedsUpdateConstraints];
        return self;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)byUpdateConstraintsIfNeeded{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void){
        @jobs_strongify(self)
        [self updateConstraintsIfNeeded];
        return self;
    };
}

#pragma mark —— UIView+Measure migrated geometry / layout DSL
#pragma mark —— 初始化方法封装
+(JobsRetViewByClassBlock _Nonnull)build{
    return ^__kindof UIView *_Nullable(Class _Nonnull cls){
        __kindof UIView *instance = cls.new;
        return instance;
    };
}
#pragma mark —— 控件居中的时候，相对于全屏的X和Y值
/// 当控件相对于view居中的时候，控件的X值
-(JobsRetCGFloatByViewBlock _Nonnull)xWhenViewInViewCenter{
    @jobs_weakify(self)
    return ^CGFloat(UIView *_Nullable view){
        @jobs_strongify(self)
        return (view.width - self.width) / 2;
    };
}
/// 当控件相对于view居中的时候，控件的Y值
-(JobsRetCGFloatByViewBlock _Nonnull)yWhenViewInViewCenter{
    @jobs_weakify(self)
    return ^CGFloat(UIView *_Nullable view){
        @jobs_strongify(self)
        return (view.height - self.height) / 2;
    };
}
/// 当控件相对于一个特定的值居中的时候，控件的X值
-(JobsRetCGFloatByCGFloatBlock _Nonnull)xWhenViewInViewCenterBy{
    @jobs_weakify(self)
    return ^CGFloat(CGFloat data){
        @jobs_strongify(self)
        return (data - self.width) / 2;
    };
}
/// 当控件相对于一个特定的值居中的时候，控件的Y值
-(JobsRetCGFloatByCGFloatBlock _Nonnull)yWhenViewInViewCenterBy{
    @jobs_weakify(self)
    return ^CGFloat(CGFloat data){
        @jobs_strongify(self)
        return (data - self.height) / 2;
    };
}
/// 当控件相对于整个设备屏幕居中的时候，控件的X值
-(JobsRetCGFloatByVoidBlock _Nonnull)xWhenViewInScreenCenter{
    @jobs_weakify(self)
    return ^CGFloat(){
        @jobs_strongify(self)
        return self.xWhenViewInViewCenterBy(JobsMainScreen_WIDTH());
    };
}
/// 当控件相对于整个设备屏幕居中的时候，控件的Y值
-(JobsRetCGFloatByVoidBlock _Nonnull)yWhenViewInScreenCenter{
    @jobs_weakify(self)
    return ^CGFloat(){
        @jobs_strongify(self)
        return self.yWhenViewInViewCenterBy(JobsMainScreen_HEIGHT());
    };
}
#pragma mark —— 刷新UI
-(JobsRetViewByVoidBlock _Nonnull)jobsRefreshUI{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self setNeedsLayout];
        [self layoutIfNeeded];
        return self;
    };
}
#pragma mark —— 交换宽高
-(JobsRetFrameByVoidBlock _Nonnull)exchangeWidthAndHeight{
    @jobs_weakify(self)
    return ^CGRect(){
        @jobs_strongify(self)
        return CGRectMake(self.x,
                          self.y,
                          self.height,
                          self.width);
    };
}
#pragma mark —— 交换 X 和 Y
-(JobsRetFrameByVoidBlock _Nonnull)exchangeXAndY{
    @jobs_weakify(self)
    return ^CGRect(){
        @jobs_strongify(self)
        return CGRectMake(self.y,
                          self.x,
                          self.width,
                          self.height);
    };
}
#pragma mark —— 【类方法】设置控件的约束（返回控件自己本身）
+(JobsRetViewByCGSizeBlock _Nonnull)BySize{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGSize data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(bySize)]) {
            instance.bySize(data); // 确保视图有 bySize: 方法
        };return instance;
    };
}
/// 设置控件的 Frame
+(JobsRetViewByFrameBlock _Nonnull)ByFrame{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGRect data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byFrame)]) {
            instance.byFrame(data); // 确保视图有 bySize: 方法
        };return instance;
    };
}
/// 设置控件的 Origin
+(JobsRetViewByCGPointBlock _Nonnull)ByOrigin{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byOrigin)]) {
            instance.byOrigin(data);
        };return instance;
    };
}
/// 设置控件的 X
+(JobsRetViewByCGFloatBlock _Nonnull)ByX{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byX)]) {
            instance.byX(data);
        };return instance;
    };
}
/// 设置控件的 Y
+(JobsRetViewByCGFloatBlock _Nonnull)ByY{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byY)]) {
            instance.byY(data);
        };return instance;
    };
}
/// 设置控件的 Left，语义等同于 X
+(JobsRetViewByCGFloatBlock _Nonnull)ByLeft{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byLeft)]) {
            instance.byLeft(data);
        };return instance;
    };
}
/// 设置控件的 Right，语义为 X + Width
+(JobsRetViewByCGFloatBlock _Nonnull)ByRight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byRight)]) {
            instance.byRight(data);
        };return instance;
    };
}
/// 设置控件的 Top，语义等同于 Y
+(JobsRetViewByCGFloatBlock _Nonnull)ByTop{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byTop)]) {
            instance.byTop(data);
        };return instance;
    };
}
/// 设置控件的 Bottom，语义为 Y + Height
+(JobsRetViewByCGFloatBlock _Nonnull)ByBottom{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byBottom)]) {
            instance.byBottom(data);
        };return instance;
    };
}
/// 设置控件的 Width
+(JobsRetViewByFloatBlock _Nonnull)ByWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byWidth)]) {
            instance.byWidth(data); // 确保视图有 bySize: 方法
        };return instance;
    };
}
/// 设置控件的 Height
+(JobsRetViewByFloatBlock _Nonnull)ByHeight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byHeight)]) {
            instance.byHeight(data); // 确保视图有 bySize: 方法
        };return instance;
    };
}
/// 设置控件的 CenterX
+(JobsRetViewByCGFloatBlock _Nonnull)ByCenterX{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byCenterX)]) {
            instance.byCenterX(data);
        };return instance;
    };
}
/// 设置控件的 CenterY
+(JobsRetViewByCGFloatBlock _Nonnull)ByCenterY{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byCenterY)]) {
            instance.byCenterY(data);
        };return instance;
    };
}
/// 设置控件的 Center
+(JobsRetViewByCenterBlock _Nonnull)ByCenter{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat x,CGFloat y){
        @jobs_strongify(self)
        __kindof UIView *instance = [self new];
        if ([instance respondsToSelector:@selector(byCenter)]) {
            instance.byCenter(x,y); // 确保视图有 bySize: 方法
        };return instance;
    };
}
#pragma mark —— 【实例方法】设置控件的约束（返回控件自己本身）
/// 设置控件的 Size
-(JobsRetViewByCGSizeBlock _Nonnull)bySize{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.sizer = data;
        return self;
    };
}
/// 设置控件的 Origin
-(JobsRetViewByCGPointBlock _Nonnull)byOrigin{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        self.Origin = data;
        return self;
    };
}
/// 设置控件的 X
-(JobsRetViewByCGFloatBlock _Nonnull)byX{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.x = data;
        return self;
    };
}
/// 设置控件的 Y
-(JobsRetViewByCGFloatBlock _Nonnull)byY{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.y = data;
        return self;
    };
}
/// 设置控件的 Left，语义等同于 X
-(JobsRetViewByCGFloatBlock _Nonnull)byLeft{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.left = data;
        return self;
    };
}
/// 设置控件的 Right，语义为 X + Width
-(JobsRetViewByCGFloatBlock _Nonnull)byRight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.right = data;
        return self;
    };
}
/// 设置控件的 Top，语义等同于 Y
-(JobsRetViewByCGFloatBlock _Nonnull)byTop{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.top = data;
        return self;
    };
}
/// 设置控件的 Bottom，语义为 Y + Height
-(JobsRetViewByCGFloatBlock _Nonnull)byBottom{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.bottom = data;
        return self;
    };
}
/// 设置控件的 Width
-(JobsRetViewByFloatBlock _Nonnull)byWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float data){
        @jobs_strongify(self)
        self.width = data;
        return self;
    };
}
/// 设置控件的 Height
-(JobsRetViewByFloatBlock _Nonnull)byHeight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float data){
        @jobs_strongify(self)
        self.height = data;
        return self;
    };
}
/// 设置控件的 CenterX
-(JobsRetViewByCGFloatBlock _Nonnull)byCenterX{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.centerX = data;
        return self;
    };
}
/// 设置控件的 CenterY
-(JobsRetViewByCGFloatBlock _Nonnull)byCenterY{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.centerY = data;
        return self;
    };
}
/// 设置控件的 Center
-(JobsRetViewByCenterBlock _Nonnull)byCenter{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat x,CGFloat y){
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.x = x;
        center.y = y;
        self.center = center;
        return self;
    };
}
#pragma mark —— 重新设置控件的约束（返回控件的Frame）
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginX{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = data;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatAndUIViewBlock _Nonnull)resetRightX{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data,UIView *superView) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = superView.width - data - self.width;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginY{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y = data;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatAndUIViewBlock _Nonnull)resetBottomY{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data,UIView *superView) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y = superView.height - data - self.height;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidth{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width = data;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeight{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.height = data;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGPointBlock _Nonnull)resetOrigin{
    @jobs_weakify(self)
    return ^CGRect(CGPoint data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = data.x;
        frame.origin.y = data.y;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGSizeBlock _Nonnull)resetSize{
    @jobs_weakify(self)
    return ^CGRect(CGSize data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size = data;
        self.byFrame(frame);
        return self.frame;
    };
}
/// 依据偏移量重设Frame
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginXByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x += data;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginYByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y += data;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetCenterX{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.x = data;
        self.byCenterPoint(center);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetCenterY{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.y = data;
        self.byCenterPoint(center);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidthByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width += data;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeightByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.height += data;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGPointBlock _Nonnull)resetOriginByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGPoint data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x += data.x;
        frame.origin.y += data.y;
        self.byFrame(frame);
        return self.frame;
    };
}

-(JobsRetFrameByCGSizeBlock _Nonnull)resetSizeByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGSize data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width += data.width;
        frame.size.height += data.height;
        self.byFrame(frame);
        return self.frame;
    };
}
/// 设置水平方向对齐
-(JobsRetViewByViewBlock _Nonnull)centerxEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        if (self.superview == view) {
            self.centerX = view.width / 2.0;
        }else{
            self.centerX = view.centerX;
        };return self;
    };
}
/// 设置垂平方向对齐
-(JobsRetViewByViewBlock _Nonnull)centeryEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        if (self.superview == view) {
            self.centerY = view.height / 2.0;
        }else{
            self.centerY = view.centerY;
        };return self;
    };
}
/// 设置中心方向对齐
-(JobsRetViewByViewBlock _Nonnull)centerEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        if (self.superview == view) {
            self.center = CGPointMake(view.width / 2.0, view.height / 2.0);
        }else{
            self.center = view.center;
        };return self;
    };
}
/// 设置左对齐
-(JobsRetViewByViewBlock _Nonnull)leftEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        if (self.superview == view) {
            self.left = 0;
        }else{
            self.left = view.left;
        };return self;
    };
}
/// 设置右对齐
-(JobsRetViewByViewBlock _Nonnull)rightEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        if (self.superview == view) {
            self.right = view.width;
        }else{
            self.right = view.right;
        };return self;
    };
}
/// 设置顶部对齐
-(JobsRetViewByViewBlock _Nonnull)topEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        if (self.superview == view) {
            self.top = 0;
        }else{
            self.top = view.top;
        };return self;
    };
}
/// 设置底部对齐
-(JobsRetViewByViewBlock _Nonnull)bottomEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        if (self.superview == view) {
            self.bottom = view.height;
        }else{
            self.bottom = view.bottom;
        };return self;
    };
}
#pragma mark —— UIScrollView.contentSize
#pragma mark —— UIScrollView.contentOffset
#pragma mark —— UIScrollView.contentInset
-(CGFloat)maxX{
    return self.x + self.width;
}

-(CGFloat)maxY{
    return self.y + self.height;
}

-(void)setMaxXByShift:(CGFloat)maxX{
    self.x = maxX - self.width;
}

-(void)setMaxYByShift:(CGFloat)maxY{
    self.y = maxY - self.height;
}

-(void)setMaxXByStretch:(CGFloat)maxX{
    self.width = maxX - self.x;
}

-(void)setMaxYByStretch:(CGFloat)maxY{
    self.height = maxY - self.y;
}

-(CGPoint)boundCenter{
    return CGPointMake(self.bounds.size.width / 2,
                       self.bounds.size.height / 2);
}
/// 简捷获得控件坐标
#pragma mark —— Prop_assign()CGFloat x
@dynamic x;
- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
#pragma mark —— Prop_assign()CGFloat y
@dynamic y;
- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
#pragma mark —— Prop_assign()CGFloat width
@dynamic width;
- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
#pragma mark —— Prop_assign()CGFloat height
@dynamic height;
- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
#pragma mark —— Prop_assign()CGFloat centerX
@dynamic centerX;
- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
#pragma mark —— Prop_assign()CGFloat centerY
@dynamic centerY;
- (CGFloat)centerY{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
#pragma mark —— Prop_assign()CGFloat left
@dynamic left;
- (CGFloat)left{
    return self.x;
}

- (void)setLeft:(CGFloat)left{
    self.x = left;
}
#pragma mark —— Prop_assign()CGFloat right
@dynamic right;
- (CGFloat)right{
    return self.x + self.width;
}

- (void)setRight:(CGFloat)right{
    self.x = right - self.width;
}
#pragma mark —— Prop_assign()CGFloat top
@dynamic top;
-(CGFloat)top{
    return self.y;
}

-(void)setTop:(CGFloat)top{
    self.y = top;
}
#pragma mark —— Prop_assign()CGFloat bottom
@dynamic bottom;
-(CGFloat)bottom{
    return self.y + self.height;
}

-(void)setBottom:(CGFloat)bottom{
    self.y = bottom - self.height;
}
#pragma mark —— Prop_assign()CGSize sizer
@dynamic sizer;
-(CGSize)sizer{
    return self.frame.size;
}

-(void)setSizer:(CGSize)sizer{
    CGRect frame = self.frame;
    frame.size = sizer;
    self.frame = frame;
}
#pragma mark —— Prop_assign()CGPoint Origin
@dynamic Origin;
-(CGPoint)Origin{
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)Origin{
    CGRect frame = self.frame;
    frame.origin = Origin;
    self.frame = frame;
}

@end

//
//  JobsTheme.m
//  JobsOCDefs
//
//  Created by Jobs on 2026年7月29日，星期三.
//

#import "JobsTheme.h"

JobsThemeStyle const JobsThemeStyleLight = @"light";
JobsThemeStyle const JobsThemeStyleDark = @"dark";

JobsThemeColorKey const JobsThemeColorKeyBackgroundPrimary = @"background.primary";
JobsThemeColorKey const JobsThemeColorKeyBackgroundSecondary = @"background.secondary";
JobsThemeColorKey const JobsThemeColorKeyBackgroundTertiary = @"background.tertiary";
JobsThemeColorKey const JobsThemeColorKeyBackgroundGrouped = @"background.grouped";
JobsThemeColorKey const JobsThemeColorKeyBackgroundGroupedSecondary = @"background.grouped.secondary";
JobsThemeColorKey const JobsThemeColorKeyBackgroundGroupedTertiary = @"background.grouped.tertiary";
JobsThemeColorKey const JobsThemeColorKeyTextPrimary = @"text.primary";
JobsThemeColorKey const JobsThemeColorKeyTextSecondary = @"text.secondary";
JobsThemeColorKey const JobsThemeColorKeyTextTertiary = @"text.tertiary";
JobsThemeColorKey const JobsThemeColorKeyTextQuaternary = @"text.quaternary";
JobsThemeColorKey const JobsThemeColorKeyTextPlaceholder = @"text.placeholder";

JobsThemeImageKey const JobsThemeImageKeyThemeToggle = @"theme.toggle";
NSNotificationName const JobsThemeDidChangeNotification = @"JobsThemeDidChangeNotification";

static NSString *const JobsThemeDefaultsKey = @"JobsTheme.currentStyle";
static NSString *const JobsThemeErrorDomain = @"JobsThemeErrorDomain";
static const void *JobsThemeColorKeyAssociatedKey = &JobsThemeColorKeyAssociatedKey;
static const void *JobsThemeImageKeyAssociatedKey = &JobsThemeImageKeyAssociatedKey;

static void JobsThemeSwizzle(Class cls, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    if (!originalMethod || !swizzledMethod) return;
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

@interface JobsThemeCenter ()

@property(nonatomic, copy, readwrite) JobsThemeStyle currentStyle;
@property(nonatomic, strong) NSDictionary<NSString *, NSDictionary *> *themes;
@property(nonatomic, strong) NSBundle *resourceBundle;
@property(nonatomic, strong) NSMapTable<NSObject *, NSMutableDictionary<NSString *, JobsThemeBindingBlock> *> *bindings;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsThemeCenter
@interface JobsThemeCenter (JobsPropertyDSLSetterAutogen_7b23413d24)
-(void)setCurrentStyle:(JobsThemeStyle)data;
-(void)setResourceBundle:(NSBundle * _Nullable)data;
-(void)setThemes:(NSDictionary<NSString *, NSDictionary *> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsThemeCenter

@implementation JobsThemeCenter

+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JobsThemeSwizzle(UIView.class,
                         @selector(setBackgroundColor:),
                         @selector(jobsTheme_swizzled_setBackgroundColor:));
        JobsThemeSwizzle(UIView.class,
                         @selector(setTintColor:),
                         @selector(jobsTheme_swizzled_setTintColor:));
        JobsThemeSwizzle(UILabel.class,
                         @selector(setTextColor:),
                         @selector(jobsTheme_swizzled_setTextColor:));
        JobsThemeSwizzle(UITextField.class,
                         @selector(setTextColor:),
                         @selector(jobsTheme_swizzled_setTextColor:));
        JobsThemeSwizzle(UITextView.class,
                         @selector(setTextColor:),
                         @selector(jobsTheme_swizzled_setTextColor:));
        JobsThemeSwizzle(UIButton.class,
                         @selector(setTitleColor:forState:),
                         @selector(jobsTheme_setTitleColor:forState:));
        JobsThemeSwizzle(UIButton.class,
                         @selector(setImage:forState:),
                         @selector(jobsTheme_setImage:forState:));
        JobsThemeSwizzle(UIButton.class,
                         @selector(setBackgroundImage:forState:),
                         @selector(jobsTheme_setBackgroundImage:forState:));
        JobsThemeSwizzle(UIImageView.class,
                         @selector(setImage:),
                         @selector(jobsTheme_swizzled_setImage:));
    });
}

+(JobsThemeCenter *)shared {
    static JobsThemeCenter *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = JobsThemeCenter.new;
    });return instance;
}

-(instancetype)init {
    if (self = [super init]) {
        _currentStyle = JobsThemeStyleLight;
        _resourceBundle = NSBundle.mainBundle;
        _bindings = [NSMapTable weakToStrongObjectsMapTable];
    };return self;
}

-(BOOL)isDarkMode {
    return [self.currentStyle isEqualToString:JobsThemeStyleDark];
}

-(BOOL)configureWithResource:(NSString *)name
               fileExtension:(NSString *)fileExtension
                      bundle:(NSBundle *)bundle
                       error:(NSError **)error {
    NSString *path = [bundle pathForResource:name ofType:fileExtension];
    if (!path.length) {
        if (error) {
            *error = [NSError errorWithDomain:JobsThemeErrorDomain
                                         code:1
                                     userInfo:@{NSLocalizedDescriptionKey:
                                                    [NSString stringWithFormat:@"未找到主题数据包：%@.%@",
                                                     name,
                                                     fileExtension]}];
        };return NO;
    }
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:error];
    if (!data) return NO;
    NSDictionary *packet = [NSJSONSerialization JSONObjectWithData:data
                                                            options:0
                                                              error:error];
    NSString *defaultTheme = [packet[@"defaultTheme"] isKindOfClass:NSString.class]
        ? packet[@"defaultTheme"]
        : nil;
    NSDictionary *themes = [packet[@"themes"] isKindOfClass:NSDictionary.class]
        ? packet[@"themes"]
        : nil;
    if (!defaultTheme.length || !themes.count || !themes[defaultTheme]) {
        if (error) {
            *error = [NSError errorWithDomain:JobsThemeErrorDomain
                                         code:2
                                     userInfo:@{NSLocalizedDescriptionKey: @"主题数据包格式无效"}];
        };return NO;
    }
    self.byThemes(themes);
    self.byResourceBundle(bundle);
    NSString *savedStyle = [NSUserDefaults.standardUserDefaults stringForKey:JobsThemeDefaultsKey];
    self.byCurrentStyle(themes[savedStyle] ? savedStyle : defaultTheme);
    self.applyBindings();
    return YES;
}

-(JobsRetStrByStrBlock _Nonnull)setStyle{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable style) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (!NSThread.isMainThread) {
            @jobs_weakify(self)
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (!self) return;
                self.setStyle(style);
            });return self.currentStyle;
        }
        if (!self.themes[style] || [self.currentStyle isEqualToString:style]) {
            return self.currentStyle;
        }
        self.currentStyle = style;
        [NSUserDefaults.standardUserDefaults setObject:style forKey:JobsThemeDefaultsKey];
        self.applyBindings();
        [NSNotificationCenter.defaultCenter postNotificationName:JobsThemeDidChangeNotification
                                                          object:self
                                                        userInfo:@{@"style": style}];
        return self.currentStyle;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)toggle{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.setStyle(self.isDarkMode ? JobsThemeStyleLight : JobsThemeStyleDark);
    };
}

-(JobsRetCorByStrBlock _Nonnull)colorForKey{
    @jobs_weakify(self)
    return ^UIColor *_Nullable(NSString *_Nonnull key) {
        @jobs_strongify(self)
        if (!self) return nil;
        UIColor *color = self.resolvedColorForKey(key);
        objc_setAssociatedObject(color,
                                 JobsThemeColorKeyAssociatedKey,
                                 key,
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);
        return color;
    };
}

-(JobsRetCorByStrBlock _Nonnull)resolvedColorForKey{
    @jobs_weakify(self)
    return ^UIColor *_Nullable(NSString *_Nonnull key) {
        @jobs_strongify(self)
        if (!self) return nil;
        NSDictionary *payload = self.themes[self.currentStyle];
        NSDictionary *colors = [payload[@"colors"] isKindOfClass:NSDictionary.class]
            ? payload[@"colors"]
            : nil;
        UIColor *color = self.colorFromHex(colors[key]);
        return color ?: self.fallbackColorForKey(key);
    };
}

-(JobsRetImageByStrBlock _Nonnull)imageForKey{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(__kindof NSString *_Nullable key) {
        @jobs_strongify(self)
        if (!self) return nil;
        UIImage *image = self.resolvedImageForKey(key);
        if (image) {
            objc_setAssociatedObject(image,
                                     JobsThemeImageKeyAssociatedKey,
                                     key,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
        };return image;
    };
}

-(JobsRetImageByStrBlock _Nonnull)resolvedImageForKey{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(__kindof NSString *_Nullable key) {
        @jobs_strongify(self)
        if (!self) return nil;
        NSDictionary *payload = self.themes[self.currentStyle];
        NSDictionary *images = [payload[@"images"] isKindOfClass:NSDictionary.class]
            ? payload[@"images"]
            : nil;
        NSString *value = [images[key] isKindOfClass:NSString.class] ? images[key] : nil;
        if (!value.length && [key isEqualToString:JobsThemeImageKeyThemeToggle]) {
            value = self.isDarkMode ? @"sf:sun.max.circle.fill" : @"sf:moon.circle.fill";
        }
        if ([value hasPrefix:@"sf:"]) {
            if (@available(iOS 13.0, tvOS 13.0, *)) {
                return [UIImage systemImageNamed:[value substringFromIndex:3]];
            };return nil;
        }
        NSString *assetName = [value hasPrefix:@"asset:"]
            ? [value substringFromIndex:6]
            : value;
        if (!assetName.length) return nil;
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            return [UIImage imageNamed:assetName
                             inBundle:self.resourceBundle
            withConfiguration:nil];
        };return [UIImage imageNamed:assetName
                           inBundle:self.resourceBundle
      compatibleWithTraitCollection:nil];
    };
}

-(void)bindObject:(NSObject *)object
             slot:(NSString *)slot
            apply:(JobsThemeBindingBlock)apply {
    if (!NSThread.isMainThread) {
        @jobs_weakify(self)
        __weak typeof(object) weakObject = object;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!weakObject) return;
            [weak_self bindObject:weakObject slot:slot apply:apply];
        });return;
    }
    NSMutableDictionary *store = [self.bindings objectForKey:object];
    if (!store) {
        store = NSMutableDictionary.dictionary;
        [self.bindings setObject:store forKey:object];
    }
    store[slot] = [apply copy];
    apply(object, self);
}

-(void)unbindObject:(NSObject *)object
               slot:(NSString *)slot {
    if (!NSThread.isMainThread) {
        @jobs_weakify(self)
        __weak typeof(object) weakObject = object;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!weakObject) return;
            [weak_self unbindObject:weakObject slot:slot];
        });return;
    }
    NSMutableDictionary *store = [self.bindings objectForKey:object];
    [store removeObjectForKey:slot];
    if (!store.count) [self.bindings removeObjectForKey:object];
}

-(jobsByVoidBlock _Nonnull)applyBindings{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            @jobs_weakify(self)
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (!self) return;
                self.applyBindings();
            });return;
        }
        /// 主题回调可能同步解绑对象，先快照弱键以避免枚举中的 NSMapTable 被修改
        NSArray<NSObject *> *objects = self.bindings.keyEnumerator.allObjects;
        for (NSObject *object in objects) {
            NSArray<JobsThemeBindingBlock> *blocks = [self.bindings objectForKey:object].allValues;
            for (JobsThemeBindingBlock block in blocks) {
                block(object, self);
            }
        }
    };
}

-(JobsRetCorByStrBlock _Nonnull)colorFromHex{
    return ^UIColor *_Nullable(NSString *_Nonnull value) {
        if (![value isKindOfClass:NSString.class]) return nil;
        NSString *hex = [[value stringByTrimmingCharactersInSet:
                          NSCharacterSet.whitespaceAndNewlineCharacterSet]
                         stringByReplacingOccurrencesOfString:@"#" withString:@""];
        if (hex.length != 6 && hex.length != 8) return nil;
        unsigned long long number = 0;
        if (![[NSScanner scannerWithString:hex] scanHexLongLong:&number]) return nil;
        BOOL hasAlpha = hex.length == 8;
        CGFloat red = ((number >> (hasAlpha ? 24 : 16)) & 0xFF) / 255.0;
        CGFloat green = ((number >> (hasAlpha ? 16 : 8)) & 0xFF) / 255.0;
        CGFloat blue = ((number >> (hasAlpha ? 8 : 0)) & 0xFF) / 255.0;
        CGFloat alpha = hasAlpha ? (number & 0xFF) / 255.0 : 1;
        return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    };
}

-(JobsRetCorByStrBlock _Nonnull)fallbackColorForKey{
    @jobs_weakify(self)
    return ^UIColor *_Nullable(NSString *_Nonnull key) {
        @jobs_strongify(self)
        if (!self) return nil;
        BOOL dark = self.isDarkMode;
        if ([key isEqualToString:JobsThemeColorKeyBackgroundPrimary] ||
            [key isEqualToString:JobsThemeColorKeyBackgroundGrouped]) {
            return dark ? UIColor.blackColor : UIColor.whiteColor;
        }
        if ([key isEqualToString:JobsThemeColorKeyBackgroundSecondary] ||
            [key isEqualToString:JobsThemeColorKeyBackgroundGroupedSecondary]) {
            return dark
                ? [UIColor colorWithRed:28 / 255.0 green:28 / 255.0 blue:30 / 255.0 alpha:1]
                : [UIColor colorWithRed:242 / 255.0 green:242 / 255.0 blue:247 / 255.0 alpha:1];
        }
        if ([key isEqualToString:JobsThemeColorKeyBackgroundTertiary]) {
            return dark
                ? [UIColor colorWithRed:44 / 255.0 green:44 / 255.0 blue:46 / 255.0 alpha:1]
                : UIColor.whiteColor;
        }
        if ([key isEqualToString:JobsThemeColorKeyBackgroundGroupedTertiary]) {
            return dark
                ? [UIColor colorWithRed:44 / 255.0 green:44 / 255.0 blue:46 / 255.0 alpha:1]
                : [UIColor colorWithRed:242 / 255.0 green:242 / 255.0 blue:247 / 255.0 alpha:1];
        }
        if ([key isEqualToString:JobsThemeColorKeyTextPrimary]) {
            return dark ? UIColor.whiteColor : UIColor.blackColor;
        }
        CGFloat alpha = 0.6;
        if ([key isEqualToString:JobsThemeColorKeyTextTertiary] ||
            [key isEqualToString:JobsThemeColorKeyTextPlaceholder]) alpha = 0.3;
        if ([key isEqualToString:JobsThemeColorKeyTextQuaternary]) alpha = 0.18;
        return dark
            ? [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:245 / 255.0 alpha:alpha]
            : [UIColor colorWithRed:60 / 255.0 green:60 / 255.0 blue:67 / 255.0 alpha:alpha];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsThemeCenter
-(JobsRetJobsThemeCenterByJobsThemeStyleBlock _Nonnull)byCurrentStyle{
    @jobs_weakify(self)
    return ^__kindof JobsThemeCenter * _Nullable(JobsThemeStyle data){
        @jobs_strongify(self)
        [self setCurrentStyle:data];
        return self;
    };
}

-(JobsRetJobsThemeCenterByNSBundleBlock _Nonnull)byResourceBundle{
    @jobs_weakify(self)
    return ^__kindof JobsThemeCenter * _Nullable(NSBundle * _Nullable data){
        @jobs_strongify(self)
        [self setResourceBundle:data];
        return self;
    };
}

-(JobsRetJobsThemeCenterByNSDictionaryNSStringNSDictionaryBlock _Nonnull)byThemes{
    @jobs_weakify(self)
    return ^__kindof JobsThemeCenter * _Nullable(NSDictionary<NSString *, NSDictionary *> * _Nullable data){
        @jobs_strongify(self)
        [self setThemes:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsThemeCenter
@end

@implementation UIColor (JobsTheme)

-(JobsThemeColorKey)jobsThemeColorKey {
    return objc_getAssociatedObject(self, JobsThemeColorKeyAssociatedKey);
}

@end

@implementation UIImage (JobsTheme)

-(JobsThemeImageKey)jobsThemeImageKey {
    return objc_getAssociatedObject(self, JobsThemeImageKeyAssociatedKey);
}

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UIView
@interface UIView (JobsPropertyDSLSetterAutogen_7b23413d24)
-(void)setIsStopRotateAnimation:(BOOL)data;
-(void)setJobsViewPushPresentation:(JobsViewPushPresentation * _Nullable)data;
-(void)setJobs_navBar:(JobsNavBar * _Nullable)data;
-(void)setJobs_navBarConfig:(JobsNavBarConfig * _Nullable)data;
-(void)setJobs_ocSkeletonConfig:(JobsOCSkeletonConfig * _Nullable)data;
-(void)setJobs_ocSkeletonCornerRadiusValue:(NSNumber * _Nullable)data;
-(void)setJobs_ocSkeletonLastAnimationWidthValue:(NSNumber * _Nullable)data;
-(void)setJobs_ocSkeletonLayer:(CAGradientLayer * _Nullable)data;
-(void)setJobs_ocSkeletonOriginalClipsValue:(NSNumber * _Nullable)data;
-(void)setJobs_ocSkeletonOriginalCornerRadiusValue:(NSNumber * _Nullable)data;
-(void)setJobs_ocSkeletonableValue:(NSNumber * _Nullable)data;
-(void)setNavigator:(JobsViewNavigator * _Nullable)data;
-(void)setPopupDelegate:(id<TFPopupDelegate> _Nullable)data;
-(void)setZf_y:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UIView

@implementation UIView (JobsThemeBinding)

-(jobsByCorBlock _Nonnull)jobsTheme_setBackgroundColor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable color) {
        @jobs_strongify(self)
        self.backgroundColor = color;
    };
}

-(jobsByCorBlock _Nonnull)jobsTheme_setTintColor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable color) {
        @jobs_strongify(self)
        self.tintColor = color;
    };
}

-(void)jobsTheme_swizzled_setBackgroundColor:(UIColor *)color {
    jobsByCorBlock action = ((jobsByCorBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIView.class, @selector(jobsJobsTheme_swizzled_setBackgroundColor)))(self, @selector(jobsJobsTheme_swizzled_setBackgroundColor));
    if (action) action(color);
}

-(jobsByCorBlock _Nonnull)jobsJobsTheme_swizzled_setBackgroundColor{
    @jobs_weakify(self)
    return ^(UIColor * color){
        @jobs_strongify(self)
        if (!self) return;
        NSString *slot = @"UIView.backgroundColor";
        JobsThemeColorKey key = color.jobsThemeColorKey;
        if (key) {
            [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIView *object, JobsThemeCenter *center) {
                [object jobsTheme_swizzled_setBackgroundColor:center.resolvedColorForKey(key)];
            }];
            return;
        }
        [JobsThemeCenter.shared unbindObject:self slot:slot];
        [self jobsTheme_swizzled_setBackgroundColor:color];
    };
}

-(void)jobsTheme_swizzled_setTintColor:(UIColor *)color {
    jobsByCorBlock action = ((jobsByCorBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIView.class, @selector(jobsJobsTheme_swizzled_setTintColor)))(self, @selector(jobsJobsTheme_swizzled_setTintColor));
    if (action) action(color);
}

-(jobsByCorBlock _Nonnull)jobsJobsTheme_swizzled_setTintColor{
    @jobs_weakify(self)
    return ^(UIColor * color){
        @jobs_strongify(self)
        if (!self) return;
        NSString *slot = @"UIView.tintColor";
        JobsThemeColorKey key = color.jobsThemeColorKey;
        if (key) {
            [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIView *object, JobsThemeCenter *center) {
                [object jobsTheme_swizzled_setTintColor:center.resolvedColorForKey(key)];
            }];
            return;
        }
        [JobsThemeCenter.shared unbindObject:self slot:slot];
        [self jobsTheme_swizzled_setTintColor:color];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UIView
-(JobsRetUIViewByCAGradientLayerBlock _Nonnull)byJobs_ocSkeletonLayer{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CAGradientLayer * _Nullable data){
        @jobs_strongify(self)
        [self setJobs_ocSkeletonLayer:data];
        return self;
    };
}

-(JobsRetUIViewByJobsNavBarBlock _Nonnull)byJobs_navBar{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(JobsNavBar * _Nullable data){
        @jobs_strongify(self)
        [self setJobs_navBar:data];
        return self;
    };
}

-(JobsRetUIViewByJobsNavBarConfigBlock _Nonnull)byJobs_navBarConfig{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(JobsNavBarConfig * _Nullable data){
        @jobs_strongify(self)
        [self setJobs_navBarConfig:data];
        return self;
    };
}

-(JobsRetUIViewByJobsOCSkeletonConfigBlock _Nonnull)byJobs_ocSkeletonConfig{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(JobsOCSkeletonConfig * _Nullable data){
        @jobs_strongify(self)
        [self setJobs_ocSkeletonConfig:data];
        return self;
    };
}

-(JobsRetUIViewByJobsViewNavigatorBlock _Nonnull)byNavigator{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(JobsViewNavigator * _Nullable data){
        @jobs_strongify(self)
        [self setNavigator:data];
        return self;
    };
}

-(JobsRetUIViewByJobsViewPushPresentationBlock _Nonnull)byJobsViewPushPresentation{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(JobsViewPushPresentation * _Nullable data){
        @jobs_strongify(self)
        [self setJobsViewPushPresentation:data];
        return self;
    };
}

-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(NSNumber * _Nullable data){
        @jobs_strongify(self)
        [self setJobs_ocSkeletonCornerRadiusValue:data];
        return self;
    };
}

-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonLastAnimationWidthValue{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(NSNumber * _Nullable data){
        @jobs_strongify(self)
        [self setJobs_ocSkeletonLastAnimationWidthValue:data];
        return self;
    };
}

-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonOriginalClipsValue{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(NSNumber * _Nullable data){
        @jobs_strongify(self)
        [self setJobs_ocSkeletonOriginalClipsValue:data];
        return self;
    };
}

-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonOriginalCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(NSNumber * _Nullable data){
        @jobs_strongify(self)
        [self setJobs_ocSkeletonOriginalCornerRadiusValue:data];
        return self;
    };
}

-(JobsRetUIViewByNSNumberBlock _Nonnull)byJobs_ocSkeletonableValue{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(NSNumber * _Nullable data){
        @jobs_strongify(self)
        [self setJobs_ocSkeletonableValue:data];
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byStopRotateAnimation{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsStopRotateAnimation:data];
        return self;
    };
}
-(JobsRetUIViewByIDTFPopupDelegateBlock _Nonnull)byPopupDelegate{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(id<TFPopupDelegate> _Nullable data){
        @jobs_strongify(self)
        [self setPopupDelegate:data];
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byZf_y{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setZf_y:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UIView
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UILabel
@interface UILabel (JobsPropertyDSLSetterAutogen_7b23413d24)
-(void)setBackgroundColor:(UIColor * _Nullable)data;
-(void)setTransformLayerDirectionType:(JobsDirectionType)data;
-(void)setZf_centerY:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UILabel

@implementation UILabel (JobsThemeBinding)

-(jobsByCorBlock _Nonnull)jobsTheme_setTextColor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable color) {
        @jobs_strongify(self)
        self.textColor = color;
    };
}

-(void)jobsTheme_swizzled_setTextColor:(UIColor *)color {
    jobsByCorBlock action = ((jobsByCorBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UILabel.class, @selector(jobsJobsTheme_swizzled_setTextColor)))(self, @selector(jobsJobsTheme_swizzled_setTextColor));
    if (action) action(color);
}

-(jobsByCorBlock _Nonnull)jobsJobsTheme_swizzled_setTextColor{
    @jobs_weakify(self)
    return ^(UIColor * color){
        @jobs_strongify(self)
        if (!self) return;
        NSString *slot = @"UILabel.textColor";
        JobsThemeColorKey key = color.jobsThemeColorKey;
        if (key) {
            [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UILabel *object, JobsThemeCenter *center) {
                [object jobsTheme_swizzled_setTextColor:center.resolvedColorForKey(key)];
            }];
            return;
        }
        [JobsThemeCenter.shared unbindObject:self slot:slot];
        [self jobsTheme_swizzled_setTextColor:color];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UILabel
-(JobsRetUILabelByJobsDirectionTypeBlock _Nonnull)byTransformLayerDirectionType{
    @jobs_weakify(self)
    return ^__kindof UILabel * _Nullable(JobsDirectionType data){
        @jobs_strongify(self)
        [self setTransformLayerDirectionType:data];
        return self;
    };
}
-(JobsRetUILabelByCGFloatBlock _Nonnull)byZf_centerY{
    @jobs_weakify(self)
    return ^__kindof UILabel * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setZf_centerY:data];
        return self;
    };
}
-(JobsRetLabelByCorBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UILabel * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setBackgroundColor:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UILabel
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UITextField
@interface UITextField (JobsPropertyDSLSetterAutogen_7b23413d24)
-(void)setAccessibilityLabel:(NSString * _Nullable)data;
-(void)setAccessibilityValue:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UITextField

@implementation UITextField (JobsThemeBinding)

-(jobsByCorBlock _Nonnull)jobsTheme_setTextColor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable color) {
        @jobs_strongify(self)
        self.textColor = color;
    };
}

-(void)jobsTheme_swizzled_setTextColor:(UIColor *)color {
    jobsByCorBlock action = ((jobsByCorBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITextField.class, @selector(jobsJobsTheme_swizzled_setTextColor)))(self, @selector(jobsJobsTheme_swizzled_setTextColor));
    if (action) action(color);
}

-(jobsByCorBlock _Nonnull)jobsJobsTheme_swizzled_setTextColor{
    @jobs_weakify(self)
    return ^(UIColor * color){
        @jobs_strongify(self)
        if (!self) return;
        NSString *slot = @"UITextField.textColor";
        JobsThemeColorKey key = color.jobsThemeColorKey;
        if (key) {
            [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UITextField *object, JobsThemeCenter *center) {
                [object jobsTheme_swizzled_setTextColor:center.resolvedColorForKey(key)];
            }];
            return;
        }
        [JobsThemeCenter.shared unbindObject:self slot:slot];
        [self jobsTheme_swizzled_setTextColor:color];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UITextField
-(JobsRetTextFieldByStringBlock _Nonnull)byAccessibilityLabel{
    @jobs_weakify(self)
    return ^__kindof UITextField * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setAccessibilityLabel:data];
        return self;
    };
}

-(JobsRetTextFieldByStringBlock _Nonnull)byAccessibilityValue{
    @jobs_weakify(self)
    return ^__kindof UITextField * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setAccessibilityValue:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UITextField
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UITextView
@interface UITextView (JobsPropertyDSLSetterAutogen_7b23413d24)
-(void)setCurrentWordNum:(NSInteger)data;
-(void)setReplacementText:(NSString * _Nullable)data;
-(void)setResStr:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UITextView

@implementation UITextView (JobsThemeBinding)

-(jobsByCorBlock _Nonnull)jobsTheme_setTextColor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable color) {
        @jobs_strongify(self)
        self.textColor = color;
    };
}

-(void)jobsTheme_swizzled_setTextColor:(UIColor *)color {
    jobsByCorBlock action = ((jobsByCorBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITextView.class, @selector(jobsJobsTheme_swizzled_setTextColor)))(self, @selector(jobsJobsTheme_swizzled_setTextColor));
    if (action) action(color);
}

-(jobsByCorBlock _Nonnull)jobsJobsTheme_swizzled_setTextColor{
    @jobs_weakify(self)
    return ^(UIColor * color){
        @jobs_strongify(self)
        if (!self) return;
        NSString *slot = @"UITextView.textColor";
        JobsThemeColorKey key = color.jobsThemeColorKey;
        if (key) {
            [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UITextView *object, JobsThemeCenter *center) {
                [object jobsTheme_swizzled_setTextColor:center.resolvedColorForKey(key)];
            }];
            return;
        }
        [JobsThemeCenter.shared unbindObject:self slot:slot];
        [self jobsTheme_swizzled_setTextColor:color];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UITextView
-(JobsRetTextViewByNSIntegerBlock _Nonnull)byCurrentWordNum{
    @jobs_weakify(self)
    return ^__kindof UITextView * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setCurrentWordNum:data];
        return self;
    };
}

-(JobsRetTextViewByStringBlock _Nonnull)byReplacementText{
    @jobs_weakify(self)
    return ^__kindof UITextView * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setReplacementText:data];
        return self;
    };
}

-(JobsRetTextViewByStringBlock _Nonnull)byResStr{
    @jobs_weakify(self)
    return ^__kindof UITextView * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setResStr:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UITextView
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UIButton
@interface UIButton (JobsPropertyDSLSetterAutogen_7b23413d24)
-(void)setAccessibilityLabel:(NSString * _Nullable)data;
-(void)setSizer:(CGSize)data;
-(void)setZf_centerY:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UIButton

@implementation UIButton (JobsThemeBinding)

-(void)jobsTheme_setTitleColor:(UIColor *)color forState:(UIControlState)state {
    NSString *slot = [NSString stringWithFormat:@"UIButton.titleColor.%lu", (unsigned long)state];
    JobsThemeColorKey key = color.jobsThemeColorKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIButton *object, JobsThemeCenter *center) {
            [object jobsTheme_setTitleColor:center.resolvedColorForKey(key) forState:state];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setTitleColor:color forState:state];
}

-(void)jobsTheme_setImage:(UIImage *)image forState:(UIControlState)state {
    NSString *slot = [NSString stringWithFormat:@"UIButton.image.%lu", (unsigned long)state];
    JobsThemeImageKey key = image.jobsThemeImageKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIButton *object, JobsThemeCenter *center) {
            [object jobsTheme_setImage:center.resolvedImageForKey(key) forState:state];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setImage:image forState:state];
}

-(void)jobsTheme_setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
    NSString *slot = [NSString stringWithFormat:@"UIButton.backgroundImage.%lu", (unsigned long)state];
    JobsThemeImageKey key = image.jobsThemeImageKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIButton *object, JobsThemeCenter *center) {
            [object jobsTheme_setBackgroundImage:center.resolvedImageForKey(key) forState:state];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setBackgroundImage:image forState:state];
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UIButton
-(JobsRetBtnByCGFloatBlock _Nonnull)byZf_centerY{
    @jobs_weakify(self)
    return ^__kindof UIButton * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setZf_centerY:data];
        return self;
    };
}

-(JobsRetBtnByCGSizeBlock _Nonnull)bySizer{
    @jobs_weakify(self)
    return ^__kindof UIButton * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setSizer:data];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)byAccessibilityLabel{
    @jobs_weakify(self)
    return ^__kindof UIButton * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setAccessibilityLabel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UIButton
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UIImageView
@interface UIImageView (JobsPropertyDSLSetterAutogen_7b23413d24)
-(void)setAbleRespose:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UIImageView

@implementation UIImageView (JobsThemeBinding)

-(jobsByImageBlock _Nonnull)jobsTheme_setImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nullable image) {
        @jobs_strongify(self)
        self.image = image;
    };
}

-(void)jobsTheme_swizzled_setImage:(UIImage *)image {
    jobsByImageBlock action = ((jobsByImageBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIImageView.class, @selector(jobsJobsTheme_swizzled_setImage)))(self, @selector(jobsJobsTheme_swizzled_setImage));
    if (action) action(image);
}

-(jobsByImageBlock _Nonnull)jobsJobsTheme_swizzled_setImage{
    @jobs_weakify(self)
    return ^(UIImage * image){
        @jobs_strongify(self)
        if (!self) return;
        NSString *slot = @"UIImageView.image";
        JobsThemeImageKey key = image.jobsThemeImageKey;
        if (key) {
            [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIImageView *object, JobsThemeCenter *center) {
                [object jobsTheme_swizzled_setImage:center.resolvedImageForKey(key)];
            }];
            return;
        }
        [JobsThemeCenter.shared unbindObject:self slot:slot];
        [self jobsTheme_swizzled_setImage:image];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UIImageView
-(JobsRetImageViewByBOOLBlock _Nonnull)byAbleRespose{
    @jobs_weakify(self)
    return ^__kindof UIImageView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAbleRespose:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UIImageView
@end

UIColor *JobsThemeColor(JobsThemeColorKey key) {
    return JobsThemeCenter.shared.colorForKey(key);
}

UIImage *JobsThemeImage(JobsThemeImageKey key) {
    return JobsThemeCenter.shared.imageForKey(key);
}

//
//  JobsTheme.m
//  JobsOCDefs
//
//  Created by Jobs on 2026年7月29日，星期三.
//

#import "JobsTheme.h"
#import <objc/runtime.h>

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

@implementation JobsThemeCenter

+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JobsThemeSwizzle(UIView.class,
                         @selector(setBackgroundColor:),
                         @selector(jobsTheme_setBackgroundColor:));
        JobsThemeSwizzle(UIView.class,
                         @selector(setTintColor:),
                         @selector(jobsTheme_setTintColor:));
        JobsThemeSwizzle(UILabel.class,
                         @selector(setTextColor:),
                         @selector(jobsTheme_setTextColor:));
        JobsThemeSwizzle(UITextField.class,
                         @selector(setTextColor:),
                         @selector(jobsTheme_setTextColor:));
        JobsThemeSwizzle(UITextView.class,
                         @selector(setTextColor:),
                         @selector(jobsTheme_setTextColor:));
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
                         @selector(jobsTheme_setImage:));
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
    }return self;
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
        }return NO;
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
        }return NO;
    }
    self.themes = themes;
    self.resourceBundle = bundle;
    NSString *savedStyle = [NSUserDefaults.standardUserDefaults stringForKey:JobsThemeDefaultsKey];
    self.currentStyle = themes[savedStyle] ? savedStyle : defaultTheme;
    [self applyBindings];
    return YES;
}

-(JobsThemeStyle)setStyle:(JobsThemeStyle)style {
    if (!NSThread.isMainThread) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf setStyle:style];
        });return self.currentStyle;
    }
    if (!self.themes[style] || [self.currentStyle isEqualToString:style]) {
        return self.currentStyle;
    }
    self.currentStyle = style;
    [NSUserDefaults.standardUserDefaults setObject:style forKey:JobsThemeDefaultsKey];
    [self applyBindings];
    [NSNotificationCenter.defaultCenter postNotificationName:JobsThemeDidChangeNotification
                                                      object:self
                                                    userInfo:@{@"style": style}];
    return self.currentStyle;
}

-(JobsThemeStyle)toggle {
    return [self setStyle:self.isDarkMode ? JobsThemeStyleLight : JobsThemeStyleDark];
}

-(UIColor *)colorForKey:(JobsThemeColorKey)key {
    UIColor *color = [self resolvedColorForKey:key];
    objc_setAssociatedObject(color,
                             JobsThemeColorKeyAssociatedKey,
                             key,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    return color;
}

-(UIColor *)resolvedColorForKey:(JobsThemeColorKey)key {
    NSDictionary *payload = self.themes[self.currentStyle];
    NSDictionary *colors = [payload[@"colors"] isKindOfClass:NSDictionary.class]
        ? payload[@"colors"]
        : nil;
    UIColor *color = [self colorFromHex:colors[key]];
    return color ?: [self fallbackColorForKey:key];
}

-(UIImage *)imageForKey:(JobsThemeImageKey)key {
    UIImage *image = [self resolvedImageForKey:key];
    if (image) {
        objc_setAssociatedObject(image,
                                 JobsThemeImageKeyAssociatedKey,
                                 key,
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);
    }return image;
}

-(UIImage *)resolvedImageForKey:(JobsThemeImageKey)key {
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
        }return nil;
    }
    NSString *assetName = [value hasPrefix:@"asset:"]
        ? [value substringFromIndex:6]
        : value;
    if (!assetName.length) return nil;
    if (@available(iOS 13.0, tvOS 13.0, *)) {
        return [UIImage imageNamed:assetName
                         inBundle:self.resourceBundle
        withConfiguration:nil];
    }return [UIImage imageNamed:assetName
                       inBundle:self.resourceBundle
  compatibleWithTraitCollection:nil];
}

-(void)bindObject:(NSObject *)object
             slot:(NSString *)slot
            apply:(JobsThemeBindingBlock)apply {
    if (!NSThread.isMainThread) {
        __weak typeof(self) weakSelf = self;
        __weak typeof(object) weakObject = object;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!weakObject) return;
            [weakSelf bindObject:weakObject slot:slot apply:apply];
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
        __weak typeof(self) weakSelf = self;
        __weak typeof(object) weakObject = object;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!weakObject) return;
            [weakSelf unbindObject:weakObject slot:slot];
        });return;
    }
    NSMutableDictionary *store = [self.bindings objectForKey:object];
    [store removeObjectForKey:slot];
    if (!store.count) [self.bindings removeObjectForKey:object];
}

-(void)applyBindings {
    if (!NSThread.isMainThread) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf applyBindings];
        });return;
    }
    NSEnumerator *enumerator = self.bindings.keyEnumerator;
    NSObject *object;
    while ((object = enumerator.nextObject)) {
        NSArray<JobsThemeBindingBlock> *blocks = [self.bindings objectForKey:object].allValues;
        for (JobsThemeBindingBlock block in blocks) {
            block(object, self);
        }
    }
}

-(UIColor *)colorFromHex:(NSString *)value {
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
}

-(UIColor *)fallbackColorForKey:(JobsThemeColorKey)key {
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
}

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

@implementation UIView (JobsThemeBinding)

-(void)jobsTheme_setBackgroundColor:(UIColor *)color {
    NSString *slot = @"UIView.backgroundColor";
    JobsThemeColorKey key = color.jobsThemeColorKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIView *object, JobsThemeCenter *center) {
            [object jobsTheme_setBackgroundColor:[center resolvedColorForKey:key]];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setBackgroundColor:color];
}

-(void)jobsTheme_setTintColor:(UIColor *)color {
    NSString *slot = @"UIView.tintColor";
    JobsThemeColorKey key = color.jobsThemeColorKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIView *object, JobsThemeCenter *center) {
            [object jobsTheme_setTintColor:[center resolvedColorForKey:key]];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setTintColor:color];
}

@end

@implementation UILabel (JobsThemeBinding)

-(void)jobsTheme_setTextColor:(UIColor *)color {
    NSString *slot = @"UILabel.textColor";
    JobsThemeColorKey key = color.jobsThemeColorKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UILabel *object, JobsThemeCenter *center) {
            [object jobsTheme_setTextColor:[center resolvedColorForKey:key]];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setTextColor:color];
}

@end

@implementation UITextField (JobsThemeBinding)

-(void)jobsTheme_setTextColor:(UIColor *)color {
    NSString *slot = @"UITextField.textColor";
    JobsThemeColorKey key = color.jobsThemeColorKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UITextField *object, JobsThemeCenter *center) {
            [object jobsTheme_setTextColor:[center resolvedColorForKey:key]];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setTextColor:color];
}

@end

@implementation UITextView (JobsThemeBinding)

-(void)jobsTheme_setTextColor:(UIColor *)color {
    NSString *slot = @"UITextView.textColor";
    JobsThemeColorKey key = color.jobsThemeColorKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UITextView *object, JobsThemeCenter *center) {
            [object jobsTheme_setTextColor:[center resolvedColorForKey:key]];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setTextColor:color];
}

@end

@implementation UIButton (JobsThemeBinding)

-(void)jobsTheme_setTitleColor:(UIColor *)color forState:(UIControlState)state {
    NSString *slot = [NSString stringWithFormat:@"UIButton.titleColor.%lu", (unsigned long)state];
    JobsThemeColorKey key = color.jobsThemeColorKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIButton *object, JobsThemeCenter *center) {
            [object jobsTheme_setTitleColor:[center resolvedColorForKey:key] forState:state];
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
            [object jobsTheme_setImage:[center resolvedImageForKey:key] forState:state];
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
            [object jobsTheme_setBackgroundImage:[center resolvedImageForKey:key] forState:state];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setBackgroundImage:image forState:state];
}

@end

@implementation UIImageView (JobsThemeBinding)

-(void)jobsTheme_setImage:(UIImage *)image {
    NSString *slot = @"UIImageView.image";
    JobsThemeImageKey key = image.jobsThemeImageKey;
    if (key) {
        [JobsThemeCenter.shared bindObject:self slot:slot apply:^(__kindof UIImageView *object, JobsThemeCenter *center) {
            [object jobsTheme_setImage:[center resolvedImageForKey:key]];
        }];
        return;
    }
    [JobsThemeCenter.shared unbindObject:self slot:slot];
    [self jobsTheme_setImage:image];
}

@end

UIColor *JobsThemeColor(JobsThemeColorKey key) {
    return [JobsThemeCenter.shared colorForKey:key];
}

UIImage *JobsThemeImage(JobsThemeImageKey key) {
    return [JobsThemeCenter.shared imageForKey:key];
}

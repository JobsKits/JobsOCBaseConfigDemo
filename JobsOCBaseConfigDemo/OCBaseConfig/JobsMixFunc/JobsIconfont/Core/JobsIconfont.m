//
//  JobsIconfont.m
//  JobsIconfont
//
//  Created by Jobs on 2026年7月25日，星期六.
//

#import "JobsIconfont.h"

#import <CoreText/CoreText.h>
#import <objc/runtime.h>

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

JobsIconfontRemoteAsset const JobsIconfontRemoteAssetLogo = @"logo";
JobsIconfontRemoteAsset const JobsIconfontRemoteAssetFontBanner = @"fontBanner";
JobsIconfontRemoteAsset const JobsIconfontRemoteAssetUsageGuide = @"usageGuide";
JobsIconfontRemoteAsset const JobsIconfontRemoteAssetInvalidURL = @"invalidURL";

static const void *JobsIconfontRepresentedAssetKey = &JobsIconfontRepresentedAssetKey;
static const void *JobsIconfontLoadTokenKey = &JobsIconfontLoadTokenKey;

@interface JobsIconfontBundleToken : NSObject

@end

@implementation JobsIconfontBundleToken

@end

@interface JobsIconfontLoadResult ()

@property(nonatomic,assign,readwrite)JobsIconfontLoadStage stage;
@property(nonatomic,copy,readwrite)NSString *loaderName;
@property(nonatomic,assign,readwrite,getter=isCacheHit)BOOL cacheHit;
@property(nonatomic,strong,readwrite,nullable)NSError *error;

@end

@implementation JobsIconfontLoadResult

@end

@interface JobsIconfontLoadToken ()

@property(nonatomic,copy,nullable)dispatch_block_t cancellation;
@property(nonatomic,assign,getter=isCancelled)BOOL cancelled;

-(instancetype)initWithCancellation:(nullable dispatch_block_t)cancellation;

@end

@implementation JobsIconfontLoadToken
-(instancetype)initWithCancellation:(dispatch_block_t)cancellation{
    if (self = [super init]) {
        self.cancellation = cancellation;
    };return self;
}

-(void)cancel{
    if (self.isCancelled) return;
    self.cancelled = YES;
    if (self.cancellation) self.cancellation();
    self.cancellation = nil;
}

-(void)dealloc{
    [self cancel];
}

@end

@interface JobsIconfontManager ()

@property(nonatomic,strong)NSLock *fontLock;
@property(nonatomic,strong)NSMutableSet <NSString *>*registeredFontFiles;
@property(nonatomic,copy,readonly)NSString *iconFontPostScriptName;
@property(nonatomic,copy,readonly)NSString *textFontPostScriptName;

-(NSBundle *)resourceBundle;
-(NSString *)unicodeStringForGlyph:(JobsIconfontGlyph)glyph;
-(void)registerFontFilename:(NSString *)filename
            postScriptName:(NSString *)postScriptName;
-(NSURL *)remoteURLForAsset:(JobsIconfontRemoteAsset)asset;
-(JobsIconfontGlyph)fallbackGlyphForAsset:(JobsIconfontRemoteAsset)asset;
-(JobsIconfontLoadResult *)resultWithStage:(JobsIconfontLoadStage)stage
                               loaderName:(NSString *)loaderName
                                  cacheHit:(BOOL)cacheHit
                                     error:(nullable NSError *)error;

@end

@implementation JobsIconfontManager
+(JobsIconfontManager *)shared{
    static JobsIconfontManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = JobsIconfontManager.new;
    });return manager;
}

-(instancetype)init{
    if (self = [super init]) {
        _iconFontPostScriptName = @"iconfontyyy";
        _textFontPostScriptName = @"AlimamaShuZhiTiVF-Regular";
        _fontLock = NSLock.new;
        _registeredFontFiles = NSMutableSet.set;
    };return self;
}

-(UIFont *)iconFontOfSize:(CGFloat)size{
    [self registerFontFilename:@"JobsIconfontSample.ttf"
                postScriptName:self.iconFontPostScriptName];
    return [UIFont fontWithName:self.iconFontPostScriptName
                          size:size] ?: [UIFont systemFontOfSize:size];
}

-(UIFont *)textFontOfSize:(CGFloat)size{
    [self registerFontFilename:@"AlimamaShuzhiti-Regular.ttf"
                postScriptName:self.textFontPostScriptName];
    return [UIFont fontWithName:self.textFontPostScriptName
                          size:size] ?: [UIFont systemFontOfSize:size];
}

-(NSString *)unicodeStringForGlyph:(JobsIconfontGlyph)glyph{
    switch (glyph) {
        case JobsIconfontGlyphSwitcher: return @"\ue601";
        case JobsIconfontGlyphIPhone: return @"\ue602";
        case JobsIconfontGlyphDirection: return @"\ue603";
        case JobsIconfontGlyphPicture: return @"\ue605";
        case JobsIconfontGlyphLodging: return @"\ue606";
        case JobsIconfontGlyphSort: return @"\ue607";
        case JobsIconfontGlyphPrevious: return @"\ue608";
        case JobsIconfontGlyphNext: return @"\ue609";
        case JobsIconfontGlyphVerified: return @"\ue60a";
        case JobsIconfontGlyphComponent: return @"\ue60c";
    }
}

-(NSString *)titleForGlyph:(JobsIconfontGlyph)glyph{
    switch (glyph) {
        case JobsIconfontGlyphSwitcher: return @"切换";
        case JobsIconfontGlyphIPhone: return @"iPhone";
        case JobsIconfontGlyphDirection: return @"方向";
        case JobsIconfontGlyphPicture: return @"图片";
        case JobsIconfontGlyphLodging: return @"住宿";
        case JobsIconfontGlyphSort: return @"排序";
        case JobsIconfontGlyphPrevious: return @"上一个";
        case JobsIconfontGlyphNext: return @"下一个";
        case JobsIconfontGlyphVerified: return @"实名认证";
        case JobsIconfontGlyphComponent: return @"组件";
    }
}

-(NSString *)titleForRemoteAsset:(JobsIconfontRemoteAsset)asset{
    if ([asset isEqualToString:JobsIconfontRemoteAssetLogo]) return @"iconfont Logo";
    if ([asset isEqualToString:JobsIconfontRemoteAssetFontBanner]) return @"阿里妈妈·智造字";
    if ([asset isEqualToString:JobsIconfontRemoteAssetUsageGuide]) return @"iOS 接入说明";
    return @"错误 URL";
}

-(UIImage *)iconImageForGlyph:(JobsIconfontGlyph)glyph
                        size:(CGSize)size
                       color:(UIColor *)color{
    return [self iconImageForGlyph:glyph
                             size:size
                            color:color
                  backgroundColor:UIColor.clearColor];
}

-(UIImage *)iconImageForGlyph:(JobsIconfontGlyph)glyph
                        size:(CGSize)size
                       color:(UIColor *)color
             backgroundColor:(UIColor *)backgroundColor{
    UIGraphicsImageRendererFormat *format = UIGraphicsImageRendererFormat.defaultFormat;
    format.scale = UIScreen.mainScreen.scale;
    format.opaque = CGColorGetAlpha(backgroundColor.CGColor) >= 1;
    UIGraphicsImageRenderer *renderer = [UIGraphicsImageRenderer.alloc initWithSize:size
                                                                              format:format];
    return [renderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        [backgroundColor setFill];
        [rendererContext fillRect:(CGRect){CGPointZero,size}];
        CGFloat pointSize = MAX(1, MIN(size.width, size.height) * 0.72);
        NSDictionary *attributes = @{
            NSFontAttributeName: [self iconFontOfSize:pointSize],
            NSForegroundColorAttributeName: color
        };
        NSString *string = [self unicodeStringForGlyph:glyph];
        CGRect bounds = [string boundingRectWithSize:size
                                             options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          attributes:attributes
                                             context:nil];
        [string drawAtPoint:CGPointMake((size.width - ceil(bounds.size.width)) / 2,
                                        (size.height - ceil(bounds.size.height)) / 2)
             withAttributes:attributes];
    }];
}

-(UIImage *)placeholderImageForAsset:(JobsIconfontRemoteAsset)asset
                                size:(CGSize)size{
    return [self iconImageForGlyph:[self fallbackGlyphForAsset:asset]
                             size:size
                            color:UIColor.systemGray3Color];
}

-(JobsIconfontLoadToken *)loadAsset:(JobsIconfontRemoteAsset)asset
                      intoImageView:(UIImageView *)imageView
                         targetSize:(CGSize)targetSize
                       forceRefresh:(BOOL)forceRefresh
                         completion:(JobsIconfontLoadCompletion)completion{
    JobsIconfontLoadToken *oldToken = objc_getAssociatedObject(imageView,
                                                                JobsIconfontLoadTokenKey);
    [oldToken cancel];
    CGSize resolvedSize = targetSize.width > 1 && targetSize.height > 1
        ? targetSize
        : CGSizeMake(96, 96);
    UIImage *placeholder = [self placeholderImageForAsset:asset
                                                     size:resolvedSize];
    objc_setAssociatedObject(imageView,
                             JobsIconfontRepresentedAssetKey,
                             asset,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    imageView.image = placeholder;
    if (completion) {
        completion([self resultWithStage:JobsIconfontLoadStagePlaceholder
                              loaderName:@""
                                 cacheHit:NO
                                    error:nil]);
    }
    SDWebImageOptions options = SDWebImageRetryFailed |
                                SDWebImageHighPriority |
                                SDWebImageScaleDownLargeImages;
    if (forceRefresh) options |= SDWebImageRefreshCached;
    __weak UIImageView *weakImageView = imageView;
    [imageView sd_setImageWithURL:[self remoteURLForAsset:asset]
                 placeholderImage:placeholder
                          options:options
                        completed:^(UIImage * _Nullable image,
                                    NSError * _Nullable error,
                                    SDImageCacheType cacheType,
                                    NSURL * _Nullable imageURL) {
        UIImageView *strongImageView = weakImageView;
        if (!strongImageView) return;
        NSString *representedAsset = objc_getAssociatedObject(strongImageView,
                                                               JobsIconfontRepresentedAssetKey);
        if (![representedAsset isEqualToString:asset]) return;
        if (image && !error) {
            strongImageView.image = image;
            if (completion) {
                completion([self resultWithStage:JobsIconfontLoadStageSuccess
                                      loaderName:@"SDWebImage"
                                         cacheHit:cacheType != SDImageCacheTypeNone
                                            error:nil]);
            }
        } else {
            strongImageView.image = placeholder;
            if (completion) {
                completion([self resultWithStage:JobsIconfontLoadStageFailure
                                      loaderName:@"SDWebImage"
                                         cacheHit:NO
                                            error:error]);
            }
        }
    }];
    __weak UIImageView *cancellableImageView = imageView;
    JobsIconfontLoadToken *token = [JobsIconfontLoadToken.alloc initWithCancellation:^{
        [cancellableImageView sd_cancelCurrentImageLoad];
    }];
    objc_setAssociatedObject(imageView,
                             JobsIconfontLoadTokenKey,
                             token,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return token;
}

-(void)cancelLoadInImageView:(UIImageView *)imageView{
    JobsIconfontLoadToken *token = objc_getAssociatedObject(imageView,
                                                            JobsIconfontLoadTokenKey);
    [token cancel];
    objc_setAssociatedObject(imageView,
                             JobsIconfontLoadTokenKey,
                             nil,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(imageView,
                             JobsIconfontRepresentedAssetKey,
                             nil,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)clearImageCache:(dispatch_block_t)completion{
    [SDImageCache.sharedImageCache clearMemory];
    [SDImageCache.sharedImageCache clearDiskOnCompletion:^{
        if (completion) dispatch_async(dispatch_get_main_queue(), completion);
    }];
}
#pragma mark —— Private
-(NSBundle *)resourceBundle{
    NSBundle *ownerBundle = [NSBundle bundleForClass:JobsIconfontBundleToken.class];
    NSArray <NSBundle *>*bundles = @[ownerBundle,NSBundle.mainBundle];
    for (NSBundle *bundle in bundles) {
        NSString *path = [bundle pathForResource:@"JobsIconfontAssets"
                                          ofType:@"bundle"];
        NSBundle *resourceBundle = path.length ? [NSBundle bundleWithPath:path] : nil;
        if (resourceBundle) return resourceBundle;
    };return ownerBundle;
}

-(void)registerFontFilename:(NSString *)filename
            postScriptName:(NSString *)postScriptName{
    [self.fontLock lock];
    if ([self.registeredFontFiles containsObject:filename]) {
        [self.fontLock unlock];
        return;
    }
    NSString *path = [self.resourceBundle pathForResource:filename.stringByDeletingPathExtension
                                                   ofType:filename.pathExtension];
    if (!path.length) {
        [self.fontLock unlock];
        return;
    }
    CFErrorRef error = NULL;
    BOOL success = CTFontManagerRegisterFontsForURL((__bridge CFURLRef)[NSURL fileURLWithPath:path],
                                                    kCTFontManagerScopeProcess,
                                                    &error);
    if (error) CFRelease(error);
    if (success || [UIFont fontWithName:postScriptName size:12]) {
        [self.registeredFontFiles addObject:filename];
    }
    [self.fontLock unlock];
}

-(NSURL *)remoteURLForAsset:(JobsIconfontRemoteAsset)asset{
    if ([asset isEqualToString:JobsIconfontRemoteAssetLogo]) {
        return [NSURL URLWithString:@"https://img.alicdn.com/imgextra/i4/O1CN01XZe8pH1USpiUNT1QN_!!6000000002517-2-tps-114-114.png"];
    }
    if ([asset isEqualToString:JobsIconfontRemoteAssetFontBanner]) {
        return [NSURL URLWithString:@"https://img.alicdn.com/imgextra/i1/O1CN01vqHHzA1JvGYdLg5KV_!!6000000001090-2-tps-2280-452.png"];
    }
    if ([asset isEqualToString:JobsIconfontRemoteAssetUsageGuide]) {
        return [NSURL URLWithString:@"https://img.alicdn.com/tfscom/T1R3VxFuRnXXaCwpjX.png"];
    };return [NSURL URLWithString:@"https://at.alicdn.com/t/jobs-iconfont-invalid-demo.png"];
}

-(JobsIconfontGlyph)fallbackGlyphForAsset:(JobsIconfontRemoteAsset)asset{
    if ([asset isEqualToString:JobsIconfontRemoteAssetLogo]) return JobsIconfontGlyphComponent;
    if ([asset isEqualToString:JobsIconfontRemoteAssetFontBanner]) return JobsIconfontGlyphSwitcher;
    if ([asset isEqualToString:JobsIconfontRemoteAssetUsageGuide]) return JobsIconfontGlyphIPhone;
    return JobsIconfontGlyphPicture;
}

-(JobsIconfontLoadResult *)resultWithStage:(JobsIconfontLoadStage)stage
                               loaderName:(NSString *)loaderName
                                  cacheHit:(BOOL)cacheHit
                                     error:(NSError *)error{
    JobsIconfontLoadResult *result = JobsIconfontLoadResult.new;
    result.stage = stage;
    result.loaderName = loaderName;
    result.cacheHit = cacheHit;
    result.error = error;
    return result;
}

@end

@implementation UIImageView (JobsIconfont)
-(instancetype)byJobsIconfontAsset:(JobsIconfontRemoteAsset)asset
                        targetSize:(CGSize)targetSize
                      forceRefresh:(BOOL)forceRefresh
                        completion:(JobsIconfontLoadCompletion)completion{
    [JobsIconfontManager.shared loadAsset:asset
                           intoImageView:self
                              targetSize:targetSize
                            forceRefresh:forceRefresh
                              completion:completion];
    return self;
}

-(instancetype)byCancelJobsIconfontLoad{
    [JobsIconfontManager.shared cancelLoadInImageView:self];
    return self;
}

@end

@implementation UILabel (JobsIconfont)
-(instancetype)byJobsIconfontGlyph:(JobsIconfontGlyph)glyph
                              size:(CGFloat)size
                             color:(UIColor *)color{
    self.font = [JobsIconfontManager.shared iconFontOfSize:size];
    self.text = [JobsIconfontManager.shared unicodeStringForGlyph:glyph];
    self.textColor = color;
    return self;
}

-(instancetype)byJobsIconfontTextSize:(CGFloat)size{
    self.font = [JobsIconfontManager.shared textFontOfSize:size];
    return self;
}

@end

@implementation UIButton (JobsIconfont)
-(instancetype)byJobsIconfontGlyph:(JobsIconfontGlyph)glyph
                         imageSize:(CGSize)imageSize
                             color:(UIColor *)color
                          forState:(UIControlState)state{
    [self setImage:[JobsIconfontManager.shared iconImageForGlyph:glyph
                                                           size:imageSize
                                                          color:color]
          forState:state];
    return self;
}

@end

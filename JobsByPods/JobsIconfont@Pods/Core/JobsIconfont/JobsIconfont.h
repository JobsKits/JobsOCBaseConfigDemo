//
//  JobsIconfont.h
//  JobsIconfont
//
//  Created by Jobs on 2026年7月25日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSICONFONT_DA89155D3B
#define JOBS_HEADER_GUARD_JOBSICONFONT_DA89155D3B

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString *JobsIconfontRemoteAsset NS_TYPED_ENUM;
FOUNDATION_EXPORT JobsIconfontRemoteAsset const JobsIconfontRemoteAssetLogo;
FOUNDATION_EXPORT JobsIconfontRemoteAsset const JobsIconfontRemoteAssetFontBanner;
FOUNDATION_EXPORT JobsIconfontRemoteAsset const JobsIconfontRemoteAssetUsageGuide;
FOUNDATION_EXPORT JobsIconfontRemoteAsset const JobsIconfontRemoteAssetInvalidURL;

typedef NS_ENUM(NSInteger, JobsIconfontGlyph) {
    JobsIconfontGlyphSwitcher,
    JobsIconfontGlyphIPhone,
    JobsIconfontGlyphDirection,
    JobsIconfontGlyphPicture,
    JobsIconfontGlyphLodging,
    JobsIconfontGlyphSort,
    JobsIconfontGlyphPrevious,
    JobsIconfontGlyphNext,
    JobsIconfontGlyphVerified,
    JobsIconfontGlyphComponent
};

typedef NS_ENUM(NSInteger, JobsIconfontLoadStage) {
    JobsIconfontLoadStagePlaceholder,
    JobsIconfontLoadStageSuccess,
    JobsIconfontLoadStageFailure
};

@interface JobsIconfontLoadResult : NSObject

@property(nonatomic,assign,readonly)JobsIconfontLoadStage stage;
@property(nonatomic,copy,readonly)NSString *loaderName;
@property(nonatomic,assign,readonly,getter=isCacheHit)BOOL cacheHit;
@property(nonatomic,strong,readonly,nullable)NSError *error;

@end

typedef void(^JobsIconfontLoadCompletion)(JobsIconfontLoadResult *result);

@interface JobsIconfontLoadToken : NSObject

-(void)cancel;

@end

@interface JobsIconfontManager : NSObject

@property(class,nonatomic,strong,readonly)JobsIconfontManager *shared;

-(UIFont *)iconFontOfSize:(CGFloat)size;
-(UIFont *)textFontOfSize:(CGFloat)size;
-(NSString *)titleForGlyph:(JobsIconfontGlyph)glyph;
-(NSString *)titleForRemoteAsset:(JobsIconfontRemoteAsset)asset;

-(UIImage *)iconImageForGlyph:(JobsIconfontGlyph)glyph
                        size:(CGSize)size
                       color:(UIColor *)color;
-(UIImage *)iconImageForGlyph:(JobsIconfontGlyph)glyph
                        size:(CGSize)size
                       color:(UIColor *)color
             backgroundColor:(UIColor *)backgroundColor;
-(UIImage *)placeholderImageForAsset:(JobsIconfontRemoteAsset)asset
                                size:(CGSize)size;

-(JobsIconfontLoadToken *)loadAsset:(JobsIconfontRemoteAsset)asset
                      intoImageView:(UIImageView *)imageView
                         targetSize:(CGSize)targetSize
                       forceRefresh:(BOOL)forceRefresh
                         completion:(nullable JobsIconfontLoadCompletion)completion;
-(void)cancelLoadInImageView:(UIImageView *)imageView;
-(void)clearImageCache:(nullable dispatch_block_t)completion;

@end

@interface UIImageView (JobsIconfont)

-(instancetype)byJobsIconfontAsset:(JobsIconfontRemoteAsset)asset
                        targetSize:(CGSize)targetSize
                      forceRefresh:(BOOL)forceRefresh
                        completion:(nullable JobsIconfontLoadCompletion)completion;
-(instancetype)byCancelJobsIconfontLoad;

@end

@interface UILabel (JobsIconfont)

-(instancetype)byJobsIconfontGlyph:(JobsIconfontGlyph)glyph
                              size:(CGFloat)size
                             color:(UIColor *)color;
-(instancetype)byJobsIconfontTextSize:(CGFloat)size;

@end

@interface UIButton (JobsIconfont)

-(instancetype)byJobsIconfontGlyph:(JobsIconfontGlyph)glyph
                         imageSize:(CGSize)imageSize
                             color:(UIColor *)color
                          forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSICONFONT_DA89155D3B */

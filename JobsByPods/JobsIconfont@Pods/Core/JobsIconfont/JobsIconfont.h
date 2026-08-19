//
//  JobsIconfont.h
//  JobsIconfont
//
//  Created by Jobs on 2026年7月25日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSICONFONT_DA89155D3B
#define JOBS_HEADER_GUARD_JOBSICONFONT_DA89155D3B

#import <UIKit/UIKit.h>

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

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
-(jobsByVoidBlock _Nonnull)jobsCancel;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsIconfontLoadToken
-(JobsRetJobsIconfontLoadTokenByBOOLBlock _Nonnull)byCancelled;
-(JobsRetJobsIconfontLoadTokenBydispatch_block_tBlock _Nonnull)byCancellation;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsIconfontLoadToken
@end

@interface JobsIconfontManager : NSObject

@property(class,nonatomic,strong,readonly)JobsIconfontManager *shared;

-(JobsRetUIFontByCGFloatBlock _Nonnull)iconFontOfSize;
-(JobsRetUIFontByCGFloatBlock _Nonnull)textFontOfSize;
-(JobsRetNSStringByJobsIconfontGlyphBlock _Nonnull)titleForGlyph;
-(JobsRetNSStringByJobsIconfontRemoteAssetBlock _Nonnull)titleForRemoteAsset;

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
-(jobsByImageViewBlock _Nonnull)cancelLoadInImageView;
-(jobsBydispatch_block_tBlock _Nonnull)clearImageCache;

@end

@interface UIImageView (JobsIconfont)

-(instancetype)byJobsIconfontAsset:(JobsIconfontRemoteAsset)asset
                        targetSize:(CGSize)targetSize
                      forceRefresh:(BOOL)forceRefresh
                        completion:(nullable JobsIconfontLoadCompletion)completion;
-(JobsRetIDByVoidBlock _Nonnull)byCancelJobsIconfontLoad;

@end

@interface UILabel (JobsIconfont)

-(instancetype)byJobsIconfontGlyph:(JobsIconfontGlyph)glyph
                              size:(CGFloat)size
                             color:(UIColor *)color;
-(JobsRetIDByCGFloatBlock _Nonnull)byJobsIconfontTextSize;

@end

@interface UIButton (JobsIconfont)

-(instancetype)byJobsIconfontGlyph:(JobsIconfontGlyph)glyph
                         imageSize:(CGSize)imageSize
                             color:(UIColor *)color
                          forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSICONFONT_DA89155D3B */

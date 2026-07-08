//
//  JobsMosaicBaseDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#endif

#import "JobsMosaicBrushImageView.h"
#import "UIImage+JobsMosaicDemo.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMosaicBaseDemoVC : BaseViewController

Prop_strong()JobsMosaicBrushImageView *imageView;
Prop_strong()UILabel *statusLabel;
Prop_strong()UIImage *originalImage;
Prop_assign()BOOL hasEdited;

-(NSString *)pageTitle;
-(UIImage *_Nullable)imageForSaving;
-(void)onImageLoaded:(UIImage *)image;
-(void)showStatus:(NSString *)text
 hiddenAfterDelay:(BOOL)hiddenAfterDelay;

@end

NS_ASSUME_NONNULL_END

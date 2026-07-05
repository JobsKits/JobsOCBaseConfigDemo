//
//  CALayer+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月5日，星期五.
//

#ifndef JOBS_HEADER_GUARD_CALAYER_DSL_9B8E3D3A51
#define JOBS_HEADER_GUARD_CALAYER_DSL_9B8E3D3A51

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (JobsChain)

#pragma mark —— Geometry
-(JobsRetCALayerByCGRectBlock _Nonnull)byBounds;
-(JobsRetCALayerByCGRectBlock _Nonnull)byFrame;
-(JobsRetCALayerByCGPointBlock _Nonnull)byPosition;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byZPosition;
-(JobsRetCALayerByCGPointBlock _Nonnull)byAnchorPoint;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byAnchorPointZ;
-(JobsRetCALayerByCATransform3DBlock _Nonnull)byTransform;
-(JobsRetCALayerByCGAffineTransformBlock _Nonnull)bySetAffineTransform;
-(JobsRetCALayerByCATransform3DBlock _Nonnull)bySublayerTransform;

#pragma mark —— Hierarchy
/// 对 QuartzCore API addSublayer 的二次封装：附着在父图层上
-(JobsRetCALayerByCALayerBlock _Nonnull)addOn;
/// 对 QuartzCore API addSublayer 的二次封装：加入子图层
-(JobsRetCALayerByCALayerBlock _Nonnull)addBy;
-(JobsRetCALayerByCALayerBlock _Nonnull)byAddSublayer;
-(JobsRetCALayerByArrBlock _Nonnull)bySublayers;
-(JobsRetCALayerByCALayerBlock _Nonnull)byMask;
-(JobsRetCALayerByVoidBlock _Nonnull)byRemoveFromSuperlayer;

#pragma mark —— Display
-(JobsRetCALayerByCGCorRefBlock _Nonnull)byBgColor;
-(JobsRetCALayerByCorBlock _Nonnull)byBgColorUIColor;
-(JobsRetCALayerByCGCorRefBlock _Nonnull)byBackgroundColor;
-(JobsRetCALayerByCorBlock _Nonnull)byBackgroundColorUIColor;
-(JobsRetCALayerByIDBlock _Nonnull)byContents;
-(JobsRetCALayerByCGRectBlock _Nonnull)byContentsRect;
-(JobsRetCALayerByCALayerContentsGravityBlock _Nonnull)byContentsGravity;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byContentsScale;
-(JobsRetCALayerByCGRectBlock _Nonnull)byContentsCenter;
-(JobsRetCALayerByCALayerContentsFormatBlock _Nonnull)byContentsFormat;
-(JobsRetCALayerByCALayerContentsFilterBlock _Nonnull)byMinificationFilter;
-(JobsRetCALayerByCALayerContentsFilterBlock _Nonnull)byMagnificationFilter;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byMinificationFilterBias;
-(JobsRetCALayerByCAToneMapModeBlock _Nonnull)byToneMapMode API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos);
-(JobsRetCALayerByCADynamicRangeBlock _Nonnull)byPreferredDynamicRange API_AVAILABLE(ios(26.0), tvos(26.0), visionos(26.0)) API_UNAVAILABLE(watchos);
-(JobsRetCALayerByCGFloatBlock _Nonnull)byContentsHeadroom API_AVAILABLE(ios(26.0), tvos(26.0), visionos(26.0)) API_UNAVAILABLE(watchos);
-(JobsRetCALayerByBOOLBlock _Nonnull)byOpaque;
-(JobsRetCALayerByBOOLBlock _Nonnull)byNeedsDisplayOnBoundsChange;
-(JobsRetCALayerByBOOLBlock _Nonnull)byDrawsAsynchronously;
-(JobsRetCALayerByVoidBlock _Nonnull)bySetNeedsDisplay;
-(JobsRetCALayerByCGRectBlock _Nonnull)bySetNeedsDisplayInRect;
-(JobsRetCALayerByVoidBlock _Nonnull)byDisplayIfNeeded;
-(JobsRetCALayerByCGContextRefBlock _Nonnull)byDrawInContext;
-(JobsRetCALayerByCGContextRefBlock _Nonnull)byRenderInContext;

#pragma mark —— Visibility
-(JobsRetCALayerByCGFloatBlock _Nonnull)byAlpha;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byOpacity;
-(JobsRetCALayerByBOOLBlock _Nonnull)byHidden;
-(JobsRetCALayerByBOOLBlock _Nonnull)byMasksToBounds;
-(JobsRetCALayerByBOOLBlock _Nonnull)byDoubleSided;
-(JobsRetCALayerByBOOLBlock _Nonnull)byGeometryFlipped;

#pragma mark —— Border / Shadow
-(JobsRetCALayerByCGFloatBlock _Nonnull)byCornerRadius;
-(JobsRetCALayerByCACornerMaskBlock _Nonnull)byMaskedCorners;
-(JobsRetCALayerByCALayerCornerCurveBlock _Nonnull)byCornerCurve;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byBorderWidth;
-(JobsRetCALayerByCGCorRefBlock _Nonnull)byBorderColor;
-(JobsRetCALayerByCorBlock _Nonnull)byBorderColorUIColor;
-(JobsRetCALayerByCGCorRefBlock _Nonnull)byShadowColor;
-(JobsRetCALayerByCorBlock _Nonnull)byShadowColorUIColor;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byShadowOpacity;
-(JobsRetCALayerByCGSizeBlock _Nonnull)byShadowOffset;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byShadowRadius;
-(JobsRetCALayerByCGPathRefBlock _Nonnull)byShadowPath;

#pragma mark —— Filters / Rasterize
-(JobsRetCALayerByIDBlock _Nonnull)byCompositingFilter;
-(JobsRetCALayerByArrBlock _Nonnull)byFilters;
-(JobsRetCALayerByArrBlock _Nonnull)byBackgroundFilters;
-(JobsRetCALayerByBOOLBlock _Nonnull)byShouldRasterize;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byRasterizationScale;
-(JobsRetCALayerByBOOLBlock _Nonnull)byAllowsGroupOpacity;
-(JobsRetCALayerByCAEdgeAntialiasingMaskBlock _Nonnull)byEdgeAntialiasingMask;
-(JobsRetCALayerByBOOLBlock _Nonnull)byAllowsEdgeAntialiasing;

#pragma mark —— Layout / Action
-(JobsRetCALayerByDelegateBlock _Nonnull)byDelegate;
-(JobsRetCALayerByNSDictionaryBlock _Nonnull)byActions;
-(JobsRetCALayerByNSDictionaryBlock _Nonnull)byStyle;
-(JobsRetCALayerByStringBlock _Nonnull)byName;
-(JobsRetCALayerByVoidBlock _Nonnull)bySetNeedsLayout;
-(JobsRetCALayerByVoidBlock _Nonnull)byLayoutIfNeeded;
-(JobsRetCALayerByCAAnimationKeyBlock _Nonnull)byAddAnimation;
-(JobsRetCALayerByStringBlock _Nonnull)byRemoveAnimationForKey;
-(JobsRetCALayerByVoidBlock _Nonnull)byRemoveAllAnimations;

-(JobsRetCAActionByStringBlock _Nonnull)byActionForKey;
-(JobsRetBOOLByPointBlock _Nonnull)byContainsPoint;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CALAYER_DSL_9B8E3D3A51 */

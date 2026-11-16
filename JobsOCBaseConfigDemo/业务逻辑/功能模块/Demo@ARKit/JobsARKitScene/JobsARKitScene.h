//
//  JobsARKitScene.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

#import <UIKit/UIKit.h>
#import <ARKit/ARKit.h>
#import <SceneKit/SceneKit.h>
#import <AVFoundation/AVFoundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// ARKit / SceneKit 管线边界；页面只处理教学内容和用户意图。
@interface JobsARKitScene : NSObject <ARSCNViewDelegate, ARSessionDelegate>

Prop_strong(readonly) UIView *view;
Prop_copy() void (^onChange)(NSString *statusKey, NSUInteger planeCount, NSUInteger objectCount);
Prop_assign(readonly) BOOL previewing;
Prop_assign() NSUInteger modelIndex;
Prop_assign(readonly) NSUInteger selectedModelIndex;
Prop_assign(readonly) BOOL canPlaceAtCenter;
Prop_copy(readonly) NSString *selectionDescription;

-(void)resume;
-(void)pause;
-(void)start;
-(void)showPreview;
-(void)reset;
-(void)clear;
-(void)placeAtPoint:(CGPoint)point;
-(void)rotate;
-(void)resizeBy:(CGFloat)factor;

@end

NS_ASSUME_NONNULL_END

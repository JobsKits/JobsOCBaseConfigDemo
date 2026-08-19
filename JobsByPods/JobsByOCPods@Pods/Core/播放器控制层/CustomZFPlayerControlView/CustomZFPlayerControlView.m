//
//  CustomZFPlayerControlView.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CustomZFPlayerControlView.h"

@interface CustomZFPlayerControlView ()

Prop_copy()jobsByTwoIDBlock customZFPlayerControlViewBlock;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN CustomZFPlayerControlView
@interface CustomZFPlayerControlView (JobsPropertyDSLSetterAutogen_d0f583561d)
-(void)setCustomZFPlayerControlViewBlock:(jobsByTwoIDBlock)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END CustomZFPlayerControlView

@implementation CustomZFPlayerControlView
-(jobsByZFPlayerGestureControlBlock _Nonnull)gestureSingleTapped{
    @jobs_weakify(self)
    return ^(ZFPlayerGestureControl * gestureControl){
        @jobs_strongify(self)
        if (!self) return;
        [self endEditing:YES];
        if (self.customZFPlayerControlViewBlock) self.customZFPlayerControlViewBlock(NSStringFromSelector(_cmd),@1);
    };
}

-(jobsByZFPlayerGestureControlBlock _Nonnull)gestureDoubleTapped{
    @jobs_weakify(self)
    return ^(ZFPlayerGestureControl * gestureControl){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"");
        [self endEditing:YES];
    };
}
//走一次
-(void)gestureBeganPan:(ZFPlayerGestureControl *)gestureControl
          panDirection:(ZFPanDirection)direction
           panLocation:(ZFPanLocation)location{
    JobsLog(@"");
//    //UITableViewCell自动滚动到顶部
//    [tableView scrollToRowAtIndexPath:jobsMakeIndexPathZero()
//                     atScrollPosition:UITableViewScrollPositionTop
//                             animated:YES];
}
//走多次
-(void)gestureChangedPan:(ZFPlayerGestureControl *)gestureControl
            panDirection:(ZFPanDirection)direction
             panLocation:(ZFPanLocation)location
            withVelocity:(CGPoint)velocity{
    JobsLog(@"");
}
//走一次
-(void)gestureEndedPan:(ZFPlayerGestureControl *)gestureControl
          panDirection:(ZFPanDirection)direction
           panLocation:(ZFPanLocation)location{
    if (self.customZFPlayerControlViewBlock) {
        JobsLog(@"%@",NSStringFromSelector(_cmd));
        self.customZFPlayerControlViewBlock(NSStringFromSelector(_cmd),
                                            @(gestureControl.panMovingDirection));
    }
}

-(void)gesturePinched:(ZFPlayerGestureControl *)gestureControl
                scale:(float)scale{
    JobsLog(@"");
}

-(jobsByjobsByTwoIDBlockBlock _Nonnull)actionCustomZFPlayerControlViewBlock{
    @jobs_weakify(self)
    return ^(jobsByTwoIDBlock _Nullable customZFPlayerControlViewBlock){
        @jobs_strongify(self)
        if (!self) return;
        self.byCustomZFPlayerControlViewBlock(customZFPlayerControlViewBlock);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN CustomZFPlayerControlView
-(JobsRetCustomZFPlayerControlViewByjobsByTwoIDBlockBlock _Nonnull)byCustomZFPlayerControlViewBlock{
    @jobs_weakify(self)
    return ^__kindof CustomZFPlayerControlView * _Nullable(jobsByTwoIDBlock data){
        @jobs_strongify(self)
        [self setCustomZFPlayerControlViewBlock:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END CustomZFPlayerControlView
@end

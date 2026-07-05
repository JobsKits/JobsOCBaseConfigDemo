//
//  ASButtonNode+DSL.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ASButtonNode+DSL.h"

JobsKey(kJobsButtonTapBlockKey)
JobsKey(kJobsButtonLongPressBlockKey)
JobsKey(kJobsButtonLongPressGRKey)
@implementation ASButtonNode (DSL)

-(JobsRetButtonNodeByTitleConfigBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(NSString *_Nonnull title,
                                            UIFont *_Nullable font,
                                            UIColor *_Nullable color,
                                            UIControlState state){
        @jobs_strongify(self)
        NSMutableDictionary<NSAttributedStringKey, id> *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = font ?: [UIFont systemFontOfSize:[UIFont buttonFontSize]];
        if (color) attrs[NSForegroundColorAttributeName] = color;
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:title ?: @"" attributes:attrs];
        [self setAttributedTitle:attr forState:state];
        return self;
    };
}

-(JobsRetButtonNodeImageByConfigBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(UIImage *_Nonnull image, UIControlState state){
        @jobs_strongify(self)
        if (image) [self setImage:image forState:state];
        return self;
    };
}

-(JobsRetButtonNodeByHitTestSlopBlock _Nonnull)byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.contentEdgeInsets = insets;
        return self;
    };
}

-(JobsRetButtonNodeByBackgroundColorsBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.backgroundColor = color;

        return self;
    };
}

-(JobsRetButtonNodeByCornerRadiusBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(CGFloat radius){
        @jobs_strongify(self)
        self.cornerRadius = radius;
        return self;
    };
}

-(JobsRetButtonNodeByHitTestSlopBlock _Nonnull)byHitTestSlop{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(UIEdgeInsets slop){
        @jobs_strongify(self)
        self.hitTestSlop = slop;
        return self;
    };
}
/// 短按（点击）封装
-(JobsRetButtonNodeByOnClickBlock _Nonnull)onClickBy{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(jobsByButtonNodeBlock _Nullable handler){
        @jobs_strongify(self)
        // 存 Handler
        Jobs_setAssociatedCOPY_NONATOMIC(kJobsButtonTapBlockKey, handler)
        // 先移除后绑定，避免重复
        [self removeTarget:self action:@selector(_jobs_handleTap:) forControlEvents:ASControlNodeEventTouchUpInside];
        [self addTarget:self action:@selector(_jobs_handleTap:) forControlEvents:ASControlNodeEventTouchUpInside];
        return self;
    };
}

-(void)_jobs_handleTap:(__unused ASButtonNode *)sender{
    jobsByButtonNodeBlock block = Jobs_getAssociatedObject(kJobsButtonTapBlockKey);
    if (block) block(self);
}
/// 长按封装（默认 & 自定义）
-(JobsRetButtonNodeByOnLongPressBlock _Nonnull)onLongPressGestureBy{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(jobsByButtonNodeLongPressBlock _Nullable handler){
        @jobs_strongify(self)
        return self.onLongPressGestureWith(0.5, 10.0, handler); // 默认参数
    };
}

-(JobsRetButtonNodeByOnLongPressWithTimeBlock _Nonnull)onLongPressGestureWith{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(NSTimeInterval minDuration,
             CGFloat allowableMovement,
             jobsByButtonNodeLongPressBlock _Nullable handler){
        @jobs_strongify(self)
        // 存 Handler
        Jobs_setAssociatedCOPY_NONATOMIC(kJobsButtonLongPressBlockKey, handler)
        // 取/建 GR（只加一次）
        UILongPressGestureRecognizer *gr = Jobs_getAssociatedObject(kJobsButtonLongPressGRKey);
        if (!gr){
            gr = [UILongPressGestureRecognizer.alloc initWithTarget:self action:@selector(_jobs_handleLongPress:)];
            Jobs_setAssociatedRETAIN_NONATOMIC(kJobsButtonLongPressGRKey, gr)
            // ⚠️ 需要 view，直接访问会触发 loadView：在 DSL 场景可接受
            [self.view addGestureRecognizer:gr];
        }
        gr.minimumPressDuration = MAX(0.0, minDuration);
        gr.allowableMovement   = MAX(0.0, allowableMovement);

        return self;
    };
}

-(void)_jobs_handleLongPress:(UILongPressGestureRecognizer *)gr{
    if (gr.state != UIGestureRecognizerStateBegan) return;
    jobsByButtonNodeLongPressBlock block = Jobs_getAssociatedObject(kJobsButtonLongPressBlockKey);
    if (block) block(self, gr);
}

@end

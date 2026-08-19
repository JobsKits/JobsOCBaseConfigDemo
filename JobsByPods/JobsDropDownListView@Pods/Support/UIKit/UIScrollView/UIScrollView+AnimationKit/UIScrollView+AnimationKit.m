//
//  UIScrollView+AnimationKit.m
//  JobsDropDownListView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIScrollView+AnimationKit.h"

@implementation UIScrollView (AnimationKit)
#pragma mark —— 一些私有方法
-(void)sortingType:(SortingType)sortingType
             cells:(NSArray *)cells
             block:(jobsByNSUIntegerBlock)block{
    if (sortingType == SortingType_Positive) {
        for (NSUInteger i = 0; i < cells.count; i++) if (block) block(i);
    }else if (sortingType == SortingType_Reverse){
        for (NSUInteger i = cells.count - 1; i > 0; i--) if (block) block(i);
    }else{}
}
#pragma mark —— moveAnimation
-(void)moveAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray *cells = self.scrollViewCells;
    CGFloat totalTime = 0.3;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        cell.byTransform(CGAffineTransformMakeTranslation(-JobsMainScreen_WIDTH(), 0));
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.25
                              delay:i * (totalTime/cells.count)
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.byTransform(CGAffineTransformIdentity);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— moveSpringAnimation
-(void)moveSpringAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                     completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray <UIView *>*cells = self.scrollViewCells;
    CGFloat totalTime = 0.4;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        cell.byTransform(CGAffineTransformMakeTranslation(-JobsMainScreen_WIDTH(), 0));
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.4
                              delay:i * (totalTime/cells.count)
             usingSpringWithDamping:0.7
              initialSpringVelocity:1 / 0.7
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
            @jobs_strongify(cell)
            cell.byTransform(CGAffineTransformIdentity);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— alphaAnimation
-(void)alphaAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray *cells = self.scrollViewCells;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = nil;
        if (sortingType == SortingType_Positive) {
            cell = self.scrollViewCellsByIndex(i);
        }else if (sortingType == SortingType_Reverse){
            cell = self.scrollViewCellsByIndex(self.scrollViewCells.count - 1 - i);
        }else{}
        cell.byAlpha(0.0);
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.3
                              delay:i * 0.05
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.byAlpha(1.0);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— fallAnimation
-(void)fallAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSTimeInterval totalTime = 0.8;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        cell.byTransform(CGAffineTransformMakeTranslation(0, - JobsMainScreen_HEIGHT()));
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.3
                              delay:(cells.count - i) * (totalTime / cells.count)
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.byTransform(CGAffineTransformIdentity);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— shakeAnimation
-(void)shakeAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray *cells = self.scrollViewCells;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        if (i % 2 == 0) {
            cell.byTransform(CGAffineTransformMakeTranslation(-JobsMainScreen_WIDTH(),0));
        }else {
            cell.byTransform(CGAffineTransformMakeTranslation(JobsMainScreen_WIDTH(),0));
        }
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.4
                              delay:i * 0.03
             usingSpringWithDamping:0.75
              initialSpringVelocity:1 / 0.75
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.byTransform(CGAffineTransformIdentity);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— overTurnAnimation
-(void)overTurnAnimWithSortingType:(SortingType)sortingType
                    animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                   completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSTimeInterval totalTime = 0.7;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        cell.layer.byOpacity(0.0);
        cell.layer.byTransform(CATransform3DMakeRotation(M_PI, 1, 0, 0));
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.3
                              delay:i * (totalTime / cells.count)
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.layer.byOpacity(1.0);
            cell.layer.byTransform(CATransform3DIdentity);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— toTopAnimation
-(void)toTopAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSTimeInterval totalTime = 0.8;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        cell.byTransform(CGAffineTransformMakeTranslation(0,JobsMainScreen_HEIGHT()));
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.35
                              delay:i*(totalTime/cells.count)
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            @jobs_strongify(cell)
            cell.byTransform(CGAffineTransformIdentity);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— springListAnimation
-(void)springListAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                     completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSTimeInterval totalTime = 1.0;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        cell.layer.byOpacity(0.7);
        cell.layer.byTransform(CATransform3DMakeTranslation(0, -JobsMainScreen_HEIGHT(), 20));
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.4
                              delay:i * (totalTime/cells.count)
             usingSpringWithDamping:0.65
              initialSpringVelocity:1 / 0.65
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
            @jobs_strongify(cell)
            cell.layer.byOpacity(1.0);
            cell.layer.byTransform(CATransform3DMakeTranslation(0, 0, 20));
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— shrinkToTopAnimation
-(void)shrinkToTopAnimWithSortingType:(SortingType)sortingType
                       animationBlock:(jobsByVoidBlock _Nullable)animationBlock{
    NSArray *cells = self.scrollViewCells;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        CGRect rect = [cell convertRect:cell.bounds fromView:self];
        cell.byTransform(CGAffineTransformMakeTranslation(0, -rect.origin.y));
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.5
                         animations:^{
            @jobs_strongify(cell)
            cell.byTransform(CGAffineTransformIdentity);
            if (animationBlock) animationBlock();
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— layDownAnimation
-(void)layDownAnimWithSortingType:(SortingType)sortingType
                   animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                  completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSMutableArray *rectArr = NSMutableArray.array;
    NSTimeInterval totalTime = 0.8;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block1 = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        CGRect rect = cell.frame;
        rectArr.add(NSValue.byRect(rect));
        rect.origin.y = i * 10;
        cell.byFrame(rect);
        cell.layer.byTransform(CATransform3DMakeTranslation(0, 0, i * 5));
    };
    jobsByNSUIntegerBlock block2 = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        @jobs_weakify(cell)
        [UIView animateWithDuration:(totalTime/cells.count) * i
                         animations:^{
            @jobs_strongify(cell)
            cell.byFrame([rectArr.objectAt(i) CGRectValue]);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            @jobs_strongify(cell)
            cell.layer.byTransform(CATransform3DIdentity);
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block1];
    [self sortingType:sortingType
                cells:cells
                block:block2];
}
#pragma mark —— roteAnimation
-(void)roteAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    NSArray *cells = self.scrollViewCells;
    CABasicAnimation *animation = @"transform.rotation.y".basicAnimation();
    animation.byFromValue(@(-M_PI));
    animation.byToValue(0);
    animation.byDuration(0.3);
    animation.byRemovedOnCompletion(NO);
    animation.byRepeatCount(3);
    animation.byFillMode(kCAFillModeForwards);
    animation.byAutoreverses(NO);
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = self.scrollViewCellsByIndex(i);
        cell.byAlpha(0.0);
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.1
                              delay:i * 0.25
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.byAlpha(1.0);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            @jobs_strongify(cell)
            [cell.layer addAnimation:animation
                              forKey:@"rotationYkey"];
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}

@end

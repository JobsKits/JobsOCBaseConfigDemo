//
//  JXCategoryViewAnimator.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JXCategoryViewAnimator : NSObject
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, copy) void(^progressCallback)(CGFloat percent);
@property (nonatomic, copy) void(^completeCallback)(void);

- (void)start;
- (void)stop;
@end


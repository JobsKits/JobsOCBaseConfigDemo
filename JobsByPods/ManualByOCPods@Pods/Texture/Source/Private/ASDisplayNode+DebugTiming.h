//
//  ASDisplayNode+DebugTiming.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASDisplayNode.h>

@interface ASDisplayNode (DebugTiming)

@property (nonatomic, readonly) NSTimeInterval debugTimeToCreateView;
@property (nonatomic, readonly) NSTimeInterval debugTimeToApplyPendingState;
@property (nonatomic, readonly) NSTimeInterval debugTimeToAddSubnodeViews;
@property (nonatomic, readonly) NSTimeInterval debugTimeForDidLoad;

- (NSTimeInterval)debugAllCreationTime;

@end

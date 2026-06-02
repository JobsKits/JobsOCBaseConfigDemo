//
//  RefreshingSectionControllerType.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RefreshingSectionControllerType

- (void)refreshContentWithCompletion:(nullable void(^)())completion;

@end

NS_ASSUME_NONNULL_END

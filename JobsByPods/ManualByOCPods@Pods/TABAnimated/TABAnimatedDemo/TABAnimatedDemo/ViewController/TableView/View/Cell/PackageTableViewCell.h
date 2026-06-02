//
//  PackageTableViewCell.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Game;

@interface PackageTableViewCell : UITableViewCell

- (void)updateWithGame:(Game *)game;

@end

NS_ASSUME_NONNULL_END

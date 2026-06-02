//
//  TestLayoutTableViewController.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

@class Game;

NS_ASSUME_NONNULL_BEGIN

@interface TestLayoutTableViewController : BaseDemoViewController

@end

@interface TestLayoutCell : UITableViewCell

- (void)initWithData:(Game *)game;

@end

NS_ASSUME_NONNULL_END

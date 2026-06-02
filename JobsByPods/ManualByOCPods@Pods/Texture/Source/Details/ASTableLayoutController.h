//
//  ASTableLayoutController.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/ASAbstractLayoutController.h>

NS_ASSUME_NONNULL_BEGIN

@class UITableView;

/**
 *  A layout controller designed for use with UITableView.
 */
AS_SUBCLASSING_RESTRICTED
@interface ASTableLayoutController : ASAbstractLayoutController

@property (nonatomic, weak, readonly) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END

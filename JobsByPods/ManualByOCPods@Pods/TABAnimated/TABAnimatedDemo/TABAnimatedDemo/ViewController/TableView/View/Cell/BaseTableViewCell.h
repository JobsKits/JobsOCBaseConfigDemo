//
//  BaseTableViewCell.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BaseViewController;

@protocol BaseTableViewCellDelegate <NSObject>

@end

@interface BaseTableViewCell : UITableViewCell

- (void)updateWithModel:(_Nullable id)model;

+ (NSNumber *)cellSizeByClass;
+ (NSString *)cellIdentifier;
+ (CGFloat)cellHeight;
+ (NSNumber *)cellHeightNumber;

+ (instancetype)cellFromTableView:(UITableView *)tableView;

+ (instancetype)cellFromTableView:(UITableView *)tableView
                        indexPath:(NSIndexPath *)indexPath;

@property (nonatomic,strong) BaseViewController *currentController;
@property (nonatomic,weak) id <BaseTableViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

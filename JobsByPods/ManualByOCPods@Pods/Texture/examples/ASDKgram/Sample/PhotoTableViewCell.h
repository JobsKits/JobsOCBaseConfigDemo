//
//  PhotoTableViewCell.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PhotoModel.h"

@interface PhotoTableViewCell : UITableViewCell

+ (CGFloat)heightForPhotoModel:(PhotoModel *)photo withWidth:(CGFloat)width;

- (void)updateCellWithPhotoObject:(PhotoModel *)photo;

@end

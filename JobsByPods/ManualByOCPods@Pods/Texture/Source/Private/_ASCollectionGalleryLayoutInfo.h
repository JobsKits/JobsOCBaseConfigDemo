//
//  _ASCollectionGalleryLayoutInfo.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

@interface _ASCollectionGalleryLayoutInfo : NSObject

// Read-only properties
@property (nonatomic, readonly) CGSize itemSize;
@property (nonatomic, readonly) CGFloat minimumLineSpacing;
@property (nonatomic, readonly) CGFloat minimumInteritemSpacing;
@property (nonatomic, readonly) UIEdgeInsets sectionInset;

- (instancetype)initWithItemSize:(CGSize)itemSize
              minimumLineSpacing:(CGFloat)minimumLineSpacing
         minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
                    sectionInset:(UIEdgeInsets)sectionInset NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end

//
//  ASCollectionLayoutContext.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <AsyncDisplayKit/ASBaseDefines.h>
#import <AsyncDisplayKit/ASScrollDirection.h>

@class ASElementMap;

NS_ASSUME_NONNULL_BEGIN

AS_SUBCLASSING_RESTRICTED
@interface ASCollectionLayoutContext : NSObject

@property (nonatomic, readonly) CGSize viewportSize;
@property (nonatomic, readonly) CGPoint initialContentOffset;
@property (nonatomic, readonly) ASScrollDirection scrollableDirections;
@property (nonatomic, weak, readonly) ASElementMap *elements;
@property (nullable, nonatomic, readonly) id additionalInfo;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

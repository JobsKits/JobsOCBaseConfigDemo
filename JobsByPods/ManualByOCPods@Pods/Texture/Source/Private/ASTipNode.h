//
//  ASTipNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASControlNode.h>
#import <AsyncDisplayKit/ASBaseDefines.h>

#if AS_ENABLE_TIPS

@class ASTip;

NS_ASSUME_NONNULL_BEGIN

/**
 * ASTipNode will send these up the responder chain.
 */
@protocol ASTipNodeActions <NSObject>
- (void)didTapTipNode:(id)sender;
@end

AS_SUBCLASSING_RESTRICTED
@interface ASTipNode : ASControlNode

- (instancetype)initWithTip:(ASTip *)tip NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@property (nonatomic, readonly) ASTip *tip;

@end

NS_ASSUME_NONNULL_END

#endif // AS_ENABLE_TIPS

//
//  OverrideViewController.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

/*
 * A simple node that displays the attribution for the kitties in the app. Note that
 * for a regular horizontal size class it does something stupid and sets the font size to 100.
 * It's VC, OverrideViewController, will have its display traits overridden such that
 * it will always have a compact horizontal size class.
 */
@interface OverrideNode : ASDisplayNode
@end

/*
 * This is a fairly stupid VC that's main purpose is to show how to override ASDisplayTraits.
 * Take a look at `defaultImageTappedAction` in KittenNode to see how this is accomplished.
 */
@interface OverrideViewController : ASDKViewController<OverrideNode *>
@property (nonatomic, copy) dispatch_block_t closeBlock;
@end

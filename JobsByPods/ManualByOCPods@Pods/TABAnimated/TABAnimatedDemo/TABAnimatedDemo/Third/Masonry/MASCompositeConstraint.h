//
//  MASCompositeConstraint.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/MASConstraint.h>
#import <TABAnimated/MASUtilities.h>

/**
 *	A group of MASConstraint objects
 */
@interface MASCompositeConstraint : MASConstraint

/**
 *	Creates a composite with a predefined array of children
 *
 *	@param	children	child MASConstraints
 *
 *	@return	a composite constraint
 */
- (id)initWithChildren:(NSArray *)children;

@end

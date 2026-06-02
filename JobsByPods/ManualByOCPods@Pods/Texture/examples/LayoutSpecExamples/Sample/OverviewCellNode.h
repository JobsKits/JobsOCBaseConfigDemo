//
//  OverviewCellNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface OverviewCellNode : ASCellNode

@property (nonatomic, strong) Class layoutExampleClass;

- (instancetype)initWithLayoutExampleClass:(Class)layoutExampleClass NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end

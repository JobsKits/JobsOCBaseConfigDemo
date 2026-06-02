//
//  LayoutExampleViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LayoutExampleViewController.h"
#import "LayoutExampleNodes.h"

@interface LayoutExampleViewController ()
@property (nonatomic, strong) LayoutExampleNode *customNode;
@end

@implementation LayoutExampleViewController

- (instancetype)initWithLayoutExampleClass:(Class)layoutExampleClass
{
  NSAssert([layoutExampleClass isSubclassOfClass:[LayoutExampleNode class]], @"Must pass a subclass of LayoutExampleNode.");
  
  self = [super initWithNode:[ASDisplayNode new]];
  
  if (self) {
    self.title = @"Layout Example";
    
    _customNode = [layoutExampleClass new];
    [self.node addSubnode:_customNode];
    
    BOOL needsOnlyYCentering = [layoutExampleClass isEqual:[HeaderWithRightAndLeftItems class]] ||
                               [layoutExampleClass isEqual:[FlexibleSeparatorSurroundingContent class]];
                               
    self.node.backgroundColor = needsOnlyYCentering ? [UIColor lightGrayColor] : [UIColor whiteColor];
    
    __weak __typeof(self) weakself = self;
    self.node.layoutSpecBlock = ^ASLayoutSpec*(__kindof ASDisplayNode * _Nonnull node, ASSizeRange constrainedSize) {
      return [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:needsOnlyYCentering ? ASCenterLayoutSpecCenteringY : ASCenterLayoutSpecCenteringXY
                                                        sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY
                                                                child:weakself.customNode];
      };
  }
  
  return self;
}

@end

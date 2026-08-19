//
//  TDHorizontalItemNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDHorizontalItemNode.h"

@interface TDHorizontalItemNode ()

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASLayoutElementStyle
@interface ASLayoutElementStyle (JobsLocalPropertyDSLAutogen_15cee1dca7)
-(JobsRetASLayoutElementStyleByCGSizeBlock _Nonnull)byPreferredSize;
-(void)setPreferredSize:(CGSize)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASLayoutElementStyle

@implementation TDHorizontalItemNode
-(instancetype)initWithIndex:(NSInteger)idx{
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.colorNode.shouldAnimateSizeChanges = YES;
        self.text = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [NSAttributedString.alloc initWithString:[NSString stringWithFormat:@"#%ld", (long)idx]
                                                                attributes:@{
               NSFontAttributeName: [UIFont boldSystemFontOfSize:13],
               NSForegroundColorAttributeName: UIColor.whiteColor
            }];
        });
    };return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    JobsRetASLayoutSpecByASSizeRangeBlock action = ((JobsRetASLayoutSpecByASSizeRangeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDHorizontalItemNode.class, @selector(jobsLayoutSpecThatFits)))(self, @selector(jobsLayoutSpecThatFits));
    return action ? action(constrainedSize) : nil;
}

-(JobsRetASLayoutSpecByASSizeRangeBlock _Nonnull)jobsLayoutSpecThatFits{
    @jobs_weakify(self)
    return ^ASLayoutSpec *(ASSizeRange constrainedSize){
        @jobs_strongify(self)
        if (!self) return nil;
        ASCenterLayoutSpec *centerText =
        [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY
                                                   sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY
                                                           child:self.text];
        ASOverlayLayoutSpec *overlay = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_colorNode overlay:centerText];
        return overlay;
    };
}
#pragma mark —— lazyLoad
-(ASDisplayNode *)colorNode{
    if(!_colorNode){
        _colorNode = jobsMakeDisplayNode(^(ASDisplayNode * _Nullable node) {
            node
                .byBgColor(JobsRandomColor)
                .byCornerRadius(8.0);
            node.style.byPreferredSize(CGSizeMake(120, 70));
        });
    };return _colorNode;
}

@end

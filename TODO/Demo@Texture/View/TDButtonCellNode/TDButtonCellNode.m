//
//  TDButtonCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDButtonCellNode.h"

@interface TDButtonCellNode ()

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASButtonNode
@interface ASButtonNode (JobsLocalPropertyDSLAutogen_bceaa62939)
-(JobsRetASButtonNodeByNSStringBlock _Nonnull)byAccessibilityLabel;
-(void)setAccessibilityLabel:(NSString * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASButtonNode

@implementation TDButtonCellNode
-(instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.button.enabled = YES;
        self.descNode.enabled = YES;
    };return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    JobsRetASLayoutSpecByASSizeRangeBlock action = ((JobsRetASLayoutSpecByASSizeRangeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDButtonCellNode.class, @selector(jobsLayoutSpecThatFits)))(self, @selector(jobsLayoutSpecThatFits));
    return action ? action(constrainedSize) : nil;
}

-(JobsRetASLayoutSpecByASSizeRangeBlock _Nonnull)jobsLayoutSpecThatFits{
    @jobs_weakify(self)
    return ^ASLayoutSpec *(ASSizeRange constrainedSize){
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 16, 12, 16) child:jobsMakeVerticalStackLayoutSpec(^(ASStackLayoutSpec * _Nullable v) {
            @jobs_strongify(self)
            v.bySpacing(10).byAlignItems(ASStackLayoutAlignItemsStart).byChildren(@[self.button, self.descNode]);
        })];
    };
}
#pragma mark —— lazyLoad
- (ASButtonNode *)button {
    if (!_button) {
        @jobs_weakify(self)
        _button = jobsMakeButtonNode(^(ASButtonNode *node) {
            node.byTitle(@"Tap to Toggle",[UIFont boldSystemFontOfSize:15],JobsWhiteColor,UIControlStateNormal)
                .byImage(@"bolt.fill".img,UIControlStateNormal)
                .byContentEdgeInsets(UIEdgeInsetsMake(10, 14, 10, 14))
                .byBackgroundColor(UIColor.systemBlueColor)
                .byCornerRadius(8)
                .byHitTestSlop(UIEdgeInsetsMake(-10, -10, -10, -10))
                .onClickBy(^(__kindof ASButtonNode *btn) {
                    @jobs_strongify(self)
                    if (!self) return;
                    BOOL on = [self.button.backgroundColor isEqual:UIColor.systemBlueColor];
                    btn.byBgColor(on ? UIColor.systemGreenColor : UIColor.systemBlueColor);
                    btn.byAccessibilityLabel(@"Tap to Toggle");
                    [self setNeedsLayout];
                })
                .onLongPressGestureBy(^(__kindof ASButtonNode *btn, UILongPressGestureRecognizer *gr) {
                    @jobs_strongify(self)
                    if (!self) return;
                    JobsLog(@"长按触发 %@", gr);
                });
        });
    };return _button;
}

-(ASTextNode *)descNode{
    if(!_descNode){
        _descNode = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [[NSAttributedString alloc] initWithString:@"ASButtonNode 支持高性能点击态、图片&标题、对齐和触控扩展区域。"
                                                                  attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:13],
                NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    };return _descNode;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ASButtonNode
@implementation ASButtonNode (JobsLocalPropertyDSLAutogen_bceaa62939)
-(JobsRetASButtonNodeByNSStringBlock _Nonnull)byAccessibilityLabel{
    @jobs_weakify(self)
    return ^__kindof ASButtonNode * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setAccessibilityLabel:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ASButtonNode

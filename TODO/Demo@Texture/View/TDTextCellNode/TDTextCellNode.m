//
//  TDTextCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDTextCellNode.h"

@interface TDTextCellNode ()

@end

@implementation TDTextCellNode
- (instancetype)initWithTitle:(NSString *)t subtitle:(NSString *)s {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.byBgColor(UIColor.systemBackgroundColor);
        self.neverShowPlaceholders = NO; // 展示占位渲染
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.title = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.truncationMode = NSLineBreakByTruncatingTail;
            node.maximumNumberOfLines = 2;
            node.attributedText = [NSAttributedString.alloc initWithString:t
                                                                attributes:@{
                NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
                NSForegroundColorAttributeName: UIColor.labelColor
            }];
        });
        self.subtitle = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.maximumNumberOfLines = 3;
            node.attributedText = [NSAttributedString.alloc initWithString:s
                                                                attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:13],
                NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    };return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    JobsRetASLayoutSpecByASSizeRangeBlock action = ((JobsRetASLayoutSpecByASSizeRangeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDTextCellNode.class, @selector(jobsLayoutSpecThatFits)))(self, @selector(jobsLayoutSpecThatFits));
    return action ? action(constrainedSize) : nil;
}

-(JobsRetASLayoutSpecByASSizeRangeBlock _Nonnull)jobsLayoutSpecThatFits{
    @jobs_weakify(self)
    return ^ASLayoutSpec *(ASSizeRange constrainedSize){
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 16, 12, 16)
                                                      child:jobsMakeVerticalStackLayoutSpec(^(__kindof ASStackLayoutSpec * _Nullable layout) {
            @jobs_strongify(self)
            layout.bySpacing(6).byChildren(@[self.title, self.subtitle]);
        })];
    };
}

@end

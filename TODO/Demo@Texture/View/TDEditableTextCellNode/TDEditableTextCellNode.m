//
//  TDEditableTextCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDEditableTextCellNode.h"

@interface TDEditableTextCellNode ()

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASEditableTextNode
@interface ASEditableTextNode (JobsLocalPropertyDSLAutogen_735f6fdb4c)
-(JobsRetASEditableTextNodeByCGColorRefBlock _Nonnull)byBorderColor;
-(JobsRetASEditableTextNodeByCGFloatBlock _Nonnull)byBorderWidth;
-(void)setBorderColor:(CGColorRef)data;
-(void)setBorderWidth:(CGFloat)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASEditableTextNode

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASLayoutElementStyle
@interface ASLayoutElementStyle (JobsLocalPropertyDSLAutogen_735f6fdb4c)
-(JobsRetASLayoutElementStyleByCGSizeBlock _Nonnull)byPreferredSize;
-(void)setPreferredSize:(CGSize)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASLayoutElementStyle

@implementation TDEditableTextCellNode
-(instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.editable.scrollEnabled = YES;
        self.hint.placeholderEnabled = YES;
    };return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    JobsRetASLayoutSpecByASSizeRangeBlock action = ((JobsRetASLayoutSpecByASSizeRangeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDEditableTextCellNode.class, @selector(jobsLayoutSpecThatFits)))(self, @selector(jobsLayoutSpecThatFits));
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
            v.bySpacing(8).byChildren(@[self.editable, self.hint]);
        })];
    };
}
#pragma mark —— lazyLoad
- (ASEditableTextNode *)editable {
    if (!_editable) {
        @jobs_weakify(self)
        _editable = jobsMakeEditableTextNode(^(__kindof ASEditableTextNode *node) {
            @jobs_strongify(self)
            node.byText([NSAttributedString.alloc initWithString:@"可编辑内容……"
                                                      attributes:@{
                NSFontAttributeName : [UIFont systemFontOfSize:15],
                NSForegroundColorAttributeName : UIColor.labelColor
            }])
            .byTypingAttributes(@{
                NSForegroundColorAttributeName : UIColor.labelColor,
                NSFontAttributeName : [UIFont systemFontOfSize:15]
            })
            .byTextContainerInset(UIEdgeInsetsMake(8, 8, 8, 8))
                .byBorderWidth(1)
                .byBorderColor(UIColor.separatorColor.CGColor)
                .byDelegate(self)
                .byPreferredSize(CGSizeMake(0, 80));
        });
    };return _editable;
}

-(ASTextNode *)hint{
    if(!_hint){
        _hint = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [NSAttributedString.alloc initWithString:@"ASEditableTextNode：异步文本编辑，避免主线程卡顿。"
                                                                attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:12],
                NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    };return _hint;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ASEditableTextNode
@implementation ASEditableTextNode (JobsLocalPropertyDSLAutogen_735f6fdb4c)
-(JobsRetASEditableTextNodeByCGColorRefBlock _Nonnull)byBorderColor{
    @jobs_weakify(self)
    return ^__kindof ASEditableTextNode * _Nullable(CGColorRef data){
        @jobs_strongify(self)
        [self setBorderColor:data];
        return self;
    };
}

-(JobsRetASEditableTextNodeByCGFloatBlock _Nonnull)byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof ASEditableTextNode * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBorderWidth:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ASEditableTextNode

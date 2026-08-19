//
//  TDNetImageCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDNetImageCellNode.h"

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASNetworkImageNode
@interface ASNetworkImageNode (JobsLocalPropertyDSLAutogen_1c3a38262f)
-(JobsRetASNetworkImageNodeByCGFloatBlock _Nonnull)byCornerRadius;
-(JobsRetASNetworkImageNodeByNSTimeIntervalBlock _Nonnull)byPlaceholderFadeDuration;
-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byClipsToBounds;
-(void)setClipsToBounds:(BOOL)data;
-(void)setCornerRadius:(CGFloat)data;
-(void)setPlaceholderFadeDuration:(NSTimeInterval)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASNetworkImageNode

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASLayoutElementStyle
@interface ASLayoutElementStyle (JobsLocalPropertyDSLAutogen_1c3a38262f)
-(JobsRetASLayoutElementStyleByCGSizeBlock _Nonnull)byPreferredSize;
-(void)setPreferredSize:(CGSize)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASLayoutElementStyle

@implementation TDNetImageCellNode
-(instancetype)initWithURL:(NSURL *)url text:(NSString *)text {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.netImage.URL = url;
        self.title = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [[NSAttributedString alloc] initWithString:text
                                                                  attributes:@{
              NSFontAttributeName: [UIFont systemFontOfSize:13 weight:UIFontWeightMedium],
              NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    };return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    JobsRetASLayoutSpecByASSizeRangeBlock action = ((JobsRetASLayoutSpecByASSizeRangeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDNetImageCellNode.class, @selector(jobsLayoutSpecThatFits)))(self, @selector(jobsLayoutSpecThatFits));
    return action ? action(constrainedSize) : nil;
}

-(JobsRetASLayoutSpecByASSizeRangeBlock _Nonnull)jobsLayoutSpecThatFits{
    @jobs_weakify(self)
    return ^ASLayoutSpec *(ASSizeRange constrainedSize){
        @jobs_strongify(self)
        if (!self) return nil;
        _netImage.style.byPreferredSize(CGSizeMake(constrainedSize.max.width - 32, 160));
        @jobs_weakify(self)
        return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:jobsMakeVerticalStackLayoutSpec(^(ASStackLayoutSpec * _Nullable v) {
            @jobs_strongify(self)
            v.bySpacing(8).byChildren(@[self.netImage, self.title]);
        })];
    };
}
#pragma mark —— lazyLoad
-(ASNetworkImageNode *)netImage{
    if(!_netImage){
        _netImage = jobsMakeNetworkImageNode(^(ASNetworkImageNode * _Nullable node) {
            node
                .byDefaultImage(@"photo".sys_img)
                .byPlaceholderFadeDuration(0.25)
                .byContentMode(UIViewContentModeScaleAspectFill)
                .byCornerRadius(8)
                .byClipsToBounds(YES);
        });
    };return _netImage;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ASNetworkImageNode
@implementation ASNetworkImageNode (JobsLocalPropertyDSLAutogen_1c3a38262f)
-(JobsRetASNetworkImageNodeByCGFloatBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setCornerRadius:data];
        return self;
    };
}

-(JobsRetASNetworkImageNodeByNSTimeIntervalBlock _Nonnull)byPlaceholderFadeDuration{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setPlaceholderFadeDuration:data];
        return self;
    };
}

-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byClipsToBounds{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setClipsToBounds:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ASNetworkImageNode

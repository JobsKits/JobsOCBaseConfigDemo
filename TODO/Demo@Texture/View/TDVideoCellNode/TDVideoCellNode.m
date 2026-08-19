//
//  TDVideoCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDVideoCellNode.h"

@interface TDVideoCellNode ()

Prop_strong() NSURL *pendingURL; // 仅在 didLoad 再喂给 video

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASVideoNode
@interface ASVideoNode (JobsLocalPropertyDSLAutogen_eac4d2dfe7)
-(JobsRetASVideoNodeByBOOLBlock _Nonnull)byClipsToBounds;
-(JobsRetASVideoNodeByBOOLBlock _Nonnull)byMuted;
-(JobsRetASVideoNodeByBOOLBlock _Nonnull)byShouldAutoplay;
-(JobsRetASVideoNodeByBOOLBlock _Nonnull)byShouldAutorepeat;
-(JobsRetASVideoNodeByCGFloatBlock _Nonnull)byCornerRadius;
-(JobsRetASVideoNodeByNSStringBlock _Nonnull)byGravity;
-(JobsRetASVideoNodeByNSURLBlock _Nonnull)byAssetURL;
-(JobsRetASVideoNodeByUIColorBlock _Nonnull)byPlaceholderColor;
-(void)setAssetURL:(NSURL * _Nullable)data;
-(void)setClipsToBounds:(BOOL)data;
-(void)setCornerRadius:(CGFloat)data;
-(void)setGravity:(NSString * _Nullable)data;
-(void)setMuted:(BOOL)data;
-(void)setPlaceholderColor:(UIColor * _Nullable)data;
-(void)setShouldAutoplay:(BOOL)data;
-(void)setShouldAutorepeat:(BOOL)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASVideoNode

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASLayoutElementStyle
@interface ASLayoutElementStyle (JobsLocalPropertyDSLAutogen_eac4d2dfe7)
-(JobsRetASLayoutElementStyleByCGSizeBlock _Nonnull)byPreferredSize;
-(void)setPreferredSize:(CGSize)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASLayoutElementStyle

@implementation TDVideoCellNode
-(instancetype)initWithURL:(NSURL *)url title:(NSString *)title {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.video.shouldAutoplay = NO;
        _pendingURL = url; // 先存起来（init 可能在后台线程）
        _title = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [[NSAttributedString alloc] initWithString:title
                                                                  attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:13 weight:UIFontWeightMedium],
                NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    };return self;
}
/// 保证在主线程设置 assetURL
-(void)didLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDVideoCellNode.class, @selector(jobsDidLoad)))(self, @selector(jobsDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super didLoad];
        if (self.pendingURL) {
            self.video.byAssetURL(self.pendingURL);
        }
    };
}

-(void)didEnterVisibleState {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDVideoCellNode.class, @selector(jobsDidEnterVisibleState)))(self, @selector(jobsDidEnterVisibleState));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsDidEnterVisibleState{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super didEnterVisibleState];
        self.video.byMuted(YES);
    };
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    JobsRetASLayoutSpecByASSizeRangeBlock action = ((JobsRetASLayoutSpecByASSizeRangeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDVideoCellNode.class, @selector(jobsLayoutSpecThatFits)))(self, @selector(jobsLayoutSpecThatFits));
    return action ? action(constrainedSize) : nil;
}

-(JobsRetASLayoutSpecByASSizeRangeBlock _Nonnull)jobsLayoutSpecThatFits{
    @jobs_weakify(self)
    return ^ASLayoutSpec *(ASSizeRange constrainedSize){
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:jobsMakeVerticalStackLayoutSpec(^(ASStackLayoutSpec * _Nullable v) {
            @jobs_strongify(self)
            v.bySpacing(8).byChildren(@[self.video, self.title]);
        })];
    };
}
#pragma mark —— lazyLoad
-(ASVideoNode *)video{
    if(!_video){
        _video = jobsMakeVideoNode(^(ASVideoNode * _Nullable node) {
            node
                .byShouldAutoplay(NO)
                .byShouldAutorepeat(NO)
                .byGravity(AVLayerVideoGravityResizeAspectFill)
                .byPlaceholderColor(UIColor.secondarySystemFillColor)
                .byBgColor(UIColor.blackColor)
                .byCornerRadius(8)
                .byClipsToBounds(YES)
                .byPreferredSize(CGSizeMake(0, 200));
        });
    };return _video;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ASVideoNode
@implementation ASVideoNode (JobsLocalPropertyDSLAutogen_eac4d2dfe7)
-(JobsRetASVideoNodeByBOOLBlock _Nonnull)byClipsToBounds{
    @jobs_weakify(self)
    return ^__kindof ASVideoNode * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setClipsToBounds:data];
        return self;
    };
}

-(JobsRetASVideoNodeByBOOLBlock _Nonnull)byMuted{
    @jobs_weakify(self)
    return ^__kindof ASVideoNode * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setMuted:data];
        return self;
    };
}

-(JobsRetASVideoNodeByBOOLBlock _Nonnull)byShouldAutoplay{
    @jobs_weakify(self)
    return ^__kindof ASVideoNode * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShouldAutoplay:data];
        return self;
    };
}

-(JobsRetASVideoNodeByBOOLBlock _Nonnull)byShouldAutorepeat{
    @jobs_weakify(self)
    return ^__kindof ASVideoNode * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShouldAutorepeat:data];
        return self;
    };
}

-(JobsRetASVideoNodeByCGFloatBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^__kindof ASVideoNode * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setCornerRadius:data];
        return self;
    };
}

-(JobsRetASVideoNodeByNSStringBlock _Nonnull)byGravity{
    @jobs_weakify(self)
    return ^__kindof ASVideoNode * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setGravity:data];
        return self;
    };
}

-(JobsRetASVideoNodeByNSURLBlock _Nonnull)byAssetURL{
    @jobs_weakify(self)
    return ^__kindof ASVideoNode * _Nullable(NSURL * _Nullable data){
        @jobs_strongify(self)
        [self setAssetURL:data];
        return self;
    };
}

-(JobsRetASVideoNodeByUIColorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof ASVideoNode * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setPlaceholderColor:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ASVideoNode

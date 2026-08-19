//
//  TextureDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TextureDemoVC.h"

@interface TextureDemoVC ()

Prop_strong() ASTableNode *tableNode;
Prop_strong() NSMutableArray<NSNumber *> *rows;
Prop_assign() BOOL hasMore;

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASTableNode
@interface ASTableNode (JobsLocalPropertyDSLAutogen_e8d1b04d76)
-(JobsRetASTableNodeByBOOLBlock _Nonnull)byInverted;
-(JobsRetASTableNodeByCGFloatBlock _Nonnull)byLeadingScreensForBatching;
-(JobsRetASTableNodeByIDASTableDataSourceBlock _Nonnull)byDataSource;
-(JobsRetASTableNodeByIDASTableDelegateBlock _Nonnull)byDelegate;
-(void)setDataSource:(id<ASTableDataSource> _Nullable)data;
-(void)setDelegate:(id<ASTableDelegate> _Nullable)data;
-(void)setInverted:(BOOL)data;
-(void)setLeadingScreensForBatching:(CGFloat)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASTableNode

@implementation TextureDemoVC
- (instancetype)init {
    if (self = [super initWithNode:self.tableNode]) {
        self.title = @;
        _hasMore = YES;
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TextureDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.node.byBgColor(UIColor.systemBackgroundColor);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TextureDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        // 导航大标题
        if (@available(iOS 11.0, *)) {
            self.navigationItem.byLargeTitleDisplayMode(UINavigationItemLargeTitleDisplayModeAutomatic);
            self.navigationController.navigationBar.byPrefersLargeTitles(YES);
        }
        self.tableNode.byInverted(NO);
    };
}
#pragma mark —— ASTable DataSource (推荐使用 Block 创建以获得异步构建收益)
- (NSInteger)tableNode:(ASTableNode *)tableNode
 numberOfRowsInSection:(NSInteger)section {
    return self.rows.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode
  nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    TDDemoRowType type = self.rows[indexPath.row].integerValue;
    return ^ASCellNode * _Nonnull{
        switch (type) {
            /// 处理 TDDemoRowType_Text 分支
            case TDDemoRowType_Text:
                return [[TDTextCellNode alloc] initWithTitle:@"ASTextNode：高性能异步文本"
                                                   subtitle:@"支持 Truncation/Highlight/Link/排版，多行异步绘制，避免主线程卡顿。"];
            /// 处理 TDDemoRowType_LocalImage 分支
            case TDDemoRowType_LocalImage:
                return [[TDImageCellNode alloc] initWithImage:@"Sample".img
                                                       title:@"Local Image + Ratio(16:9) + Overlay + Corner"];
            /// 处理 TDDemoRowType_NetImage 分支
            case TDDemoRowType_NetImage:
                return [[TDNetImageCellNode alloc] initWithURL:@"https://picsum.photos/800/400".jobsUrl
                                                          text:@"ASNetworkImageNode：支持默认图、占位渐隐、渐进式渲染、圆角裁切。"];
            /// 处理 TDDemoRowType_Button 分支
            case TDDemoRowType_Button:
                return [[TDButtonCellNode alloc] init];
            /// 处理 TDDemoRowType_EditableText 分支
            case TDDemoRowType_EditableText:
                return [[TDEditableTextCellNode alloc] init];
            /// 处理 TDDemoRowType_HCarousel 分支
            case TDDemoRowType_HCarousel:
                return [[TDHorizontalCarouselCellNode alloc] initWithCount:18];
            /// 处理 TDDemoRowType_Video 分支
            case TDDemoRowType_Video:
                return [[TDVideoCellNode alloc] initWithURL:@"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4".jobsUrl
                                                      title:@"ASVideoNode：离屏解码、可见时准备，避免滚动卡顿。"];
            /// 处理 TDDemoRowType_Map 分支
            case TDDemoRowType_Map:
                return [[TDMapCellNode alloc] init];
            /// 处理 TDDemoRowType_Draw 分支
            case TDDemoRowType_Draw:
                return [[TDDrawCellNode alloc] init];
        };return [[ASCellNode alloc] init];
    };
}
#pragma mark —— ASTable Delegate (批量加载示例)
-(BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode {
    JobsRetBOOLByASTableNodeBlock action = ((JobsRetBOOLByASTableNodeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TextureDemoVC.class, @selector(jobsShouldBatchFetchForTableNode)))(self, @selector(jobsShouldBatchFetchForTableNode));
    return action ? action(tableNode) : NO;
}

-(JobsRetBOOLByASTableNodeBlock _Nonnull)jobsShouldBatchFetchForTableNode{
    @jobs_weakify(self)
    return ^BOOL(ASTableNode * tableNode){
        @jobs_strongify(self)
        if (!self) return NO;
        return self.hasMore;
    };
}

-(void)tableNode:(ASTableNode *)tableNode
willBeginBatchFetchWithContext:(ASBatchContext *)context {
    // 模拟分页拉取
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSInteger startCount = self.rows.count;
        // 追加一轮混合条目
        NSArray *more = @[
            @(TDDemoRowType_Text),
            @(TDDemoRowType_NetImage),
            @(TDDemoRowType_HCarousel),
            @(TDDemoRowType_Draw),
        ];
        [self.rows addObjectsFromArray:more];
        NSMutableArray<NSIndexPath *> *inserts = [NSMutableArray array];
        for (NSInteger i = startCount; i < self.rows.count; i++) {
            [inserts addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        self.byHasMore((self.rows.count < 60));
        [self.tableNode insertRowsAtIndexPaths:inserts withRowAnimation:UITableViewRowAnimationAutomatic];
        [context completeBatchFetching:YES];
    });
}
#pragma mark —— lazyLoad
-(__kindof NSArray *)rows{
    if(!_rows){
        _rows = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            arr.add(@(TDDemoRowType_Text))
            .add(@(TDDemoRowType_LocalImage))
            .add(@(TDDemoRowType_NetImage))
            .add(@(TDDemoRowType_Button))
            .add(@(TDDemoRowType_EditableText))
            .add(@(TDDemoRowType_HCarousel))
            .add(@(TDDemoRowType_Video))
            .add(@(TDDemoRowType_Draw));
    [arr insertObject:@(TDDemoRowType_Map) atIndex:7];
        });
    };return _rows;
}

-(ASTableNode *)tableNode{
    if(!_tableNode){
        _tableNode = [ASTableNode.alloc initWithStyle:UITableViewStyleInsetGrouped];
        _tableNode.byDelegate(self);
        _tableNode.byDataSource(self);
        // 范围/批量加载调优
        _tableNode.byLeadingScreensForBatching(2.0);
        _tableNode.view.bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine);
        _tableNode.view.byKeyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag);
        // 下拉刷新（系统 UIRefreshControl 也能配合 Texture）
        _tableNode.view.refreshControl = jobsMakeRefreshControl(^(__kindof UIRefreshControl * _Nullable refreshCtrl) {
            [refreshCtrl jobs_onChange:^(UIRefreshControl *x) {
                // 刷新逻辑…
                @jobs_weakify(self)
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(0.8 * NSEC_PER_SEC)),
                               dispatch_get_main_queue(), ^{
                    @jobs_strongify(self)
                    [self.tableNode reloadData];
                    [x endRefreshing];
                });
            }];
        });
    };return _tableNode;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN TextureDemoVC
-(JobsRetTextureDemoVCByBOOLBlock _Nonnull)byHasMore{
    @jobs_weakify(self)
    return ^__kindof TextureDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHasMore:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END TextureDemoVC
@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ASTableNode
@implementation ASTableNode (JobsLocalPropertyDSLAutogen_e8d1b04d76)
-(JobsRetASTableNodeByBOOLBlock _Nonnull)byInverted{
    @jobs_weakify(self)
    return ^__kindof ASTableNode * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setInverted:data];
        return self;
    };
}

-(JobsRetASTableNodeByCGFloatBlock _Nonnull)byLeadingScreensForBatching{
    @jobs_weakify(self)
    return ^__kindof ASTableNode * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setLeadingScreensForBatching:data];
        return self;
    };
}

-(JobsRetASTableNodeByIDASTableDataSourceBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof ASTableNode * _Nullable(id<ASTableDataSource> _Nullable data){
        @jobs_strongify(self)
        [self setDataSource:data];
        return self;
    };
}

-(JobsRetASTableNodeByIDASTableDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof ASTableNode * _Nullable(id<ASTableDelegate> _Nullable data){
        @jobs_strongify(self)
        [self setDelegate:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ASTableNode

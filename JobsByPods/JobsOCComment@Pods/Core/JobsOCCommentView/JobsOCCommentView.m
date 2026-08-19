//
//  JobsOCCommentView.m
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCCommentView.h"
#import "JobsOCCommentCell.h"


@interface JobsOCCommentView ()

Prop_strong(readwrite)UITableView *tableView;
Prop_strong(readwrite)JobsOCCommentConfig *config;
Prop_copy(readwrite)NSArray <JobsOCCommentModel *>*comments;
Prop_strong()NSMutableArray <JobsOCCommentModel *>*renderCommentMutArr;
Prop_strong()NSMutableArray <NSNumber *>*renderDepthMutArr;
Prop_strong()NSMutableArray <id>*renderParentMutArr;
Prop_strong()NSMutableArray <NSNumber *>*renderMoreMutArr;
Prop_strong()NSMutableSet <NSString *>*expandedRootIDMutSet;

-(jobsByJobsOCCommentConfigBlock _Nonnull)setupWithConfig;
-(jobsByVoidBlock _Nonnull)rebuildRenderData;
-(void)appendRenderComment:(JobsOCCommentModel *)comment
                     depth:(NSInteger)depth
             parentComment:(JobsOCCommentModel *_Nullable)parentComment
                 isMoreRow:(BOOL)isMoreRow;
-(void)appendComment:(JobsOCCommentModel *)comment
               depth:(NSInteger)depth
       parentComment:(JobsOCCommentModel *_Nullable)parentComment
    shouldShowChilds:(BOOL)shouldShowChilds;
-(void)appendLimitedChildComment:(JobsOCCommentModel *)comment
                           depth:(NSInteger)depth
                   parentComment:(JobsOCCommentModel *_Nullable)parentComment
                  remainingCount:(NSUInteger *)remainingCount;
-(JobsRetNSUIntegerByJobsOCCommentModelBlock _Nonnull)jobs_descendantCountByComment;
-(JobsRetNSUIntegerByVoidBlock _Nonnull)jobs_effectiveMaxVisibleChildReplyCount;
-(JobsRetBOOLByVoidBlock _Nonnull)jobs_shouldEnableRefreshByMode;
-(jobsByVoidBlock _Nonnull)jobs_updateRefresher;

@end

@implementation JobsOCCommentView
-(JobsRetJobsOCCommentViewByConfigBlock _Nonnull)byConfig{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentView *_Nullable(JobsOCCommentConfig *_Nullable config){
        @jobs_strongify(self)
        [self setConfig:config];
        return self;
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.setupWithConfig(nil);
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.setupWithConfig(nil);
    };return self;
}

-(instancetype)initWithConfig:(JobsOCCommentConfig *)config{
    if (self = [super initWithFrame:CGRectZero]) {
        self.setupWithConfig(config);
    };return self;
}

-(JobsRetJobsOCCommentViewByNSArrayJobsOCCommentModelBlock _Nonnull)byComments{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentView *_Nullable(NSArray <JobsOCCommentModel *>*_Nullable comments) {
        @jobs_strongify(self)
        [self setComments:comments];
        return self;
    };
}

-(JobsRetJobsOCCommentViewByJobsOCCommentModeBlock _Nonnull)byMode{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentView *_Nullable(JobsOCCommentMode mode) {
        @jobs_strongify(self)
        self.config.mode = mode;
        self.jobs_updateRefresher();
        self.rebuildRenderData();
        [self.tableView reloadData];
        return self;
    };
}

-(jobsByJobsOCCommentConfigBlock _Nonnull)setupWithConfig{
    @jobs_weakify(self)
    return ^(JobsOCCommentConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        self.byConfig(config ? : JobsOCCommentConfig.defaultConfig());
        self.byComments(@[]);
        self.byBgColor(RGBA_COLOR(0.96 * 255.0, 0.97 * 255.0, 0.99 * 255.0, 1));
        self.tableView.addOn(self);
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.jobs_updateRefresher();
    };
}

-(jobsByJobsOCCommentConfigBlock _Nonnull)reloadWithConfig{
    @jobs_weakify(self)
    return ^(JobsOCCommentConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        self.byConfig(config ? : JobsOCCommentConfig.defaultConfig());
        self.jobs_updateRefresher();
        self.rebuildRenderData();
        [self.tableView reloadData];
    };
}

-(jobsByNSArrayJobsOCCommentModelBlock _Nonnull)reloadWithComments{
    @jobs_weakify(self)
    return ^(NSArray<JobsOCCommentModel *> * comments){
        @jobs_strongify(self)
        if (!self) return;
        NSMutableArray <JobsOCCommentModel *>*result = NSMutableArray.array;
        if ([comments isKindOfClass:NSArray.class]) {
            for (id comment in comments) {
                if (![comment isKindOfClass:JobsOCCommentModel.class]) continue;
                [result addObject:comment];
            }
        }
        self.byComments(result.copy);
        self.rebuildRenderData();
        [self.tableView reloadData];
    };
}

-(jobsByVoidBlock _Nonnull)rebuildRenderData{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.renderCommentMutArr removeAllObjects];
        [self.renderDepthMutArr removeAllObjects];
        [self.renderParentMutArr removeAllObjects];
        [self.renderMoreMutArr removeAllObjects];
        BOOL shouldShowChilds = self.config.mode != JobsOCCommentModeToutiao || self.comments.count == 1;
        for (JobsOCCommentModel *comment in self.comments) {
            [self appendRenderComment:comment
                                depth:0
                        parentComment:nil
                            isMoreRow:NO];
            if (!shouldShowChilds) continue;
            NSUInteger childReplyCount = self.jobs_descendantCountByComment(comment);
            NSUInteger maxVisibleCount = self.jobs_effectiveMaxVisibleChildReplyCount();
            BOOL shouldLimit = childReplyCount > maxVisibleCount && ![self.expandedRootIDMutSet containsObject:comment.messageID ?: @""];
            if (shouldLimit) {
                NSUInteger remainingCount = maxVisibleCount;
                for (JobsOCCommentModel *child in comment.children) {
                    [self appendLimitedChildComment:child
                                              depth:1
                                      parentComment:comment
                                     remainingCount:&remainingCount];
                    if (!remainingCount) break;
                }
                [self appendRenderComment:comment
                                    depth:1
                            parentComment:nil
                                isMoreRow:YES];
            }else{
                for (JobsOCCommentModel *child in comment.children) {
                    [self appendComment:child
                                  depth:1
                          parentComment:comment
                       shouldShowChilds:YES];
                }
            }
        }
    };
}

-(void)appendRenderComment:(JobsOCCommentModel *)comment
                     depth:(NSInteger)depth
             parentComment:(JobsOCCommentModel *)parentComment
                 isMoreRow:(BOOL)isMoreRow{
    [self.renderCommentMutArr addObject:comment];
    [self.renderDepthMutArr addObject:@(depth)];
    [self.renderParentMutArr addObject:parentComment ? : NSNull.null];
    [self.renderMoreMutArr addObject:@(isMoreRow)];
}

-(void)appendComment:(JobsOCCommentModel *)comment
               depth:(NSInteger)depth
       parentComment:(JobsOCCommentModel *)parentComment
    shouldShowChilds:(BOOL)shouldShowChilds{
    [self appendRenderComment:comment
                        depth:depth
                parentComment:parentComment
                    isMoreRow:NO];
    if (!shouldShowChilds) return;
    for (JobsOCCommentModel *child in comment.children) {
        [self appendComment:child
                      depth:depth + 1
              parentComment:comment
           shouldShowChilds:shouldShowChilds];
    }
}

-(void)appendLimitedChildComment:(JobsOCCommentModel *)comment
                           depth:(NSInteger)depth
                   parentComment:(JobsOCCommentModel *)parentComment
                  remainingCount:(NSUInteger *)remainingCount{
    if (!remainingCount || !*remainingCount) return;
    [self appendRenderComment:comment
                        depth:depth
                parentComment:parentComment
                    isMoreRow:NO];
    *remainingCount = *remainingCount - 1;
    if (!*remainingCount) return;
    for (JobsOCCommentModel *child in comment.children) {
        [self appendLimitedChildComment:child
                                  depth:depth + 1
                          parentComment:comment
                         remainingCount:remainingCount];
        if (!*remainingCount) break;
    }
}

-(JobsRetNSUIntegerByJobsOCCommentModelBlock _Nonnull)jobs_descendantCountByComment{
    @jobs_weakify(self)
    return ^NSUInteger(JobsOCCommentModel * comment){
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        NSUInteger count = 0;
        for (JobsOCCommentModel *child in comment.children) {
            count += 1 + self.jobs_descendantCountByComment(child);
        };return count;
    };
}

-(JobsRetNSUIntegerByVoidBlock _Nonnull)jobs_effectiveMaxVisibleChildReplyCount{
    @jobs_weakify(self)
    return ^NSUInteger{
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        return self.config.maxVisibleChildReplyCount ? : JobsOCCommentDefaultMaxVisibleChildReplyCount;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobs_shouldEnableRefreshByMode{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.config.mode == JobsOCCommentModeNetEase || self.config.mode == JobsOCCommentModeCustom;
    };
}

-(jobsByVoidBlock _Nonnull)jobs_updateRefresher{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.tableView.jobs_removeRefreshAt(JobsOCRefreshPositionHeader);
        self.tableView.jobs_removeRefreshAt(JobsOCRefreshPositionFooter);
        if (!self.jobs_shouldEnableRefreshByMode()) return;
        @jobs_weakify(self)
        if (self.config.enablesPullRefresh) {
            [self.tableView jobs_byRefreshHeaderWithConfig:self.config.pullRefreshConfig
                                                   action:^{
                @jobs_strongify(self)
                if (self.config.pullRefreshBlock) {
                    self.config.pullRefreshBlock(self);
                }else{
                    self.endPullRefresh();
                }
            }];
        }
        if (self.config.enablesLoadMore) {
            [self.tableView jobs_byRefreshFooterWithConfig:self.config.loadMoreConfig
                                                   action:^{
                @jobs_strongify(self)
                if (self.config.loadMoreBlock) {
                    self.config.loadMoreBlock(self);
                }else{
                    self.endLoadMore();
                }
            }];
        }
    };
}

-(jobsByVoidBlock _Nonnull)endPullRefresh{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self endRefreshingAtPosition:JobsOCRefreshPositionHeader
                              toState:JobsOCRefreshStateIdle];
    };
}

-(jobsByVoidBlock _Nonnull)endLoadMore{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.endLoadMoreWithNoMoreData(NO);
    };
}

-(jobsByBOOLBlock _Nonnull)endLoadMoreWithNoMoreData{
    @jobs_weakify(self)
    return ^(BOOL noMoreData){
        @jobs_strongify(self)
        if (!self) return;
        [self endRefreshingAtPosition:JobsOCRefreshPositionFooter
                              toState:noMoreData ? JobsOCRefreshStateNoMoreData : JobsOCRefreshStateIdle];
    };
}

-(void)endRefreshingAtPosition:(JobsOCRefreshPosition)position
                       toState:(JobsOCRefreshState)state{
    [self.tableView jobs_switchRefreshAt:position
                                  toState:state];
}
#pragma mark —— UITableViewDelegate, UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.renderCommentMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsOCCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:(JobsOCCommentCell.reuseIdentifier)()
                                                               forIndexPath:indexPath];
    JobsOCCommentModel *comment = self.renderCommentMutArr[indexPath.row];
    NSInteger depth = self.renderDepthMutArr[indexPath.row].integerValue;
    id parent = self.renderParentMutArr[indexPath.row];
    if (self.renderMoreMutArr[indexPath.row].boolValue) {
        [cell updateWithMoreText:JobsOCCommentMoreRepliesText
                          config:self.config
                           depth:depth];
    }else{
        [cell updateWithComment:comment
                         config:self.config
                          depth:depth
                  parentComment:[parent isKindOfClass:JobsOCCommentModel.class] ? parent : nil];
    };return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                              animated:YES];
    JobsOCCommentModel *comment = self.renderCommentMutArr[indexPath.row];
    if (self.renderMoreMutArr[indexPath.row].boolValue) {
        if (comment.messageID.length) [self.expandedRootIDMutSet addObject:comment.messageID];
        self.rebuildRenderData();
        [self.tableView reloadData];
        return;
    }
    if (self.config.commentSelectedBlock) self.config.commentSelectedBlock(comment);
}
#pragma mark —— LazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byEstimatedRowHeight(96)
                .byRowHeight(UITableViewAutomaticDimension)
                .byContentInset(UIEdgeInsetsMake(6, 0, 10, 0))
                .byKeyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag)
                .byBgColor(UIColor.clearColor);
        });
        [_tableView registerClass:JobsOCCommentCell.class
           forCellReuseIdentifier:(JobsOCCommentCell.reuseIdentifier)()];
        if (@available(iOS 15.0, *)) {
            _tableView.bySectionHeaderTopPadding(0);
        }
    };return _tableView;
}

-(NSMutableArray<JobsOCCommentModel *> *)renderCommentMutArr{
    if (!_renderCommentMutArr) {
        _renderCommentMutArr = NSMutableArray.array;
    };return _renderCommentMutArr;
}

-(NSMutableArray<NSNumber *> *)renderDepthMutArr{
    if (!_renderDepthMutArr) {
        _renderDepthMutArr = NSMutableArray.array;
    };return _renderDepthMutArr;
}

-(NSMutableArray<id> *)renderParentMutArr{
    if (!_renderParentMutArr) {
        _renderParentMutArr = NSMutableArray.array;
    };return _renderParentMutArr;
}

-(NSMutableArray<NSNumber *> *)renderMoreMutArr{
    if (!_renderMoreMutArr) {
        _renderMoreMutArr = NSMutableArray.array;
    };return _renderMoreMutArr;
}

-(NSMutableSet<NSString *> *)expandedRootIDMutSet{
    if (!_expandedRootIDMutSet) {
        _expandedRootIDMutSet = NSMutableSet.set;
    };return _expandedRootIDMutSet;
}

@end

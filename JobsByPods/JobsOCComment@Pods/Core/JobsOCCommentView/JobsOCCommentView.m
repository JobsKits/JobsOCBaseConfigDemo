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

-(void)setupWithConfig:(JobsOCCommentConfig *_Nullable)config;
-(void)rebuildRenderData;
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
-(NSUInteger)jobs_descendantCountByComment:(JobsOCCommentModel *)comment;
-(NSUInteger)jobs_effectiveMaxVisibleChildReplyCount;
-(BOOL)jobs_shouldEnableRefreshByMode;
-(void)jobs_updateRefresher;

@end

@implementation JobsOCCommentView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupWithConfig:nil];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self setupWithConfig:nil];
    };return self;
}

-(instancetype)initWithConfig:(JobsOCCommentConfig *)config{
    if (self = [super initWithFrame:CGRectZero]) {
        [self setupWithConfig:config];
    };return self;
}

-(__kindof JobsOCCommentView *_Nullable(^)(NSArray<JobsOCCommentModel *> * _Nullable))byComments{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentView *_Nullable(NSArray <JobsOCCommentModel *>*_Nullable comments) {
        @jobs_strongify(self)
        [self reloadWithComments:comments];
        return self;
    };
}

-(__kindof JobsOCCommentView *_Nullable(^)(JobsOCCommentMode))byMode{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentView *_Nullable(JobsOCCommentMode mode) {
        @jobs_strongify(self)
        self.config.mode = mode;
        [self jobs_updateRefresher];
        [self rebuildRenderData];
        [self.tableView reloadData];
        return self;
    };
}

-(void)setupWithConfig:(JobsOCCommentConfig *)config{
    self.config = config ? : JobsOCCommentConfig.defaultConfig;
    self.comments = @[];
    self.backgroundColor = [UIColor colorWithRed:0.96 green:0.97 blue:0.99 alpha:1];
    [self addSubview:self.tableView];
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.tableView.leftAnchor constraintEqualToAnchor:self.leftAnchor],
        [self.tableView.rightAnchor constraintEqualToAnchor:self.rightAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
    [self jobs_updateRefresher];
}

-(void)reloadWithConfig:(JobsOCCommentConfig *)config{
    self.config = config ? : JobsOCCommentConfig.defaultConfig;
    [self jobs_updateRefresher];
    [self rebuildRenderData];
    [self.tableView reloadData];
}

-(void)reloadWithComments:(NSArray<JobsOCCommentModel *> *)comments{
    NSMutableArray <JobsOCCommentModel *>*result = NSMutableArray.array;
    if ([comments isKindOfClass:NSArray.class]) {
        for (id comment in comments) {
            if (![comment isKindOfClass:JobsOCCommentModel.class]) continue;
            [result addObject:comment];
        }
    }
    self.comments = result.copy;
    [self rebuildRenderData];
    [self.tableView reloadData];
}

-(void)rebuildRenderData{
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
        NSUInteger childReplyCount = [self jobs_descendantCountByComment:comment];
        NSUInteger maxVisibleCount = self.jobs_effectiveMaxVisibleChildReplyCount;
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

-(NSUInteger)jobs_descendantCountByComment:(JobsOCCommentModel *)comment{
    NSUInteger count = 0;
    for (JobsOCCommentModel *child in comment.children) {
        count += 1 + [self jobs_descendantCountByComment:child];
    };return count;
}

-(NSUInteger)jobs_effectiveMaxVisibleChildReplyCount{
    return self.config.maxVisibleChildReplyCount ? : JobsOCCommentDefaultMaxVisibleChildReplyCount;
}

-(BOOL)jobs_shouldEnableRefreshByMode{
    return self.config.mode == JobsOCCommentModeNetEase || self.config.mode == JobsOCCommentModeCustom;
}

-(void)jobs_updateRefresher{
    [self.tableView jobs_removeRefreshAt:JobsOCRefreshPositionHeader];
    [self.tableView jobs_removeRefreshAt:JobsOCRefreshPositionFooter];
    if (!self.jobs_shouldEnableRefreshByMode) return;
    @jobs_weakify(self)
    if (self.config.enablesPullRefresh) {
        [self.tableView jobs_byRefreshHeaderWithConfig:self.config.pullRefreshConfig
                                               action:^{
            @jobs_strongify(self)
            if (self.config.pullRefreshBlock) {
                self.config.pullRefreshBlock(self);
            }else{
                [self endPullRefresh];
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
                [self endLoadMore];
            }
        }];
    }
}

-(void)endPullRefresh{
    [self endRefreshingAtPosition:JobsOCRefreshPositionHeader
                          toState:JobsOCRefreshStateIdle];
}

-(void)endLoadMore{
    [self endLoadMoreWithNoMoreData:NO];
}

-(void)endLoadMoreWithNoMoreData:(BOOL)noMoreData{
    [self endRefreshingAtPosition:JobsOCRefreshPositionFooter
                          toState:noMoreData ? JobsOCRefreshStateNoMoreData : JobsOCRefreshStateIdle];
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
    JobsOCCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCCommentCell.reuseIdentifier
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
        [self rebuildRenderData];
        [self.tableView reloadData];
        return;
    }
    if (self.config.commentSelectedBlock) self.config.commentSelectedBlock(comment);
}
#pragma mark —— LazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView.alloc initWithFrame:CGRectZero
                                                style:UITableViewStylePlain];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColor.clearColor;
        _tableView.estimatedRowHeight = 96;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.contentInset = UIEdgeInsetsMake(6, 0, 10, 0);
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [_tableView registerClass:JobsOCCommentCell.class
           forCellReuseIdentifier:JobsOCCommentCell.reuseIdentifier];
        if (@available(iOS 15.0, *)) {
            _tableView.sectionHeaderTopPadding = 0;
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

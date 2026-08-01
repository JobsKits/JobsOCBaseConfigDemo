//
//  JobsSwiftParityMomentsPreviewDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityMomentsPreviewDemoVC.h"
#import <GKPhotoBrowser/GKPhotoBrowser.h>

@interface JobsSwiftParityMomentsPreviewDemoVC ()
<
UITableViewDataSource,
UITableViewDelegate
>

Prop_strong()UITableView *momentsTableView;
Prop_strong()NSMutableArray<NSMutableDictionary *> *postMutArr;
Prop_strong()GKPhotoBrowser *photoBrowser;

-(void)reloadSamplePosts;
-(void)appendSamplePosts:(NSInteger)count;
-(void)showBrowserAtRow:(NSInteger)row
             mediaIndex:(NSInteger)mediaIndex
             sourceView:(UIImageView *)sourceView;

@end

@implementation JobsSwiftParityMomentsPreviewDemoVC

-(NSString *)demoNavigationTitle{
    return @"朋友圈";
}

-(void)configureDemo{
    self.parityScrollView.byRemove();
    [self reloadSamplePosts];
    self.momentsTableView.byHidden(NO);
}

-(void)reloadSamplePosts{
    [self.postMutArr removeAllObjects];
    [self appendSamplePosts:20];
    [self.momentsTableView reloadData];
}

-(void)appendSamplePosts:(NSInteger)count{
    NSInteger startIndex = self.postMutArr.count;
    NSArray<UIImage *> *sampleImages = @[
        @"新首页的底图".img ?: @"photo.fill".sys_img,
        @"Ani".img ?: @"person.crop.square".sys_img,
        @"启动页SLOGAN".img ?: @"photo.on.rectangle.angled".sys_img
    ];
    for (NSInteger index = 0; index < count; index++) {
        NSInteger number = startIndex + index;
        NSString *content = number % 2
            ? @"把同一套朋友圈卡片、图文宫格、评论和图片预览完整落到 Objective-C。点击图片可进入 GKPhotoBrowser，点赞与评论会即时更新。"
            : @"今天继续打磨 iOS Demo：可展开长文、图文混排、点赞、评论、下拉刷新和上拉加载更多都要真实可操作。";
        NSMutableDictionary *post = @{
            @"name": [NSString stringWithFormat:@"Jobs %ld",(long)number + 1],
            @"content": content,
            @"time": [NSString stringWithFormat:@"%ld 分钟前",(long)(number % 59) + 1],
            @"images": number % 3 == 0 ? @[sampleImages.firstObject] : sampleImages,
            @"liked": @NO,
            @"likeCount": @(number % 5),
            @"comments": [NSMutableArray arrayWithObject:number % 4 == 0 ? @"Tom：顶一下" : @"Jobs：同端 UI 已对齐"],
            @"expanded": @NO
        }.mutableCopy;
        [self.postMutArr addObject:post];
    }
}

-(void)showBrowserAtRow:(NSInteger)row
             mediaIndex:(NSInteger)mediaIndex
             sourceView:(UIImageView *)sourceView{
    if (row < 0 || row >= self.postMutArr.count) return;
    NSArray<UIImage *> *images = self.postMutArr[row][@"images"];
    if (mediaIndex < 0 || mediaIndex >= images.count) return;
    NSMutableArray<GKPhoto *> *photos = NSMutableArray.array;
    [images enumerateObjectsUsingBlock:^(UIImage *image,
                                         NSUInteger index,
                                         BOOL *stop) {
        GKPhoto *photo = GKPhoto.new;
        photo.image = image;
        if (index == mediaIndex) photo.sourceImageView = sourceView;
        [photos addObject:photo];
    }];
    self.photoBrowser = [GKPhotoBrowser photoBrowserWithPhotos:photos
                                                  currentIndex:mediaIndex];
    self.photoBrowser.configure.showStyle = GKPhotoBrowserShowStyleZoom;
    [self.photoBrowser showFromVC:self];
}

#pragma mark —— UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.postMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobsMomentsPostCell"];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:@"JobsMomentsPostCell"];
        cell.bySelectionStyle(UITableViewCellSelectionStyleNone);
    }
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSMutableDictionary *post = self.postMutArr[indexPath.row];
    BOOL expanded = [post[@"expanded"] boolValue];
    UIView *card = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byBgColor(JobsSecondarySystemGroupedBackgroundColor)
            .byCornerRadius(JobsWidth(12))
            .byClipsToBounds(YES)
            .addOn(cell.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(cell.contentView).insets(UIEdgeInsetsMake(8, 12, 8, 12));
            });
    });
    UIImageView *avatar = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
        imageView
            .byImage(@"Ani".img ?: @"person.crop.circle.fill".sys_img)
            .byContentMode(UIViewContentModeScaleAspectFill)
            .byBgColor(JobsTertiarySystemFillColor)
            .byCornerRadius(JobsWidth(20))
            .byClipsToBounds(YES)
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.left.equalTo(card).offset(JobsWidth(12));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(40), JobsWidth(40)));
            });
    });
    UILabel *nameLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(post[@"name"])
            .byTextCor(JobsLabelColor)
            .byFont(UIFontWeightBoldSize(15))
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(card).offset(JobsWidth(12));
                make.left.equalTo(avatar.mas_right).offset(JobsWidth(10));
                make.right.equalTo(card).offset(-JobsWidth(12));
                make.height.mas_equalTo(JobsWidth(20));
            });
    });
    UILabel *contentLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(post[@"content"])
            .byTextCor(JobsLabelColor)
            .byFont(UIFontWeightRegularSize(14))
            .byNumberOfLines(expanded ? 0 : 2)
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(nameLab.mas_bottom).offset(JobsWidth(5));
                make.left.right.equalTo(nameLab);
                make.height.mas_equalTo(JobsWidth(expanded ? 66 : 40));
            });
    });
    UIButton *expandBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle((expanded ? @"收起" : @"全文").tr)
            .jobsResetBtnTitleCor(JobsSystemBlueColor)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(12))
            .jobsResetBtnBgCor(JobsClearColor)
            .onClickBy(^(__kindof UIButton *sender) {
                post[@"expanded"] = @(!expanded);
                [tableView reloadRowsAtIndexPaths:@[indexPath]
                                 withRowAnimation:UITableViewRowAnimationAutomatic];
            })
            .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentLeft)
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(contentLab.mas_bottom);
                make.left.equalTo(contentLab);
                make.width.mas_equalTo(JobsWidth(52));
                make.height.mas_equalTo(JobsWidth(22));
            });
    });
    UIStackView *mediaStack = jobsMakeStackView(^(__kindof UIStackView * _Nullable stackView) {
        stackView
            .byAxis(UILayoutConstraintAxisHorizontal)
            .byDistribution(UIStackViewDistributionFillEqually)
            .byAlignment(UIStackViewAlignmentFill)
            .bySpacing(JobsWidth(4))
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(expandBtn.mas_bottom).offset(JobsWidth(4));
                make.left.right.equalTo(contentLab);
                make.height.mas_equalTo(JobsWidth(112));
            });
    });
    NSArray<UIImage *> *images = post[@"images"];
    [images enumerateObjectsUsingBlock:^(UIImage *image,
                                         NSUInteger mediaIndex,
                                         BOOL *stop) {
        UIButton *mediaBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(image)
                .jobsResetBtnBgCor(JobsTertiarySystemBackgroundColor)
                .jobsResetBtnCornerRadiusValue(JobsWidth(7))
                .onClickBy(^(__kindof UIButton *sender) {
                    [self showBrowserAtRow:indexPath.row
                               mediaIndex:mediaIndex
                               sourceView:sender.imageView];
                })
                .byClipsToBounds(YES);
            button.imageView.byContentMode(UIViewContentModeScaleAspectFill);
        });
        mediaStack.byAddArrangedSubview(mediaBtn);
    }];
    UILabel *timeLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(post[@"time"])
            .byTextCor(JobsSecondaryLabelColor)
            .byFont(UIFontWeightRegularSize(12))
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(mediaStack.mas_bottom).offset(JobsWidth(7));
                make.left.equalTo(contentLab);
                make.height.mas_equalTo(JobsWidth(24));
            });
    });
    UIButton *commentBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(@"评论".tr)
            .jobsResetBtnTitleCor(JobsSystemBlueColor)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .jobsResetBtnBgCor(JobsClearColor)
            .onClickBy(^(__kindof UIButton *sender) {
                NSMutableArray<NSString *> *comments = post[@"comments"];
                [comments addObject:@"Jobs：Nice～"];
                [tableView reloadRowsAtIndexPaths:@[indexPath]
                                 withRowAnimation:UITableViewRowAnimationAutomatic];
            })
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(timeLab);
                make.right.equalTo(contentLab);
                make.width.mas_equalTo(JobsWidth(48));
            });
    });
    jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        BOOL liked = [post[@"liked"] boolValue];
        NSInteger likeCount = [post[@"likeCount"] integerValue];
        NSString *title = liked
            ? [NSString stringWithFormat:@"已赞 %ld",(long)likeCount]
            : (likeCount ? [NSString stringWithFormat:@"赞 %ld",(long)likeCount] : @"赞");
        button
            .jobsResetBtnTitle(title.tr)
            .jobsResetBtnTitleCor(JobsSystemBlueColor)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .jobsResetBtnBgCor(JobsClearColor)
            .onClickBy(^(__kindof UIButton *sender) {
                BOOL nextLiked = ![post[@"liked"] boolValue];
                NSInteger nextCount = [post[@"likeCount"] integerValue] + (nextLiked ? 1 : -1);
                post[@"liked"] = @(nextLiked);
                post[@"likeCount"] = @(MAX(0, nextCount));
                [tableView reloadRowsAtIndexPaths:@[indexPath]
                                 withRowAnimation:UITableViewRowAnimationNone];
            })
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(timeLab);
                make.right.equalTo(commentBtn.mas_left).offset(-JobsWidth(8));
                make.width.mas_equalTo(JobsWidth(68));
            });
    });
    NSArray<NSString *> *comments = post[@"comments"];
    jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText([comments componentsJoinedByString:@"\n"])
            .byTextCor(JobsSecondaryLabelColor)
            .byFont(UIFontWeightRegularSize(12))
            .byNumberOfLines(2)
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(JobsWidth(8))
            .byClipsToBounds(YES)
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(timeLab.mas_bottom).offset(JobsWidth(6));
                make.left.right.equalTo(contentLab);
                make.height.mas_equalTo(JobsWidth(42));
                make.bottom.lessThanOrEqualTo(card).offset(-JobsWidth(10));
            });
    });
    return cell;
}

#pragma mark —— UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BOOL expanded = [self.postMutArr[indexPath.row][@"expanded"] boolValue];
    return JobsWidth(expanded ? 350 : 324);
}

#pragma mark —— LazyLoad
-(UITableView *)momentsTableView{
    if (!_momentsTableView) {
        @jobs_weakify(self)
        _momentsTableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byDataSource(self)
                .byDelegate(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsSystemGroupedBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
        _momentsTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self reloadSamplePosts];
            [self.momentsTableView.mj_header endRefreshing];
        }];
        _momentsTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            [self appendSamplePosts:10];
            [self.momentsTableView reloadData];
            [self.momentsTableView.mj_footer endRefreshing];
        }];
    };return _momentsTableView;
}

-(NSMutableArray<NSMutableDictionary *> *)postMutArr{
    if (!_postMutArr) {
        _postMutArr = NSMutableArray.array;
    };return _postMutArr;
}

@end

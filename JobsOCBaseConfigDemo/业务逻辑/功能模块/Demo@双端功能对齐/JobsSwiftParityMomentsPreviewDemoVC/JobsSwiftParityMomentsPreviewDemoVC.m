//
//  JobsSwiftParityMomentsPreviewDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityMomentsPreviewDemoVC.h"
#import "NSObject+GKPhotoBrowser.h"

@interface JobsSwiftParityMomentsPreviewDemoVC ()
<
UITableViewDataSource,
UITableViewDelegate
>

Prop_strong()UITableView *momentsTableView;
Prop_strong()NSMutableArray<NSMutableDictionary *> *postMutArr;
Prop_strong()GKPhotoBrowser *photoBrowser;
Prop_strong()JobsPresentationCtrl *presentationController;
Prop_strong()NSArray<UIButton *> *commentModeActionBtns;
Prop_strong()UIImpactFeedbackGenerator *hapticFeedback;
Prop_weak()UIButton *activeLikeBtn;
Prop_assign()JobsOCCommentMode commentMode;

-(jobsByVoidBlock _Nonnull)reloadSamplePosts;
-(jobsByNSIntegerBlock _Nonnull)appendSamplePosts;
-(jobsByVoidBlock _Nonnull)jobs_applyTheme;
-(jobsByVoidBlock _Nonnull)jobs_updateCommentModeButtons;
-(JobsRetUIButtonByJobsOCCommentModeBlock _Nonnull)jobs_commentModeActionBtnByMode;
-(void)jobs_updateLikeButton:(UIButton *)button
                        post:(NSMutableDictionary *)post;
-(void)jobs_handleLikeLongPress:(UILongPressGestureRecognizer *)gesture
                           post:(NSMutableDictionary *)post;
-(void)jobs_beginLikeByButton:(UIButton *)button
                          post:(NSMutableDictionary *)post;
-(jobsByBtnBlock _Nonnull)jobs_endLikeByButton;
-(jobsByNSIntegerBlock _Nonnull)jobs_showCommentsAtRow;
-(JobsRetNSArrayJobsOCCommentModelByNSIntegerBlock _Nonnull)jobs_commentModelsAtRow;
-(jobsByNSArrayJobsOCCommentModelBlock _Nonnull)jobs_presentComments;
-(jobsByNSArrayJobsOCCommentModelBlock _Nonnull)jobs_pushComments;
-(void)showBrowserAtRow:(NSInteger)row
             mediaIndex:(NSInteger)mediaIndex
             sourceView:(UIImageView *)sourceView;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsSwiftParityMomentsPreviewDemoVC
@interface JobsSwiftParityMomentsPreviewDemoVC (JobsPropertyDSLSetterAutogen_0faf362e36)
-(void)setActiveLikeBtn:(UIButton * _Nullable)data;
-(void)setCommentMode:(JobsOCCommentMode)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsSwiftParityMomentsPreviewDemoVC

@implementation JobsSwiftParityMomentsPreviewDemoVC

-(void)dealloc{
    self.activeLikeBtn.byFuseBubbleStop();
    JobsLog(@"%@",JobsLocalFunc);
}

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"朋友圈";
    };
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSwiftParityMomentsPreviewDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.byCommentMode(JobsOCCommentModeNetEase);
        self.byRightBarButtonItems(jobsMakeMutArr(^(__kindof NSMutableArray<UIBarButtonItem *> * _Nullable data) {
            for (UIButton *button in self.commentModeActionBtns) {
                data.add(UIBarButtonItem.initBy(button));
            }
        }));
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSwiftParityMomentsPreviewDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        [JobsThemeCenter.shared bindObject:self
                                      slot:@"JobsSwiftParityMomentsPreviewDemoVC.theme"
                                     apply:^(__kindof NSObject *object,
                                             JobsThemeCenter *center) {
            (void)center;
            ((JobsSwiftParityMomentsPreviewDemoVC *)object).jobs_applyTheme();
        }];
    };
}

-(jobsByVoidBlock _Nonnull)configureDemo{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.parityScrollView.byRemove();
        self.reloadSamplePosts();
        self.momentsTableView.byHidden(NO);
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSwiftParityMomentsPreviewDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.jobs_endLikeByButton(self.activeLikeBtn);
    };
}

-(jobsByVoidBlock _Nonnull)reloadSamplePosts{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.postMutArr removeAllObjects];
        self.appendSamplePosts(20);
        [self.momentsTableView reloadData];
    };
}

-(jobsByNSIntegerBlock _Nonnull)appendSamplePosts{
    @jobs_weakify(self)
    return ^(NSInteger count){
        @jobs_strongify(self)
        if (!self) return;
        NSInteger startIndex = self.postMutArr.count;
        NSArray<UIImage *> *sampleImages = @[
            @"首页卡片临时占位图".img ?: @"photo.fill".sys_img,
            @"默认头像".img ?: @"person.crop.square".sys_img,
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
    };
}

-(jobsByVoidBlock _Nonnull)jobs_applyTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIColor *primaryTextColor = JobsLabelColor;
        UIColor *secondaryTextColor = JobsSecondaryLabelColor;
        self.viewModel
            .byBgCor(JobsSystemGroupedBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor)
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byTextCor(primaryTextColor);
            })
            .bySubTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byTextCor(secondaryTextColor);
            })
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byTextCor(primaryTextColor);
            });
        self.view.byBgColor(JobsSystemGroupedBackgroundColor);
        self.momentsTableView.byBgColor(JobsSystemGroupedBackgroundColor);
        self
            .byGKNavBackgroundColor(JobsSystemBackgroundColor)
            .byGKNavTitleColor(primaryTextColor);
        self.gk_navMainTitleLab.byTextCor(primaryTextColor);
        self.gk_navSubTitleLab.byTextCor(secondaryTextColor);
        self.backBtnCategory
            .jobsResetBtnTitleCor(primaryTextColor)
            .byTintColor(primaryTextColor);
        self.jobs_endLikeByButton(self.activeLikeBtn);
        [self.momentsTableView reloadData];
    };
}

-(jobsByVoidBlock _Nonnull)jobs_updateCommentModeButtons{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.commentModeActionBtns enumerateObjectsUsingBlock:^(UIButton *button,
                                                                  NSUInteger index,
                                                                  BOOL *stop) {
            button.bySelected(index == self.commentMode);
        }];
    };
}

-(JobsRetUIButtonByJobsOCCommentModeBlock _Nonnull)jobs_commentModeActionBtnByMode{
    @jobs_weakify(self)
    return ^UIButton *(JobsOCCommentMode mode){
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .normalStateImageBy(@"circle".sys_img)
                .selectedStateImageBy(@"checkmark.circle.fill".sys_img)
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(__kindof UIButton *sender) {
                    @jobs_strongify(self)
                    self.byCommentMode(mode);
                    self.jobs_updateCommentModeButtons();
                })
                .byAccessibilityLabel(JobsOCCommentConfig.titleByMode(mode).jobsTr())
                .bySelected(self.commentMode == mode)
                .byTintColor(JobsSystemBlueColor)
                .byFrame(CGRectMake(0, 0, JobsWidth(44), JobsWidth(36)));
        });
    };
}

-(void)jobs_updateLikeButton:(UIButton *)button
                        post:(NSMutableDictionary *)post{
    BOOL liked = [post[@"liked"] boolValue];
    NSInteger likeCount = [post[@"likeCount"] integerValue];
    NSString *title = liked
        ? [NSString stringWithFormat:@"已赞 %ld",(long)likeCount]
        : (likeCount ? [NSString stringWithFormat:@"赞 %ld",(long)likeCount] : @"赞");
    UIColor *color = liked ? JobsSystemRedColor : JobsSystemBlueColor;
    button
        .jobsResetBtnTitle(title.jobsTr())
        .jobsResetBtnTitleCor(color)
        .jobsResetBtnImage(@"hand.thumbsup.fill".sys_img)
        .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading, JobsWidth(4))
        .bySelected(liked)
        .byTintColor(color);
}

-(void)jobs_handleLikeLongPress:(UILongPressGestureRecognizer *)gesture
                           post:(NSMutableDictionary *)post{
    UIButton *button = (UIButton *)gesture.view;
    switch (gesture.state) {
        /// 开始长按时进入持续点赞冒泡状态
        case UIGestureRecognizerStateBegan:
            [self jobs_beginLikeByButton:button
                                    post:post];
            break;
        /// 长按结束时停止冒泡并回弹
        case UIGestureRecognizerStateEnded:
        /// 长按取消时停止冒泡并回弹
        case UIGestureRecognizerStateCancelled:
        /// 长按失败时停止冒泡并回弹
        case UIGestureRecognizerStateFailed:
            self.jobs_endLikeByButton(button);
            break;
        /// 其它手势状态不改变当前点赞过程
        default:
            break;
    }
}

-(void)jobs_beginLikeByButton:(UIButton *)button
                          post:(NSMutableDictionary *)post{
    if (![post[@"liked"] boolValue]) {
        post[@"liked"] = @YES;
        post[@"likeCount"] = @([post[@"likeCount"] integerValue] + 1);
    }
    self.byActiveLikeBtn(button);
    [self jobs_updateLikeButton:button
                          post:post];
    [button byFusePressScaleStart:1.08
                         duration:0.12];
    JobsFuseBubbleConfig *config = JobsFuseBubbleConfig.config()
        .byEmissionInterval(0.16)
        .byRiseDistance(JobsWidth(150))
        .byHorizontalDrift(JobsWidth(46))
        .byDuration(0.92)
        .byMaximumConcurrentCount(10);
    @jobs_weakify(self)
    [self.hapticFeedback prepare];
    [button byFuseBubbleStartInView:self.view
                            config:config
                    bubbleProvider:^__kindof UIView *{
        return jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(@"hand.thumbsup.fill".sys_img)
                .byContentMode(UIViewContentModeScaleAspectFit)
                .byFrame(CGRectMake(0, 0, JobsWidth(28), JobsWidth(28)))
                .byTintColor(JobsSystemRedColor);
        });
    } onEmit:^{
        @jobs_strongify(self)
        [self.hapticFeedback impactOccurred];
        [self.hapticFeedback prepare];
        button.byFusePlaySound(@"Sound.wav");
    }];
}

-(jobsByBtnBlock _Nonnull)jobs_endLikeByButton{
    @jobs_weakify(self)
    return ^(UIButton * button){
        @jobs_strongify(self)
        if (!self) return;
        button.byFuseBubbleStop();
        [button byFusePressScaleStop:YES
                           duration:0.22
                            damping:0.72
                           velocity:0.8];
        if (button == self.activeLikeBtn) self.activeLikeBtn = nil;
    };
}

-(jobsByNSIntegerBlock _Nonnull)jobs_showCommentsAtRow{
    @jobs_weakify(self)
    return ^(NSInteger row){
        @jobs_strongify(self)
        if (!self) return;
        NSArray<JobsOCCommentModel *> *comments = self.jobs_commentModelsAtRow(row);
        if (self.commentMode == JobsOCCommentModeToutiao) {
            self.jobs_pushComments(comments);
        }else self.jobs_presentComments(comments);
    };
}

-(JobsRetNSArrayJobsOCCommentModelByNSIntegerBlock _Nonnull)jobs_commentModelsAtRow{
    @jobs_weakify(self)
    return ^NSArray<JobsOCCommentModel *> *(NSInteger row){
        @jobs_strongify(self)
        if (!self) return nil;
        if (row < 0 || row >= self.postMutArr.count) return @[];
        NSMutableDictionary *post = self.postMutArr[row];
        NSArray<NSString *> *comments = post[@"comments"];
        NSMutableArray<JobsOCCommentModel *> *commentModels = NSMutableArray.array;
        [comments enumerateObjectsUsingBlock:^(NSString *comment,
                                                NSUInteger index,
                                                BOOL *stop) {
            NSRange separatorRange = [comment rangeOfString:@"："];
            NSString *nickname = separatorRange.location == NSNotFound
                ? post[@"name"]
                : [comment substringToIndex:separatorRange.location];
            NSString *content = separatorRange.location == NSNotFound
                ? comment
                : [comment substringFromIndex:NSMaxRange(separatorRange)];
            [commentModels addObject:[JobsOCCommentModel commentWithMessageID:
                [NSString stringWithFormat:@"moments-%ld-%ld",(long)row,(long)index]
                                                                   userAvatar:@""
                                                                     nickname:nickname
                                                                       replyID:[NSString stringWithFormat:@"moments-%ld",(long)row]
                                                                 replyUserName:nil
                                                                   publishTime:post[@"time"]
                                                                       content:content
                                                                        device:@"iPhone"
                                                                      location:@"朋友圈"
                                                                      children:nil]];
        }];return commentModels.copy;
    };
}

-(jobsByNSArrayJobsOCCommentModelBlock _Nonnull)jobs_presentComments{
    @jobs_weakify(self)
    return ^(NSArray<JobsOCCommentModel *> * comments){
        @jobs_strongify(self)
        if (!self) return;
        UIViewController *presentingVC = self.jobsGetCurrentViewControllerBlock() ? : self;
        if (presentingVC.presentedViewController) return;
        JobsOCCommentModeDetailVC *viewController = JobsOCCommentModeDetailVC.new;
        viewController.byMode(self.commentMode);
        viewController.byPopupStyle(YES);
        viewController.byCommentArr(comments);
        viewController.byPopUpHeight(JobsMainScreen_HEIGHT() * 0.62);
        viewController.byPushOrPresent(ComingStyle_PRESENT);
        viewController.byPreferredContentSize(CGSizeMake(JobsRealWidth(), viewController.popUpHeight));
        self.presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:viewController
                                                                      presentingViewController:presentingVC];
        viewController.byTransitioningDelegate(self.presentationController);
        [presentingVC presentViewController:viewController
                                   animated:YES
                                 completion:nil];
    };
}

-(jobsByNSArrayJobsOCCommentModelBlock _Nonnull)jobs_pushComments{
    @jobs_weakify(self)
    return ^(NSArray<JobsOCCommentModel *> * comments){
        @jobs_strongify(self)
        if (!self) return;
        JobsOCCommentModeDetailVC *viewController = JobsOCCommentModeDetailVC.new;
        viewController.byMode(self.commentMode);
        viewController.byCommentArr(comments);
        if (self.navigationController) {
            [self.navigationController pushViewController:viewController
                                                 animated:YES];
        }else{
            viewController.byModalPresentationStyle(UIModalPresentationFullScreen);
            [self presentViewController:viewController
                               animated:YES
                             completion:nil];
        }
    };
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
        photo.byImage(image);
        if (index == mediaIndex) photo.sourceImageView = sourceView;
        [photos addObject:photo];
    }];
    self.photoBrowser = [GKPhotoBrowser photoBrowserWithPhotos:photos
                                                  currentIndex:mediaIndex];
    self.photoBrowser.configure.byShowStyle(GKPhotoBrowserShowStyleZoom);
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
    }
    cell
        .bySelectionStyle(UITableViewCellSelectionStyleNone)
        .byBgColor(JobsClearColor);
    cell.contentView.byBgColor(JobsClearColor);
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
            .byImage(@"默认头像".img ?: @"person.crop.circle.fill".sys_img)
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
            .jobsResetBtnTitle((expanded ? @"收起" : @"全文").jobsTr())
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
        UIView *mediaView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsTertiarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(7))
                .byClipsToBounds(YES);
        });
        UIImageView *mediaImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(image)
                .byContentMode(UIViewContentModeScaleAspectFill)
                .byClipsToBounds(YES)
                .addOn(mediaView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(mediaView);
                });
        });
        jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(__kindof UIButton *sender) {
                    [self showBrowserAtRow:indexPath.row
                               mediaIndex:mediaIndex
                               sourceView:mediaImageView];
                })
                .addOn(mediaView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(mediaView);
                });
            button.byAccessibilityLabel(@"预览朋友圈图片".jobsTr());
        });
        mediaStack.byAddArrangedSubview(mediaView);
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
            .jobsResetBtnTitle(@"评论".jobsTr())
            .jobsResetBtnTitleCor(JobsSystemBlueColor)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .jobsResetBtnImage(@"bubble.left.and.bubble.right.fill".sys_img)
            .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading, JobsWidth(4))
            .jobsResetBtnBgCor(JobsClearColor)
            .onClickBy(^(__kindof UIButton *sender) {
                self.jobs_showCommentsAtRow(indexPath.row);
            })
            .byTintColor(JobsSystemBlueColor)
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(timeLab);
                make.right.equalTo(contentLab);
                make.width.mas_equalTo(JobsWidth(70));
            });
    });
    jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        UILongPressGestureRecognizer *gesture = (jobsMakeLongPressGesture(^(UILongPressGestureRecognizer * _Nullable gesture) {
            gesture
                .byMinimumPressDuration(0.32)
                .byAllowableMovement(JobsWidth(18));
        })).GestureActionBy(^(__kindof UIGestureRecognizer * _Nullable gesture) {
            [self jobs_handleLikeLongPress:(UILongPressGestureRecognizer *)gesture
                                      post:post];
        });
        button
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .jobsResetBtnBgCor(JobsClearColor)
            .onClickBy(^(__kindof UIButton *sender) {
                BOOL nextLiked = ![post[@"liked"] boolValue];
                NSInteger nextCount = [post[@"likeCount"] integerValue] + (nextLiked ? 1 : -1);
                post[@"liked"] = @(nextLiked);
                post[@"likeCount"] = @(MAX(0, nextCount));
                [self jobs_updateLikeButton:sender
                                       post:post];
            })
            .byAddGestureRecognizer(gesture)
            .addOn(card)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(timeLab);
                make.right.equalTo(commentBtn.mas_left).offset(-JobsWidth(4));
                make.width.mas_equalTo(JobsWidth(82));
            });
        [self jobs_updateLikeButton:button
                               post:post];
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
            self.reloadSamplePosts();
            [self.momentsTableView.mj_header endRefreshing];
        }];
        _momentsTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            self.appendSamplePosts(10);
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

-(NSArray<UIButton *> *)commentModeActionBtns{
    if (!_commentModeActionBtns) {
        _commentModeActionBtns = @[
            self.jobs_commentModeActionBtnByMode(JobsOCCommentModeNetEase),
            self.jobs_commentModeActionBtnByMode(JobsOCCommentModeToutiao),
            self.jobs_commentModeActionBtnByMode(JobsOCCommentModeCustom)
        ];
        self.jobs_updateCommentModeButtons();
    };return _commentModeActionBtns;
}

-(UIImpactFeedbackGenerator *)hapticFeedback{
    if (!_hapticFeedback) {
        _hapticFeedback = [UIImpactFeedbackGenerator.alloc initWithStyle:UIImpactFeedbackStyleMedium];
    };return _hapticFeedback;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsSwiftParityMomentsPreviewDemoVC
-(JobsRetJobsSwiftParityMomentsPreviewDemoVCByJobsOCCommentModeBlock _Nonnull)byCommentMode{
    @jobs_weakify(self)
    return ^__kindof JobsSwiftParityMomentsPreviewDemoVC * _Nullable(JobsOCCommentMode data){
        @jobs_strongify(self)
        [self setCommentMode:data];
        return self;
    };
}

-(JobsRetJobsSwiftParityMomentsPreviewDemoVCByUIButtonBlock _Nonnull)byActiveLikeBtn{
    @jobs_weakify(self)
    return ^__kindof JobsSwiftParityMomentsPreviewDemoVC * _Nullable(UIButton * _Nullable data){
        @jobs_strongify(self)
        [self setActiveLikeBtn:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsSwiftParityMomentsPreviewDemoVC
@end

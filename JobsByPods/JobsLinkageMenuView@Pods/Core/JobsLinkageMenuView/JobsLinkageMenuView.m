//
//  JobsLinkageMenuView.m
//  JobsLinkageMenuView
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsLinkageMenuView.h"
#import <JobsLinkageMenuView/UIButton+UI.h>

#define FULLVIEW_FOR6 667

static id _Nullable JobsLinkageSafeObjectAtIndex(NSArray *_Nullable array, NSInteger index){
    if (![array isKindOfClass:NSArray.class]) return nil;
    if (index < 0 || index >= array.count) return nil;
    id obj = array[index];
    return obj == NSNull.null ? nil : obj;
}

@interface JobsLinkageMenuView()

Prop_strong()UIScrollView *menuView;
Prop_strong()UIView *bottomView;
Prop_strong()UIView *lineView;
Prop_strong()UIView *rightview;
Prop_strong()NSMutableArray <__kindof UIButton *>*btnMutArr;
Prop_strong()NSArray <__kindof UIView *>*viewArray;
Prop_assign()NSInteger newChoseTag;
Prop_assign()NSInteger choseTag;
Prop_assign()CGFloat btnHeight;
Prop_assign()NSInteger DTScrollTag;
Prop_assign()CGFloat blankHeight;
Prop_assign()CGFloat half_blankHeight;
Prop_strong()UIButtonModel *btnConfig;
Prop_strong()JobsLinkageMenuViewConfig *linkageMenuViewConfig;
Prop_assign()CGFloat MENU_WIDTH;
Prop_assign()CGFloat BOTTOMVIEW_HEIGHT;
Prop_assign()CGFloat BOTTOMVIEW_WIDTH;
Prop_assign()CGFloat LINEVIEW_WIDTH;
Prop_assign()CGFloat ANIMATION_TIME;

@end

@implementation JobsLinkageMenuView

-(instancetype)initWithFrame:(CGRect)frame
                   btnConfig:(UIButtonModel *)btnConfig
       linkageMenuViewConfig:(JobsLinkageMenuViewConfig *)linkageMenuViewConfig{
    if (self = [super init]) {
        self.byFrame(frame);
        self.clipsToBounds = YES;
        self.btnConfig = btnConfig;
        self.viewArray = btnConfig.data;
        self.linkageMenuViewConfig = KindOfClsFromStr(linkageMenuViewConfig, @"JobsLinkageMenuViewConfig") ? linkageMenuViewConfig : JobsLinkageMenuViewConfig.new;
        self.MENU_WIDTH = self.linkageMenuViewConfig.MENU_WIDTH;
        self.BOTTOMVIEW_HEIGHT = self.linkageMenuViewConfig.BOTTOMVIEW_HEIGHT;
        self.BOTTOMVIEW_WIDTH = self.linkageMenuViewConfig.BOTTOMVIEW_WIDTH;
        self.LINEVIEW_WIDTH = self.linkageMenuViewConfig.LINEVIEW_WIDTH;
        self.ANIMATION_TIME = self.linkageMenuViewConfig.ANIMATION_TIME;
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self updateLayoutFrames];
}
#pragma mark —— Public
-(instancetype)byMenuClickBlock:(jobsByIDBlock)block{
    self.menuClickBlock = block;
    return self;
}

-(instancetype)byNoContentClickBlock:(jobsByIDBlock)block{
    self.noContentClickBlock = block;
    return self;
}

-(void)reloadData{
    [self.btnMutArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.btnMutArr removeAllObjects];
    [self.rightview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.choseTag = 0;
    [self buildMenuButtonsIfNeeded];
    [self updateLayoutFrames];
    if (self.btnMutArr.count) [self choseMenu:self.btnMutArr.firstObject];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel __kindof *_Nullable model) {
        @jobs_strongify(self)
        [self prepareDefaults];
        self.rightview.byAlpha(1);
        self.menuView.byAlpha(1);
        self.lineView.byAlpha(1);
        [self reloadData];
    };
}
#pragma mark —— MenuButton Method
-(void)choseMenu:(UIButton __kindof *)button{
    if (!button) return;
    NSInteger index = button.tag - 1;
    UIView *contentView = [self contentViewAtIndex:index];
    NSDictionary *payload = [self payloadAtIndex:index button:button contentView:contentView];
    [self resetMenuButtons];
    [self markSelectedButton:button];
    self.newChoseTag = button.tag;
    if (self.newChoseTag != self.choseTag) {
        @jobs_weakify(self)
        [UIView animateWithDuration:self.ANIMATION_TIME
                              delay:0
             usingSpringWithDamping:0.8
              initialSpringVelocity:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
            @jobs_strongify(self)
            self.bottomView.frame = [self bottomFrameForButton:button];
        } completion:nil];
        self.choseTag = self.newChoseTag;
    }
    if (contentView) {
        [self showContentView:contentView];
    } else {
        if (self.linkageMenuViewConfig.CLEAR_CONTENT_WHEN_MISSING) {
            [self.rightview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        }
        if (self.noContentClickBlock) self.noContentClickBlock(payload);
        if (self.linkageMenuViewConfig.noContentClickBlock) self.linkageMenuViewConfig.noContentClickBlock(payload);
    }
    if (self.menuClickBlock) self.menuClickBlock(payload);
    if (self.linkageMenuViewConfig.menuClickBlock) self.linkageMenuViewConfig.menuClickBlock(payload);
    if (self.objBlock) self.objBlock(button);
}
#pragma mark —— Setter Method
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    for (UIButton *button in self.btnMutArr) {
        if (button.tag != self.choseTag) button.jobsResetBtnTitleCor(textColor);
    }
}

-(void)setTextSize:(CGFloat)textSize{
    _textSize = textSize;
    for (UIButton *button in self.btnMutArr) {
        button.titleLabel.byFont(UIFontSystemFontOfSize(textSize));
    }
}
#pragma mark —— Private
-(void)prepareDefaults{
    if (JobsMainScreen_HEIGHT() < FULLVIEW_FOR6) {
        self.btnHeight = 43;
        self.DTScrollTag = 5;
    } else if (JobsMainScreen_HEIGHT() == FULLVIEW_FOR6) {
        self.btnHeight = 44;
        self.DTScrollTag = 6;
    } else {
        self.btnHeight = 42.7;
        self.DTScrollTag = 7;
    }
    if (self.linkageMenuViewConfig.DEFAULT_MENU_ITEM_HEIGHT > 0) {
        self.btnHeight = self.linkageMenuViewConfig.DEFAULT_MENU_ITEM_HEIGHT;
    }
    self.textSize = self.textSize > 0 ? self.textSize : 14.0;
    self.selectViewColor = self.selectViewColor ? : JobsWhiteColor;
    self.textColor = self.textColor ? : self.btnConfig.titleCor;
    self.selectTextColor = self.selectTextColor ? : self.btnConfig.selectedTitleCor;
    self.blankHeight = MAX(0, self.btnHeight - self.BOTTOMVIEW_HEIGHT);
    self.half_blankHeight = self.blankHeight / 2.0;
}

-(void)buildMenuButtonsIfNeeded{
    if (self.btnMutArr.count) return;
    NSInteger count = self.btnConfig.normal_titles.count;
    for (NSInteger i = 0; i < count; i++) {
        @jobs_weakify(self)
        BaseButton *menuButton = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            @jobs_strongify(self)
            data.byNormalImage(JobsLinkageSafeObjectAtIndex(self.btnConfig.normal_images, i))
                .byTitle(JobsLinkageSafeObjectAtIndex(self.btnConfig.normal_titles, i))
                .byTitleFont(UIFontSystemFontOfSize(self.textSize))
                .byTitleCor(self.btnConfig.titleCor)
                .byImagePadding([self imagePaddingAtIndex:i])
                .byTitlePadding(JobsWidth(10))
                .byImagePlacement(self.btnConfig.imagePlacement)
                .byCornerRadiusValue(self.linkageMenuViewConfig.MENU_ITEM_CORNER_RADIUS);
        })).onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            [self choseMenu:x];
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
        menuButton.imageViewFrameResetX = 0;
        menuButton.tag = i + 1;
        self.btnMutArr.add(menuButton);
        menuButton.addOn(self.menuView);
    }
}

-(void)resetMenuButtons{
    for (NSInteger i = 0; i < self.btnMutArr.count; i++) {
        UIButton *btn = self.btnMutArr[i];
        btn.jobsResetBtnTitleCor(self.btnConfig.titleCor);
        btn.jobsResetBtnImage(JobsLinkageSafeObjectAtIndex(self.btnConfig.normal_images, i));
        btn.jobsResetBtnBgImage(JobsLinkageSafeObjectAtIndex(self.btnConfig.normal_backgroundImages, i));
    }
}

-(void)markSelectedButton:(UIButton *)button{
    NSInteger index = button.tag - 1;
    button.jobsResetBtnTitleCor(self.selectTextColor);
    id selectedBgImage = JobsLinkageSafeObjectAtIndex(self.btnConfig.selected_backgroundImages, index);
    button.jobsResetBtnImage(nil);
    if (selectedBgImage) button.jobsResetBtnBgImage(selectedBgImage);
}

-(void)showContentView:(UIView *)contentView{
    [self.rightview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    contentView.frame = self.rightview.bounds;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    contentView.addOn(self.rightview);
}

-(UIView *)contentViewAtIndex:(NSInteger)index{
    id obj = JobsLinkageSafeObjectAtIndex(self.viewArray, index);
    return [obj isKindOfClass:UIView.class] ? obj : nil;
}

-(NSDictionary *)payloadAtIndex:(NSInteger)index
                         button:(UIButton *)button
                    contentView:(UIView *)contentView{
    NSMutableDictionary *payload = NSMutableDictionary.dictionary;
    payload[@"index"] = @(index);
    if (button.currentTitle.length) payload[@"title"] = button.currentTitle;
    if (button) payload[@"button"] = button;
    if (contentView) payload[@"contentView"] = contentView;
    return payload.copy;
}

-(CGFloat)imagePaddingAtIndex:(NSInteger)index{
    NSNumber *padding = JobsLinkageSafeObjectAtIndex(self.btnConfig.imagePaddings, index);
    return jobs3TO(self.btnConfig.imagePadding, padding.floatValue);
}

-(CGFloat)itemHeightAtIndex:(NSInteger)index{
    NSNumber *mapHeight = self.linkageMenuViewConfig.MENU_ITEM_HEIGHT_MAP[@(index)];
    if (mapHeight.floatValue > 0) return mapHeight.floatValue;
    NSNumber *arrayHeight = JobsLinkageSafeObjectAtIndex(self.linkageMenuViewConfig.MENU_ITEM_HEIGHTS, index);
    if (arrayHeight.floatValue > 0) return arrayHeight.floatValue;
    if (self.linkageMenuViewConfig.DEFAULT_MENU_ITEM_HEIGHT > 0) return self.linkageMenuViewConfig.DEFAULT_MENU_ITEM_HEIGHT;
    return self.btnHeight > 0 ? self.btnHeight : 44;
}

-(CGFloat)resolvedMenuWidth{
    CGFloat boundsWidth = CGRectGetWidth(self.bounds);
    CGFloat lineWidth = self.LINEVIEW_WIDTH;
    if (self.linkageMenuViewConfig.MENU_WIDTH > 0) {
        return MIN(self.linkageMenuViewConfig.MENU_WIDTH, MAX(0, boundsWidth - lineWidth));
    }
    if (self.linkageMenuViewConfig.CONTENT_WIDTH > 0 && boundsWidth > self.linkageMenuViewConfig.CONTENT_WIDTH + lineWidth) {
        return boundsWidth - self.linkageMenuViewConfig.CONTENT_WIDTH - lineWidth;
    }
    if (self.linkageMenuViewConfig.MENU_RATIO > 0 && self.linkageMenuViewConfig.MENU_RATIO < 1) {
        return floor(boundsWidth * self.linkageMenuViewConfig.MENU_RATIO);
    };return self.MENU_WIDTH > 0 ? self.MENU_WIDTH : JobsWidth(136);
}

-(void)updateLayoutFrames{
    CGFloat menuWidth = [self resolvedMenuWidth];
    CGFloat lineWidth = self.LINEVIEW_WIDTH;
    CGFloat height = CGRectGetHeight(self.bounds);
    self.MENU_WIDTH = menuWidth;
    self.menuView.frame = CGRectMake(0, 0, menuWidth, height);
    self.lineView.frame = CGRectMake(menuWidth, 0, lineWidth, height);
    self.rightview.frame = CGRectMake(menuWidth + lineWidth, 0, MAX(0, CGRectGetWidth(self.bounds) - menuWidth - lineWidth), height);
    CGFloat y = self.half_blankHeight;
    for (NSInteger i = 0; i < self.btnMutArr.count; i++) {
        UIButton *button = self.btnMutArr[i];
        CGFloat itemHeight = [self itemHeightAtIndex:i];
        button.frame = CGRectMake(0, y, menuWidth, itemHeight);
        if (button.tag == self.choseTag) self.bottomView.frame = [self bottomFrameForButton:button];
        y += itemHeight;
    }
    self.menuView.contentSize = CGSizeMake(0, y + self.half_blankHeight + 5.0);
    for (UIView *view in self.rightview.subviews) {
        view.frame = self.rightview.bounds;
    }
}

-(CGRect)bottomFrameForButton:(UIButton *)button{
    CGFloat width = self.BOTTOMVIEW_WIDTH > 0 ? self.BOTTOMVIEW_WIDTH : self.MENU_WIDTH - JobsWidth(10);
    return CGRectMake((self.MENU_WIDTH - width) / 2.0,
                      button.frame.origin.y + (button.frame.size.height - self.BOTTOMVIEW_HEIGHT) / 2.0,
                      width,
                      self.BOTTOMVIEW_HEIGHT);
}
#pragma mark —— LazyLoad
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor).addOn(self);
        });
    };return _lineView;
}

-(UIView *)rightview{
    if (!_rightview) {
        _rightview = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor).addOn(self);
        });
    };return _rightview;
}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(self.selectViewColor)
                .byLayer(^(CALayer *layer) {
                    layer.byCornerRadius(self.BOTTOMVIEW_HEIGHT / 2.0);
                });
        });
    };return _bottomView;
}

-(UIScrollView *)menuView{
    if (!_menuView) {
        _menuView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byScrollsToTop(NO)
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(JobsClearColor)
                .addOn(self);
        });
        self.bottomView.addOn(_menuView);
    };return _menuView;
}

-(NSMutableArray<__kindof UIButton *> *)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = NSMutableArray.array;
    };return _btnMutArr;
}

-(CGFloat)MENU_WIDTH{
    if (!_MENU_WIDTH) {
        _MENU_WIDTH = JobsWidth(136);
    };return _MENU_WIDTH;
}

-(CGFloat)BOTTOMVIEW_HEIGHT{
    if (!_BOTTOMVIEW_HEIGHT) {
        _BOTTOMVIEW_HEIGHT = JobsWidth(25);
    };return _BOTTOMVIEW_HEIGHT;
}

-(CGFloat)BOTTOMVIEW_WIDTH{
    if (!_BOTTOMVIEW_WIDTH) {
        _BOTTOMVIEW_WIDTH = self.MENU_WIDTH - JobsWidth(10);
    };return _BOTTOMVIEW_WIDTH;
}

-(CGFloat)LINEVIEW_WIDTH{
    if (!_LINEVIEW_WIDTH) {
        _LINEVIEW_WIDTH = JobsWidth(1.0f);
    };return _LINEVIEW_WIDTH;
}

-(CGFloat)ANIMATION_TIME{
    if (!_ANIMATION_TIME) {
        _ANIMATION_TIME = 0.2f;
    };return _ANIMATION_TIME;
}

@end

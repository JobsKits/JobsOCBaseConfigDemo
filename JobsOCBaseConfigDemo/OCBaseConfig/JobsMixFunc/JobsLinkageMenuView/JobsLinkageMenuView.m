//
//  JobsLinkageMenuView.m
//  JobsLinkageMenuView
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsLinkageMenuView.h"

#import "UIButton+UI.h"

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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsLinkageMenuView
@interface JobsLinkageMenuView (JobsPropertyDSLSetterAutogen_2838bfad8f)
-(void)setBlankHeight:(CGFloat)data;
-(void)setBtnHeight:(CGFloat)data;
-(void)setChoseTag:(NSInteger)data;
-(void)setDTScrollTag:(NSInteger)data;
-(void)setHalf_blankHeight:(CGFloat)data;
-(void)setMENU_WIDTH:(CGFloat)data;
-(void)setNewChoseTag:(NSInteger)data;
-(void)setSelectTextColor:(UIColor * _Nullable)data;
-(void)setSelectViewColor:(UIColor * _Nullable)data;
-(void)setTextSize:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsLinkageMenuView

@implementation JobsLinkageMenuView
-(instancetype)initWithFrame:(CGRect)frame
                   btnConfig:(UIButtonModel *)btnConfig
       linkageMenuViewConfig:(JobsLinkageMenuViewConfig *)linkageMenuViewConfig{
    if (self = [super init]) {
        self.byFrame(frame);
        self.byClipsToBounds(YES);
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLinkageMenuView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.updateLayoutFrames();
    };
}
#pragma mark —— Public
-(JobsRetIDByVoidIDBlocks _Nonnull)byMenuClickBlock{
    @jobs_weakify(self)
    return ^id(jobsByIDBlock block){
        @jobs_strongify(self)
        if (!self) return nil;
        self.menuClickBlock = block;
        return self;
    };
}

-(JobsRetIDByVoidIDBlocks _Nonnull)byNoContentClickBlock{
    @jobs_weakify(self)
    return ^id(jobsByIDBlock block){
        @jobs_strongify(self)
        if (!self) return nil;
        self.noContentClickBlock = block;
        return self;
    };
}

-(void)reloadData{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLinkageMenuView.class, @selector(jobsReloadData)))(self, @selector(jobsReloadData));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsReloadData{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.btnMutArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.btnMutArr removeAllObjects];
        [self.rightview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        self.byChoseTag(0);
        self.buildMenuButtonsIfNeeded();
        self.updateLayoutFrames();
        if (self.btnMutArr.count) self.choseMenu(self.btnMutArr.firstObject);
    };
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel __kindof *_Nullable model) {
        @jobs_strongify(self)
        self.prepareDefaults();
        self.rightview.byAlpha(1);
        self.menuView.byAlpha(1);
        self.lineView.byAlpha(1);
        [self reloadData];
    };
}
#pragma mark —— MenuButton Method
-(jobsByBtnBlock _Nonnull)choseMenu{
    @jobs_weakify(self)
    return ^(UIButton __kindof * button){
        @jobs_strongify(self)
        if (!self) return;
        if (!button) return;
        NSInteger index = button.tag - 1;
        UIView *contentView = self.contentViewAtIndex(index);
        NSDictionary *payload = [self payloadAtIndex:index button:button contentView:contentView];
        self.resetMenuButtons();
        self.markSelectedButton(button);
        self.byNewChoseTag(button.tag);
        if (self.newChoseTag != self.choseTag) {
            @jobs_weakify(self)
            [UIView animateWithDuration:self.ANIMATION_TIME
                                  delay:0
                 usingSpringWithDamping:0.8
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionAllowUserInteraction
                             animations:^{
                @jobs_strongify(self)
                self.bottomView.byFrame(self.bottomFrameForButton(button));
            } completion:nil];
            self.byChoseTag(self.newChoseTag);
        }
        if (contentView) {
            self.showContentView(contentView);
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
    };
}
#pragma mark —— Setter Method
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    for (UIButton *button in self.btnMutArr) {
        if (button.tag != self.choseTag) button.jobsResetBtnTitleCor(textColor);
    }
}

-(JobsRetJobsLinkageMenuViewByCorBlock _Nonnull)byTextColor{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setTextColor:color];
        return self;
    };
}

-(void)setTextSize:(CGFloat)textSize{
    _textSize = textSize;
    for (UIButton *button in self.btnMutArr) {
        button.titleLabel.byFont([UIFont systemFontOfSize:textSize]);
    }
}
#pragma mark —— Private
-(jobsByVoidBlock _Nonnull)prepareDefaults{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (JobsMainScreen_HEIGHT() < FULLVIEW_FOR6) {
            self.byBtnHeight(43);
            self.byDTScrollTag(5);
        } else if (JobsMainScreen_HEIGHT() == FULLVIEW_FOR6) {
            self.byBtnHeight(44);
            self.byDTScrollTag(6);
        } else {
            self.byBtnHeight(42.7);
            self.byDTScrollTag(7);
        }
        if (self.linkageMenuViewConfig.DEFAULT_MENU_ITEM_HEIGHT > 0) {
            self.byBtnHeight(self.linkageMenuViewConfig.DEFAULT_MENU_ITEM_HEIGHT);
        }
        self.byTextSize(self.textSize > 0 ? self.textSize : 14.0);
        self.bySelectViewColor(self.selectViewColor ? : JobsWhiteColor);
        self.byTextColor(self.textColor ? : self.btnConfig.titleCor);
        self.bySelectTextColor(self.selectTextColor ? : self.btnConfig.selectedTitleCor);
        self.byBlankHeight(MAX(0, self.btnHeight - self.BOTTOMVIEW_HEIGHT));
        self.byHalf_blankHeight(self.blankHeight / 2.0);
    };
}

-(jobsByVoidBlock _Nonnull)buildMenuButtonsIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.btnMutArr.count) return;
        NSInteger count = self.btnConfig.normal_titles.count;
        for (NSInteger i = 0; i < count; i++) {
            @jobs_weakify(self)
            BaseButton *menuButton = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                @jobs_strongify(self)
                data.byNormalImage(JobsLinkageSafeObjectAtIndex(self.btnConfig.normal_images, i))
                    .byTitle(JobsLinkageSafeObjectAtIndex(self.btnConfig.normal_titles, i))
                    .byTitleFont([UIFont systemFontOfSize:self.textSize])
                    .byTitleCor(self.btnConfig.titleCor)
                    .byImagePadding(self.imagePaddingAtIndex(i))
                    .byTitlePadding(JobsWidth(10))
                    .byImagePlacement(self.btnConfig.imagePlacement)
                    .byCornerRadiusValue(self.linkageMenuViewConfig.MENU_ITEM_CORNER_RADIUS);
            })).byImageViewFrameResetX(0)
                .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                self.choseMenu(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            }).byTag(i + 1)
                .addOn(self.menuView);
            self.btnMutArr.add(menuButton);
        }
    };
}

-(jobsByVoidBlock _Nonnull)resetMenuButtons{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (NSInteger i = 0; i < self.btnMutArr.count; i++) {
            UIButton *btn = self.btnMutArr[i];
            btn
                .jobsResetBtnTitleCor(self.btnConfig.titleCor)
                .jobsResetBtnImage(JobsLinkageSafeObjectAtIndex(self.btnConfig.normal_images, i))
                .jobsResetBtnBgImage(JobsLinkageSafeObjectAtIndex(self.btnConfig.normal_backgroundImages, i));
        }
    };
}

-(jobsByBtnBlock _Nonnull)markSelectedButton{
    @jobs_weakify(self)
    return ^(UIButton * button){
        @jobs_strongify(self)
        if (!self) return;
        NSInteger index = button.tag - 1;
        button.jobsResetBtnTitleCor(self.selectTextColor);
        id selectedBgImage = JobsLinkageSafeObjectAtIndex(self.btnConfig.selected_backgroundImages, index);
        button.jobsResetBtnImage(nil);
        if (selectedBgImage) button.jobsResetBtnBgImage(selectedBgImage);
    };
}

-(jobsByViewBlock _Nonnull)showContentView{
    @jobs_weakify(self)
    return ^(UIView * contentView){
        @jobs_strongify(self)
        if (!self) return;
        [self.rightview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        contentView
            .byFrame(self.rightview.bounds)
            .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        [self.rightview addSubview:contentView];
    };
}

-(JobsRetViewByNSIntegerBlock _Nonnull)contentViewAtIndex{
    @jobs_weakify(self)
    return ^UIView *(NSInteger index){
        @jobs_strongify(self)
        if (!self) return nil;
        id obj = JobsLinkageSafeObjectAtIndex(self.viewArray, index);
        return [obj isKindOfClass:UIView.class] ? obj : nil;
    };
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

-(JobsRetCGFloatByNSIntegerBlock _Nonnull)imagePaddingAtIndex{
    @jobs_weakify(self)
    return ^CGFloat(NSInteger index){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        NSNumber *padding = JobsLinkageSafeObjectAtIndex(self.btnConfig.imagePaddings, index);
        return jobs3TO(self.btnConfig.imagePadding, padding.floatValue);
    };
}

-(JobsRetCGFloatByNSIntegerBlock _Nonnull)itemHeightAtIndex{
    @jobs_weakify(self)
    return ^CGFloat(NSInteger index){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        NSNumber *mapHeight = self.linkageMenuViewConfig.MENU_ITEM_HEIGHT_MAP[@(index)];
        if (mapHeight.floatValue > 0) return mapHeight.floatValue;
        NSNumber *arrayHeight = JobsLinkageSafeObjectAtIndex(self.linkageMenuViewConfig.MENU_ITEM_HEIGHTS, index);
        if (arrayHeight.floatValue > 0) return arrayHeight.floatValue;
        if (self.linkageMenuViewConfig.DEFAULT_MENU_ITEM_HEIGHT > 0) return self.linkageMenuViewConfig.DEFAULT_MENU_ITEM_HEIGHT;
        return self.btnHeight > 0 ? self.btnHeight : 44;
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)resolvedMenuWidth{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
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
    };
}

-(jobsByVoidBlock _Nonnull)updateLayoutFrames{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat menuWidth = self.resolvedMenuWidth();
        CGFloat lineWidth = self.LINEVIEW_WIDTH;
        CGFloat height = CGRectGetHeight(self.bounds);
        self.byMENU_WIDTH(menuWidth);
        self.menuView.byFrame(CGRectMake(0, 0, menuWidth, height));
        self.lineView.byFrame(CGRectMake(menuWidth, 0, lineWidth, height));
        self.rightview.byFrame(CGRectMake(menuWidth + lineWidth, 0, MAX(0, CGRectGetWidth(self.bounds) - menuWidth - lineWidth), height));
        CGFloat y = self.half_blankHeight;
        for (NSInteger i = 0; i < self.btnMutArr.count; i++) {
            UIButton *button = self.btnMutArr[i];
            CGFloat itemHeight = self.itemHeightAtIndex(i);
            button.byFrame(CGRectMake(0, y, menuWidth, itemHeight));
            if (button.tag == self.choseTag) self.bottomView.frame = self.bottomFrameForButton(button);
            y += itemHeight;
        }
        self.menuView.byContentSize(CGSizeMake(0, y + self.half_blankHeight + 5.0));
        for (UIView *view in self.rightview.subviews) {
            view.byFrame(self.rightview.bounds);
        }
    };
}

-(JobsRetCGRectByUIButtonBlock _Nonnull)bottomFrameForButton{
    @jobs_weakify(self)
    return ^CGRect(UIButton * button){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        CGFloat width = self.BOTTOMVIEW_WIDTH > 0 ? self.BOTTOMVIEW_WIDTH : self.MENU_WIDTH - JobsWidth(10);
        return CGRectMake((self.MENU_WIDTH - width) / 2.0,
                          button.frame.origin.y + (button.frame.size.height - self.BOTTOMVIEW_HEIGHT) / 2.0,
                          width,
                          self.BOTTOMVIEW_HEIGHT);
    };
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsLinkageMenuView
-(JobsRetJobsLinkageMenuViewByCGFloatBlock _Nonnull)byBlankHeight{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBlankHeight:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewByCGFloatBlock _Nonnull)byBtnHeight{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBtnHeight:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewByCGFloatBlock _Nonnull)byHalf_blankHeight{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setHalf_blankHeight:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewByCGFloatBlock _Nonnull)byMENU_WIDTH{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setMENU_WIDTH:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewByCGFloatBlock _Nonnull)byTextSize{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setTextSize:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewByCorBlock _Nonnull)bySelectTextColor{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setSelectTextColor:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewByCorBlock _Nonnull)bySelectViewColor{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setSelectViewColor:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewByNSIntegerBlock _Nonnull)byChoseTag{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setChoseTag:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewByNSIntegerBlock _Nonnull)byDTScrollTag{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setDTScrollTag:data];
        return self;
    };
}

-(JobsRetJobsLinkageMenuViewByNSIntegerBlock _Nonnull)byNewChoseTag{
    @jobs_weakify(self)
    return ^__kindof JobsLinkageMenuView * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setNewChoseTag:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsLinkageMenuView
@end

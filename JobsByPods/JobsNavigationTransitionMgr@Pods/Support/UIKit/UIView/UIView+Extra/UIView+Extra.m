//
//  UIView+Extra.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)
#pragma mark —— init
+(JobsRetViewByFrameBlock _Nonnull)initByFrame{
    return ^__kindof UIView *_Nullable(CGRect data){
        return [UIView.alloc initWithFrame:data];
    };
}

-(UIBarButtonItem *_Nonnull)barBtnItem{
    return [UIBarButtonItem.alloc initWithCustomView:self];
}
#pragma mark —— BaseViewProtocol
/// 用于类
+(JobsRetViewByIDBlock _Nonnull)JobsRichViewByModel{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        UIView <BaseViewProtocol>*instance = self.class.new;
        if ([instance respondsToSelector:@selector(jobsRichViewByModel)]) {
            instance.jobsRichViewByModel(data);
        };return instance;
    };
}
/// 用于实例
-(JobsRetViewByIDBlock _Nonnull)JobsRichViewByModel2{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if(self.isKindOfClass(UITableViewCell.class)){
            if ([self respondsToSelector:@selector(jobsRichElementsTableViewCellBy)]) self.jobsRichElementsTableViewCellBy(data);
        }else if (self.isKindOfClass(UICollectionViewCell.class)){
            if ([self respondsToSelector:@selector(jobsRichElementsCollectionViewCellBy)]) self.jobsRichElementsCollectionViewCellBy(data);
        }else{
            self.jobsRichViewByModel(data);
        };return self;
    };
}

-(JobsRetScrollViewByIDBlock _Nonnull)dataLink{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *(id _Nonnull target) {
        @jobs_strongify(self)
        if(self.isKindOfClass(UICollectionView.class)){
            UICollectionView *view = (UICollectionView *)self;
            view.byDelegate(target)
                .byDataSource(target);
        }
        if(self.isKindOfClass(UITableView.class)){
            UITableView *view = (UITableView *)self;
            view.byDelegate(target)
                .byDataSource(target);
        };return (UIScrollView *)self;
    };
}
/// 用于显示 UICollectionView / UITableView
-(JobsRetScrollViewByIDBlock _Nonnull)byShow{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(id _Nonnull target) {
        @jobs_strongify(self)
        if(self.isKindOfClass(UICollectionView.class)){
            UICollectionView *view = (UICollectionView *)self;
            view.byDelegate(target)
                .byDataSource(target);
            view.reloadDatas();
        }
        if(self.isKindOfClass(UITableView.class)){
            UITableView *view = (UITableView *)self;
            view.byDelegate(target)
                .byDataSource(target);
            view.reloadDatas();
        };return (UIScrollView *)self;
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    return ^(id _Nullable data) {};
}

-(jobsByIDBlock _Nonnull)update{
    return ^(id _Nullable data) {};
}
#pragma mark —— 用类方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewWidthByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewHeightByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)heightForFooterInSectionByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(0);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)heightForHeaderInSection{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeZero;
    };
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetFrameByIDBlock _Nonnull)viewFrameByModel{
    return ^CGRect(id _Nullable data){
        return CGRectZero;
    };
}
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewChangeXByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewChangeYByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewChangeWidthByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewChangeHeightByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(JobsRetCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeZero;
    };
}
/// 数据（字符串）定宽
+(JobsRetCGFloatByIDBlock _Nonnull)widthByData{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 数据（字符串）定高
+(JobsRetCGFloatByIDBlock _Nonnull)heightByData{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
#pragma mark —— 用实例方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewWidthByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewWidthByModel(data);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewHeightByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewHeightByModel(data);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)heightForFooterInSectionByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.heightForFooterInSectionByModel(data);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)heightForHeaderInSection{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.heightForHeaderInSection(data);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    @jobs_weakify(self)
    return ^CGSize(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewSizeByModel(data);
    };
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetFrameByIDBlock _Nonnull)viewFrameByModel{
    @jobs_weakify(self)
    return ^CGRect(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewFrameByModel(data);
    };
}
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewChangeXByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewChangeXByModel(data);
    };
}
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewChangeYByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewChangeYByModel(data);
    };
}
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewChangeWidthByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewChangeWidthByModel(data);
    };
}
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCGFloatByIDBlock _Nonnull)viewChangeHeightByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewChangeHeightByModel(data);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
-(JobsRetCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data){
        @jobs_strongify(self)
        return self.class.collectionReusableViewSizeByModel(data);
    };
}
/// 数据（字符串）定宽
-(JobsRetCGFloatByIDBlock _Nonnull)widthByData{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.widthByData(data);
    };
}
/// 数据（字符串）定高
-(JobsRetCGFloatByIDBlock _Nonnull)heightByData{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.heightByData(data);
    };
}
#pragma mark —— 打印
-(jobsByStrBlock _Nonnull)jobsLogFrame{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull str) {
        @jobs_strongify(self)
        JobsLog(@"%@ = %@", str, NSStringFromCGRect(self.frame));
    };
}

-(jobsByStrBlock _Nonnull)jobsLogPoint{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull str) {
        @jobs_strongify(self)
        JobsLog(@"%@ = %@", str, NSStringFromCGPoint(self.Origin));
    };
}

-(jobsByStrBlock _Nonnull)jobsLogSize{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull str) {
        @jobs_strongify(self)
        JobsLog(@"%@ = %@", str, NSStringFromCGSize(self.sizer));
    };
}
#pragma mark —— 键盘事件
/// 监听键盘事件
-(void)monitorKeyboardAction{
    //    @jobs_weakify(self)
    [self addNotificationName:UIKeyboardWillShowNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        //        @jobs_strongify(self)
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            JobsLog(@"SSS = %d",b.boolValue);
        }JobsLog(@"通知传递过来的 = %@",notification.object);
    }];

    [self addNotificationName:UIKeyboardWillHideNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        //        @jobs_strongify(self)
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            JobsLog(@"SSS = %d",b.boolValue);
        }JobsLog(@"通知传递过来的 = %@",notification.object);
    }];
}
#pragma mark —— 截屏
/*
 1、将图片存本地相册 UIImageWriteToSavedPhotosAlbum
 2、iOS安全 —— 录屏、截屏判断
 2.1、UIApplicationUserDidTakeScreenshotNotification iOS7+ 截屏事件通知
 2.2、UIScreenCapturedDidChangeNotification 判断是否在录屏状态 而当录屏状态改变时，UIKit会发送录屏通知
 */
/// 获取屏幕截图
-(UIImage *_Nullable)screenShot{
    CGSize size = UIScreen.mainScreen.bounds.size;
    CGFloat scale = UIScreen.mainScreen.scale;
    UIGraphicsBeginImageContextWithOptions(size,
                                           YES,
                                           scale);
    [jobsGetMainWindow().layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/// 获取启动页的截图
-(UIImage *_Nullable)lanuchScreenShot{
    NSString *name = NSBundle.mainBundle.infoDictionary.valueForKey(@"UILaunchStoryboardName");
    if(!name) return nil;
    UIViewController *vc = [self vcByStoryboardWithName:name storyboardBundle:nil];
    if(vc){
        UIView *view = vc.view;
        UIWindow *window = jobsGetMainWindow();
        view.byFrame(window.bounds);

        [window addSubview:view];
        window.refresh();
        UIImage *image = self.screenShot;
        window = nil;
        return image;
    };return nil;
}
/// 获取某个view 上的截图
-(UIImage *_Nullable)viewShots{
    if (CGRectIsEmpty(self.frame)) return nil;
    CGSize size = self.bounds.size;
    CGFloat scale = UIScreen.mainScreen.scale;
    UIGraphicsBeginImageContextWithOptions(size,
                                           NO,
                                           scale);
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        /// 对view进行一个快照，然后将快照渲染到当前的上下文中 https://www.jianshu.com/p/3d246235388c
        /// rect：指定图片绘制的坐标
        /// afterUpdates：截图的瞬间是否将屏幕当前的变更渲染进去
        [self drawViewHierarchyInRect:self.bounds
                   afterScreenUpdates:YES];
    }else{
        /// 将view的layer渲染到当前的绘制的上下文中
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/// 获取某个scrollview 上的截图
-(UIImage *_Nullable)scrollViewShot{
    if ([self isKindOfClass:UIScrollView.class]) {
        UIScrollView *scrollview = (UIScrollView *)self;
        UIGraphicsBeginImageContextWithOptions(scrollview.contentSize,
                                               YES,
                                               UIScreen.mainScreen.scale);

        /// 获取当前scrollview的frame 和 contentOffset
        // CGRect saveFrame = scrollview.frame;
        // CGPoint saveOffset = scrollview.contentOffset;
        /// 置为起点
        scrollview.contentOffset = CGPointZero;
        scrollview.frame = CGRectMake(0,
                                      0,
                                      scrollview.contentSize.width,
                                      scrollview.contentSize.height);

        [scrollview.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    };return nil;
}
/// 截图
-(JobsRetImageByViewBlock _Nonnull)rendImage{
    @jobs_weakify(self)
    return ^UIImage *_Nonnull(__kindof UIView *_Nonnull data){
        @jobs_strongify(self)
        /// 1、开始位图上下文
        UIGraphicsBeginImageContext(CGSizeMake(self.width,self.height - 80));
        /// 2、获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        /// 3、截图
        [self.layer renderInContext:ctx];
        /// 4、获取图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        /// 5、关闭上下文
        UIGraphicsEndImageContext() ;
        return newImage;
    };
}
/// 获取某个 范围内的 截图
-(JobsRetImageByFrameBlock _Nonnull)innerViewShotAtFrame{
    @jobs_weakify(self)
    return ^UIImage *_Nonnull(CGRect rect){
        @jobs_strongify(self)
        UIGraphicsBeginImageContext(self.frame.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        UIRectClip(rect);
        [self.layer renderInContext:context];
        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return theImage;
    };
}
#pragma mark —— 描边
JobsKey(_leftBorderLayer)
-(CALayer *)leftBorderLayer{
    CALayer *layer = Jobs_getAssociatedObject(_leftBorderLayer);
    if (!layer) {
        layer = self.layer.addSublayer(jobsMakeCALayer(^(__kindof CALayer * _Nullable layer) {

        }));Jobs_setAssociatedRETAIN_NONATOMIC(_leftBorderLayer, layer);
    };return layer;
}
JobsKey(_rightBorderLayer)
-(CALayer *)rightBorderLayer{
    CALayer *layer = Jobs_getAssociatedObject(_rightBorderLayer);
    if (!layer) {
        layer = self.layer.addSublayer(jobsMakeCALayer(^(__kindof CALayer * _Nullable layer) {

        }));Jobs_setAssociatedRETAIN_NONATOMIC(_rightBorderLayer, layer);
    };return layer;
}
JobsKey(_topBorderLayer)
-(CALayer *)topBorderLayer{
    CALayer *layer = Jobs_getAssociatedObject(_topBorderLayer);
    if (!layer) {
        layer = self.layer.addSublayer(jobsMakeCALayer(^(__kindof CALayer * _Nullable layer) {

        }));Jobs_setAssociatedRETAIN_NONATOMIC(_topBorderLayer, layer);
    };return layer;
}
JobsKey(_bottomBorderLayer)
-(CALayer *)bottomBorderLayer{
    CALayer *layer = Jobs_getAssociatedObject(_bottomBorderLayer);
    if (!layer) {
        layer = self.layer.addSublayer(jobsMakeCALayer(^(__kindof CALayer * _Nullable layer) {

        }));Jobs_setAssociatedRETAIN_NONATOMIC(_bottomBorderLayer, layer);
    };return layer;
}
/// 调用方式：view.leftBorderColor(color).leftBorderWidth(borderType);
-(JobsRetViewByCorBlock _Nonnull)leftBorderColor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        CALayer *layer = self.leftBorderLayer;
        layer.byBgColor(color.CGColor);

        return self;
    };
}
/// 调用方式：view.rightBorderColor(color).rightBorderWidth(borderType);
-(JobsRetViewByCorBlock _Nonnull)rightBorderColor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        CALayer *layer = self.rightBorderLayer;
        layer.byBgColor(color.CGColor);

        return self;
    };
}
/// 调用方式：view.topBorderColor(color).topBorderWidth(borderType);
-(JobsRetViewByCorBlock _Nonnull)topBorderColor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        CALayer *layer = self.topBorderLayer;
        layer.byBgColor(color.CGColor);

        return self;
    };
}
/// 调用方式：view.bottomBorderColor(color).bottomBorderWidth(borderType);
-(JobsRetViewByCorBlock _Nonnull)bottomBorderColor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        CALayer *layer = self.bottomBorderLayer;
        layer.byBgColor(color.CGColor);

        return self;
    };
}
/// 调用方式：view.leftBorderColor(color).leftBorderWidth(borderType);
-(JobsRetViewByFloatBlock _Nonnull)leftBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float borderWidth){
        @jobs_strongify(self)
        CALayer *layer = self.leftBorderLayer;
        layer.frame = CGRectMake(0,
                                 0,
                                 borderWidth,
                                 self.frame.size.height);
        return self;
    };
}
/// 调用方式：view.rightBorderColor(color).rightBorderWidth(borderType);
-(JobsRetViewByFloatBlock _Nonnull)rightBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float borderWidth){
        @jobs_strongify(self)
        CALayer *layer = self.rightBorderLayer;
        layer.frame = CGRectMake(self.frame.size.width - borderWidth,
                                 0,
                                 borderWidth,
                                 self.frame.size.height);
        return self;
    };
}
/// 调用方式：view.topBorderColor(color).topBorderWidth(borderType);
-(JobsRetViewByFloatBlock _Nonnull)topBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float borderWidth){
        @jobs_strongify(self)
        CALayer *layer = self.topBorderLayer;
        layer.frame = CGRectMake(0,
                                 0,
                                 self.frame.size.width,
                                 borderWidth);
        return self;
    };
}
/// 调用方式：view.bottomBorderColor(color).bottomBorderWidth(borderType);
-(JobsRetViewByFloatBlock _Nonnull)bottomBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float borderWidth){
        @jobs_strongify(self)
        CALayer *layer = self.bottomBorderLayer;
        layer.frame = CGRectMake(0,
                                 self.frame.size.height - borderWidth,
                                 self.frame.size.width,
                                 borderWidth);
        return self;
    };
}
/// 描边：统一设置Layer的线宽+颜色+圆切角（一定切角）
-(JobsReturnViewByLocationModelBlock _Nonnull)setLayerBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof JobsLocationModel *_Nullable data){
        @jobs_strongify(self)
        data.masksToBounds = YES;
        self.layerBy(data);
        return self;
    };
}
/// 描边：统一设置Layer的线宽+颜色+圆切角（不一定切角）
-(JobsReturnViewByLocationModelBlock _Nonnull)layerBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof JobsLocationModel *_Nullable data){
        @jobs_strongify(self)
        self.layer.borderColor = data.layerCor.CGColor;
        self.layer.borderWidth = data.jobsWidth;
        self.layer.cornerRadius = data.cornerRadiusValue;
        self.layer.masksToBounds = data.masksToBounds;
        return self;
    };
}
/// 指定描边 【在使用这个方法的一个前提是被描边的view刷新后存在frame】
/// @param color 作用颜色
/// @param borderWidth 线宽
/// @param borderType 作用方向
-(void)setBorderWithColor:(UIColor *_Nullable)color
              borderWidth:(CGFloat)borderWidth
               borderType:(UIBorderSideType)borderType{
    if(self.superview) self.superview.refresh();
    /// 左
    if (borderType & UIBorderSideTypeLeft) self.leftBorderColor(color).leftBorderWidth(borderType);
    /// 右
    if (borderType & UIBorderSideTypeRight) self.rightBorderColor(color).rightBorderWidth(borderType);
    /// 上
    if (borderType & UIBorderSideTypeTop) self.topBorderColor(color).topBorderWidth(borderType);
    /// 下
    if (borderType & UIBorderSideTypeBottom) self.bottomBorderColor(color).bottomBorderWidth(borderType);
}
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable layerBorderCor) {
        @jobs_strongify(self)
        self.layer.borderColor = layerBorderCor.CGColor;
        return self;
    };
}
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float borderWidth) {
        @jobs_strongify(self)
        self.layer.borderWidth = borderWidth;
        return self;
    };
}
#pragma mark —— 切角
/// 切整个View的4个角为统一的切角参数
-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float cornerRadiusValue) {
        @jobs_strongify(self)
        self.layer.cornerRadius = cornerRadiusValue;
        self.layer.masksToBounds = YES;
        return self;
    };
}
/// 调用方式：view.appointCorners(UIRectCornerTopLeft | UIRectCornerBottomRight).cornerRadii(CGSizeMake(10, 10));
JobsKey(_appointCorners)
- (JobsRetViewByNSUIntegerBlock _Nonnull)appointCorners {
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIRectCorner corners) {
        @jobs_strongify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_appointCorners, @(corners));
        return self;
    };
}
/// 调用方式：view.appointCorners(UIRectCornerTopLeft | UIRectCornerBottomRight).cornerRadii(CGSizeMake(10, 10));
JobsKey(_cornerRadii)
- (JobsRetViewByCGSizeBlock _Nonnull)cornerRadii {
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGSize cornerRadii) {
        @jobs_strongify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_cornerRadii,[NSValue valueWithCGSize:cornerRadii])
        UIRectCorner corners = [Jobs_getAssociatedObject(_appointCorners) unsignedIntegerValue];
        /// 如果 cornerRadii 是 CGSizeZero，自动计算
        if (jobsZeroSizeValue(cornerRadii)) {
            cornerRadii = CGSizeMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        }
        /// 创建 UIBezierPath 遮罩路径
        __block UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                               byRoundingCorners:corners
                                                                     cornerRadii:cornerRadii];
        /// 创建 CAShapeLayer 并设置 path
        self.layer.mask = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer.byFrame(self.bounds);

            layer.path = maskPath.CGPath;
        });return self;
    };
}
/// 指定圆切角
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii{
    // 设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    /// 得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    @jobs_weakify(self)
    self.layer.mask = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
        @jobs_strongify(self)
        data.byFrame(self.bounds);

        data.path = maskPath.CGPath;
    });
}
#pragma mark —— 其他
-(JobsRetViewByNSUIntegerBlock _Nonnull)makeLabelByShowingType{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UILabelShowingType labelShowingType) {
        @jobs_strongify(self)
        if([self isKindOfClass:UILabel.class]){
            UILabel *label = (UILabel *)self;
            label.makeLabelByShowingType(labelShowingType);
        };return self;
    };
}

-(JobsRetViewByNSIntegerBlock _Nonnull)viewByID{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self viewWithTag:data];
    };
}

-(JobsRetViewByGestureRecognizer _Nonnull)addGesture{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIGestureRecognizer *_Nonnull gesture) {
        @jobs_strongify(self)
        if(gesture) self.addGestureRecognizer(gesture);
        return self;
    };
}

-(JobsReturnGestureByGesture _Nonnull)addGestureRecognizer{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof UIGestureRecognizer *_Nullable gesture) {
        @jobs_strongify(self)
        if(gesture) [self addGestureRecognizer:gesture];
        return gesture;
    };
}

-(JobsRetViewByNSIntegerBlock _Nonnull)viewWithTag{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        return [self viewWithTag:data];
    };
}

-(JobsRetViewByInteractionBlock _Nonnull)addInteraction{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(id <UIInteraction>_Nullable data){
        @jobs_strongify(self)
        [self addInteraction:data];
        return self;
    };
}

-(JobsRetViewByInteractionBlock _Nonnull)removeInteraction{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(id <UIInteraction>_Nullable data){
        @jobs_strongify(self)
        [self removeInteraction:data];
        return self;
    };
}
/// 对 UIKit API addSubview 的二次封装：附着在父视图上
-(JobsRetViewByViewBlock _Nonnull)addOn{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable superView) {
        @jobs_strongify(self)
        if (superView) [superView addSubview:self];
        return self;
    };
}
/// 对 UIKit API addSubview 的二次封装：加入子视图
-(JobsRetViewByViewBlock _Nonnull)addBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIView *_Nullable subView){
        @jobs_strongify(self)
        if (subView) [self addSubview:subView];
        return self;
    };
}
/// 对 UIKit API bringSubviewToFront 的二次封装
-(JobsRetViewByViewBlock _Nonnull)byBringSubviewToFront{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        if (subView)  [self bringSubviewToFront:subView];
        return subView;
    };
}
/// 对 UIKit API sendSubviewToBack 的二次封装
-(JobsRetViewByViewBlock _Nonnull)bySendSubviewToBack{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        if (subView)  [self sendSubviewToBack:subView];
        return subView;
    };
}
/// 对 UIKit API removeFromSuperview 的二次封装
-(JobsRetViewByVoidBlock _Nonnull)byRemove{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        [self removeFromSuperview];
        return self;
    };
}
/// 针对数据源是UIImage  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageDataMutArr:(NSMutableArray <UIImage *>*_Nonnull)imageDataMutArr
                                atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                   byTarget:(id _Nonnull)target{
    self.viewTapGRSavePicsBaseConfigByTarget(target);
    @jobs_weakify(self)
    self.tapGR_SelImp.selector = [target jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                         UITapGestureRecognizer *_Nullable arg) {
        @jobs_strongify(self)
        GKPhotoBrowser *browser = [target tapImageWithIndexPath:indexPath imageDataMutArr:imageDataMutArr];
        [browser showFromVC:self.currentController];
        return nil;
    }];self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}
/// 针对数据源是NSURL  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageUrlMutArr:(NSMutableArray <NSURL *>*_Nonnull)imageUrlMutArr
                               atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                  byTarget:(id _Nonnull)target{
    self.viewTapGRSavePicsBaseConfigByTarget(target);
    @jobs_weakify(self)
    self.tapGR_SelImp.selector = [target jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                         UITapGestureRecognizer *_Nullable arg) {
        @jobs_strongify(self)
        GKPhotoBrowser *browser = [target tapImageWithIndexPath:indexPath imageUrlMutArr:imageUrlMutArr];
        [browser showFromVC:self.currentController];
        return nil;
    }];self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}
/// 针对数据源是NSString  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageUrlStrMutArr:(NSMutableArray <NSString *>*_Nonnull)imageUrlStrMutArr
                                  atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                     byTarget:(id _Nonnull)target{
    self.viewTapGRSavePicsBaseConfigByTarget(target);
    @jobs_weakify(self)
    self.tapGR_SelImp.selector = [target jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                         UITapGestureRecognizer *_Nullable arg) {
        @jobs_strongify(self)
        GKPhotoBrowser *browser = [target tapImageWithIndexPath:indexPath imageUrlStrMutArr:imageUrlStrMutArr];
        [browser showFromVC:self.currentController];
        return nil;
    }];self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}
/// 对GKPhotoBrowser保存图片的基础设置
-(jobsByIDBlock _Nonnull)viewTapGRSavePicsBaseConfigByTarget{
    @jobs_weakify(self)
    return ^(id _Nullable target){
        @jobs_strongify(self)
        self.numberOfTouchesRequired = 1;
        self.numberOfTapsRequired = 1; ///⚠️ 注意：如果要设置长按手势，此属性必须设置为0⚠️
        self.minimumPressDuration = 0.1;
        self.allowableMovement = 1;
        self.userInteractionEnabled = YES;
        self.weak_target = target;
    };
}
/// popView取消按钮常规处理方法
-(jobsByIDBlock _Nonnull)cancelBtnActionForPopView{
    @jobs_weakify(self)
    return ^(id _Nullable object){
        @jobs_strongify(self)
        [self tf_hide:nil];
        [self.class destroySingleton];
        if(self.objBlock) self.objBlock(object);
    };
}
/// 顺时针旋转radians度【依据中心点进行旋转】
-(jobsByCGFloatBlock _Nonnull)transformByRadians{
    @jobs_weakify(self)
    return ^(CGFloat radians){
        @jobs_strongify(self)
        self.transform = CGAffineTransformMakeRotation(M_PI * radians);
        self.transformByRadians(1.5f); // 逆时针旋转 3 * 90度
    };
}
/// 顺时针旋转degrees弧度【依据中心点进行旋转】
-(jobsByCGFloatBlock _Nonnull)transformByDegrees{
    @jobs_weakify(self)
    return ^(CGFloat degrees){
        @jobs_strongify(self)
        /// 将度数转换为弧度
        CGFloat radians = degrees * (M_PI / 180.0);
        /// 应用旋转变换（radians为正数将逆时针旋转）
        self.transform = CGAffineTransformMakeRotation(radians);
        self.transformByDegrees(45);// 逆时针旋转 45 度
    };
}

-(UIImage *_Nullable)getImage{
    /// 检查视图的大小是否为有效值
    CGSize size = self.bounds.size;
    /// 如果 size 是 {0, 0}，直接返回 nil
    if (jobsZeroSizeValue(size)) return nil;
    /// 使用 UIGraphicsImageRenderer 创建图像
    UIGraphicsImageRenderer *renderer = [UIGraphicsImageRenderer.alloc initWithSize:size];
    @jobs_weakify(self )
    UIImage *image = [renderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull context) {
        @jobs_strongify(self)
        [self.layer renderInContext:context.CGContext];
    }];return image;
}

/// iOS 阴影效果 添加了shadowPath后消除了离屏渲染问题 。特别提示：不能存在 -(void)drawRect:(CGRect)rect 或者在-(void)drawRect:(CGRect)rect里面写，否则无效
/// @param targetShadowview 需要作用阴影效果的View
/// @param superview 该阴影效果的View的父View
/// @param ShadowDirection 阴影朝向
/// @param offsetX 贝塞尔曲线X轴偏移量
/// @param offsetY 贝塞尔曲线Y轴偏移量
/// @param cornerRadius 圆切角参数，传0表示不切
/// @param shadowOffset  阴影偏移量
/// @param shadowOpacity 阴影的不透明度,取值范围在0~1
/// @param layerShadowColor 阴影颜色
/// @param layerShadowRadius  模糊计算的半径
+(void)makeTargetShadowview:(__kindof UIView *__nonnull)targetShadowview
                  superView:(__kindof UIView *__nullable)superview
            shadowDirection:(ShadowDirection)ShadowDirection
          shadowWithOffsetX:(CGFloat)offsetX
                    offsetY:(CGFloat)offsetY
               cornerRadius:(CGFloat)cornerRadius
               shadowOffset:(CGSize)shadowOffset
              shadowOpacity:(CGFloat)shadowOpacity
           layerShadowColor:(UIColor *__nullable)layerShadowColor
          layerShadowRadius:(CGFloat)layerShadowRadius{
    targetShadowview.layer.cornerRadius = cornerRadius;/// 圆切角
    /// targetShadowview当在某些masonry约束的时候，没有frame,需要进行刷新得到frame，否则不会出现阴影效果
    if (superview && CGRectEqualToRect(targetShadowview.frame,CGRectZero)) superview.refresh();
    targetShadowview.layer.shadowOpacity = (shadowOpacity != 0) ? : 0.7f;//shadowOpacity设置了阴影的不透明度,取值范围在0~1;
    targetShadowview.layer.shadowOffset = shadowOffset;//阴影偏移量
    targetShadowview.layer.shadowColor = (layerShadowColor ? :JobsDarkGrayColor).CGColor;//阴影颜色   JobsLightGrayColor.CGColor;
    targetShadowview.layer.shadowRadius = (layerShadowRadius != 0) ? : 8.0f;//模糊计算的半径
    /// 偏移量保持为正数，便于后续计算
    offsetX = offsetX >= 0 ? offsetX : -offsetX;
    offsetY = offsetY >= 0 ? offsetY : -offsetY;
    /// 偏移量默认值
    offsetX = offsetX != 0 ? :20;
    offsetY = offsetY != 0 ? :20;

    targetShadowview.layer.shadowPath = jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable path) {
        switch (ShadowDirection) {
            case ShadowDirection_top:{
                path.moveTo(CGPointMake(0, -offsetY));/// 左上角为绘制的贝塞尔曲线原点
                path.add(CGPointMake(0, targetShadowview.height));/// 👇
                path.add(CGPointMake(targetShadowview.width, targetShadowview.height));/// 👉
                path.add(CGPointMake(targetShadowview.width, -offsetY));///👆
            }break;
            case ShadowDirection_down:{
                path.moveTo(CGPointZero);/// 左上角为绘制的贝塞尔曲线原点
                path.add(CGPointMake(0, targetShadowview.height + offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width, targetShadowview.height + offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width, 0));///👆
            }break;
            case ShadowDirection_left:{
                path.moveTo(CGPointMake(offsetX, 0));/// 左上角
                path.add(CGPointMake(offsetX, targetShadowview.height));///👇
                path.add(CGPointMake(targetShadowview.width, targetShadowview.height));/// 👉
                path.add(CGPointMake(targetShadowview.width, 0));/// 👆
            }break;
            case ShadowDirection_right:{
                path.moveTo(CGPointZero);/// 左上角
                path.add(CGPointMake(0, targetShadowview.height));/// 👇
                path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height));/// 👉
                path.add(CGPointMake(targetShadowview.width + offsetX, 0));/// 👆
            }break;
            case ShadowDirection_leftTop:{
                path.moveTo(CGPointMake(-offsetX, -offsetY));/// 左上角
                path.add(CGPointMake(-offsetX, targetShadowview.height - offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width - offsetX, targetShadowview.height - offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width - offsetX, -offsetY));/// 👆
            }break;
            case ShadowDirection_leftDown:{
                path.moveTo(CGPointMake(-offsetX, offsetY));/// 左上角
                path.add(CGPointMake(-offsetX, targetShadowview.height + offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width - offsetX, targetShadowview.height + offsetX));/// 👉
                path.add(CGPointMake(targetShadowview.width - offsetX, offsetY));/// 👆
            }break;
            case ShadowDirection_rightTop:{
                path.moveTo(CGPointMake(offsetX, -offsetY));/// 左上角
                path.add(CGPointMake(offsetX, targetShadowview.height - offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height - offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width + offsetX, -offsetY));/// 👆
            }break;
            case ShadowDirection_rightDown:{
                path.moveTo(CGPointMake(offsetX, offsetY));/// 左上角
                path.add(CGPointMake(offsetX, targetShadowview.height + offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height + offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width + offsetX, offsetY));/// 👆
            }break;
            case ShadowDirection_All:{
                path.moveTo(CGPointMake(-offsetX, -offsetY));/// 左上角
                path.add(CGPointMake(-offsetX, targetShadowview.height + offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height + offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width + offsetX, -offsetY));/// 👆
            }break;
                
            default:
                break;
        }
    }).CGPath;
}

-(JobsRetViewByCGFloatBlock _Nonnull)byVisible{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat alpha){
        @jobs_strongify(self)
        self.jobsVisible = alpha;
        return self;
    };
}
/// 设置控件是否可见，对影响可视化的hidden 和 alpha属性进行操作
/// 需要特别注意的是：这个地方的jobsVisible不能属性化，否则在某些情况下会出现异常（只会走子类方法不会走分类方法）
JobsKey(_jobsVisible)
-(CGFloat)jobsVisible{
    BOOL JobsVisible = [Jobs_getAssociatedObject(_jobsVisible) floatValue];
    return JobsVisible;
}

-(void)setJobsVisible:(CGFloat)jobsVisible{
    self.byHidden(!jobsVisible);

    self.byAlpha(jobsVisible);

    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsVisible, @(jobsVisible))
}

@end

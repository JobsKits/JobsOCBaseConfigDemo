//
//  BaseLabel.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseLabel.h"
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/NSString+Check.h>
#import <JobsBaseUI/NSString+Menu.h>
#import <JobsBaseUI/NSString+Extra.h>
#import <JobsBaseUI/NSMutableArray+Extra.h>
#import <JobsBaseUI/UIEditMenuInteraction+Extra.h>

@interface BaseLabel ()

@end

@implementation BaseLabel
UILocationProtocol_synthesize
-(instancetype)init{
    if (self = [super init]) {
        
    };return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        {/// 配置相关手势
            self.numberOfTouchesRequired = 1;
            self.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            self.minimumPressDuration = 0.1;
            self.allowableMovement = 1;
            self.weak_target = self;
            self.userInteractionEnabled = YES;
            @jobs_weakify(self)
            self.longPressGR_SelImp.selector = selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                            id _Nullable arg) {
                @jobs_strongify(self)
                if (self.retIDByGestureRecognizerBlock) self.retIDByGestureRecognizerBlock(arg);
                return nil;
            }, MethodName(self), self);
            self.tapGR_SelImp.selector = selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                      id _Nullable arg) {
                @jobs_strongify(self)
                if (self.retIDByGestureRecognizerBlock) self.retIDByGestureRecognizerBlock(arg);
                return nil;
            }, MethodName(self), self);
        }
    };return self;
}
#pragma mark —— 一些公有方法
/// UILabel文字的复制
-(jobsByStrBlock _Nonnull)copyText{
    return ^(NSString *_Nullable text){
        text.pasteboard();
        JobsLog(@"%@%@",@"复制的文字：".tr,text);
    };
}
/// 弹出系统菜单控件
-(jobsByStrBlock _Nonnull)makeMenuCtrl{
    @jobs_weakify(self)
    return ^(NSString *_Nullable text) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            // 使用 UIEditMenuInteraction
            UIEditMenuInteraction *menuInteraction = UIEditMenuInteraction.initBy(self);
            [self addInteraction:menuInteraction];
            // 创建配置
            CGPoint sourcePoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
            UIEditMenuConfiguration *configuration = [UIEditMenuConfiguration configurationWithIdentifier:text ? : @""
                                                                                               sourcePoint:sourcePoint];
            // 展示菜单
            [menuInteraction presentEditMenuWithConfiguration:configuration];
        } else {
            // 使用 UIMenuController（适配 iOS 16 以下版本）
            UIMenuController.sharedMenuController.menuItems = nil;
            UIMenuController *menu = jobsMakeMenuController(^(__kindof UIMenuController * _Nullable menu) {
                menu.menuItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                    data.add(@"请复制".tr.initMenuItemBy(selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                                                          id _Nullable arg) {
                        @jobs_strongify(self)
                        if (self.retIDBySelectorBlock) self.retIDBySelectorBlock(weakSelf, arg);
                        self.copyText(text);
                        return nil;
                    }, @"copyText", self)));
                });
            });
            [menu update];
            if (@available(iOS 10.3, *)) {
                [menu showMenuFromView:self rect:self.bounds];
            } else {
                #pragma clang diagnostic push
                #pragma clang diagnostic ignored "-Wdeprecated-declarations"
                [menu setTargetRect:self.bounds inView:self];
                [menu setMenuVisible:YES animated:YES];
                #pragma clang diagnostic pop
            }
        }
    };
}
#pragma mark —— UIEditMenuInteractionDelegate
-(UIMenu *)editMenuInteraction:(UIEditMenuInteraction *)interaction
          menuForConfiguration:(UIEditMenuConfiguration *)configuration
              suggestedActions:(NSArray<UIMenuElement *> *)suggestedActions API_AVAILABLE(ios(16.0)){
    id identifier = configuration.identifier;
    NSString *text = [identifier isKindOfClass:NSString.class] ? (NSString *)identifier : self.text;
    @jobs_weakify(self)
    UIAction *copyAction = [UIAction actionWithTitle:@"请复制".tr
                                               image:nil
                                          identifier:nil
                                             handler:^(__kindof UIAction * _Nonnull action) {
        @jobs_strongify(self)
        if (self.retIDBySelectorBlock) self.retIDBySelectorBlock(self, text);
        self.copyText(text);
    }];
    return [UIMenu menuWithTitle:@""
                        children:@[copyAction]];
}

#pragma mark —— UIResponder
-(BOOL)canPerformAction:(SEL)action
              withSender:(id)sender{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if ([super canPerformAction:action withSender:sender]) return YES;
    if([sender isKindOfClass:UIMenuController.class]){
        return [NSStringFromSelector(action) containsString:@"copyText"];
    };return NO;
#pragma clang diagnostic pop
}
#pragma mark —— UIGestureRecognizerDelegate
/// 解决 UITableViewCell和手势冲突 https://blog.csdn.net/FreeTourW/article/details/51911416
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
      shouldReceiveTouch:(UITouch *)touch {
    return !NSStringFromClass(touch.view.class).isEqualToString(@"UITableViewCellContentView");
}
#pragma mark —— 复写相关父类方法
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
}
/// 修改绘制文字的区域，edgeInsets增加bounds
-(CGRect)textRectForBounds:(CGRect)bounds
    limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets)
                    limitedToNumberOfLines:numberOfLines];
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}
/// 绘制文字
-(void)drawTextInRect:(CGRect)rect{
    CGRect newRect = rect;
    newRect.origin.y += self.jobsOffsetX;
    newRect.origin.x += self.jobsOffsetY;
    if (isValue(self.text)) {
        [super drawTextInRect:UIEdgeInsetsInsetRect(newRect, self.edgeInsets)];
        self.jobsVisible = YES;
    } else {
        [super drawTextInRect:UIEdgeInsetsInsetRect(newRect, UIEdgeInsetsZero)];
        self.jobsVisible = NO;
    }
}
#pragma mark —— LazyLoad

@end

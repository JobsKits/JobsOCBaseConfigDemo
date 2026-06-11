//
//  UIView+BackgroundImage.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+BackgroundImage.h"

@implementation UIView (BackgroundImage)
/**
 
     【特别指出】
     如果self 是 诸如UICollectionViewCell 或者UITableViewCell,即：
     存在 self.contentView
     如果上面覆盖一个按钮，则需要[self.contentView addSubview:self.backgroundImageView];
     否则按钮点击事件被截断
 */
#pragma mark —— Prop_strong()UIImageView *backgroundImageView;
JobsKey(_backgroundImageView)
@dynamic backgroundImageView;
-(UIImageView *)backgroundImageView{
    UIImageView *BackgroundImageView = Jobs_getAssociatedObject(_backgroundImageView);
    if (!BackgroundImageView) {
        @jobs_weakify(self)
        BackgroundImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.userInteractionEnabled = YES;
            imageView.byContentMode(UIViewContentModeScaleToFill);
            self.byBgColor(JobsClearColor);
            if ([self isKindOfClass:UICollectionViewCell.class]) {
                UICollectionViewCell *cell = (UICollectionViewCell *)self;
                imageView.byAddTo(cell.contentView, ^(MASConstraintMaker *make) {
                    make.edges.equalTo(cell.contentView);
                });

            }else if ([self isKindOfClass:UITableViewCell.class]){
                UITableViewCell *cell = (UITableViewCell *)self;
                imageView.byAddTo(cell.contentView, ^(MASConstraintMaker *make) {
                    make.edges.equalTo(cell.contentView);
                });
            }else{
                [self addSubview:BackgroundImageView];
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                }];
            }imageView.layer.zPosition = -1;// 设置层级关系
            Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundImageView, imageView)
        });
    };return BackgroundImageView;
}

-(void)setBackgroundImageView:(UIImageView *)backgroundImageView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundImageView, backgroundImageView)
}

@end

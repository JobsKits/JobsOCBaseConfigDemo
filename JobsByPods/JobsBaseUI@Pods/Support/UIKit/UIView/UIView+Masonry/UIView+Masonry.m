//
//  UIView+Masonry.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Masonry.h"

@implementation UIView (JobsBaseUIMasonry)
#pragma mark —— 一些Masonry算法
/// 制作一个带有n*m小矩形内容的大矩形（二次封装）
-(jobsByViewArrayRowsColumnsBlock _Nonnull)gridLayoutBy{
    @jobs_weakify(self)
    return ^(__kindof NSArray <__kindof UIView *>*_Nullable arr,NSInteger rows,NSInteger columns){
        @jobs_strongify(self)
        [self setupGridWithRows:rows
                        columns:columns
                      itemViews:arr.count ? arr : jobsMakeMutArr(^(__kindof NSMutableArray<UIView *> * _Nullable arr) {
            for (int i = 0; i < rows * columns; i++) {
                arr.add(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byBgColor(JobsRandomColor);
                }));
            }
        })
                         margin:JobsWidth(10)
                        spacing:JobsWidth(10)];
    };
}
/// 制作一个带有n*m小矩形内容的大矩形（核心算法）
-(void)setupGridWithRows:(NSInteger)rows
                 columns:(NSInteger)columns
               itemViews:(NSArray<__kindof UIView *> *)views
                  margin:(CGFloat)margin
                 spacing:(CGFloat)spacing{
    NSAssert(views.count == rows * columns, @"视图数量必须等于 rows * columns");
    UIView *lastRowTop = nil;
    for (NSInteger row = 0; row < rows; row++) {
        UIView *lastView = nil;
        for (NSInteger col = 0; col < columns; col++) {
            UIView *view = views[row * columns + col];
            self.addSubview(view);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                // 顶部约束
                if (lastRowTop) {
                    make.top.equalTo(lastRowTop.mas_bottom).offset(spacing);
                } else {
                    make.top.equalTo(self.mas_top).offset(margin);
                }
                // 左右等间距
                if (lastView) {
                    make.left.equalTo(lastView.mas_right).offset(spacing);
                    make.width.equalTo(lastView); // 等宽
                } else {
                    make.left.equalTo(self.mas_left).offset(margin);
                }
                // 最后一列贴右边
                if (col == columns - 1) {
                    make.right.equalTo(self.mas_right).offset(-margin);
                }
                // 固定高度（可调整为参数或动态）
                make.height.mas_equalTo(80);
            }];lastView = view;
        }lastRowTop = views[row * columns]; // 当前行第一项的 top 作为下一行参考
    }
}

@end

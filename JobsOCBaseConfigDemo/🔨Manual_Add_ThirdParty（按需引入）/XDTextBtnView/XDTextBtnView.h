//
//  XDTextBtnView.h
//  文字按钮
//
//  Created by XD on 2019/6/10.
//  Copyright © 2019 XDTextBtnView. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XDTextBtnViewDelegate <NSObject>

@optional
//isSingle = YES
- (void)XDTextBtnViewClickIndex:(NSInteger)index lastClickIndex:(NSInteger)lastClickIndex;
//isSingle = NO
- (void)XDTextBtnViewSelectIndexes:(NSArray *)indexes;

@end

@interface XDTextBtnView : UIView

/**
 *  是否单选 默认单选
 *  如果单选 XDTextBtnViewClickIndex:lastClickIndex:
 *  如果多选 XDTextBtnViewSelectIndexes:
 */
Prop_assign()BOOL isSingle;
Prop_assign()CGFloat textFontSize;
Prop_strong()UIColor *textColor;
Prop_strong()UIColor *selectTextColor;
Prop_strong()UIColor *backgroundColor;
Prop_strong()UIColor *selectBackgroundColor;
Prop_assign()CGFloat cornerRadius;
Prop_assign()CGFloat borderWidth;
Prop_strong()UIColor *borderColor;

//按钮文字到按钮左右边的间距
Prop_assign()CGFloat marginX;

//按钮的间距
Prop_assign()CGFloat btnMarginX;
Prop_assign()CGFloat marginY;
Prop_assign()CGFloat btnHeight;

/**
 *  需要设置完全部样式后设置数据
 */
Prop_strong()NSArray <NSString *> *textArr;

/**
 *  需要设置完数据后设置默认数据
 */
Prop_strong()NSArray <NSString *> *defultIndexArr;
Prop_weak()id <XDTextBtnViewDelegate> delegate;

/**
 * 总高度(第一行无上marginY 最后一行无下marginY)
 */
Prop_assign(readonly)CGFloat maxY;

@end

NS_ASSUME_NONNULL_END

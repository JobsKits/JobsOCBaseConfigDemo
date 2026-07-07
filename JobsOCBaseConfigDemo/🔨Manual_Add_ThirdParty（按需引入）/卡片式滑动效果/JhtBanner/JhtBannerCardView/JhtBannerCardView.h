//
//  JhtBannerCardView.h
//  JobsOCBaseConfigDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jinht on 2017/6/2.
//  Copyright © 2017年 JhtBannerScrollView. All rights reserved.
//

#import <UIKit/UIKit.h>

/// banner cardView（单张卡片）

#import "JobsDefineProperty.h"

@interface JhtBannerCardView : UIView
/// 图片
Prop_strong(nullable)UIImageView *cardImageView;
Prop_strong(nullable)UILabel *cardLab;
/// 蒙板 View（覆盖在cardImageView上）
Prop_strong(nullable)UIView *coverView;

+(JobsRetJhtBannerCardViewByFrameBlock _Nonnull)initByFrame;

@end

//
//  BaseImageView.h
//  JobsOCBaseConfigDemo
//
//  Created by 杨科军 on 2021/2/19.
//  Copyright © 2021 杨科军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroDef_Notification.h"
#import "JobsBlock.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseImageView : UIImageView

Prop_assign()UIRectCorner layoutSubviewsRectCorner;
Prop_assign()CGSize layoutSubviewsRectCornerSize;

@end

NS_ASSUME_NONNULL_END

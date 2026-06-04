//
//  GXCardItemDemoCell.h
//  GXCardViewDemo
//
//  Created by Gin on 2018/8/3.
//  Copyright © 2018年 gin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GXCardView.h"

#import "DefineProperty.h"

@interface GXCardItemDemoCell : GXCardViewCell

Prop_weak()IBOutlet UILabel *numberLabel;
Prop_weak()IBOutlet UILabel *leftLabel;
Prop_weak()IBOutlet UILabel *rightLabel;

@end

//
//  XLChannelView.h
//  XLChannelControlDemo
//
//  Created by MengXianLiang on 2017/3/3.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DefineProperty.h"

@interface XLChannelView : UIView

Prop_strong()NSMutableArray *enabledTitles;
Prop_strong()NSMutableArray *disabledTitles;

-(void)reloadData;

@end

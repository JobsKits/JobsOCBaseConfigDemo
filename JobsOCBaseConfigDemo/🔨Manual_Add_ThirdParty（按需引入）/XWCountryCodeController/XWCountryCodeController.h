//
//  XWCountryCodeController.h
//  JobsOCBaseConfigDemo
//
//  Created by 邱学伟 on 16/4/19.
//  Copyright © 2016年 邱学伟. All rights reserved.
//  国家代码选择界面

#import <UIKit/UIKit.h>
#import "JobsDefineProperty.h"
#import "JobsBlock.h"

typedef jobsByOCCountryCodeBlock returnCountryCode;

@protocol XWCountryCodeControllerDelegate <NSObject>
@optional
/**
 Delegate 回调所选国家代码
 @param countryName 所选国家
 @param code 所选国家代码
 */
-(void)returnCountryName:(NSString *)countryName code:(NSString *)code;

@end

@interface XWCountryCodeController : UIViewController
<
UITableViewDataSource
,UITableViewDelegate
,UISearchResultsUpdating
>
Prop_weak()id<XWCountryCodeControllerDelegate> deleagete;
Prop_copy()returnCountryCode countryCodeBlock;

@end

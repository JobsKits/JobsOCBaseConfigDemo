//
//  JobsHeaderFooterViewModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "UIViewModel.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsHeaderFooterViewModel : UIViewModel

Prop_assign()BOOL useHeaderView;
Prop_assign()BOOL useFooterView;

@end

NS_ASSUME_NONNULL_END

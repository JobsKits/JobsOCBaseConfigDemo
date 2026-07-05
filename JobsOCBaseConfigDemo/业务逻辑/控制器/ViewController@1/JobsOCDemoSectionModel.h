//
//  JobsOCDemoSectionModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import <Foundation/Foundation.h>

#import "JobsModel.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCDemoSectionModel : NSObject

Prop_copy()NSString *title;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

+(instancetype)sectionWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

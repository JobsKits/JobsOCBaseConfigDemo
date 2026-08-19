//
//  NotifiViewFactory.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "NotifiView.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

typedef void(^FetchNotifiViewBlock)(NotifiView *_Nullable view);

NS_ASSUME_NONNULL_BEGIN

@interface NotifiViewFactory : NSObject

@property(nonatomic,readonly,copy)NSArray *notifiViews;

+(JobsRetIDByVoidBlock _Nonnull)shared;

-(void)setNotifiViews:(NSArray *)notifiViews;
-(jobsByNSArrayBlock _Nonnull)jobsSetNotifiViews;
//取得一个目前可用的NotifiView, 如果没有可能为空
-(jobsByFetchNotifiViewBlockBlock _Nonnull)fetchAvailableView;
//如果key指向的view为空，则返回nil
-(JobsRetNotifiViewByNSStringBlock _Nonnull)fetchViewWithKey;

@end

NS_ASSUME_NONNULL_END

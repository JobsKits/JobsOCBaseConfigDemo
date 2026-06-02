//
//  MainTableViewCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "MainTableViewCellItem.h"
#import "JobsExcelConfigureViewModel.h"
#import "JobsBaseTableViewCell.h"

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@class UIButtonModel;
@class MainTableViewCell;

@protocol MianTableViewCellDelegate <NSObject>
-(jobsByScrollViewBlock _Nonnull)mianTableViewCellScrollerDid;
@end

typedef MainTableViewCell *_Nonnull(^JobsReturnMainTableViewCellByDelegateBlock)(NSObject<MianTableViewCellDelegate> * _Nullable delegate);

@interface MainTableViewCell : JobsBaseTableViewCell
<
BaseCellProtocol,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
/// Data
Prop_weak()NSObject <MianTableViewCellDelegate> *delegate;

-(jobsByPointBlock _Nonnull)scrollerItemBy;
-(JobsReturnMainTableViewCellByDelegateBlock _Nonnull)byDelegate;

@end


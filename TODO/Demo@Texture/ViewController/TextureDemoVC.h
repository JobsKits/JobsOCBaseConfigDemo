//
//  TextureDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TDTextCellNode.h"
#import "TDImageCellNode.h"
#import "TDNetImageCellNode.h"
#import "TDButtonCellNode.h"
#import "TDEditableTextCellNode.h"
#import "TDHorizontalItemNode.h"
#import "TDHorizontalCarouselCellNode.h"
#import "TDVideoCellNode.h"
#import "TDMapCellNode.h"
#import "TDDrawCellNode.h"

#if __has_include(<AsyncDisplayKit/AsyncDisplayKit.h>)
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#else
#import "AsyncDisplayKit.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

#pragma mark —— Table Section Model
typedef NS_ENUM(NSInteger, TDDemoRowType) {
    TDDemoRowType_Text = 0,
    TDDemoRowType_LocalImage,
    TDDemoRowType_NetImage,
    TDDemoRowType_Button,
    TDDemoRowType_EditableText,
    TDDemoRowType_HCarousel,
    TDDemoRowType_Video,
    TDDemoRowType_Map,
    TDDemoRowType_Draw
};

NS_ASSUME_NONNULL_BEGIN

@interface TextureDemoVC : ASDKViewController<ASTableNode *> <ASTableDataSource, ASTableDelegate>

@end

NS_ASSUME_NONNULL_END

//
//  TextureDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>
#import "NSString+Others.h"
#import "NSObject+image.h"
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
#import "JobsDefineProperty.h"

#pragma mark - Table Section Model
typedef NS_ENUM(NSInteger, TDDemoRowType) {
    TDDemoRowType_Text = 0,
    TDDemoRowType_LocalImage,
    TDDemoRowType_NetImage,
    TDDemoRowType_Button,
    TDDemoRowType_EditableText,
    TDDemoRowType_HCarousel,
    TDDemoRowType_Video,
#if HAS_MAPKIT
    TDDemoRowType_Map,
#endif
    TDDemoRowType_Draw
};

NS_ASSUME_NONNULL_BEGIN

@interface TextureDemoVC : ASDKViewController<ASTableNode *> <ASTableDataSource, ASTableDelegate>

@end

NS_ASSUME_NONNULL_END

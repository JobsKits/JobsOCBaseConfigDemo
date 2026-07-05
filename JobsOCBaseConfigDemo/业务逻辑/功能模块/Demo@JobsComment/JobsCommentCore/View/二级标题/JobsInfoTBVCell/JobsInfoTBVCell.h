//
//  JobsInfoTBVCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsCommentConfig.h"
#import "JobsCommentModel.h"

#import "JobsBaseProtocolHeader.h"

#import "JobsLoadingImageHeader.h"

#import "JobsBaseUI.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsInfoTBVCell : UITableViewCell<BaseCellProtocol>

Prop_strong(readonly)RBCLikeButton *likeBtn;

@end

NS_ASSUME_NONNULL_END

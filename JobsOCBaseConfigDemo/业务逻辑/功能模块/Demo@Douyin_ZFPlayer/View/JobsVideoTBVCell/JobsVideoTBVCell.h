//
//  ZFDouYinCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/9/28.
//

#import <UIKit/UIKit.h>
#import "BaseCellProtocol.h"
#import "UIMarkProtocol.h"
#import "UIViewModelOthersProtocol.h"
#import "JobsDefineProperty.h"
#import "JobsRightBtnsView.h"
#import "VideoModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
@class JobsVideoTBVCell;

typedef JobsVideoTBVCell *_Nonnull(^JobsRetVideoTBVCellByDelegateBlock)(id<UIViewModelOthersProtocol> _Nullable delegate);

@interface JobsVideoTBVCell : UITableViewCell
<
BaseCellProtocol,
UIMarkProtocol
>

Prop_weak()id<UIViewModelOthersProtocol> delegate;
-(JobsRetVideoTBVCellByDelegateBlock _Nonnull)byDelegate;

@end

NS_ASSUME_NONNULL_END

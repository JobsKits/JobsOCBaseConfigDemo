//
//  JobsBtnStyleTBVCell.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/11/24.
//

#import "JobsBaseTableViewCell.h"
#import "BaseButtonProtocol.h"
#import "JobsDefineProperty.h"
#import "JobsBlock.h"
#import "UIButton+UI.h"
#import "UIButton+SimplyMake.h"
#import "UIButtonModel.h"
#import "UIViewModel.h"

NS_ASSUME_NONNULL_BEGIN
/// 将一个按钮整个覆盖到TableViewCell上面，以实现图文混排
/// 同 JobsBtnStyleCVCell
@interface JobsBtnStyleTBVCell : JobsBaseTableViewCell<BaseButtonProtocol>
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;
-(JobsRetTableViewCellByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets;

@end

NS_ASSUME_NONNULL_END

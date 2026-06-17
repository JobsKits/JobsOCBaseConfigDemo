//
//  JobsBtnsStyleCVCell.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/18/24.
//

#import "JobsBaseCollectionViewCell.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
/// 左右两边各有一个UIButton
@interface JobsBtnsStyleCVCell : JobsBaseCollectionViewCell

-(BaseButton *)leftBtn;
-(BaseButton *)rightBtn;
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END

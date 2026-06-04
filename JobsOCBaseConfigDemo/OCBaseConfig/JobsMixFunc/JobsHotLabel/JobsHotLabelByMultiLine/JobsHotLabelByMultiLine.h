//
//  JobsHotLabelWithMultiLine.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/15.
//

#import "JobsHotLabelConfig.h"
#import "BaseView.h"
#import "JobsHotLabelByMultiLineCVCell.h"
#import "JobsHeaderFooterView.h"
#import "JobsHeaderFooterViewModel.h"
#import "JobsDefineAllStructHeader.h"          // 此文件用来存储记录全局的一些结构体

NS_ASSUME_NONNULL_BEGIN

@interface JobsHotLabelWithMultiLineModel : UIViewModel

Prop_strong()JobsHeaderFooterViewModel *headerViewModel;
Prop_strong()JobsHeaderFooterViewModel *footerViewModel;

@end

@interface JobsHotLabelByMultiLine : BaseView
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END

/**
 
 使用方式：新建一个view，并复制粘贴下列内容👇🏻
 
 /// UI
 Prop_strong()NSMutableArray <NSString *>*btnTitleMutArr;
 Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;
 Prop_strong()JobsHotLabelWithMultiLineModel *hotLabelModel;
 Prop_strong()JobsHeaderFooterViewModel *headerViewModel;
 Prop_strong()JobsHeaderFooterViewModel *footerViewModel;
 
 #pragma mark —— lazyLoad
 -(JobsHotLabelWithMultiLine *)hotLabel{
     if (!_hotLabel) {
         _hotLabel = JobsHotLabelWithMultiLine.new;
         _hotLabel.jobsRichViewByModel(self.hotLabelModel);
         [self addSubview:_hotLabel];
         [_hotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
             make.edges.equalTo(self);
         }];
     }return _hotLabel;
 }

 -(JobsHotLabelWithMultiLineModel *)hotLabelModel{
     if (!_hotLabelModel) {
         _hotLabelModel = JobsHotLabelWithMultiLineModel.new;
         _hotLabelModel.bgCor = HEXCOLOR(0xFDFCF9);
         _hotLabelModel.viewModelMutArr = self.dataMutArr;
         _hotLabelModel.headerViewModel = self.headerViewModel;
         _hotLabelModel.footerViewModel = self.footerViewModel;
     }return _hotLabelModel;
 }

 -(JobsHeaderFooterViewModel *)headerViewModel{
     if (!_headerViewModel) {
         _headerViewModel = JobsHeaderFooterViewModel.new;
         _headerViewModel.useHeaderView = YES;
         _headerViewModel.textModel.text = @"交易类型".tr;
         _headerViewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
         _headerViewModel.textModel.font = UIFontWeightBoldSize(14);
         _headerViewModel.textModel.textAlignment = NSTextAlignmentLeft;
         _headerViewModel.bgCor = HEXCOLOR(0xFDFCF9);
 //        _headerViewModel.jobsSize = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(20));
     }return _headerViewModel;
 }

 -(JobsHeaderFooterViewModel *)footerViewModel{
     if (!_footerViewModel) {
         _footerViewModel = JobsHeaderFooterViewModel.new;
         _footerViewModel.useFooterView = NO;
         _footerViewModel.textModel.text = @"查看详情".tr;
         _footerViewModel.textModel.textAlignment = NSTextAlignmentLeft;
         _footerViewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
         _footerViewModel.textModel.font = UIFontWeightBoldSize(14);
         _footerViewModel.bgCor = HEXCOLOR(0xFDFCF9);
 //        _footerViewModel.jobsSize = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(20));
     }return _footerViewModel;
 }

 -(NSMutableArray<UIViewModel *> *)dataMutArr{
     if (!_dataMutArr) {
         _dataMutArr = NSMutableArray.array;
         for (NSString *str in self.btnTitleMutArr) {
             UIViewModel *viewModel = UIViewModel.new;
             viewModel.textModel.text = str;
             viewModel.textModel.font = UIFontWeightRegularSize(12);
             viewModel.textModel.textCor = HEXCOLOR(0x757575);
             viewModel.bgCor = HEXCOLOR(0xF3F3F3);
             viewModel.jobsSize = CGSizeMake(JobsWidth(80), JobsWidth(30));
             [_dataMutArr addObject:viewModel];
         }
     }return _dataMutArr;
 }

 -(NSMutableArray<NSString *> *)btnTitleMutArr{
     if (!_btnTitleMutArr) {
         _btnTitleMutArr = NSMutableArray.array;
         [_btnTitleMutArr addObject:@"全部".tr];
         [_btnTitleMutArr addObject:@"充值".tr];
         [_btnTitleMutArr addObject:@"取款".tr];
         [_btnTitleMutArr addObject:@"转账".tr];
         [_btnTitleMutArr addObject:@"返水".tr];
         [_btnTitleMutArr addObject:@"会员活动".tr];
         [_btnTitleMutArr addObject:@"VIP福利".tr];
         [_btnTitleMutArr addObject:@"其他".tr];
     }return _btnTitleMutArr;
 }

 /// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
 -(jobsByIDBlock _Nonnull)jobsRichViewByModel{
     @jobs_weakify(self)
     return ^(UIViewModel *_Nullable model) {
         @jobs_strongify(self)


     };
 }
 
 */

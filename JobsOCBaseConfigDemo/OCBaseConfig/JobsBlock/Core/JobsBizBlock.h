//
//  JobsBizBlock.h
//  JobsBlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsBlockDef.h"
#import "JobsBlockHeader.h"

#import "JobsDefines.h"

#ifndef JobsBizBlock_h
#define JobsBizBlock_h
typedef void(^jobsByFirstCommentCustomCofigModelBlock)(__kindof JobsFirstCommentCustomCofigModel *_Nullable model);
typedef void(^jobsByCommentModelBlock)(__kindof JobsCommentModel *_Nullable model);
typedef void(^jobsByFirstCommentModelBlock)(__kindof JobsFirstCommentModel *_Nullable model);
typedef void(^jobsByChildCommentModelBlock)(__kindof JobsChildCommentModel *_Nullable model);
typedef void(^jobsByMSCommentDetailModelBlock)(MSCommentDetailModel *_Nullable model);
typedef void(^jobsByMSCommentModelBlock)(MSCommentModel *_Nullable model);
typedef void(^jobsByIMListDataModelBlock)(__kindof JobsIMListDataModel *_Nullable model);
typedef void(^jobsByTMSCollectionViewLayoutBlock)(__kindof TMSCollectionViewLayout *_Nullable layout);
typedef void(^jobsByBizSubViewBlock)(__kindof FMHomeMainBizSubView *_Nullable subView);
typedef void(^jobsByKYCModelBlock)(__kindof KYCModel *_Nullable model);
typedef void(^jobsByTableHeaderView1Block)(__kindof FMTableHeaderView1 *_Nullable tableHeaderView);
typedef void(^jobsByThreeClassCellBlock)(__kindof ThreeClassCell *_Nullable cell);
typedef void(^jobsByGoodsClassModelBlock)(GoodsClassModel *_Nullable model);
typedef void(^jobsByBannerAdsModelBlock)(__kindof FMBannerAdsModel *_Nullable model);
typedef void(^jobsByBannerAdsModelAndCellBlock)(Jobs_ByBannerAdsModelAndCellBlock_Arguments);
typedef void(^jobsByWMZBannerParamBlock)(WMZBannerParam *_Nullable data);
typedef void(^jobsByMsgDataModelBlock)(__kindof JobsMsgDataModel *_Nullable model);
typedef void(^jobsByUpdatePasswordModelBlock)(__kindof FM_updatePassword_model *_Nullable model);
typedef void(^jobsByLikeModelBlock)(__kindof FMLikeModel *_Nullable model);
typedef void(^jobsByKYCInfoModelBlock)(__kindof FMKYCInfoModel *_Nullable model);
typedef void(^jobsByHotGameListModelBlock)(__kindof FMHotGameListModel *_Nullable model);
typedef void(^jobsByGameHomeSubMobileModelBlock)(__kindof FMGameHomeSubMobileModel *_Nullable model);
typedef void(^jobsByInboxModelBlock)(__kindof FMInboxModel *_Nullable model);
typedef void(^jobsByInboxTitleModelBlock)(__kindof FMInboxTitleModel *_Nullable model);
typedef void(^jobsBySubjectModelBlock)(__kindof FMSubjectModel *_Nullable model);
typedef void(^jobsByFMDateModelBlock)(__kindof FMDateModel *_Nullable model);
typedef void(^jobsByTypeModelBlock)(__kindof FMTypeModel *_Nullable model);
typedef void(^jobsByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable model);
typedef void(^jobsByPagerModelBlock)(__kindof FMPagerModel *_Nullable model);
typedef void(^jobsByReportTradeModelBlock)(__kindof FMReportTradeModel *_Nullable model);
typedef void(^jobsByBankDataSubModelBlock)(__kindof FMBankDataSubModel *_Nullable model);
typedef void(^jobsByBankDataModelBlock)(__kindof FMBankDataModel *_Nullable model);
typedef void(^jobsByMyGameBetOrderSumModelBlock)(__kindof FMMyGameBetOrderSumModel *_Nullable model);
typedef void(^jobsByFMAccModelBlock)(__kindof FMAccModel *_Nullable model);
typedef void(^jobsByVMArrBlock)(__kindof NSMutableArray<__kindof UIViewModel *> * _Nullable models);
typedef void(^jobsByPhilippinesModelsBlocks)(jobsByVMArrBlock _Nullable completionBlock);
typedef void(^jobsByFileNameModelBlock)(__kindof FileNameModel *_Nullable model);

typedef JobsToggleBaseView *_Nonnull(^JobsRetToggleBaseViewByArrBlock)(__kindof NSArray *_Nullable arr);

typedef __kindof KYCBaseView *_Nullable(^JobsRetKYCBaseViewByStatusBlock)(VerificationStatus status);
typedef __kindof UIScrollView *_Nullable(^JobsRetScrollViewByStatusBlock)(VerificationStatus status);
typedef __kindof GoodsClassModel *_Nullable(^JobsRetGoodsClassModelByIntBlock)(int data);
typedef __kindof GoodsClassModel *_Nullable(^JobsRetGoodsClassModelByInt2Block)(Jobs_ReturnGoodsClassModelByInt2Block_Arguments);
typedef __kindof GoodsClassModel *_Nullable(^JobsRetGoodsClassModelByIntStringBlock)(Jobs_ReturnGoodsClassModelByIntStringBlock_Arguments);

typedef JobsExcelConfigureViewModel *_Nullable(^JobsRetExcelConfigureDataByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable model);
typedef JobsExcelConfigureViewModel *_Nullable(^JobsRetExcelConfigureDataByReportTradeModelBlock)(__kindof FMReportTradeModel *_Nullable model);
typedef WMZBannerParam *_Nonnull(^JobsRetWMZBannerParamByArrBlock)(__kindof NSArray <FMBannerAdsModel *>*_Nullable models);
typedef WMZBannerParam *_Nonnull(^JobsRetWMZBannerParamByArrAndADTypeBlock)(Jobs_WMZBannerParam_Arr_ADType_Arguments);
typedef FMAccModel *_Nullable(^JobsRetAccModelByArrBlock)(__kindof NSArray *_Nullable arr);

#endif /* JobsBizBlock_h */

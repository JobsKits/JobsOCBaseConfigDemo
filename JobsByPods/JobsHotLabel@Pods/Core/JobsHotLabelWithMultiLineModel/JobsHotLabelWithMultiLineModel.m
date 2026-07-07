//
//  JobsHotLabelWithMultiLineModel.m
//  JobsHotLabel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsHotLabelWithMultiLineModel.h"

@implementation JobsHotLabelWithMultiLineModel

-(JobsHeaderFooterViewModel *)headerViewModel{
    if (!_headerViewModel) {
        _headerViewModel = jobsMakeHeaderFooterViewModel(^(JobsHeaderFooterViewModel * _Nullable data) {
//            data.textModel.text = @"独家情报".tr;
//            data.bgCor = JobsGreenColor;
            /// 结构体虽然分配了空间，但是里面的成员的值是随机的，特别是如果里面有指针的话，如果不初始化而直接访问，则会造成读取非法的内存地址的错误。
            data.byJobsSize(CGSizeZero)
                .byCellSize(CGSizeZero)
                .byTableHeaderViewSize(CGSizeZero)
                .byTableFooterViewSize(CGSizeZero)
                .byCornerRadii(CGSizeZero)
                .byJobsRect(CGRectZero)
                .byJobsPoint(CGPointZero);
        });
    };return _headerViewModel;
}

-(JobsHeaderFooterViewModel *)footerViewModel{
    if (!_footerViewModel) {
        _footerViewModel = jobsMakeHeaderFooterViewModel(^(JobsHeaderFooterViewModel * _Nullable data) {
//            data.textModel.text = @"查看详情".tr;
//            data.bgCor = JobsBlueColor;
            /// 结构体虽然分配了空间，但是里面的成员的值是随机的，特别是如果里面有指针的话，如果不初始化而直接访问，则会造成读取非法的内存地址的错误。
            data.byJobsSize(CGSizeZero)
                .byCellSize(CGSizeZero)
                .byTableHeaderViewSize(CGSizeZero)
                .byTableFooterViewSize(CGSizeZero)
                .byCornerRadii(CGSizeZero)
                .byJobsRect(CGRectZero)
                .byJobsPoint(CGPointZero);
        });
    };return _footerViewModel;
}

@end

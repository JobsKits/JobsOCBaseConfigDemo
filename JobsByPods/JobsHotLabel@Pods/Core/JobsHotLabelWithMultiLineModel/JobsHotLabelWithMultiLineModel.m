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
        _headerViewModel = jobsMakeViewModel(^(JobsHeaderFooterViewModel * _Nullable data) {
//            data.textModel.text = @"独家情报".tr;
//            data.bgCor = JobsGreenColor;
            /// 结构体虽然分配了空间，但是里面的成员的值是随机的，特别是如果里面有指针的话，如果不初始化而直接访问，则会造成读取非法的内存地址的错误。
            data.jobsSize = CGSizeZero;
            data.cellSize = CGSizeZero;
            data.tableHeaderViewSize = CGSizeZero;
            data.tableFooterViewSize = CGSizeZero;
            data.cornerRadii = CGSizeZero;
            data.jobsRect = CGRectZero;
            data.jobsPoint = CGPointZero;
        });
    }return _headerViewModel;
}

-(JobsHeaderFooterViewModel *)footerViewModel{
    if (!_footerViewModel) {
        _footerViewModel = jobsMakeViewModel(^(JobsHeaderFooterViewModel * _Nullable data) {
//            data.textModel.text = @"查看详情".tr;
//            data.bgCor = JobsBlueColor;
            /// 结构体虽然分配了空间，但是里面的成员的值是随机的，特别是如果里面有指针的话，如果不初始化而直接访问，则会造成读取非法的内存地址的错误。
            data.jobsSize = CGSizeZero;
            data.cellSize = CGSizeZero;
            data.tableHeaderViewSize = CGSizeZero;
            data.tableFooterViewSize = CGSizeZero;
            data.cornerRadii = CGSizeZero;
            data.jobsRect = CGRectZero;
            data.jobsPoint = CGPointZero;
        });
    }return _footerViewModel;
}

@end

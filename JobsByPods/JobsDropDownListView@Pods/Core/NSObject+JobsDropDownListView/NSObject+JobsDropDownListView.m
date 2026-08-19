//
//  NSObject+JobsDropDownListView.m
//  JobsDropDownListView
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "NSObject+JobsDropDownListView.h"

static CGRect jobsDropDownListViewWindowFrameByView(UIView *view) {
    return [view convertRect:view.bounds toView:jobsGetMainWindow()];
}

static CGFloat jobsDropDownListViewRowHeightByModel(UIViewModel *model) {
    return JobsDropDownListTBVCell.cellHeightByModel(model);
}

static CGFloat jobsDropDownListViewHeightByModels(NSArray <__kindof UIViewModel *>*models) {
    CGFloat listHeight = 0;
    for (UIViewModel *model in models) {
        listHeight += jobsDropDownListViewRowHeightByModel(model);
    };return listHeight;
}

@implementation NSObject (JobsDropDownListView)
-(JobsDropDownListView *_Nullable)jobsMotivateDropDownListFromView:(UIView *_Nonnull)motivateFromView
                                                         direction:(JobsDropDownListViewDirection)direction
                                                              data:(NSArray <__kindof UIViewModel *>*_Nullable)data
                                                motivateViewOffset:(CGFloat)motivateViewOffset
                                                       finishBlock:(jobsByIDBlock _Nullable)finishBlock{
    if (!motivateFromView || !data.count) return nil;
    NSMutableArray <__kindof UIViewModel *>*dataMutArr = data.mutableCopy;
    JobsDropDownListView *dropDownListView = JobsDropDownListView.new.byDirection(direction);
    @jobs_weakify(dropDownListView)
    dropDownListView.actionObjBlock(^(id selectedData) {
        @jobs_strongify(dropDownListView)
        UIControl *motivateControl = [motivateFromView isKindOfClass:UIControl.class]
            ? (UIControl *)motivateFromView
            : nil;
        jobsByCtrlBlock disappearBlock = dropDownListView.dropDownListViewDisappear;
        if (disappearBlock) disappearBlock(motivateControl);
        if (finishBlock) finishBlock(selectedData);
    });
    CGRect anchorFrame = jobsDropDownListViewWindowFrameByView(motivateFromView);
    CGFloat listHeight = jobsDropDownListViewHeightByModels(dataMutArr);
    dropDownListView.jobsReloadDataWithModels(dataMutArr);
    dropDownListView.byFrame(jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable location) {
        location.byJobsX(anchorFrame.origin.x)
                .byJobsY(direction == JobsDropDownListViewDirection_UP
                    ? anchorFrame.origin.y - motivateViewOffset - listHeight
                    : anchorFrame.origin.y + anchorFrame.size.height + motivateViewOffset)
                .byJobsWidth(anchorFrame.size.width)
                .byJobsHeight(listHeight);
    }));
    dropDownListView.addOn(jobsGetMainWindow());
    return dropDownListView;
}

@end

//
//  UIAlertController+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIALERTCONTROLLER_EXTRA_7A19BA870D
#define JOBS_HEADER_GUARD_UIALERTCONTROLLER_EXTRA_7A19BA870D

#import <UIKit/UIKit.h>

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// UIAlertController 的标题和消息属性仅支持简单的字符串 (NSString) 类型，而不直接支持富文本 (NSAttributedString)
@interface UIAlertController (Extra)

-(JobsRetAlertCtrlByActionBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIAlertController *_Nonnull JobsMakeAlertControllerBy(JobsAlertModel *_Nonnull model){
    return [UIAlertController alertControllerWithTitle:model.alertControllerTitle
                                               message:model.message
                                        preferredStyle:model.preferredStyle];
}
/**

     self.getCurrentViewController.comingToPresentVC(self.makeAlertControllerByAlertModel(jobsMakeAlertModel(^(JobsAlertModel * _Nullable data) {
         data.alertControllerTitle = @"主标题";
         data.message = @"副标题";
         data.preferredStyle = UIAlertControllerStyleAlert;
         data.alertActionTitle = @"OK";
         data.alertActionStyle = UIAlertActionStyleDefault;
         data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
             JobsLog(@"OK");
         };
         data.cancelAlertActionTitle = @"取消";
         data.cancelAlertActionStyle = UIAlertActionStyleCancel;
         data.cancelAlertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
             JobsLog(@"Cancel");
         };
     })));
 */
#endif /* JOBS_HEADER_GUARD_UIALERTCONTROLLER_EXTRA_7A19BA870D */

//
//  BaseImageView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEIMAGEVIEW_8FE347DBD4
#define JOBS_HEADER_GUARD_BASEIMAGEVIEW_8FE347DBD4

#import <UIKit/UIKit.h>
#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseImageView : UIImageView
<
BaseProtocol,
RACProtocol,
BaseViewProtocol
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASEIMAGEVIEW_8FE347DBD4 */

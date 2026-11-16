//
//  BaseCollectionReusableView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASECOLLECTIONREUSABLEVIEW_F067AB0C92

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JOBS_HEADER_GUARD_BASECOLLECTIONREUSABLEVIEW_F067AB0C92

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

#import "JobsBaseProtocolHeader.h"
#import "JobsModelDSL.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 更多自定义，移步 JobsHeaderFooterView
@interface BaseCollectionReusableView : UICollectionReusableView
<
BaseViewProtocol,
BaseProtocol,
UITextFieldProtocol,
UIPictureAndBackGroundCorProtocol,
AppToolsProtocol
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASECOLLECTIONREUSABLEVIEW_F067AB0C92 */

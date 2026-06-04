//
//  BaseCellProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASECELLPROTOCOL_A6BBD2BF0F
#define JOBS_HEADER_GUARD_BASECELLPROTOCOL_A6BBD2BF0F

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCProtocols/BaseViewProtocol.h>)
#import <JobsOCProtocols/BaseViewProtocol.h>
#elif __has_include("../BaseViewProtocol.h")
#import "../BaseViewProtocol.h"
#else
#import "BaseViewProtocol.h"
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

@protocol BaseCellProtocol <BaseViewProtocol>
@optional
#pragma mark —— 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy;
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy;
#pragma mark —— 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel;
-(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel;
#pragma mark —— 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel;
-(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel;
#pragma mark —— 设置Cell的背景图片
-(jobsByImageBlock _Nonnull)setCellBgImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASECELLPROTOCOL_A6BBD2BF0F */

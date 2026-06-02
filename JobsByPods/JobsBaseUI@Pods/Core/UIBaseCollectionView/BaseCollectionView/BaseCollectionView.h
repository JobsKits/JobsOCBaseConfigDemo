//
//  BaseCollectionView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASECOLLECTIONVIEW_7866F0156C
#define JOBS_HEADER_GUARD_BASECOLLECTIONVIEW_7866F0156C

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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
/**
    1、子类如果重写-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event，
        则将会被优先执行，从而忽略UICollectionViewDelegate方法；
    2、监听reloadData的方法： 因为reloadData刷新UI是在主线程上，那么就在主线程上等待。直接在reloadData后获取主线程操作等待；
 */
@interface BaseCollectionView : UICollectionView
<
BaseViewProtocol
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASECOLLECTIONVIEW_7866F0156C */

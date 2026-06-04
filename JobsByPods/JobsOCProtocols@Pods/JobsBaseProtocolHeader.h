//
//  JobsBaseProtocolHeader.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsBaseProtocolHeader_h
#define JobsBaseProtocolHeader_h

#pragma mark —— Leaf protocols
#if __has_include(<JobsOCProtocols/RACProtocol.h>)
#import <JobsOCProtocols/RACProtocol.h>
#elif __has_include("Core/XProtocols/XProtocol/RACProtocol.h")
#import "Core/XProtocols/XProtocol/RACProtocol.h"
#else
#import "RACProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/TimerProtocol.h>)
#import <JobsOCProtocols/TimerProtocol.h>
#elif __has_include("Core/BaseProtocols/TimerProtocol.h")
#import "Core/BaseProtocols/TimerProtocol.h"
#else
#import "TimerProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/BaseLayerProtocol.h>)
#import <JobsOCProtocols/BaseLayerProtocol.h>
#elif __has_include("Core/XProtocols/XProtocol/BaseLayerProtocol.h")
#import "Core/XProtocols/XProtocol/BaseLayerProtocol.h"
#else
#import "BaseLayerProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UILocationProtocol.h>)
#import <JobsOCProtocols/UILocationProtocol.h>
#elif __has_include("Core/XProtocols/XProtocol/UILocationProtocol.h")
#import "Core/XProtocols/XProtocol/UILocationProtocol.h"
#else
#import "UILocationProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UIMarkProtocol.h>)
#import <JobsOCProtocols/UIMarkProtocol.h>
#elif __has_include("Core/XProtocols/XProtocol/UIMarkProtocol.h")
#import "Core/XProtocols/XProtocol/UIMarkProtocol.h"
#else
#import "UIMarkProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UIPictureAndBackGroundCorProtocol.h>)
#import <JobsOCProtocols/UIPictureAndBackGroundCorProtocol.h>
#elif __has_include("Core/XProtocols/XProtocol/UIPictureAndBackGroundCorProtocol.h")
#import "Core/XProtocols/XProtocol/UIPictureAndBackGroundCorProtocol.h"
#else
#import "UIPictureAndBackGroundCorProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UITextModelProtocol.h>)
#import <JobsOCProtocols/UITextModelProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewModelProtocol/UITextModelProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewModelProtocol/UITextModelProtocol.h"
#else
#import "UITextModelProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UIViewModelOthersProtocol.h>)
#import <JobsOCProtocols/UIViewModelOthersProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewModelProtocol/UIViewModelOthersProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewModelProtocol/UIViewModelOthersProtocol.h"
#else
#import "UIViewModelOthersProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/BaseButtonProtocol.h>)
#import <JobsOCProtocols/BaseButtonProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewProtocols/BaseButtonProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewProtocols/BaseButtonProtocol.h"
#else
#import "BaseButtonProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UITextFieldProtocol.h>)
#import <JobsOCProtocols/UITextFieldProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewProtocols/UITextFieldProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewProtocols/UITextFieldProtocol.h"
#else
#import "UITextFieldProtocol.h"
#endif
#pragma mark —— XProtocols
#if __has_include(<JobsOCProtocols/XProtocol.h>)
#import <JobsOCProtocols/XProtocol.h>
#elif __has_include("Core/XProtocols/XProtocol.h")
#import "Core/XProtocols/XProtocol.h"
#else
#import "XProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/MJRefreshProtocol.h>)
#import <JobsOCProtocols/MJRefreshProtocol.h>
#elif __has_include("Core/XProtocols/XProtocol/MJRefreshProtocol.h")
#import "Core/XProtocols/XProtocol/MJRefreshProtocol.h"
#else
#import "MJRefreshProtocol.h"
#endif
#pragma mark —— BaseProtocols
#if __has_include(<JobsOCProtocols/BaseProtocol.h>)
#import <JobsOCProtocols/BaseProtocol.h>
#elif __has_include("Core/BaseProtocols/BaseProtocol.h")
#import "Core/BaseProtocols/BaseProtocol.h"
#else
#import "BaseProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/AppToolsProtocol.h>)
#import <JobsOCProtocols/AppToolsProtocol.h>
#elif __has_include("Core/BaseProtocols/AppToolsProtocol.h")
#import "Core/BaseProtocols/AppToolsProtocol.h"
#else
#import "AppToolsProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/GestureProtocol.h>)
#import <JobsOCProtocols/GestureProtocol.h>
#elif __has_include("Core/BaseProtocols/GestureProtocol.h")
#import "Core/BaseProtocols/GestureProtocol.h"
#else
#import "GestureProtocol.h"
#endif
#pragma mark —— OtherProtocols
#if __has_include(<JobsOCProtocols/TMSCollectionViewLayoutDelegate.h>)
#import <JobsOCProtocols/TMSCollectionViewLayoutDelegate.h>
#elif __has_include("Core/OtherProtocols/TMSCollectionViewLayoutDelegate.h")
#import "Core/OtherProtocols/TMSCollectionViewLayoutDelegate.h"
#else
#import "TMSCollectionViewLayoutDelegate.h"
#endif

#if __has_include(<JobsOCProtocols/JobsDoorInputViewProtocol.h>)
#import <JobsOCProtocols/JobsDoorInputViewProtocol.h>
#elif __has_include("Core/OtherProtocols/JobsDoorInputViewProtocol.h")
#import "Core/OtherProtocols/JobsDoorInputViewProtocol.h"
#else
#import "JobsDoorInputViewProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UIScrollViewDSLProtocol.h>)
#import <JobsOCProtocols/UIScrollViewDSLProtocol.h>
#elif __has_include("Core/OtherProtocols/UIScrollViewDSLProtocol.h")
#import "Core/OtherProtocols/UIScrollViewDSLProtocol.h"
#else
#import "UIScrollViewDSLProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UIScrollViewProtocol.h>)
#import <JobsOCProtocols/UIScrollViewProtocol.h>
#elif __has_include("Core/OtherProtocols/UIScrollViewProtocol.h")
#import "Core/OtherProtocols/UIScrollViewProtocol.h"
#else
#import "UIScrollViewProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UICollectionViewDSLProtocol.h>)
#import <JobsOCProtocols/UICollectionViewDSLProtocol.h>
#elif __has_include("Core/OtherProtocols/UICollectionViewDSLProtocol.h")
#import "Core/OtherProtocols/UICollectionViewDSLProtocol.h"
#else
#import "UICollectionViewDSLProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/YTKCustomBaseRequestProtocol.h>)
#import <JobsOCProtocols/YTKCustomBaseRequestProtocol.h>
#elif __has_include("Core/OtherProtocols/YTKCustomBaseRequestProtocol.h")
#import "Core/OtherProtocols/YTKCustomBaseRequestProtocol.h"
#else
#import "YTKCustomBaseRequestProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/YTKNetworkProtocols.h>)
#import <JobsOCProtocols/YTKNetworkProtocols.h>
#elif __has_include("Core/OtherProtocols/YTKNetworkProtocols.h")
#import "Core/OtherProtocols/YTKNetworkProtocols.h"
#else
#import "YTKNetworkProtocols.h"
#endif
#pragma mark —— UIViewModelProtocols
#if __has_include(<JobsOCProtocols/UIViewModelProtocol.h>)
#import <JobsOCProtocols/UIViewModelProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewModelProtocol/UIViewModelProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewModelProtocol/UIViewModelProtocol.h"
#else
#import "UIViewModelProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/BaseViewProtocol.h>)
#import <JobsOCProtocols/BaseViewProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewProtocols/BaseViewProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewProtocols/BaseViewProtocol.h"
#else
#import "BaseViewProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/BaseCollectionViewProtocol.h>)
#import <JobsOCProtocols/BaseCollectionViewProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewProtocols/BaseCollectionViewProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewProtocols/BaseCollectionViewProtocol.h"
#else
#import "BaseCollectionViewProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/BaseTableViewProtocol.h>)
#import <JobsOCProtocols/BaseTableViewProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewProtocols/BaseTableViewProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewProtocols/BaseTableViewProtocol.h"
#else
#import "BaseTableViewProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/BaseViewControllerProtocol.h>)
#import <JobsOCProtocols/BaseViewControllerProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewProtocols/BaseViewControllerProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewProtocols/BaseViewControllerProtocol.h"
#else
#import "BaseViewControllerProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/BaseCellProtocol.h>)
#import <JobsOCProtocols/BaseCellProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewProtocols/BaseCellProtocols/BaseCellProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewProtocols/BaseCellProtocols/BaseCellProtocol.h"
#else
#import "BaseCellProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UICollectionViewCellProtocol.h>)
#import <JobsOCProtocols/UICollectionViewCellProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewProtocols/BaseCellProtocols/UICollectionViewCellProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewProtocols/BaseCellProtocols/UICollectionViewCellProtocol.h"
#else
#import "UICollectionViewCellProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/UITableViewCellProtocol.h>)
#import <JobsOCProtocols/UITableViewCellProtocol.h>
#elif __has_include("Core/UIViewModelProtocols/BaseViewProtocols/BaseCellProtocols/UITableViewCellProtocol.h")
#import "Core/UIViewModelProtocols/BaseViewProtocols/BaseCellProtocols/UITableViewCellProtocol.h"
#else
#import "UITableViewCellProtocol.h"
#endif
#endif /* JobsBaseProtocolHeader_h */

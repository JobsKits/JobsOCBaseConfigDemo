//
//  MyCollectionVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 6/22/24.
//

#import "BaseViewController.h"
#import "MyCollectionVC.h"
#import "PreviewVC.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectionVC : BaseViewController
<
UIContextMenuInteractionDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource
>

@end

NS_ASSUME_NONNULL_END

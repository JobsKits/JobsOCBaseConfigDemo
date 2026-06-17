//
//  HXPhotoView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "HXPhotoView+DSL.h"

@implementation HXPhotoView (DSL)

-(JobsRetHXPhotoViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(id<HXPhotoViewDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByPhotoMgrBlock _Nonnull)byManager{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(__kindof HXPhotoManager *_Nullable data){
        @jobs_strongify(self)
        self.manager = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByCollectionViewBlock _Nonnull)byCollectionView{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(__kindof HXCollectionView *_Nullable data){
        @jobs_strongify(self)
        self.collectionView = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByCellCustomProtocolBlock _Nonnull)byCellCustomProtocol{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(id<HXPhotoViewCellCustomProtocol> _Nullable data){
        @jobs_strongify(self)
        self.cellCustomProtocol = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByScrollDirectionBlock _Nonnull)byScrollDirection{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(UICollectionViewScrollDirection data){
        @jobs_strongify(self)
        self.scrollDirection = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byOuterCamera{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.outerCamera = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByNSIntegerBlock _Nonnull)byLineCount{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.lineCount = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByCGFloatBlock _Nonnull)bySpacing{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.spacing = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byHideDeleteButton{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.hideDeleteButton = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byEditEnabled{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.editEnabled = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byShowAddCell{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showAddCell = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byPreviewShowDeleteButton{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.previewShowDeleteButton = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByStringBlock _Nonnull)byAddImageName{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.addImageName = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByStringBlock _Nonnull)byAddDarkImageName{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.addDarkImageName = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByStringBlock _Nonnull)byDeleteImageName{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.deleteImageName = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byDisableaInteractiveTransition{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.disableaInteractiveTransition = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byInterceptAddCellClick{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.interceptAddCellClick = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byShowDeleteNetworkPhotoAlert{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showDeleteNetworkPhotoAlert = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byDeleteCellShowAlert{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.deleteCellShowAlert = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByNSUIntegerBlock _Nonnull)byPreviewStyle{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.previewStyle = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byPreviewShowBottomPageControl{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.previewShowBottomPageControl = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byAdaptiveDarkness{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.adaptiveDarkness = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByCGFloatBlock _Nonnull)byMaximumHeight{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.maximumHeight = data;
        return self;
    };
}

-(JobsRetHXPhotoViewByIndexPathBlock _Nonnull)byCurrentIndexPath{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(NSIndexPath *_Nullable data){
        @jobs_strongify(self)
        self.currentIndexPath = data;
        return self;
    };
}

-(__kindof HXPhotoView *_Nonnull)byGoPhotoViewController{
    [self goPhotoViewController];
    return self;
}

-(__kindof HXPhotoView *_Nonnull)byDirectGoPhotoViewController{
    [self directGoPhotoViewController];
    return self;
}

-(__kindof HXPhotoView *_Nonnull)byGoCameraViewController{
    [self goCameraViewController];
    return self;
}

-(JobsRetHXPhotoViewByNSIntegerBlock _Nonnull)byDeleteModelWithIndex{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        [self deleteModelWithIndex:data];
        return self;
    };
}

-(__kindof HXPhotoView *_Nonnull)byRefreshView{
    [self refreshView];
    return self;
}

-(JobsRetHXPhotoViewByNSIntegerBlock _Nonnull)byJumpPreviewViewControllerWithIndex{
    @jobs_weakify(self)
    return ^__kindof HXPhotoView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        [self jumpPreviewViewControllerWithIndex:data];
        return self;
    };
}

@end

//
//  UICollectionViewFlowLayout+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#import "UICollectionViewFlowLayout+DSL.h"

@implementation UICollectionViewFlowLayout (DSL)
#pragma mark —— Factory
+(JobsRetCollectionViewFlowLayoutByVoidBlock _Nonnull)byCollectionViewFlowLayout{
    return ^__kindof UICollectionViewFlowLayout *_Nullable(void){
        return [[self alloc] init];
    };
}

#pragma mark —— Layout Metrics
-(JobsRetCollectionViewFlowLayoutByCGFloatBlock _Nonnull)byMinimumLineSpacing{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minimumLineSpacing = data;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGFloatBlock _Nonnull)byMinimumInteritemSpacing{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minimumInteritemSpacing = data;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGSizeBlock _Nonnull)byItemSize{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.itemSize = size;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGSizeBlock _Nonnull)byEstimatedItemSize{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.estimatedItemSize = size;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByUICollectionViewScrollDirectionBlock _Nonnull)byScrollDirection{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(UICollectionViewScrollDirection direction){
        @jobs_strongify(self)
        self.scrollDirection = direction;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGSizeBlock _Nonnull)byHeaderReferenceSize{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.headerReferenceSize = size;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGSizeBlock _Nonnull)byFooterReferenceSize{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.footerReferenceSize = size;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByUIEdgeInsetsBlock _Nonnull)bySectionInset{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.sectionInset = insets;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByBOOLBlock _Nonnull)bySectionHeadersPinToVisibleBounds{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)){
            self.sectionHeadersPinToVisibleBounds = data;
        };return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByBOOLBlock _Nonnull)bySectionFootersPinToVisibleBounds{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)){
            self.sectionFootersPinToVisibleBounds = data;
        };return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByUICollectionViewFlowLayoutSectionInsetReferenceBlock _Nonnull)bySectionInsetReference{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(UICollectionViewFlowLayoutSectionInsetReference reference){
        @jobs_strongify(self)
        if (@available(iOS 11.0, tvOS 11.0, *)){
            self.sectionInsetReference = reference;
        };return self;
    };
}

@end

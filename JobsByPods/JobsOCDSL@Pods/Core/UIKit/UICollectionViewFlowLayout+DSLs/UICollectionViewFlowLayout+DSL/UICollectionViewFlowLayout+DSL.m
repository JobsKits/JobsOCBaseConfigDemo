//
//  UICollectionViewFlowLayout+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#import "UICollectionViewFlowLayout+DSL.h"

@implementation UICollectionViewFlowLayout (DSL)
#pragma mark —— Factory
+(JobsRetCollectionViewFlowLayoutByVoidBlock)byCollectionViewFlowLayout{
    return ^__kindof UICollectionViewFlowLayout *_Nullable(void){
        return [[self alloc] init];
    };
}

#pragma mark —— Layout Metrics
-(JobsRetCollectionViewFlowLayoutByCGFloatBlock)byMinimumLineSpacing{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minimumLineSpacing = data;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGFloatBlock)byMinimumInteritemSpacing{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minimumInteritemSpacing = data;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGSizeBlock)byItemSize{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.itemSize = size;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGSizeBlock)byEstimatedItemSize{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.estimatedItemSize = size;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByUICollectionViewScrollDirectionBlock)byScrollDirection{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(UICollectionViewScrollDirection direction){
        @jobs_strongify(self)
        self.scrollDirection = direction;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGSizeBlock)byHeaderReferenceSize{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.headerReferenceSize = size;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByCGSizeBlock)byFooterReferenceSize{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.footerReferenceSize = size;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByUIEdgeInsetsBlock)bySectionInset{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.sectionInset = insets;
        return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByBOOLBlock)bySectionHeadersPinToVisibleBounds{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)){
            self.sectionHeadersPinToVisibleBounds = data;
        };return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByBOOLBlock)bySectionFootersPinToVisibleBounds{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)){
            self.sectionFootersPinToVisibleBounds = data;
        };return self;
    };
}

-(JobsRetCollectionViewFlowLayoutByUICollectionViewFlowLayoutSectionInsetReferenceBlock)bySectionInsetReference{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewFlowLayout *_Nullable(UICollectionViewFlowLayoutSectionInsetReference reference){
        @jobs_strongify(self)
        if (@available(iOS 11.0, tvOS 11.0, *)){
            self.sectionInsetReference = reference;
        };return self;
    };
}

@end

//
//  JXCategoryImageView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryImageView+Extra.h"

@implementation JXCategoryImageView (Extra)
-(JobsRetCategoryImageViewByStringsBlock _Nonnull)byImageNames{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.imageNames = strings;
        return self;
    };
}

-(JobsRetCategoryImageViewByStringsBlock _Nonnull)bySelectedImageNames{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.selectedImageNames = strings;
        return self;
    };
}

-(JobsRetCategoryImageViewByStringsBlock _Nonnull)byImageInfoArray{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.imageInfoArray = strings;
        return self;
    };
}

-(JobsRetCategoryImageViewByStringsBlock _Nonnull)bySelectedImageInfoArray{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.selectedImageInfoArray = strings;
        return self;
    };
}

-(JobsRetCategoryImageViewBySizeBlock _Nonnull)byImageSize{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.imageSize = size;
        return self;
    };
}

-(JobsRetCategoryImageViewByCGFloatBlock _Nonnull)byImageCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.imageCornerRadius = data;
        return self;
    };
}

-(JobsRetCategoryImageViewByBOOLBlock _Nonnull)byImageZoomEnabled{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.imageZoomEnabled = data;
        return self;
    };
}

-(JobsRetCategoryImageViewByNSIntegerBlock _Nonnull)byImageZoomScale{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.imageZoomScale = data;
        return self;
    };
}

@end

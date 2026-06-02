//
//  JXCategoryImageCellModel.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryIndicatorCellModel.h>

@interface JXCategoryImageCellModel : JXCategoryIndicatorCellModel

@property (nonatomic, copy) void(^loadImageCallback)(UIImageView *imageView, NSURL *imageURL);

@property (nonatomic, copy) NSString *imageName;    //加载bundle内的图片

@property (nonatomic, strong) NSURL *imageURL;      //图片URL

@property (nonatomic, copy) NSString *selectedImageName;

@property (nonatomic, strong) NSURL *selectedImageURL;

@property (nonatomic, assign) CGSize imageSize;

@property (nonatomic, assign) CGFloat imageCornerRadius;

@property (nonatomic, assign) BOOL imageZoomEnabled;    

@property (nonatomic, assign) CGFloat imageZoomScale;

@end

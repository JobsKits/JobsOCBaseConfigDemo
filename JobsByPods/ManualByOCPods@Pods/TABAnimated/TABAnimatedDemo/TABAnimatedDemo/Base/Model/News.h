//
//  News.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (nonatomic,copy) NSString *imageUrl;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *coverImageUrls;

@end

NS_ASSUME_NONNULL_END

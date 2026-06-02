//
//  ZWPullMenuModel.h
//  ZWPullMenuView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, ZWPullMenuStyle) {
    PullMenuDarkStyle = 0,  //类微信、黑底白字
    PullMenuLightStyle      //类支付宝、白底黑字
};
@interface ZWPullMenuModel : NSObject
/** 
 * 文字
 */
@property (nonatomic, copy) NSString *title;
/** 
 * 图片
 */
@property (nonatomic, copy) NSString *imageName;
@end
NS_ASSUME_NONNULL_END

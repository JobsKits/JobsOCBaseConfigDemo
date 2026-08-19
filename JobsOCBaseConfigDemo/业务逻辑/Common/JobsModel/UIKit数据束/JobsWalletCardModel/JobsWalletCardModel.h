//
//  JobsWalletCardModel.h
//  JobsModel
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JobsWalletCardModel_h
#define JobsWalletCardModel_h

#import <UIKit/UIKit.h>
#import "BaseModel.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 一张银行卡卡片的最小渲染数据束。
@interface JobsWalletCardModel : BaseModel

Prop_strong(nullable)UIImage *backgroundImage;
Prop_strong(nullable)UIColor *backgroundColor;
Prop_strong()UIImage *bankIcon;
Prop_copy()NSString *bankName;
Prop_copy()NSString *cardNumber;
Prop_copy(nullable)NSString *cvc;
Prop_copy(nullable)NSString *expirationDate;

-(JobsRetJobsWalletCardModelByImageBlock _Nonnull)byBackgroundImage;
-(JobsRetJobsWalletCardModelByCorBlock _Nonnull)byBackgroundColor;
-(JobsRetJobsWalletCardModelByImageBlock _Nonnull)byBankIcon;
-(JobsRetJobsWalletCardModelByStrBlock _Nonnull)byBankName;
-(JobsRetJobsWalletCardModelByStrBlock _Nonnull)byCardNumber;
-(JobsRetJobsWalletCardModelByStrBlock _Nonnull)byCvc;
-(JobsRetJobsWalletCardModelByStrBlock _Nonnull)byExpirationDate;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsWalletCardModel_h */

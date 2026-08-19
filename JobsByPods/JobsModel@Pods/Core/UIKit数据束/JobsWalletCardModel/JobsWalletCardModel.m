//
//  JobsWalletCardModel.m
//  JobsModel
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsWalletCardModel.h"

@implementation JobsWalletCardModel

#define JOBS_WALLET_CARD_MODEL_OBJECT_DSL(_selector_, _property_, _type_, _blockType_) \
-(_blockType_ _Nonnull)_selector_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsWalletCardModel *_Nullable(_type_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JOBS_WALLET_CARD_MODEL_OBJECT_DSL(byBackgroundImage, backgroundImage, UIImage *_Nullable, JobsRetJobsWalletCardModelByImageBlock)
JOBS_WALLET_CARD_MODEL_OBJECT_DSL(byBackgroundColor, backgroundColor, UIColor *_Nullable, JobsRetJobsWalletCardModelByCorBlock)
JOBS_WALLET_CARD_MODEL_OBJECT_DSL(byBankIcon, bankIcon, UIImage *_Nullable, JobsRetJobsWalletCardModelByImageBlock)
JOBS_WALLET_CARD_MODEL_OBJECT_DSL(byBankName, bankName, NSString *_Nullable, JobsRetJobsWalletCardModelByStrBlock)
JOBS_WALLET_CARD_MODEL_OBJECT_DSL(byCardNumber, cardNumber, NSString *_Nullable, JobsRetJobsWalletCardModelByStrBlock)
JOBS_WALLET_CARD_MODEL_OBJECT_DSL(byCvc, cvc, NSString *_Nullable, JobsRetJobsWalletCardModelByStrBlock)
JOBS_WALLET_CARD_MODEL_OBJECT_DSL(byExpirationDate, expirationDate, NSString *_Nullable, JobsRetJobsWalletCardModelByStrBlock)

#undef JOBS_WALLET_CARD_MODEL_OBJECT_DSL

@end

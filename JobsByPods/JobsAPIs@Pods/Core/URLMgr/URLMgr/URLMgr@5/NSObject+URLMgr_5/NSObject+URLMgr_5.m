//
//  NSObject+URLMgr_5.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+URLMgr_5.h"

#import <JobsAPIs/NSObject+Extra.h>
/// 来自 http://18.162.73.145:18193/doc.html#/default/
@implementation NSObject (URLMgr_5)
#pragma mark —— adjust-order-controller
/// 资金调整@POST
-(URLManagerModel *_Nullable)post_fund_adjust_adjustOrder{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_adjust_adjustOrder)))(self, @selector(jobs_post_fund_adjust_adjustOrder)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_adjust_adjustOrder{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/adjust/adjustOrder");
    };
}
/// 资金调整审核@POST
-(URLManagerModel *_Nullable)post_fund_adjust_auditFundAdjust{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_adjust_auditFundAdjust)))(self, @selector(jobs_post_fund_adjust_auditFundAdjust)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_adjust_auditFundAdjust{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/adjust/auditFundAdjust");
    };
}
/// 批量资金调整@POST
-(URLManagerModel *_Nullable)post_fund_adjust_batchAdjustOrderList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_adjust_batchAdjustOrderList)))(self, @selector(jobs_post_fund_adjust_batchAdjustOrderList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_adjust_batchAdjustOrderList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/adjust/batchAdjustOrderList");
    };
}
#pragma mark —— ai-pay-controller
/// MantaPayGcash支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_deposit_aipay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_aipay_callback)))(self, @selector(jobs_post_fund_deposit_aipay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_aipay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/aipay/callback");
    };
}
/// MantaPayGcash提现订单回调@POST
-(URLManagerModel *_Nullable)post_fund_payment_aipay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_payment_aipay_callback)))(self, @selector(jobs_post_fund_payment_aipay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_payment_aipay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/payment/aipay/callback");
    };
}
#pragma mark —— bbpay-controller
/// BB支付-充值回调@POST
-(URLManagerModel *_Nullable)post_fund_callback_bbpay_depositCallback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_callback_bbpay_depositCallback)))(self, @selector(jobs_post_fund_callback_bbpay_depositCallback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_callback_bbpay_depositCallback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/callback/bbpay/depositCallback");
    };
}
#pragma mark —— cb-pay-controller
/// 九五支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_deposit_jwpay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_jwpay_callback)))(self, @selector(jobs_post_fund_deposit_jwpay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_jwpay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/jwpay/callback");
    };
}
#pragma mark —— da-xin-yu-pay-controller
/// 大信誉支付充值订单回调@POST
-(URLManagerModel *_Nullable)post_fund_callback_daxinyupay_depositCallbac{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_callback_daxinyupay_depositCallbac)))(self, @selector(jobs_post_fund_callback_daxinyupay_depositCallbac)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_callback_daxinyupay_depositCallbac{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/callback/daxinyupay/depositCallback");
    };
}
#pragma mark —— gt-pay-ph-controller
/// GTpayPH支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_deposit_gtpay_ph_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_gtpay_ph_callback)))(self, @selector(jobs_post_fund_deposit_gtpay_ph_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_gtpay_ph_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/gtpay/ph/callback");
    };
}
/// GTpayPH提现订单回调@POST
-(URLManagerModel *_Nullable)post_fund_payment_gtpay_ph_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_payment_gtpay_ph_callback)))(self, @selector(jobs_post_fund_payment_gtpay_ph_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_payment_gtpay_ph_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/payment/gtpay/ph/callback");
    };
}
#pragma mark —— gtpay-controller
/// GT支付充值订单回调@POST
-(URLManagerModel *_Nullable)post_fund_callback_gtpay_depositCallback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_callback_gtpay_depositCallback)))(self, @selector(jobs_post_fund_callback_gtpay_depositCallback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_callback_gtpay_depositCallback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/callback/gtpay/depositCallback");
    };
}
#pragma mark —— hsct-pay-controller
/// 合胜财通支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_callback_hsCtPay_depositCallback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_callback_hsCtPay_depositCallback)))(self, @selector(jobs_post_fund_callback_hsCtPay_depositCallback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_callback_hsCtPay_depositCallback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/callback/hsCtPay/depositCallback");
    };
}
#pragma mark —— joy-pay-service
/// depositCallBack@POST
-(URLManagerModel *_Nullable)post_fund_gcash_deposit_joypay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_gcash_deposit_joypay_callback)))(self, @selector(jobs_post_fund_gcash_deposit_joypay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_gcash_deposit_joypay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/gcash/deposit/joypay/callback");
    };
}
#pragma mark —— lh-pay-controller
/// 领航支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_deposit_lhpay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_lhpay_callback)))(self, @selector(jobs_post_fund_deposit_lhpay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_lhpay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/lhpay/callback");
    };
}
#pragma mark —— lubupay-controller
/// 吕布支付充值订单回调@POST
-(URLManagerModel *_Nullable)post_fund_callback_lubupay_depositCallback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_callback_lubupay_depositCallback)))(self, @selector(jobs_post_fund_callback_lubupay_depositCallback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_callback_lubupay_depositCallback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/callback/lubupay/depositCallback");
    };
}
#pragma mark —— manta-pay-controller
/// MantaPayGcash支付订单回调@GET
-(URLManagerModel *_Nullable)get_fund_deposit_mantapay_gcash_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_deposit_mantapay_gcash_callback)))(self, @selector(jobs_get_fund_deposit_mantapay_gcash_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_deposit_mantapay_gcash_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/mantapay/gcash/callback");
    };
}
/// MantaPayMaya支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_deposit_mantapay_maya_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_mantapay_maya_callback)))(self, @selector(jobs_post_fund_deposit_mantapay_maya_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_mantapay_maya_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/mantapay/maya/callback");
    };
}
/// MantaPayGcash提现订单回调@GET
-(URLManagerModel *_Nullable)get_fund_payment_mantapay_gcash_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_payment_mantapay_gcash_callback)))(self, @selector(jobs_get_fund_payment_mantapay_gcash_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_payment_mantapay_gcash_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/payment/mantapay/gcash/callback");
    };
}
/// MantaPayMaya提现订单回调@POST
-(URLManagerModel *_Nullable)post_fund_payment_mantapay_maya_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_payment_mantapay_maya_callback)))(self, @selector(jobs_post_fund_payment_mantapay_maya_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_payment_mantapay_maya_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/payment/mantapay/maya/callback");
    };
}
#pragma mark —— ptsg-cash-service
/// depositCallBack@POST
-(URLManagerModel *_Nullable)post_fund_gcash_deposit_pts_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_gcash_deposit_pts_callback)))(self, @selector(jobs_post_fund_gcash_deposit_pts_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_gcash_deposit_pts_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/gcash/deposit/pts/callback");
    };
}
/// paymentCallBack@POST
-(URLManagerModel *_Nullable)post_fund_gcash_payment_pts_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_gcash_payment_pts_callback)))(self, @selector(jobs_post_fund_gcash_payment_pts_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_gcash_payment_pts_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/gcash/payment/pts/callback");
    };
}
/// withdrawConfirmation@POST
-(URLManagerModel *_Nullable)post_fund_gcash_pts_withdraw_confirmation{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_gcash_pts_withdraw_confirmation)))(self, @selector(jobs_post_fund_gcash_pts_withdraw_confirmation)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_gcash_pts_withdraw_confirmation{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/gcash/pts/withdraw/confirmation");
    };
}
#pragma mark —— ttpay-controller
/// TT支付充值订单回调@POST
-(URLManagerModel *_Nullable)post_fund_callback_ttpay_depositCallbackn{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_callback_ttpay_depositCallbackn)))(self, @selector(jobs_post_fund_callback_ttpay_depositCallbackn)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_callback_ttpay_depositCallbackn{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/callback/ttpay/depositCallback");
    };
}
#pragma mark —— wuyoupay-controller
/// TT支付充值订单回调@POST
-(URLManagerModel *_Nullable)post_fund_callback_ttpay_depositCallback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_callback_ttpay_depositCallback)))(self, @selector(jobs_post_fund_callback_ttpay_depositCallback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_callback_ttpay_depositCallback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/callback/ttpay/depositCallback");
    };
}
#pragma mark —— wy-pay-controller
/// WYPay支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_deposit_wypay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_wypay_callback)))(self, @selector(jobs_post_fund_deposit_wypay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_wypay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/wypay/callback");
    };
}
#pragma mark —— xh-pay-controller
/// 幸汇支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_deposit_xhPay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_xhPay_callback)))(self, @selector(jobs_post_fund_deposit_xhPay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_xhPay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/xhPay/callback");
    };
}
#pragma mark —— yf-pay-controller
/// 远方支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_deposit_yfpay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_yfpay_callback)))(self, @selector(jobs_post_fund_deposit_yfpay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_yfpay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/yfpay/callback");
    };
}
#pragma mark —— yh-pay-controller
/// 123pay支付订单回调@POST
-(URLManagerModel *_Nullable)post_fund_deposit_yhpay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_yhpay_callback)))(self, @selector(jobs_post_fund_deposit_yhpay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_yhpay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/yhpay/callback");
    };
}
/// 123pay提现订单回调@POST
-(URLManagerModel *_Nullable)post_fund_payment_yhpay_callback{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_payment_yhpay_callback)))(self, @selector(jobs_post_fund_payment_yhpay_callback)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_payment_yhpay_callback{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/payment/yhpay/callback");
    };
}
#pragma mark —— 资金明细接口
/// 查询会员资金明细@POST
-(URLManagerModel *_Nullable)post_fund_report_trade_page{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_report_trade_page)))(self, @selector(jobs_post_fund_report_trade_page)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_report_trade_page{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/report/trade/page");
    };
}
#pragma mark —— 资金模块-微服务内部使用-四方商户接口
/// 查询电子钱包商户余额@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_fund_eWallet_balance_fiatByMCHID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable mchId){
        NSString *url = @"/api/fund/eWallet/balance/fiat/{".add(mchId).add(@"}");
        return JobsURL(url);
    };
}
/// 会员电子钱包出款下单@POST
-(URLManagerModel *_Nullable)post_fund_eWallet_payment_fiat{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_eWallet_payment_fiat)))(self, @selector(jobs_post_fund_eWallet_payment_fiat)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_eWallet_payment_fiat{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/eWallet/payment/fiat");
    };
}
/// 代理法币出款下单@POST
-(URLManagerModel *_Nullable)post_fund_merchantBiz_agentPayment_fiat{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_merchantBiz_agentPayment_fiat)))(self, @selector(jobs_post_fund_merchantBiz_agentPayment_fiat)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_merchantBiz_agentPayment_fiat{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/merchant-biz/agentPayment/fiat");
    };
}
/// 代理USDT出款下单@POST
-(URLManagerModel *_Nullable)post_fund_merchantBiz_agentPayment_usdt{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_merchantBiz_agentPayment_usdt)))(self, @selector(jobs_post_fund_merchantBiz_agentPayment_usdt)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_merchantBiz_agentPayment_usdt{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/merchant-biz/agentPayment/usdt");
    };
}
/// 查询法币商户余额@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_fund_merchantBiz_balance_fiatByMCHID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable mchId){
        NSString *url = @"/api/fund/merchant-biz/balance/fiat/{".add(mchId).add(@"}");
        return JobsURL(url);
    };
}
/// 查询USDT商户余额@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_fund_merchantBiz_balance_usdtByMCHID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable mchId){
        NSString *url = @"/api/fund/merchant-biz/balance/usdt/{".add(mchId).add(@"}");
        return JobsURL(url);
    };
}
/// 会员法币充值创建订单@POST`
-(URLManagerModel *_Nullable)post_fund_merchantBiz_deposit_fiat{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_merchantBiz_deposit_fiat)))(self, @selector(jobs_post_fund_merchantBiz_deposit_fiat)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_merchantBiz_deposit_fiat{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/merchant-biz/deposit/fiat");
    };
}
/// 会员USDT充值创建订单@POST
-(URLManagerModel *_Nullable)post_fund_merchantBiz_deposit_usdt{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_merchantBiz_deposit_usdt)))(self, @selector(jobs_post_fund_merchantBiz_deposit_usdt)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_merchantBiz_deposit_usdt{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/merchant-biz/deposit/usdt");
    };
}
/// 会员法币出款下单@POST
-(URLManagerModel *_Nullable)post_fund_merchantBiz_payment_fiat{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_merchantBiz_payment_fiat)))(self, @selector(jobs_post_fund_merchantBiz_payment_fiat)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_merchantBiz_payment_fiat{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/merchant-biz/payment/fiat");
    };
}
/// 会员USDT出款下单@POST
-(URLManagerModel *_Nullable)post_fund_merchantBiz_payment_usdt{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_merchantBiz_payment_usdt)))(self, @selector(jobs_post_fund_merchantBiz_payment_usdt)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_merchantBiz_payment_usdt{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/merchant-biz/payment/usdt");
    };
}
#pragma mark —— 资金模块-提现接口
/// 提现拆单的子单进行状态确认-确认收款@POST
-(URLManagerModel *_Nullable)post_fund_withdraw_confirmOrder{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_withdraw_confirmOrder)))(self, @selector(jobs_post_fund_withdraw_confirmOrder)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_withdraw_confirmOrder{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/withdraw/confirmOrder");
    };
}
/// eWallet提现下单@POST
-(URLManagerModel *_Nullable)post_fund_withdraw_eWallet_order{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_withdraw_eWallet_order)))(self, @selector(jobs_post_fund_withdraw_eWallet_order)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_withdraw_eWallet_order{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/withdraw/eWallet/order");
    };
}
/// EB币提现下单@POST
-(URLManagerModel *_Nullable)post_fund_withdraw_ebpay_order{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_withdraw_ebpay_order)))(self, @selector(jobs_post_fund_withdraw_ebpay_order)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_withdraw_ebpay_order{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/withdraw/ebpay/order");
    };
}
/// 查询提现订单状态@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_fund_withdraw_get_order_statusByOrderNo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable orderNo){
        NSString *url = @"/api/fund/withdraw/get-order-status/{".add(orderNo).add(@"}");
        return JobsURL(url);
    };
}
/// 查询正在进行中的提现订单的收银台详情@POST
-(URLManagerModel *_Nullable)post_fund_withdraw_getOrder{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_withdraw_getOrder)))(self, @selector(jobs_post_fund_withdraw_getOrder)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_withdraw_getOrder{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/withdraw/getOrder");
    };
}
/// 法币提现下单@POST
-(URLManagerModel *_Nullable)post_fund_withdraw_order{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_withdraw_order)))(self, @selector(jobs_post_fund_withdraw_order)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_withdraw_order{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/withdraw/order");
    };
}
/// 虚拟币提现下单@POST
-(URLManagerModel *_Nullable)post_fund_withdraw_usdtOrder{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_withdraw_usdtOrder)))(self, @selector(jobs_post_fund_withdraw_usdtOrder)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_withdraw_usdtOrder{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/withdraw/usdtOrder");
    };
}
#pragma mark —— 资金模块-虚拟币汇率
/// 获取USDT虚拟币的参考汇率@GET
-(URLManagerModel *)get_fund_crypto_getRate_usdt_rateType:(NSString *)rateType fiatCurrency:(NSString *)fiatCurrency{
    NSString *url = @"/api/fund/crypto/getRate/usdt/{".add(rateType).add(@"}/{").add(fiatCurrency).add(@"}");
    return JobsURL(url);
}
#pragma mark —— 资金管理-充值接口
/// 代理充值@POST
-(URLManagerModel *_Nullable)post_fund_deposit_agentDepositRecor{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_agentDepositRecor)))(self, @selector(jobs_post_fund_deposit_agentDepositRecor)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_agentDepositRecor{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/agentDepositRecord");
    };
}
/// C2C银行转账充值@POST
-(URLManagerModel *_Nullable)post_fund_deposit_c2cOrder{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_c2cOrder)))(self, @selector(jobs_post_fund_deposit_c2cOrder)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_c2cOrder{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/c2cOrder");
    };
}
/// 用户撤销充值订单@PUT
-(URLManagerModel *_Nullable)put_fund_deposit_cancel_order{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_fund_deposit_cancel_order)))(self, @selector(jobs_put_fund_deposit_cancel_order)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_fund_deposit_cancel_order{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/cancel-order");
    };
}
/// 查询用户充值加送剩余额度@GET
-(URLManagerModel *_Nullable)get_fund_deposit_getChanelDeposit_Limit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_deposit_getChanelDeposit_Limit)))(self, @selector(jobs_get_fund_deposit_getChanelDeposit_Limit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_deposit_getChanelDeposit_Limit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/get-chanelDeposit-Limit");
    };
}
/// 查询用户充值加送剩余额度@GET
-(URLManagerModel *_Nullable)get_fund_deposit_getDeposit_gift{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_deposit_getDeposit_gift)))(self, @selector(jobs_get_fund_deposit_getDeposit_gift)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_deposit_getDeposit_gift{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/get-deposit-gift");
    };
}
/// 查询充值订单状态@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_fund_deposit_getOrder_statusByOrderNo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable orderNo){
        NSString *url = @"/api/fund/deposit/get-order-status/{".add(orderNo).add(@"}");
        return JobsURL(url);
    };
}
/// 查询用户充值当日已加送额度@POST
-(URLManagerModel *_Nullable)post_fund_deposit_getChannelDepositGift{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_getChannelDepositGift)))(self, @selector(jobs_post_fund_deposit_getChannelDepositGift)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_getChannelDepositGift{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/deposit/getChannelDepositGift";
        return JobsURL(url);
    };
}
/// 获取系统当前时间@POST
-(URLManagerModel *_Nullable)post_fund_deposit_getCurrentDate{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_getCurrentDate)))(self, @selector(jobs_post_fund_deposit_getCurrentDate)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_getCurrentDate{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/deposit/getCurrentDate";
        return JobsURL(url);
    };
}
/// 查询正在进行中的充值订单的收银台详情@POST
-(URLManagerModel *_Nullable)post_fund_deposit_getOrder{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_getOrder)))(self, @selector(jobs_post_fund_deposit_getOrder)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_getOrder{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/deposit/getOrder";
        return JobsURL(url);
    };
}
/// 普通充值@POST
-(URLManagerModel *_Nullable)post_fund_deposit_order{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_order)))(self, @selector(jobs_post_fund_deposit_order)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_order{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/deposit/order";
        return JobsURL(url);
    };
}
/// 上传支付凭证@POST
-(URLManagerModel *_Nullable)post_fund_deposit_upload{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_upload)))(self, @selector(jobs_post_fund_deposit_upload)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_upload{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/deposit/upload";
        return JobsURL(url);
    };
}
/// USDT充值@POST
-(URLManagerModel *_Nullable)post_fund_deposit_usdtOrder{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_deposit_usdtOrder)))(self, @selector(jobs_post_fund_deposit_usdtOrder)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_deposit_usdtOrder{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/deposit/usdtOrder";
        return JobsURL(url);
    };
}
#pragma mark —— 资金管理-充值通道列表接口
/// 查询代理可用的充值通道@GET
-(URLManagerModel *_Nullable)get_fund_dpChannel_agentDepositChannelList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_dpChannel_agentDepositChannelList)))(self, @selector(jobs_get_fund_dpChannel_agentDepositChannelList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_dpChannel_agentDepositChannelList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/dp-channel/agentDepositChannelList";
        return JobsURL(url);
    };
}
/// 拉取充值通道类型页面提示文案@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_fund_dpChannel_contentByChannelTypeId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable channelTypeId){
        NSString *url = @"/api/fund/dp-channel/content/{".add(channelTypeId).add(@"}");
        return JobsURL(url);
    };
}
/// 拉取会员可用的充值通道列表@GET
-(URLManagerModel *_Nullable)get_fund_dpChannel_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_dpChannel_list)))(self, @selector(jobs_get_fund_dpChannel_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_dpChannel_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/dp-channel/list";
        return JobsURL(url);
    };
}
#pragma mark —— 资金管理-提现类型列表接口
/// 拉取提现页面提示文案@GET
-(URLManagerModel *_Nullable)get_fund_wdChannel_content{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_wdChannel_content)))(self, @selector(jobs_get_fund_wdChannel_content)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_wdChannel_content{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/wd-channel/content";
        return JobsURL(url);
    };
}
/// 拉取大额提现规则信息@GET
-(URLManagerModel *_Nullable)get_fund_wdChannel_largeWithdrawLimit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_wdChannel_largeWithdrawLimit)))(self, @selector(jobs_get_fund_wdChannel_largeWithdrawLimit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_wdChannel_largeWithdrawLimit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/wd-channel/largeWithdrawLimit/get";
        return JobsURL(url);
    };
}
/// 拉取会员可用的提现通道列表@GET
-(URLManagerModel *_Nullable)get_fund_wdChannel_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_wdChannel_list)))(self, @selector(jobs_get_fund_wdChannel_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_wdChannel_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/wd-channel/list";
        return JobsURL(url);
    };
}
#pragma mark —— 资金管理-银行管理接口
/// 查询平台所支持的银行@GET
-(URLManagerModel *_Nullable)get_fund_bank_list_support{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_bank_list_support)))(self, @selector(jobs_get_fund_bank_list_support)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_bank_list_support{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/bank/list-support";
        return JobsURL(url);
    };
}
/// 查询平台可用的银行列表（C2C提现）@GET
-(URLManagerModel *_Nullable)get_fund_bank_list_c2c{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_bank_list_c2c)))(self, @selector(jobs_get_fund_bank_list_c2c)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_bank_list_c2c{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/fund/bank/list/c2c";
        return JobsURL(url);
    };
}

@end

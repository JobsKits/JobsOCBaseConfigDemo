//
//  NSObject+URLMgr_2.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+URLMgr_2.h"

#import <JobsAPIs/NSObject+Extra.h>
/// 来自 http://18.162.73.145:18100/api/promotion/doc.html#/default
@implementation NSObject (URLMgr_2)
#pragma mark —— feign-support-controller
/// 查看是否有流水卷或者存送卷@POST
-(URLManagerModel *_Nullable)post_promotion_feign_rolls_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_feign_rolls_list)))(self, @selector(jobs_post_promotion_feign_rolls_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_feign_rolls_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/feign/rolls/list");
    };
}
/// 批量使用流水卷或者存送卷@POST
-(URLManagerModel *_Nullable)post_promotion_feign_rolls_use{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_feign_rolls_use)))(self, @selector(jobs_post_promotion_feign_rolls_use)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_feign_rolls_use{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/feign/rolls/use");
    };
}
#pragma mark —— health-controller
/// hearbeat@GET
-(URLManagerModel *_Nullable)get_promotion_heartbeat{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_heartbeat)))(self, @selector(jobs_get_promotion_heartbeat)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_heartbeat{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/heartbeat");
    };
}
#pragma mark —— 大转盘
/// 查询大转盘活动参数配置@GET
-(URLManagerModel *_Nullable)get_promotion_activity_turntable_detail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_activity_turntable_detail)))(self, @selector(jobs_get_promotion_activity_turntable_detail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_turntable_detail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/activity/turntable/detail");
    };
}
/// 大转盘抽奖@GET
-(URLManagerModel *_Nullable)get_promotion_activity_turntable_prize_get{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_activity_turntable_prize_get)))(self, @selector(jobs_get_promotion_activity_turntable_prize_get)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_turntable_prize_get{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/activity/turntable/prize/get");
    };
}
/// 分页查询大转盘活动抽奖记录@POST
-(URLManagerModel *_Nullable)post_promotion_activity_turntable_record{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_activity_turntable_record)))(self, @selector(jobs_post_promotion_activity_turntable_record)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_activity_turntable_record{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/activity/turntable/record");
    };
}
/// 查询用户大转盘抽奖次数@GET
-(URLManagerModel *_Nullable)get_promotion_activity_turntable_user_num{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_activity_turntable_user_num)))(self, @selector(jobs_get_promotion_activity_turntable_user_num)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_turntable_user_num{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/activity/turntable/user/num");
    };
}
/// 查询用户大转盘活动抽奖记录@GET
-(URLManagerModel *_Nullable)get_promotion_activity_turntable_user_record{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_activity_turntable_user_record)))(self, @selector(jobs_get_promotion_activity_turntable_user_record)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_turntable_user_record{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/activity/turntable/user/record");
    };
}
#pragma mark —— 广告配置所有接口
/// 查询广告列表-支持游客:活动推广专区@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_info_list_activity{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_advertise_info_list_activity)))(self, @selector(jobs_get_promotion_advertise_info_list_activity)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_info_list_activity{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/advertise/info/list/activity");
    };
}
/// 查询广告列表-支持游客:APP首页右下3Banner@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_infoP_list_appIndex{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_advertise_infoP_list_appIndex)))(self, @selector(jobs_get_promotion_advertise_infoP_list_appIndex)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_infoP_list_appIndex{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/advertise/info/list/app-index");
    };
}
/// 查询广告列表-支持游客:APP会员中心@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_info_list_appMember{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_advertise_info_list_appMember)))(self, @selector(jobs_get_promotion_advertise_info_list_appMember)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_info_list_appMember{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/advertise/info/list/app-member");
    };
}
/// 查询广告列表-支持游客:首页天顶轮播大Banner@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_info_list_index{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_advertise_info_list_index)))(self, @selector(jobs_get_promotion_advertise_info_list_index)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_info_list_index{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/advertise/info/list/index");
    };
}
/// 查询广告列表-支持游客:导航栏4小Banner@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_info_list_navigationBar{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_advertise_info_list_navigationBar)))(self, @selector(jobs_get_promotion_advertise_info_list_navigationBar)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_info_list_navigationBar{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/advertise/info/list/navigation-bar");
    };
}
#pragma mark —— 新手活动
/// 查询新手活动参数配置@GET
-(URLManagerModel *_Nullable)get_promotion_activity_newbie_detail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_activity_newbie_detail)))(self, @selector(jobs_get_promotion_activity_newbie_detail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_newbie_detail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/activity/newbie/detail");
    };
}
/// 查询登录用户新手大礼包完成情况@GET
-(URLManagerModel *_Nullable)get_promotion_get_user_newbie_gift_detail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_get_user_newbie_gift_detail)))(self, @selector(jobs_get_promotion_get_user_newbie_gift_detail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_get_user_newbie_gift_detail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/get/user/newbie/gift/detail");
    };
}
/// 查询登录用户参加新手活动资格@GET
-(URLManagerModel *_Nullable)get_promotion_get_user_newbie_qualifications{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_get_user_newbie_qualifications)))(self, @selector(jobs_get_promotion_get_user_newbie_qualifications)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_get_user_newbie_qualifications{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/get/user/newbie/qualifications");
    };
}
/// 查询登录用户签到完成情况@GET
-(URLManagerModel *_Nullable)get_promotion_get_user_sign_gift_detail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_get_user_sign_gift_detail)))(self, @selector(jobs_get_promotion_get_user_sign_gift_detail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_get_user_sign_gift_detail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/get/user/sign/gift/detail");
    };
}
/// 新手活动复活大礼包用户领取@GET
-(URLManagerModel *_Nullable)get_promotion_newbie_user_resurrection_receive{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_newbie_user_resurrection_receive)))(self, @selector(jobs_get_promotion_newbie_user_resurrection_receive)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_newbie_user_resurrection_receive{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/newbie/user/resurrection/receive");
    };
}
/// 新手活动用户复活大礼包状态查询@GET
-(URLManagerModel *_Nullable)get_promotion_newbie_user_resurrection_statusGet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_newbie_user_resurrection_statusGet)))(self, @selector(jobs_get_promotion_newbie_user_resurrection_statusGet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_newbie_user_resurrection_statusGet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/newbie/user/resurrection/status/get");
    };
}
/// 新手活动签到大礼包用户签到@GET
-(URLManagerModel *_Nullable)get_promotion_newbie_user_sign{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_newbie_user_sign)))(self, @selector(jobs_get_promotion_newbie_user_sign)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_newbie_user_sign{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/newbie/user/sign");
    };
}
#pragma mark —— 活动相关接口
/// 存款优惠活动信息@POST
-(URLManagerModel *_Nullable)post_promotion_api_client_activity_getActivity{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_api_client_activity_getActivity)))(self, @selector(jobs_post_promotion_api_client_activity_getActivity)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_api_client_activity_getActivity{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/api/client/activity/getActivity");
    };
}
/// 存款优惠活动信息@POST
-(URLManagerModel *_Nullable)post_promotion_api_client_activity_getDepositDiscountActivityRecord{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_api_client_activity_getDepositDiscountActivityRecord)))(self, @selector(jobs_post_promotion_api_client_activity_getDepositDiscountActivityRecord)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_api_client_activity_getDepositDiscountActivityRecord{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/api/client/activity/getDepositDiscountActivityRecord");
    };
}
/// 会员签到活动信息@POST
-(URLManagerModel *_Nullable)post_promotion_api_client_activity_getMemberSignActivityRecord{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_api_client_activity_getMemberSignActivityRecord)))(self, @selector(jobs_post_promotion_api_client_activity_getMemberSignActivityRecord)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_api_client_activity_getMemberSignActivityRecord{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/api/client/activity/getMemberSignActivityRecord");
    };
}
/// 获取存款金额奖励@GET
-(URLManagerModel *_Nullable)get_promotion_api_client_activity_getObtainDepositBonus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_api_client_activity_getObtainDepositBonus)))(self, @selector(jobs_get_promotion_api_client_activity_getObtainDepositBonus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_api_client_activity_getObtainDepositBonus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/api/client/activity/getObtainDepositBonus");
    };
}
/// 查询活动信息@GET
-(URLManagerModel *_Nullable)get_promotion_api_client_activity_queryActivityInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_api_client_activity_queryActivityInfo)))(self, @selector(jobs_get_promotion_api_client_activity_queryActivityInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_api_client_activity_queryActivityInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/api/client/activity/queryActivityInfo");
    };
}
/// 查询用户123存款活动的在途订单数量@GET
-(URLManagerModel *_Nullable)get_promotion_api_client_activity_queryInTransit123DepositOrdersCount{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_api_client_activity_queryInTransit123DepositOrdersCount)))(self, @selector(jobs_get_promotion_api_client_activity_queryInTransit123DepositOrdersCount)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_api_client_activity_queryInTransit123DepositOrdersCount{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/api/client/activity/queryInTransit123DepositOrdersCount");
    };
}
/// 会员签到@GET
-(URLManagerModel *_Nullable)get_promotion_api_client_activity_sign{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_api_client_activity_sign)))(self, @selector(jobs_get_promotion_api_client_activity_sign)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_api_client_activity_sign{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/api/client/activity/sign");
    };
}
/// 首存活动-查询累计流水@GET
-(URLManagerModel *_Nullable)get_promotion_event_activity_bet_total{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_event_activity_bet_total)))(self, @selector(jobs_get_promotion_event_activity_bet_total)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_event_activity_bet_total{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/event/activity/bet/total");
    };
}
/// 活动领取-传返回记录的id@POST
-(URLManagerModel *_Nullable)post_promotion_event_activity_claimp{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_event_activity_claimp)))(self, @selector(jobs_post_promotion_event_activity_claimp)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_event_activity_claimp{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/event/activity/claim");
    };
}
/// 查询首存活动记录@GET
-(URLManagerModel *_Nullable)get_promotion_event_activity_record{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_event_activity_record)))(self, @selector(jobs_get_promotion_event_activity_record)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_event_activity_record{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/event/activity/record");
    };
}
/// 会员签到@POST
-(URLManagerModel *_Nullable)post_promotion_event_memberSign{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_event_memberSign)))(self, @selector(jobs_post_promotion_event_memberSign)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_event_memberSign{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/event/memberSign");
    };
}
/// 会员签到活动信息@POST
-(URLManagerModel *_Nullable)post_promotion_event_memberSignEvent{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_event_memberSignEvent)))(self, @selector(jobs_post_promotion_event_memberSignEvent)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_event_memberSignEvent{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/event/memberSignEvent");
    };
}
#pragma mark —— 福利中心所有接口
/// 福利领取 ，目前只限2现金券 3存送卷 4流水卷@GET
-(URLManagerModel *_Nullable)get_promotion_welfare_claim{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_welfare_claim)))(self, @selector(jobs_get_promotion_welfare_claim)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_welfare_claim{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/welfare/claim");
    };
}
/// 用户查询福利中心列表@POST
-(URLManagerModel *_Nullable)post_promotion_welfare_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_welfare_list)))(self, @selector(jobs_post_promotion_welfare_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_welfare_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/welfare/list");
    };
}
/// 用户福利中心统计@GET
-(URLManagerModel *_Nullable)get_promotion_welfare_statistic{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_promotion_welfare_statistic)))(self, @selector(jobs_get_promotion_welfare_statistic)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_welfare_statistic{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/welfare/statistic");
    };
}
/// vip模块领取福利@POST
-(URLManagerModel *_Nullable)post_promotion_welfare_vip_claim{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_promotion_welfare_vip_claim)))(self, @selector(jobs_post_promotion_welfare_vip_claim)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_welfare_vip_claim{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/promotion/welfare/vip/claim");
    };
}

@end

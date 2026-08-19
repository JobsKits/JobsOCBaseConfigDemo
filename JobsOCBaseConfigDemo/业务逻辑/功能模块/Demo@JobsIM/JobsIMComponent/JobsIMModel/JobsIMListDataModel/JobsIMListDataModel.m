//
//  JobsIMListDataModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMListDataModel.h"

@implementation JobsIMListDataModel
#define JobsIMListStrDSL(method, setter) \
-(JobsRetJobsIMListDataModelByStrBlock _Nonnull)method{ \
    @jobs_weakify(self) \
    return ^__kindof JobsIMListDataModel *_Nullable(NSString *_Nullable string){ \
        @jobs_strongify(self) \
        if (!self) return nil; \
        [self setter:string]; \
        return self; \
    }; \
}

#define JobsIMListIntegerDSL(method, setter) \
-(JobsRetJobsIMListDataModelByNSIntegerBlock _Nonnull)method{ \
    @jobs_weakify(self) \
    return ^__kindof JobsIMListDataModel *_Nullable(NSInteger value){ \
        @jobs_strongify(self) \
        if (!self) return nil; \
        [self setter:value]; \
        return self; \
    }; \
}

JobsIMListStrDSL(byUserID, setUserID)
JobsIMListStrDSL(byPeerID, setPeerID)
JobsIMListStrDSL(byUsernameStr, setUsernameStr)
JobsIMListStrDSL(byContentStr, setContentStr)
JobsIMListStrDSL(byTimeStr, setTimeStr)
JobsIMListStrDSL(byUserHeaderURLStr, setUserHeaderURLStr)
JobsIMListStrDSL(byLastMessageID, setLastMessageID)
JobsIMListIntegerDSL(byTransportKind, setTransportKind)
JobsIMListIntegerDSL(byPeerOnlineState, setPeerOnlineState)
JobsIMListIntegerDSL(byUnreadCount, setUnreadCount)

-(JobsRetJobsIMListDataModelByImageBlock _Nonnull)byUserHeaderIMG{
    @jobs_weakify(self)
    return ^__kindof JobsIMListDataModel *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setUserHeaderIMG:image];
        return self;
    };
}

#undef JobsIMListIntegerDSL
#undef JobsIMListStrDSL

-(NSString *)userID{
    if (!_userID) {
        _userID = @"jobsim_peer_unknown";
    };return _userID;
}

-(NSString *)peerID{
    if (!_peerID) {
        _peerID = self.userID;
    };return _peerID;
}

-(NSString *)usernameStr{
    if (!_usernameStr) {
        _usernameStr = @"未定义";
    };return _usernameStr;
}

-(NSString *)contentStr{
    if (!_contentStr) {
        _contentStr = @"未定义";
    };return _contentStr;
}

-(NSString *)timeStr{
    if (!_timeStr) {
        _timeStr = @"未定义";
    };return _timeStr;
}

-(NSString *)userHeaderURLStr{
    if (!_userHeaderURLStr) {
        _userHeaderURLStr = @"https://picsum.photos/126";
    };return _userHeaderURLStr;
}

-(JobsIMTransportKind)transportKind{
    if (_transportKind == JobsIMTransportKindUnknown) {
        _transportKind = JobsIMTransportKindLANBonjourNetwork;
    };return _transportKind;
}

-(JobsIMPeerOnlineState)peerOnlineState{
    if (_peerOnlineState == JobsIMPeerOnlineStateUnknown) {
        _peerOnlineState = JobsIMPeerOnlineStateOnlineForeground;
    };return _peerOnlineState;
}

@end

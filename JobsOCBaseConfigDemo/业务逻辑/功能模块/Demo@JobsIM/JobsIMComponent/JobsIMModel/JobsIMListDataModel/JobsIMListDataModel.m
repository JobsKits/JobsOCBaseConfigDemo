//
//  JobsIMListDataModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMListDataModel.h"

@implementation JobsIMListDataModel

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

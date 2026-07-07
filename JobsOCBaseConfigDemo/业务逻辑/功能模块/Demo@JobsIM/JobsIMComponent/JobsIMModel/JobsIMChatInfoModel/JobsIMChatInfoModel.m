//
//  JobsIMChatInfoModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMChatInfoModel.h"

@implementation JobsIMChatInfoModel

-(NSString *)messageID{
    if (!_messageID) {
        _messageID = NSUUID.UUID.UUIDString;
    };return _messageID;
}

-(NSString *)conversationID{
    if (!_conversationID) {
        NSString *targetUserID = self.toUserID.length ? self.toUserID : self.userID;
        _conversationID = targetUserID.length ? targetUserID : @"jobsim_conversation_local";
    };return _conversationID;
}

-(NSString *)fromUserID{
    if (!_fromUserID) {
        _fromUserID = self.userID.length ? self.userID : JobsIMLocalDemoUserID();
    };return _fromUserID;
}

-(NSString *)toUserID{
    if (!_toUserID) {
        _toUserID = JobsIMLocalDemoUserID();
    };return _toUserID;
}

-(NSString *)userIconURLStr{
    if (!_userIconURLStr) {
        _userIconURLStr = @"https://picsum.photos/126";
    };return _userIconURLStr;
}

-(NSString *)identification{
    if (!_identification) {
        _identification = @"我是我自己";
    };return _identification;
}

-(JobsIMPacketType)packetType{
    if (_packetType == JobsIMPacketTypeUnknown) {
        _packetType = JobsIMPacketTypeText;
    };return _packetType;
}

-(JobsIMDeliveryState)deliveryState{
    if (_deliveryState == JobsIMDeliveryStateDraft) {
        _deliveryState = JobsIMDeliveryStateSent;
    };return _deliveryState;
}

-(JobsIMTransportKind)transportKind{
    if (_transportKind == JobsIMTransportKindUnknown) {
        _transportKind = JobsIMTransportKindLANBonjourNetwork;
    };return _transportKind;
}

-(NSDictionary *)rawPacket{
    if (!_rawPacket) {
        _rawPacket = JobsIMPacketMake(self.packetType,
                                      self.messageID,
                                      self.fromUserID,
                                      self.toUserID,
                                      @{
                                          @"text": self.chatTextStr ?: @"",
                                          @"transport": JobsIMStringFromTransportKind(self.transportKind)
                                      });
    };return _rawPacket;
}

@end

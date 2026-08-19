//
//  JobsIMChatInfoModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMChatInfoModel.h"

@implementation JobsIMChatInfoModel
#define JobsIMChatStrDSL(method, setter) \
-(JobsRetJobsIMChatInfoModelByStrBlock _Nonnull)method{ \
    @jobs_weakify(self) \
    return ^__kindof JobsIMChatInfoModel *_Nullable(NSString *_Nullable string){ \
        @jobs_strongify(self) \
        if (!self) return nil; \
        [self setter:string]; \
        return self; \
    }; \
}

#define JobsIMChatIntegerDSL(method, setter) \
-(JobsRetJobsIMChatInfoModelByNSIntegerBlock _Nonnull)method{ \
    @jobs_weakify(self) \
    return ^__kindof JobsIMChatInfoModel *_Nullable(NSInteger value){ \
        @jobs_strongify(self) \
        if (!self) return nil; \
        [self setter:value]; \
        return self; \
    }; \
}

JobsIMChatStrDSL(byMessageID, setMessageID)
JobsIMChatStrDSL(byConversationID, setConversationID)
JobsIMChatStrDSL(byFromUserID, setFromUserID)
JobsIMChatStrDSL(byToUserID, setToUserID)
JobsIMChatStrDSL(byUserID, setUserID)
JobsIMChatStrDSL(byUserNameStr, setUserNameStr)
JobsIMChatStrDSL(byUserIconURLStr, setUserIconURLStr)
JobsIMChatStrDSL(byChatTextTimeStr, setChatTextTimeStr)
JobsIMChatStrDSL(byChatTextStr, setChatTextStr)
JobsIMChatStrDSL(byIdentification, setIdentification)
JobsIMChatIntegerDSL(byMessageType, setMessageType)
JobsIMChatIntegerDSL(byChatInfoDirection, setChatInfoDirection)
JobsIMChatIntegerDSL(byPacketType, setPacketType)
JobsIMChatIntegerDSL(byDeliveryState, setDeliveryState)
JobsIMChatIntegerDSL(byTransportKind, setTransportKind)

-(JobsRetJobsIMChatInfoModelByImageBlock _Nonnull)byUserIconIMG{
    @jobs_weakify(self)
    return ^__kindof JobsIMChatInfoModel *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setUserIconIMG:image];
        return self;
    };
}

-(JobsRetJobsIMChatInfoModelByDicBlock _Nonnull)byRawPacket{
    @jobs_weakify(self)
    return ^__kindof JobsIMChatInfoModel *_Nullable(NSDictionary *_Nullable dictionary){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setRawPacket:dictionary];
        return self;
    };
}

#undef JobsIMChatIntegerDSL
#undef JobsIMChatStrDSL

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

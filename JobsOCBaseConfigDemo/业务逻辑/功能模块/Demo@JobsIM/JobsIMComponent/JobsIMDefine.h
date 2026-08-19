//
//  JobsIMDefine.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsIMDefine_h

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#define JobsIMDefine_h

#import <CoreGraphics/CoreGraphics.h>

#import <Foundation/Foundation.h>

#define isAllowSysEdit NO// 编译期就要优先进去，所以不能用属性

/**
 JobsIM V1 协议层定位：

 1. 当前 Demo 沿用现有 `JobsIMShowVC`、用户列表、聊天页和本地数据逻辑，只在数据模型上补协议字段。
 2. V1 不做真正互联网 IM，也不承诺后台可靠收消息、离线消息、APNs 推送或跨公网穿透。
 3. V1 的真实目标是“无服务器、本地近场 IM 协议演示”：
    - 局域网：Bonjour 负责发现同一 Wi-Fi 下的 JobsIM 节点，Network.framework 负责连接和收发。
    - 近场：MultipeerConnectivity 负责附近设备发现和通信，系统底层可走 Wi-Fi / 蓝牙等能力。
 4. UI 层只关心用户、会话、消息和投递状态；传输层通过 `JobsIMTransportProtocol` 抽象，后续可替换为 WebSocket / WebRTC。
 5. 当前文件只定义协议包、状态和传输接口，不直接启动 Bonjour、MultipeerConnectivity 或后台任务。
 */

NS_INLINE NSString *_Nonnull JobsIMLocalDemoUserID(void){
    return @"jobsim_local_user_jobs";
}

NS_INLINE NSString *_Nonnull JobsIMLocalDemoUserName(void){
    return @"Jobs";
}

NS_INLINE NSString *_Nonnull JobsIMBonjourServiceType(void){
    return @"_jobsim._tcp.";
}

#ifndef INFO_LOCATION_ENUM_DEFINED
#define INFO_LOCATION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, InfoLocation) {
    InfoLocation_Unknown = 0,
    InfoLocation_Left = 1,
    InfoLocation_Right = 2
};
#endif /* INFO_LOCATION_ENUM_DEFINED */

#ifndef JOBS_IM_CHAT_INFO_DIRECTION_ENUM_DEFINED
#define JOBS_IM_CHAT_INFO_DIRECTION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsIMChatInfoDirection) {
    JobsIMChatInfoDirection_Unknown = 0,
    JobsIMChatInfoDirection_Send,/// 对方
    JobsIMChatInfoDirection_Receive/// 自己
};
#endif /* JOBS_IM_CHAT_INFO_DIRECTION_ENUM_DEFINED */

#ifndef JOBS_IM_CHAT_MESSAGE_TYPE_ENUM_DEFINED
#define JOBS_IM_CHAT_MESSAGE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsIMChatMessageType) {
    JobsIMChatMessageType_Text = 0,/// 文本
    JobsIMChatMessageType_Gift,/// 礼物
    JobsIMChatMessageType_expression,/// 表情
};
#endif /* JOBS_IM_CHAT_MESSAGE_TYPE_ENUM_DEFINED */

#ifndef JOBS_IM_TRANSPORT_KIND_ENUM_DEFINED
#define JOBS_IM_TRANSPORT_KIND_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsIMTransportKind) {
    JobsIMTransportKindUnknown = 0,
    JobsIMTransportKindLANBonjourNetwork,/// 局域网：Bonjour 发现 + Network.framework 连接
    JobsIMTransportKindNearbyMultipeer,/// 近场：MultipeerConnectivity，底层可用 Wi-Fi / 蓝牙
    JobsIMTransportKindWebSocketReserved,/// 预留：真正互联网 IM 的 WebSocket 通道
    JobsIMTransportKindWebRTCReserved/// 预留：WebRTC DataChannel / 音视频方向
};
#endif /* JOBS_IM_TRANSPORT_KIND_ENUM_DEFINED */

#ifndef JOBS_IM_PACKET_TYPE_ENUM_DEFINED
#define JOBS_IM_PACKET_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsIMPacketType) {
    JobsIMPacketTypeUnknown = 0,
    JobsIMPacketTypeHello,/// 握手：声明当前用户、设备和协议版本
    JobsIMPacketTypePresenceOnline,/// 上线：进入前台并准备收发
    JobsIMPacketTypePresenceBackground,/// 后台：可能还能短暂在线，但不保证可靠收消息
    JobsIMPacketTypePresenceOffline,/// 下线：主动退出或连接断开
    JobsIMPacketTypeText,/// 文本消息
    JobsIMPacketTypeAck,/// 确认：对某条 messageId 做收到确认
    JobsIMPacketTypeHeartbeat,/// 心跳：维持前台连接活性
    JobsIMPacketTypeTyping,/// 输入中：轻量状态通知
    JobsIMPacketTypeError/// 错误：协议解析失败或传输失败
};
#endif /* JOBS_IM_PACKET_TYPE_ENUM_DEFINED */

#ifndef JOBS_IM_DELIVERY_STATE_ENUM_DEFINED
#define JOBS_IM_DELIVERY_STATE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsIMDeliveryState) {
    JobsIMDeliveryStateDraft = 0,
    JobsIMDeliveryStateSending,
    JobsIMDeliveryStateSent,
    JobsIMDeliveryStateReceived,
    JobsIMDeliveryStateAcknowledged,
    JobsIMDeliveryStateFailed
};
#endif /* JOBS_IM_DELIVERY_STATE_ENUM_DEFINED */

#ifndef JOBS_IM_PEER_ONLINE_STATE_ENUM_DEFINED
#define JOBS_IM_PEER_ONLINE_STATE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsIMPeerOnlineState) {
    JobsIMPeerOnlineStateUnknown = 0,
    JobsIMPeerOnlineStateOnlineForeground,/// 前台在线，Demo 内最可靠
    JobsIMPeerOnlineStateBackgroundMaybeOffline,/// 后台，可能断连或漏收
    JobsIMPeerOnlineStateOffline/// 离线，无服务器存储时消息不可保证
};
#endif /* JOBS_IM_PEER_ONLINE_STATE_ENUM_DEFINED */

NS_INLINE NSString *_Nonnull JobsIMStringFromTransportKind(JobsIMTransportKind kind){
    switch (kind) {
        /// 处理 JobsIMTransportKindLANBonjourNetwork 分支
        case JobsIMTransportKindLANBonjourNetwork:
            return @"LANBonjourNetwork";
        /// 处理 JobsIMTransportKindNearbyMultipeer 分支
        case JobsIMTransportKindNearbyMultipeer:
            return @"NearbyMultipeer";
        /// 处理 JobsIMTransportKindWebSocketReserved 分支
        case JobsIMTransportKindWebSocketReserved:
            return @"WebSocketReserved";
        /// 处理 JobsIMTransportKindWebRTCReserved 分支
        case JobsIMTransportKindWebRTCReserved:
            return @"WebRTCReserved";
        /// 未匹配已知分支时执行兜底处理
        default:
            return @"Unknown";
    }
}

NS_INLINE NSString *_Nonnull JobsIMStringFromPacketType(JobsIMPacketType type){
    switch (type) {
        /// 处理 JobsIMPacketTypeHello 分支
        case JobsIMPacketTypeHello:
            return @"hello";
        /// 处理 JobsIMPacketTypePresenceOnline 分支
        case JobsIMPacketTypePresenceOnline:
            return @"presence_online";
        /// 处理 JobsIMPacketTypePresenceBackground 分支
        case JobsIMPacketTypePresenceBackground:
            return @"presence_background";
        /// 处理 JobsIMPacketTypePresenceOffline 分支
        case JobsIMPacketTypePresenceOffline:
            return @"presence_offline";
        /// 处理 JobsIMPacketTypeText 分支
        case JobsIMPacketTypeText:
            return @"text";
        /// 处理 JobsIMPacketTypeAck 分支
        case JobsIMPacketTypeAck:
            return @"ack";
        /// 处理 JobsIMPacketTypeHeartbeat 分支
        case JobsIMPacketTypeHeartbeat:
            return @"heartbeat";
        /// 处理 JobsIMPacketTypeTyping 分支
        case JobsIMPacketTypeTyping:
            return @"typing";
        /// 处理 JobsIMPacketTypeError 分支
        case JobsIMPacketTypeError:
            return @"error";
        /// 未匹配已知分支时执行兜底处理
        default:
            return @"unknown";
    }
}

NS_INLINE NSDictionary *_Nonnull JobsIMPacketMake(JobsIMPacketType type,
                                                  NSString *_Nullable messageID,
                                                  NSString *_Nullable fromUserID,
                                                  NSString *_Nullable toUserID,
                                                  NSDictionary *_Nullable payload){
    NSString *safeMessageID = messageID.length ? messageID : NSUUID.UUID.UUIDString;
    NSTimeInterval timestamp = NSDate.date.timeIntervalSince1970;
    return @{
        @"protocol": @"JobsIM",
        @"version": @"1",
        @"type": JobsIMStringFromPacketType(type),
        @"messageId": safeMessageID,
        @"from": fromUserID ?: @"",
        @"to": toUserID ?: @"",
        @"timestamp": @(timestamp),
        @"payload": payload ?: @{}
    };
}

@protocol JobsIMTransportProtocol <NSObject>

/// 当前传输通道类型。V1 推荐先落 `LANBonjourNetwork` 和 `NearbyMultipeer`。
@property(nonatomic, assign, readonly) JobsIMTransportKind transportKind;

/// 启动本地无服务器传输。局域网通道负责发布/发现 Bonjour 服务，近场通道负责启动 Multipeer 会话。
-(void)startWithLocalUserID:(NSString *_Nonnull)localUserID
                displayName:(NSString *_Nonnull)displayName;

/// 停止发现、断开连接，并广播离线状态。
-(jobsByVoidBlock _Nonnull)stop;

/// 发送 JobsIM 协议包。packet 建议由 `JobsIMPacketMake(...)` 生成，真实传输层再做 JSON 编码。
-(void)sendPacket:(NSDictionary *_Nonnull)packet
         toPeerID:(NSString *_Nonnull)peerID;

@end

NS_INLINE CGFloat JobsIMInputviewHeight(void){
    return 60;
}

NS_INLINE CGFloat JobsIMInputviewAccessoryLabelHeight(void){
    return 30;
}

NS_INLINE CGSize JobsIMInputviewAccessoryLabelSize(void){
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsIMInputviewAccessoryLabelHeight());
}

NS_INLINE CGFloat JobsIMChatInfoTimeLabWidth(void){
    return 55;
}

NS_INLINE CGFloat JobsIMChatInfoTBVDefaultCellHeight(void){
    return 50;
}

NS_INLINE CGFloat JobsIMChatInfoTBVChatContentLabWidth(void){
    return JobsMainScreen_WIDTH() - JobsIMChatInfoTimeLabWidth() - (JobsIMChatInfoTBVDefaultCellHeight() - 5) - 20;
}

NS_INLINE CGFloat JobsIMChatInfoTBVChatContentLabDefaultWidth(void){
    return 30;
}

#endif /* JobsIMDefine_h */

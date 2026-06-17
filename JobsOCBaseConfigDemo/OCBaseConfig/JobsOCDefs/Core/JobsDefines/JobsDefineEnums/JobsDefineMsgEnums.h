//
//  JobsDefineMsgEnums.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineMsgEnums_h
#define JobsDefineMsgEnums_h
#pragma mark —— ✉️消息相关
/// 站内信类型
#ifndef FM_INBOX_TYPE_ENUM_DEFINED
#define FM_INBOX_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, FMINBOXTYPE) {
    FMINBOX_Undefined = -1,                 // 站内信类型@未定义或所有类型
    FMINBOX_SportsMatchAnnouncement = 1,    // 站内信类型@体育赛事公告
    FMINBOX_Promo = 2,                      // 站内信类型@推广
    FMINBOX_News = 3,                       // 站内信类型@新闻
    FMINBOX_Personal = 4,                   // 站内信类型@个人
    FMINBOX_Announcement = 5                // 站内信类型@公告
};
#endif /* FM_INBOX_TYPE_ENUM_DEFINED */
/// 消息状态
#ifndef READSTATUS
#define READSTATUS
typedef NS_ENUM(NSInteger, ReadStatus) {
    ReadStatus_UNREAD, // 消息状态@未读
    ReadStatus_READ    // 消息状态@已读
};
#endif /* READSTATUS */

#endif /* JobsDefineMsgEnums_h */

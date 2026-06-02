//
//  TKPermissionKit.h
//  TKPermissionKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

/**
 AppleTV:
 NSVideoSubscriberAccountUsageDescription 需要您的同意，才能访问AppleTV
 */
//! Project version number for TKPermissionKit.
FOUNDATION_EXPORT double TKPermissionKitVersionNumber;
//! Project version string for TKPermissionKit.
FOUNDATION_EXPORT const unsigned char TKPermissionKitVersionString[];

#ifndef TKPermissionKit_h
#define TKPermissionKit_h

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h> // 提供本地通知和远程通知处理能力，是现代通知框架的统一入口。
#endif

#ifndef TKPhotoAccessLevel_h
#define TKPhotoAccessLevel_h
typedef NS_ENUM(NSInteger, TKPhotoAccessLevel) {
    TKPhotoAccessLevelReadWrite = 0,    // 获取全部的相册读写权限 -> PHAccessLevelReadWrite
    TKPhotoAccessLevelOnlyAdd           // 只获取向相册中添加权限 -> PHAccessLevelAddOnly
};
#endif /* TKPhotoAccessLevel_h */

#import <TKPermissionKit/TKPermissionPublic.h>
#import <TKPermissionKit/TKPermissionPhoto.h>
#import <TKPermissionKit/TKPermissionCamera.h>
#import <TKPermissionKit/TKPermissionMedia.h>
#import <TKPermissionKit/TKPermissionMicrophone.h>
#import <TKPermissionKit/TKPermissionLocationAlways.h>
#import <TKPermissionKit/TKPermissionLocationWhen.h>
#import <TKPermissionKit/TKPermissionBluetooth.h>
#import <TKPermissionKit/TKPermissionSpeech.h>
#import <TKPermissionKit/TKPermissionCalendar.h>
#import <TKPermissionKit/TKPermissionReminder.h>
#import <TKPermissionKit/TKPermissionContacts.h>
#import <TKPermissionKit/TKPermissionNetWork.h>
#import <TKPermissionKit/TKPermissionHealth.h>
#import <TKPermissionKit/TKPermissionHome.h>
#import <TKPermissionKit/TKPermissionMotion.h>
#import <TKPermissionKit/TKPermissionNotification.h>
#import <TKPermissionKit/TKPermissionFolders.h>
#import <TKPermissionKit/TKPermissionTracking.h>
#import <TKPermissionKit/TKPermissionSiri.h>

#endif /* TKPermissionKit_h */

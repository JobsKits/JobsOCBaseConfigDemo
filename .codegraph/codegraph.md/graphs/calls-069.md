# `calls 符号关系 - 069`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::playSoundEffect<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Sound/NSObject+Sound.m:30"]
  T1["method:NSString::byFileFullName<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:52"]
  S1 -->|calls| T1
  S2["method:NSObject::scrollViewDidScroll:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UIScrollViewDelegate/NSObject+UIScrollViewDelegate.m:12"]
  T2["method:UIScrollView::scrolldirectionWhenScrollViewDidScroll<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:20"]
  S2 -->|calls| T2
  S3["method:NSObject::handleCalendarCategoryAction<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:12"]
  T3["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  S3 -->|calls| T3
  S4["method:NSObject::handleCalendarCategoryAction<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:12"]
  T4["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  S4 -->|calls| T4
  S5["method:NSObject::handleCustomUICategory<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:29"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S5 -->|calls| T5
  S6["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  T6["method:NSCalendar::initBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSCalendar/NSCalendar+Extra/NSCalendar+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  T7["method:UNNotificationRequest::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UNNotificationRequest/UNNotificationRequest+Extra/UNNotificationRequest+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  T8["method:UNCalendarNotificationTrigger::initByNORepeats<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UNCalendarNotificationTrigger/UNCalendarNotificationTrigger+Extra/UNCalendarNotificationTrigger+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:NSObject::userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:100"]
  T9["method:NSObject::handleCalendarCategoryAction<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:12"]
  S9 -->|calls| T9
  S10["method:NSObject::userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:100"]
  T10["method:NSObject::handleCustomUICategory<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:29"]
  S10 -->|calls| T10
  S11["method:NSObject::notificationCenter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:37"]
  T11["method:NSObject::registerForRemoteNotifications<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:91"]
  S11 -->|calls| T11
  S12["method:NSObject::notificationRequestInitWithIdentifier:content:trigger:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:150"]
  T12["method:NSObject::notificationTriggerWithTimeInterval:repeats:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:125"]
  S12 -->|calls| T12
  S13["method:NSObject::notificationRequestInitWithIdentifier:content:trigger:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:150"]
  T13["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S13 -->|calls| T13
  S14["method:NSObject::notificationCenter:addNotificationRequest:withIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:171"]
  T14["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S14 -->|calls| T14
  S15["method:NSObject::notificationCenter:addNotificationRequest:withIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:171"]
  T15["method:NSObject::notificationRequestInitWithIdentifier:content:trigger:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:150"]
  S15 -->|calls| T15
  S16["method:NSObject::notificationCenter:addNotificationRequest:withIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:171"]
  T16["method:NSObject::notificationTriggerWithTimeInterval:repeats:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:125"]
  S16 -->|calls| T16
  S17["method:NSObject::jobsSaveUserInfo<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:33"]
  T17["method:NSUserDefaults::updateWithModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:13"]
  S17 -->|calls| T17
  S18["method:NSObject::userNameToSaveUserInfo<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:52"]
  T18["method:NSUserDefaults::updateWithModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:13"]
  S18 -->|calls| T18
  S19["method:NSObject::readUserInfoByUserName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:61"]
  T19["method:NSUserDefaults::readWithKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:43"]
  S19 -->|calls| T19
  S20["method:NSObject::deleteUserInfoByUserName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:95"]
  T20["method:NSUserDefaults::deleteWithKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:52"]
  S20 -->|calls| T20
  S21["method:NSObject::saveUserName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:102"]
  T21["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S21 -->|calls| T21
  S22["method:NSObject::deleteUserName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:116"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S22 -->|calls| T22
  S23["method:NSObject::gif_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:NSObject::gif_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T24["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  S24 -->|calls| T24
  S25["method:NSObject::gif_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T25["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

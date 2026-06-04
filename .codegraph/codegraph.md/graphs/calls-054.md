# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::jobsOpenURL:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:94"]
  T1["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  S1 -->|calls| T1
  S2["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:NSObject::logOutPopupVM<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+PopViewToLogOut/NSObject+PopViewToLogOut.m:14"]
  T7["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S7 -->|calls| T7
  S8["method:NSObject::playSoundEffect<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Sound/NSObject+Sound.m:30"]
  T8["method:NSString::byFileFullName<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:52"]
  S8 -->|calls| T8
  S9["method:NSObject::scrollViewDidScroll:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UIScrollViewDelegate/NSObject+UIScrollViewDelegate.m:12"]
  T9["method:UIScrollView::scrolldirectionWhenScrollViewDidScroll<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:20"]
  S9 -->|calls| T9
  S10["method:NSObject::handleCalendarCategoryAction<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:12"]
  T10["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  S10 -->|calls| T10
  S11["method:NSObject::handleCalendarCategoryAction<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:12"]
  T11["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  S11 -->|calls| T11
  S12["method:NSObject::handleCustomUICategory<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:29"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  T13["method:NSCalendar::initBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSCalendar/NSCalendar+Extra/NSCalendar+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  T14["method:UNNotificationRequest::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UNNotificationRequest/UNNotificationRequest+Extra/UNNotificationRequest+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSObject::scheduleNotificationAt<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:58"]
  T15["method:UNCalendarNotificationTrigger::initByNORepeats<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UNCalendarNotificationTrigger/UNCalendarNotificationTrigger+Extra/UNCalendarNotificationTrigger+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSObject::userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:100"]
  T16["method:NSObject::handleCalendarCategoryAction<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:12"]
  S16 -->|calls| T16
  S17["method:NSObject::userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:100"]
  T17["method:NSObject::handleCustomUICategory<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UNUserNotificationCenterDelegate/NSObject+UNUserNotificationCenterDelegate.m:29"]
  S17 -->|calls| T17
  S18["method:NSObject::notificationCenter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:37"]
  T18["method:NSObject::registerForRemoteNotifications<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:91"]
  S18 -->|calls| T18
  S19["method:NSObject::notificationRequestInitWithIdentifier:content:trigger:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:150"]
  T19["method:NSObject::notificationTriggerWithTimeInterval:repeats:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:125"]
  S19 -->|calls| T19
  S20["method:NSObject::notificationRequestInitWithIdentifier:content:trigger:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:150"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:NSObject::notificationCenter:addNotificationRequest:withIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:171"]
  T21["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S21 -->|calls| T21
  S22["method:NSObject::notificationCenter:addNotificationRequest:withIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:171"]
  T22["method:NSObject::notificationRequestInitWithIdentifier:content:trigger:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:150"]
  S22 -->|calls| T22
  S23["method:NSObject::notificationCenter:addNotificationRequest:withIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:171"]
  T23["method:NSObject::notificationTriggerWithTimeInterval:repeats:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:125"]
  S23 -->|calls| T23
  S24["method:NSObject::jobsSaveUserInfo<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:33"]
  T24["method:NSUserDefaults::updateWithModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:13"]
  S24 -->|calls| T24
  S25["method:NSObject::userNameToSaveUserInfo<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:52"]
  T25["method:NSUserDefaults::updateWithModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:13"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

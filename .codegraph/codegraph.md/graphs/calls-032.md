# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::notificationCenter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:37"]
  T1["method:NSObject::registerForRemoteNotifications<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:91"]
  S1 -->|calls| T1
  S2["method:NSObject::notificationRequestInitWithIdentifier:content:trigger:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:150"]
  T2["method:NSObject::notificationTriggerWithTimeInterval:repeats:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:125"]
  S2 -->|calls| T2
  S3["method:NSObject::notificationRequestInitWithIdentifier:content:trigger:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:150"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSObject::notificationCenter:addNotificationRequest:withIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:171"]
  T4["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S4 -->|calls| T4
  S5["method:NSObject::notificationCenter:addNotificationRequest:withIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:171"]
  T5["method:NSObject::notificationRequestInitWithIdentifier:content:trigger:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:150"]
  S5 -->|calls| T5
  S6["method:NSObject::notificationCenter:addNotificationRequest:withIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:171"]
  T6["method:NSObject::notificationTriggerWithTimeInterval:repeats:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:125"]
  S6 -->|calls| T6
  S7["method:NSObject::gif_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:NSObject::gif_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T8["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  S8 -->|calls| T8
  S9["method:NSObject::gif_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:NSObject::sys_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:NSObject::sys_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T11["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S11 -->|calls| T11
  S12["method:NSObject::sys_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S14 -->|calls| T14
  S15["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T15["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S15 -->|calls| T15
  S16["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T16["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S16 -->|calls| T16
  S17["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T17["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S17 -->|calls| T17
  S18["method:NSObject::fetchImageByPlaceholder:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:71"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSObject::imageByDataURL<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:109"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T21["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S21 -->|calls| T21
  S22["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T22["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S22 -->|calls| T22
  S23["method:NSString::isEqualToString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:NSString::isEqualToString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T24["method:NSString::isEqualToString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S24 -->|calls| T24
  S25["method:NSString::containsString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

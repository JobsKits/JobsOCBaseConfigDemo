# `calls 符号关系 - 178`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TKPermissionContacts::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Contacts/TKPermissionContacts.m:17"]
  T1["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S1 -->|calls| T1
  S2["method:TKPermissionContacts::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Contacts/TKPermissionContacts.m:17"]
  T2["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S2 -->|calls| T2
  S3["method:TKPermissionHome::homeManager:didUpdateAuthorizationStatus:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Home/TKPermissionHome.m:29"]
  T3["method:TKPermissionHome::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Home/TKPermissionHome.m:64"]
  S3 -->|calls| T3
  S4["method:TKPermissionHome::checkAuth<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Home/TKPermissionHome.m:76"]
  T4["method:TKPermissionHome::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Home/TKPermissionHome.m:64"]
  S4 -->|calls| T4
  S5["method:TKPermissionHome::checkAuthOldWithManager:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Home/TKPermissionHome.m:89"]
  T5["method:TKPermissionHome::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Home/TKPermissionHome.m:64"]
  S5 -->|calls| T5
  S6["function:status<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/LocationAlways/TKPermissionLocationAlways.m:38"]
  T6["method:TKPermissionBluetooth::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Bluetooth/TKPermissionBluetooth.m:90"]
  S6 -->|calls| T6
  S7["function:(^)<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/LocationAlways/TKPermissionLocationAlways.m:79"]
  T7["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S7 -->|calls| T7
  S8["function:status<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/LocationWhen/TKPermissionLocationWhen.m:78"]
  T8["method:TKPermissionBluetooth::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Bluetooth/TKPermissionBluetooth.m:90"]
  S8 -->|calls| T8
  S9["method:TKPermissionMedia::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Media/TKPermissionMedia.m:17"]
  T9["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S9 -->|calls| T9
  S10["method:TKPermissionMedia::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Media/TKPermissionMedia.m:17"]
  T10["method:TKPermissionMedia::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Media/TKPermissionMedia.m:53"]
  S10 -->|calls| T10
  S11["method:TKPermissionMedia::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Media/TKPermissionMedia.m:17"]
  T11["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S11 -->|calls| T11
  S12["method:TKPermissionMedia::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Media/TKPermissionMedia.m:17"]
  T12["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S12 -->|calls| T12
  S13["method:TKPermissionMicrophone::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Microphone/TKPermissionMicrophone.m:17"]
  T13["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S13 -->|calls| T13
  S14["method:TKPermissionMicrophone::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Microphone/TKPermissionMicrophone.m:17"]
  T14["method:TKPermissionMicrophone::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Microphone/TKPermissionMicrophone.m:42"]
  S14 -->|calls| T14
  S15["method:TKPermissionMicrophone::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Microphone/TKPermissionMicrophone.m:17"]
  T15["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S15 -->|calls| T15
  S16["method:TKPermissionMotion::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Motion/TKPermissionMotion.m:32"]
  T16["method:TKPermissionMotion::queryActivityStarting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Motion/TKPermissionMotion.m:60"]
  S16 -->|calls| T16
  S17["method:TKPermissionMotion::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Motion/TKPermissionMotion.m:32"]
  T17["method:TKPermissionMotion::queryActivityStarting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Motion/TKPermissionMotion.m:60"]
  S17 -->|calls| T17
  S18["method:TKPermissionMotion::queryActivityStarting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Motion/TKPermissionMotion.m:60"]
  T18["method:TKPermissionMotion::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Motion/TKPermissionMotion.m:93"]
  S18 -->|calls| T18
  S19["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T19["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S19 -->|calls| T19
  S20["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T20["method:TKPermissionNotification::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:64"]
  S20 -->|calls| T20
  S21["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T21["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S21 -->|calls| T21
  S22["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T22["method:NSObject::registerForRemoteNotifications<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UserNotifications/NSObject+UserNotifications.m:91"]
  S22 -->|calls| T22
  S23["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T23["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S23 -->|calls| T23
  S24["method:TKPermissionPhoto::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:17"]
  T24["method:TKPermissionPhoto::authWithAlert:level:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:28"]
  S24 -->|calls| T24
  S25["method:TKPermissionPhoto::handler:Alert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:56"]
  T25["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

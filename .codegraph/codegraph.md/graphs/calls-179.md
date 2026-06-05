# `calls 符号关系 - 179`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TKPermissionPhoto::handler:Alert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:56"]
  T1["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S1 -->|calls| T1
  S2["method:TKPermissionPhoto::handler:Alert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:56"]
  T2["method:TKPermissionPhoto::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:101"]
  S2 -->|calls| T2
  S3["method:TKPermissionPhoto::handler:Alert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:56"]
  T3["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S3 -->|calls| T3
  S4["method:TKPermissionPhoto::handler:Alert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:56"]
  T4["method:TKPermissionPhoto::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:101"]
  S4 -->|calls| T4
  S5["method:TKPermissionPhoto::handler:Alert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Photo/TKPermissionPhoto.m:56"]
  T5["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S5 -->|calls| T5
  S6["method:TKPermissionPublic::alertTips:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Public/TKPermissionPublic.m:80"]
  T6["method:TKPermissionPublic::alertActionTitle:msg:actionTitle:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Public/TKPermissionPublic.m:60"]
  S6 -->|calls| T6
  S7["method:TKPermissionPublic::alertPromptTips:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Public/TKPermissionPublic.m:86"]
  T7["method:TKPermissionPublic::alertTitle:msg:leftTitle:rightTitle:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Public/TKPermissionPublic.m:24"]
  S7 -->|calls| T7
  S8["method:TKPermissionReminder::authWithAlert:requestFullAccessToEventsWithCompletion:requestWriteOnlyAccessToEventsWithCompletion:requestFullAccessToRemindersWithCompletion:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Reminder/TKPermissionReminder.m:17"]
  T8["variable:requestFullAccessToEventsWithCompletion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Reminder/TKPermissionReminder.h:38"]
  S8 -->|calls| T8
  S9["method:TKPermissionReminder::authWithAlert:requestFullAccessToEventsWithCompletion:requestWriteOnlyAccessToEventsWithCompletion:requestFullAccessToRemindersWithCompletion:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Reminder/TKPermissionReminder.m:17"]
  T9["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S9 -->|calls| T9
  S10["method:TKPermissionReminder::authWithAlert:requestFullAccessToEventsWithCompletion:requestWriteOnlyAccessToEventsWithCompletion:requestFullAccessToRemindersWithCompletion:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Reminder/TKPermissionReminder.m:17"]
  T10["method:TKPermissionReminder::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Reminder/TKPermissionReminder.m:65"]
  S10 -->|calls| T10
  S11["method:TKPermissionReminder::authWithAlert:requestFullAccessToEventsWithCompletion:requestWriteOnlyAccessToEventsWithCompletion:requestFullAccessToRemindersWithCompletion:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Reminder/TKPermissionReminder.m:17"]
  T11["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S11 -->|calls| T11
  S12["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T12["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S12 -->|calls| T12
  S13["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T13["method:TKPermissionSiri::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:45"]
  S13 -->|calls| T13
  S14["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T14["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S14 -->|calls| T14
  S15["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T15["method:TKPermissionSiri::alertAction<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:49"]
  S15 -->|calls| T15
  S16["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T16["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S16 -->|calls| T16
  S17["method:TKPermissionSpeech::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Speech/TKPermissionSpeech.m:17"]
  T17["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S17 -->|calls| T17
  S18["method:TKPermissionSpeech::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Speech/TKPermissionSpeech.m:17"]
  T18["method:TKPermissionSpeech::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Speech/TKPermissionSpeech.m:52"]
  S18 -->|calls| T18
  S19["method:TKPermissionSpeech::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Speech/TKPermissionSpeech.m:17"]
  T19["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S19 -->|calls| T19
  S20["method:TKPermissionSpeech::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Speech/TKPermissionSpeech.m:17"]
  T20["method:TKPermissionSpeech::alertAction<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Speech/TKPermissionSpeech.m:56"]
  S20 -->|calls| T20
  S21["method:TKPermissionSpeech::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Speech/TKPermissionSpeech.m:17"]
  T21["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S21 -->|calls| T21
  S22["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T22["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S22 -->|calls| T22
  S23["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T23["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S23 -->|calls| T23
  S24["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T24["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S24 -->|calls| T24
  S25["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T25["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

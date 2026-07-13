# `calls 符号关系 - 068`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TKPermissionCamera::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:17"]
  T1["method:TKPermissionCamera::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:62"]
  S1 -->|calls| T1
  S2["method:TKPermissionCamera::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:17"]
  T2["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S2 -->|calls| T2
  S3["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T3["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S3 -->|calls| T3
  S4["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T4["method:TKPermissionNotification::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:64"]
  S4 -->|calls| T4
  S5["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T5["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S5 -->|calls| T5
  S6["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T6["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S6 -->|calls| T6
  S7["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T7["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S7 -->|calls| T7
  S8["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T8["method:TKPermissionSiri::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:45"]
  S8 -->|calls| T8
  S9["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T9["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S9 -->|calls| T9
  S10["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T10["method:TKPermissionSiri::alertAction<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:49"]
  S10 -->|calls| T10
  S11["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T11["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S11 -->|calls| T11
  S12["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T12["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S12 -->|calls| T12
  S13["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T13["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S13 -->|calls| T13
  S14["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T14["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S14 -->|calls| T14
  S15["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T15["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S15 -->|calls| T15
  S16["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T16["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S16 -->|calls| T16
  S17["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  T17["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S17 -->|calls| T17
  S18["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  T18["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S18 -->|calls| T18
  S19["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T19["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S19 -->|calls| T19
  S20["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T20["method:ASLayoutElementStyle::yogaNodeCreateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:778"]
  S20 -->|calls| T20
  S21["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T21["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  S21 -->|calls| T21
  S22["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T22["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  S22 -->|calls| T22
  S23["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T23["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S23 -->|calls| T23
  S24["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T24["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S24 -->|calls| T24
  S25["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T25["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

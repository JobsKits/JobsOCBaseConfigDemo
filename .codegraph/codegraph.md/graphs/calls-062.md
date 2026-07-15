# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:UIScrollView::popup_gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:49"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T3["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  S3 -->|calls| T3
  S4["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:UIScrollView::popup_gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:67"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:UIScrollView::popup_gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:67"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIView/UIView+TFPopup/UIView+TFPopup.h<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIView/UIView+TFPopup/UIView+TFPopup.h:1"]
  T8["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S8 -->|calls| T8
  S9["method:TKPermissionCamera::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:17"]
  T9["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S9 -->|calls| T9
  S10["method:TKPermissionCamera::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:17"]
  T10["method:TKPermissionCamera::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:62"]
  S10 -->|calls| T10
  S11["method:TKPermissionCamera::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:17"]
  T11["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S11 -->|calls| T11
  S12["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T12["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S12 -->|calls| T12
  S13["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T13["method:TKPermissionNotification::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:64"]
  S13 -->|calls| T13
  S14["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T14["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S14 -->|calls| T14
  S15["method:TKPermissionNotification::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Notification/TKPermissionNotification.m:28"]
  T15["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S15 -->|calls| T15
  S16["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T16["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S16 -->|calls| T16
  S17["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T17["method:TKPermissionSiri::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:45"]
  S17 -->|calls| T17
  S18["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T18["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S18 -->|calls| T18
  S19["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T19["method:TKPermissionSiri::alertAction<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:49"]
  S19 -->|calls| T19
  S20["method:TKPermissionSiri::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Siri/TKPermissionSiri.m:16"]
  T20["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S20 -->|calls| T20
  S21["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T21["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S21 -->|calls| T21
  S22["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T22["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S22 -->|calls| T22
  S23["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T23["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S23 -->|calls| T23
  S24["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T24["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S24 -->|calls| T24
  S25["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T25["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

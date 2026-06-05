# `calls 符号关系 - 177`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::popup_classMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:28"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:NSObject::popup_classMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:28"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:NSObject::popup_classMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:28"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T4["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  S4 -->|calls| T4
  S5["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:UIScrollView::popup_gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:49"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T8["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  S8 -->|calls| T8
  S9["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:UIScrollView::popup_gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:67"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["method:UIScrollView::popup_gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:67"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIView/UIView+TFPopup/UIView+TFPopup.h<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIView/UIView+TFPopup/UIView+TFPopup.h:1"]
  T13["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S13 -->|calls| T13
  S14["method:TKPermissionBluetooth::peripheralManagerDidUpdateState:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Bluetooth/TKPermissionBluetooth.m:22"]
  T14["method:TKPermissionBluetooth::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Bluetooth/TKPermissionBluetooth.m:90"]
  S14 -->|calls| T14
  S15["method:TKPermissionBluetooth::peripheralManagerDidUpdateState:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Bluetooth/TKPermissionBluetooth.m:22"]
  T15["method:TKPermissionBluetooth::invalid<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Bluetooth/TKPermissionBluetooth.m:84"]
  S15 -->|calls| T15
  S16["method:TKPermissionBluetooth::checkAuth<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Bluetooth/TKPermissionBluetooth.m:39"]
  T16["method:TKPermissionBluetooth::authorizationCode<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Bluetooth/TKPermissionBluetooth.m:66"]
  S16 -->|calls| T16
  S17["method:TKPermissionCalendar::authWithAlert:requestFullAccessToEventsWithCompletion:requestWriteOnlyAccessToEventsWithCompletion:requestFullAccessToRemindersWithCompletion:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Calendar/TKPermissionCalendar.m:17"]
  T17["variable:requestFullAccessToEventsWithCompletion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Calendar/TKPermissionCalendar.h:38"]
  S17 -->|calls| T17
  S18["method:TKPermissionCalendar::authWithAlert:requestFullAccessToEventsWithCompletion:requestWriteOnlyAccessToEventsWithCompletion:requestFullAccessToRemindersWithCompletion:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Calendar/TKPermissionCalendar.m:17"]
  T18["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S18 -->|calls| T18
  S19["method:TKPermissionCalendar::authWithAlert:requestFullAccessToEventsWithCompletion:requestWriteOnlyAccessToEventsWithCompletion:requestFullAccessToRemindersWithCompletion:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Calendar/TKPermissionCalendar.m:17"]
  T19["method:TKPermissionCalendar::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Calendar/TKPermissionCalendar.m:66"]
  S19 -->|calls| T19
  S20["method:TKPermissionCalendar::authWithAlert:requestFullAccessToEventsWithCompletion:requestWriteOnlyAccessToEventsWithCompletion:requestFullAccessToRemindersWithCompletion:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Calendar/TKPermissionCalendar.m:17"]
  T20["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S20 -->|calls| T20
  S21["method:TKPermissionCamera::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:17"]
  T21["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S21 -->|calls| T21
  S22["method:TKPermissionCamera::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:17"]
  T22["method:TKPermissionCamera::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:62"]
  S22 -->|calls| T22
  S23["method:TKPermissionCamera::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Camera/TKPermissionCamera.m:17"]
  T23["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S23 -->|calls| T23
  S24["method:TKPermissionContacts::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Contacts/TKPermissionContacts.m:17"]
  T24["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S24 -->|calls| T24
  S25["method:TKPermissionContacts::authWithAlert:completion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Contacts/TKPermissionContacts.m:17"]
  T25["method:TKPermissionContacts::jumpSetting<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Contacts/TKPermissionContacts.m:70"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

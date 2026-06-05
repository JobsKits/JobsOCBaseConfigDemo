# `calls 符号关系 - 104`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TLFrameAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:237"]
  T1["function:playFireworksAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:42"]
  S1 -->|calls| T1
  S2["method:TLFrameAnimation::playDeselectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:252"]
  T2["function:playFrameAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:30"]
  S2 -->|calls| T2
  S3["method:TLFrameAnimation::playDeselectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:252"]
  T3["function:reversedArray<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:12"]
  S3 -->|calls| T3
  S4["method:JobsPullListAutoSizeView::initWithTargetView:dataMutArr:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：高仿 Telegram，在指定位置出现菜单列表/JobsPullListAutoSizeView/JobsPullListAutoSizeView.m:25"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:JobsPullListAutoSizeView::initWithTargetView:dataMutArr:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：高仿 Telegram，在指定位置出现菜单列表/JobsPullListAutoSizeView/JobsPullListAutoSizeView.m:46"]
  T5["method:JobsPullListAutoSizeView::makeUI<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：高仿 Telegram，在指定位置出现菜单列表/JobsPullListAutoSizeView/JobsPullListAutoSizeView.m:55"]
  S5 -->|calls| T5
  S6["method:JobsVPN::configureVPN<br/>JobsByPods/JobsOCTools@Pods/Core/VPN/JobsVPN.m:20"]
  T6["method:JobsVPN::getKeychainPassword<br/>JobsByPods/JobsOCTools@Pods/Core/VPN/JobsVPN.m:12"]
  S6 -->|calls| T6
  S7["method:SocketRocketUtility::SRWebSocketOpenWithURLString<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:35"]
  T7["method:SRWebSocket::initByURLRequest<br/>JobsByPods/SRWebSocketExtra@Pods/Core/SRWebSocket+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:SocketRocketUtility::SRWebSocketOpenWithURLString<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:35"]
  T8["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:SocketRocketUtility::SRWebSocketClose<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:49"]
  T9["method:SocketRocketUtility::destoryHeartBeat<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:108"]
  S9 -->|calls| T9
  S10["method:SocketRocketUtility::sendData<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:57"]
  T10["method:SocketRocketUtility::reConnect<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:91"]
  S10 -->|calls| T10
  S11["method:SocketRocketUtility::sendData<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:57"]
  T11["method:SocketRocketUtility::reConnect<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:91"]
  S11 -->|calls| T11
  S12["method:SocketRocketUtility::reConnect<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:91"]
  T12["method:SocketRocketUtility::SRWebSocketClose<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:49"]
  S12 -->|calls| T12
  S13["method:SocketRocketUtility::reConnect<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:91"]
  T13["method:SocketRocketUtility::SRWebSocketOpenWithURLString<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:35"]
  S13 -->|calls| T13
  S14["method:SocketRocketUtility::webSocketDidOpen:<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:131"]
  T14["method:SocketRocketUtility::initHeartBeat<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:116"]
  S14 -->|calls| T14
  S15["method:SocketRocketUtility::webSocket:didFailWithError:<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:140"]
  T15["method:SocketRocketUtility::reConnect<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:91"]
  S15 -->|calls| T15
  S16["method:SocketRocketUtility::webSocket:didCloseWithCode:reason:wasClean:<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:148"]
  T16["method:SocketRocketUtility::SRWebSocketClose<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:49"]
  S16 -->|calls| T16
  S17["method:XLSphereView::init<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:24"]
  T17["method:XLSphereView::init<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:24"]
  S17 -->|calls| T17
  S18["method:XLSphereView::init<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:24"]
  T18["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S18 -->|calls| T18
  S19["method:XLSphereView::setItems:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:34"]
  T19["method:XLSphereView::setTagOfPoint:andIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:80"]
  S19 -->|calls| T19
  S20["method:XLSphereView::setItems:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:34"]
  T20["method:XLSphereView::timerStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:91"]
  S20 -->|calls| T20
  S21["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  T21["method:XLSphereView::setTagOfPoint:andIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:80"]
  S21 -->|calls| T21
  S22["method:XLSphereView::autoTurnRotation<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:101"]
  T22["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  S22 -->|calls| T22
  S23["method:XLSphereView::inertiaStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:107"]
  T23["method:XLSphereView::timerStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:96"]
  S23 -->|calls| T23
  S24["method:XLSphereView::inertiaStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:113"]
  T24["method:XLSphereView::timerStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:91"]
  S24 -->|calls| T24
  S25["method:XLSphereView::inertiaStep<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:119"]
  T25["method:XLSphereView::inertiaStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:113"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

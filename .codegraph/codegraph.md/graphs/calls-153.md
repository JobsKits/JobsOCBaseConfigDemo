# `calls 符号关系 - 153`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TransitionController::initWithGestureRecognizer:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：手势横向滚动子VC联动Tabbar切换/TransitionController/TransitionController.m:25"]
  T1["method:TransitionController::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：手势横向滚动子VC联动Tabbar切换/TransitionController/TransitionController.m:33"]
  S1 -->|calls| T1
  S2["method:JobsPullListAutoSizeView::initWithTargetView:dataMutArr:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：高仿 Telegram，在指定位置出现菜单列表/JobsPullListAutoSizeView/JobsPullListAutoSizeView.m:25"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:JobsPullListAutoSizeView::initWithTargetView:dataMutArr:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：高仿 Telegram，在指定位置出现菜单列表/JobsPullListAutoSizeView/JobsPullListAutoSizeView.m:46"]
  T3["method:TransitionController::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：手势横向滚动子VC联动Tabbar切换/TransitionController/TransitionController.m:33"]
  S3 -->|calls| T3
  S4["method:JobsPullListAutoSizeView::initWithTargetView:dataMutArr:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：高仿 Telegram，在指定位置出现菜单列表/JobsPullListAutoSizeView/JobsPullListAutoSizeView.m:46"]
  T4["method:JobsPullListAutoSizeView::makeUI<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：高仿 Telegram，在指定位置出现菜单列表/JobsPullListAutoSizeView/JobsPullListAutoSizeView.m:55"]
  S4 -->|calls| T4
  S5["method:JobsPullListAutoSizeView::touchesBegan:withEvent:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：高仿 Telegram，在指定位置出现菜单列表/JobsPullListAutoSizeView/JobsPullListAutoSizeView.m:64"]
  T5["function:removeFromSuperview<br/>JobsOCBaseConfigDemo/业务逻辑/Common/App工具类/3rd/JhtBanner（卡片式滑动效果）/JhtBannerScrollView/JhtBannerScrollView.m:48"]
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
  S17["method:SocketRocketUtility::timer<br/>JobsByPods/JobsOCTools@Pods/Core/WebSocket/SocketRocketUtility.m:183"]
  T17["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S17 -->|calls| T17
  S18["method:XLChannelItem::initWithFrame:<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:19"]
  T18["method:XLChannelItem::initUI<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:25"]
  S18 -->|calls| T18
  S19["method:XLChannelItem::initUI<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:25"]
  T19["method:XLChannelItem::backgroundColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:62"]
  S19 -->|calls| T19
  S20["method:XLChannelItem::initUI<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:25"]
  T20["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S20 -->|calls| T20
  S21["method:XLChannelItem::initUI<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:25"]
  T21["method:XLChannelItem::textColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:66"]
  S21 -->|calls| T21
  S22["method:XLChannelItem::initUI<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:25"]
  T22["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S22 -->|calls| T22
  S23["method:XLChannelItem::initUI<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:25"]
  T23["method:XLChannelItem::addBorderLayer<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:41"]
  S23 -->|calls| T23
  S24["method:XLChannelItem::addBorderLayer<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:41"]
  T24["method:XLChannelItem::backgroundColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:62"]
  S24 -->|calls| T24
  S25["method:XLChannelItem::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:57"]
  T25["method:XLChannelItem::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:57"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

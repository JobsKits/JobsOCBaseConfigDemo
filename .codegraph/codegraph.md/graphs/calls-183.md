# `calls 符号关系 - 183`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T2["method:JobsTimer::resume<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:450"]
  S2 -->|calls| T2
  S3["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T3["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S3 -->|calls| T3
  S4["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T4["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S4 -->|calls| T4
  S5["method:ViewController::gtCaptchaSession:didReceiveError:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:143"]
  T5["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S5 -->|calls| T5
  S6["method:ViewController::gtCaptchaSession:didReceiveError:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:143"]
  T6["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S6 -->|calls| T6
  S7["function:main<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/main.m:11"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  T8["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  S8 -->|calls| T8
  S9["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  T9["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  S9 -->|calls| T9
  S10["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  T10["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S10 -->|calls| T10
  S11["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  T11["method:TABAnimationMethod::appVersion<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:24"]
  S11 -->|calls| T11
  S12["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  T12["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S12 -->|calls| T12
  S13["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  T13["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S13 -->|calls| T13
  S14["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  T14["method:TABAnimationMethod::appVersion<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:24"]
  S14 -->|calls| T14
  S15["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  T15["method:TABAnimatedCacheManager::_getFolderPath<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:309"]
  S15 -->|calls| T15
  S16["method:TABAnimatedCacheManager::cacheProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:115"]
  T16["method:TABAnimatedCacheManager::_canCacheToMemoryWithProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:383"]
  S16 -->|calls| T16
  S17["method:TABAnimatedCacheManager::cacheProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:115"]
  T17["method:TABAnimatedCacheManager::_canCacheToDiskWithProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:391"]
  S17 -->|calls| T17
  S18["method:TABAnimatedCacheManager::getProductionWithKey:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:147"]
  T18["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S18 -->|calls| T18
  S19["method:TABAnimatedCacheManager::getProductionWithKey:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:147"]
  T19["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S19 -->|calls| T19
  S20["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T20["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S20 -->|calls| T20
  S21["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T21["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S21 -->|calls| T21
  S22["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T22["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithClass:controllerName:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:246"]
  S22 -->|calls| T22
  S23["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T23["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithClass:controllerName:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:246"]
  S23 -->|calls| T23
  S24["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T24["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithClass:controllerName:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:246"]
  S24 -->|calls| T24
  S25["method:TABAnimatedCacheManager::_loadDataToMemory:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:191"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 021`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T1["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  S1 -->|calls| T1
  S2["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T2["method:ViewController::randomChangeBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:62"]
  S2 -->|calls| T2
  S3["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T3["method:ViewController::captchaSession<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:29"]
  S3 -->|calls| T3
  S4["method:ViewController::randomChangeBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:62"]
  T4["method:ViewController::randomColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:67"]
  S4 -->|calls| T4
  S5["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T9["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S9 -->|calls| T9
  S10["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T10["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S10 -->|calls| T10
  S11["method:ViewController::gtCaptchaSession:didReceiveError:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:143"]
  T11["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S11 -->|calls| T11
  S12["method:ViewController::gtCaptchaSession:didReceiveError:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:143"]
  T12["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S12 -->|calls| T12
  S13["function:main<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/main.m:11"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  T14["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  S14 -->|calls| T14
  S15["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  T15["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  S15 -->|calls| T15
  S16["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  T16["method:TABAnimationMethod::appVersion<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:24"]
  S16 -->|calls| T16
  S17["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  T17["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S17 -->|calls| T17
  S18["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  T18["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S18 -->|calls| T18
  S19["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  T19["method:TABAnimationMethod::appVersion<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:24"]
  S19 -->|calls| T19
  S20["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  T20["method:TABAnimatedCacheManager::_getFolderPath<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:309"]
  S20 -->|calls| T20
  S21["method:TABAnimatedCacheManager::cacheProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:115"]
  T21["method:TABAnimatedCacheManager::_canCacheToMemoryWithProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:383"]
  S21 -->|calls| T21
  S22["method:TABAnimatedCacheManager::cacheProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:115"]
  T22["method:TABAnimatedCacheManager::_canCacheToDiskWithProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:391"]
  S22 -->|calls| T22
  S23["method:TABAnimatedCacheManager::getProductionWithKey:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:147"]
  T23["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S23 -->|calls| T23
  S24["method:TABAnimatedCacheManager::getProductionWithKey:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:147"]
  T24["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S24 -->|calls| T24
  S25["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T25["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

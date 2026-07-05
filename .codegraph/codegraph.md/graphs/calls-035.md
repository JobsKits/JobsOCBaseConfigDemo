# `calls 符号关系 - 035`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABAnimatedProductImpl::_cannotBeCreated:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:502"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:TABAnimatedProductImpl::_cannotBeCreated:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:502"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:TABAnimatedProductImpl::_cannotBeCreated:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:502"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:TABAnimatedProductImpl::_cannotBeCreated:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:502"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:TABAnimatedProductImpl::_cannotBeCreated:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:502"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:TABAnimatedProductImpl::_cannotBeCreated:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:502"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:TABAnimatedProductImpl::_cannotBeCreated:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:502"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:TABAnimatedProductImpl::_cannotBeCreated:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:502"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["method:TABAnimatedProductImpl::_isNeedRemove:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:537"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:TABAnimatedProductImpl::_isNeedRemove:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:537"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:TABAnimatedProductImpl::_syncProduction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:575"]
  T11["method:TABAnimatedProductImpl::_bindWithProduction:targetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:589"]
  S11 -->|calls| T11
  S12["method:TABAnimatedProductImpl::setProductFinished:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:604"]
  T12["method:TABAnimatedProductImpl::syncProductions<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:151"]
  S12 -->|calls| T12
  S13["method:TABAnimatedProductImpl::setControlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:611"]
  T13["method:TABAnimatedDarkModeManagerImpl::addDarkModelSentryView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:39"]
  S13 -->|calls| T13
  S14["method:TABAnimatedProduction::initWithState:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:19"]
  T14["method:TABAnimatedProduction::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:26"]
  S14 -->|calls| T14
  S15["method:TABAnimatedProduction::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:26"]
  T15["method:TABAnimatedProduction::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:26"]
  S15 -->|calls| T15
  S16["method:TABAnimatedProduction::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:46"]
  T16["method:TABAnimatedProduction::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:26"]
  S16 -->|calls| T16
  S17["method:TABAnimatedProduction::copyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:59"]
  T17["method:TABAnimatedProduction::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:26"]
  S17 -->|calls| T17
  S18["method:TABAnimatedProduction::copyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:59"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:TABAnimatedProduction::syncDelegateManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:74"]
  T19["method:TABAnimatedProduction::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:26"]
  S19 -->|calls| T19
  S20["method:TABAnimatedProduction::recommendHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:81"]
  T20["method:TABAnimatedProduction::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:89"]
  S20 -->|calls| T20
  S21["method:TABAnimatedProduction::recommendHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:81"]
  T21["method:TABAnimatedProduction::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:99"]
  S21 -->|calls| T21
  S22["method:TABAnimatedProduction::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:89"]
  T22["method:TABComponentLayer::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:388"]
  S22 -->|calls| T22
  S23["method:TABAnimatedProduction::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:99"]
  T23["method:TABComponentLayer::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:376"]
  S23 -->|calls| T23
  S24["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  T24["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  S24 -->|calls| T24
  S25["method:TABComponentLayer::resetFrameWithRect:animatedHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:46"]
  T25["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

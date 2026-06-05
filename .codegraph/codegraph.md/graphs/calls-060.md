# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::resetContentInsetBottom<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:651"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIView::resetContentInsetRight<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:665"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIView::resetContentInsetOffsetTop<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:679"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIView::resetContentInsetOffsetLeft<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:693"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIView::resetContentInsetOffsetBottom<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:707"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIView::resetContentInsetOffsetRight<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:721"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIView::setSizer:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:904"]
  T7["method:NSValue::bySize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIView::setOrigin:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:918"]
  T8["method:NSValue::byPoint<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:24"]
  S8 -->|calls| T8
  S9["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T9["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T10["method:MJRefreshGifHeader::refreshStateIdleByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:57"]
  S10 -->|calls| T10
  S11["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T11["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T12["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T13["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIView::endRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T14["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S14 -->|calls| T14
  S15["method:UIView::endRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T15["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S15 -->|calls| T15
  S16["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T16["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S16 -->|calls| T16
  S17["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T17["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S17 -->|calls| T17
  S18["function:jobsMakeWKWebViewByConfig<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.h:47"]
  T18["method:WKWebView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsDebug::standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsDebug::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["function:JobsDeviceIDKeychainLoad<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:21"]
  T22["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S22 -->|calls| T22
  S23["function:JobsDeviceIDKeychainLoad<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:21"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["function:JobsDeviceIDKeychainSave<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:41"]
  T24["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S24 -->|calls| T24
  S25["function:JobsDeviceIDKeychainRemove<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:49"]
  T25["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

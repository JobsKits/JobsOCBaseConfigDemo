# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::MJRefreshBackFooterBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:301"]
  T1["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::MJRefreshFooterBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:314"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::endRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T3["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S3 -->|calls| T3
  S4["method:UIView::endRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T4["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S4 -->|calls| T4
  S5["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T5["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S5 -->|calls| T5
  S6["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T6["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S6 -->|calls| T6
  S7["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T7["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T8["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S8 -->|calls| T8
  S9["function:jobsMakeWKWebViewByConfig<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.h:47"]
  T9["method:WKWebView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  T10["method:JobsPodspecKitForJobsDebug::standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:266"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsDebug::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:273"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  S12 -->|calls| T12
  S13["function:JobsDeviceIDKeychainLoad<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:21"]
  T13["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S13 -->|calls| T13
  S14["function:JobsDeviceIDKeychainLoad<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:21"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["function:JobsDeviceIDKeychainSave<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:41"]
  T15["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S15 -->|calls| T15
  S16["function:JobsDeviceIDKeychainRemove<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:49"]
  T16["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S16 -->|calls| T16
  S17["method:NSObject::deleteDeviceID<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:59"]
  T17["function:JobsDeviceIDKeychainRemove<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:49"]
  S17 -->|calls| T17
  S18["method:NSObject::deviceID<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:63"]
  T18["function:JobsDeviceIDKeychainLoad<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:21"]
  S18 -->|calls| T18
  S19["method:NSObject::deviceID<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:63"]
  T19["function:JobsDeviceIDKeychainSave<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:41"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  T20["method:JobsPodspecKitForJobsDeviceInfo::standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:266"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:273"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  S22 -->|calls| T22
  S23["method:NSArray::containsObject<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T23["method:NSArray::containsObject<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S23 -->|calls| T23
  S24["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T24["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T25["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

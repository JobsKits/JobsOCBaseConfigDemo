# `calls 符号关系 - 010`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsFiltrationView::apply_standard_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsFiltrationView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:277"]
  S1 -->|calls| T1
  S2["method:JobsGestureLockConfiguration::copyWithZone:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:37"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:JobsGestureLockResource::imageNamed:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:29"]
  T3["method:JobsGestureLockResource::resourceBundle<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:12"]
  S3 -->|calls| T3
  S4["method:JobsGestureLockStorage::saveGesturePassword:forKey:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockStorage/JobsGestureLockStorage.m:16"]
  T4["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  T5["method:JobsPodspecKitForJobsGestureLock::standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:266"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsGestureLock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:273"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsGetWindow::standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsGetWindow::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  T11["method:JobsPodspecKitForJobsHotLabel::standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:266"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsHotLabel::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:273"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsImageNumberView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:277"]
  T14["method:JobsPodspecKitForJobsImageNumberView::standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:266"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsImageNumberView::apply_standard_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsImageNumberView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:273"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsImageNumberView::apply_standard_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsImageNumberView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:277"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  T17["method:JobsPodspecKitForJobsLanMgr::standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:266"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsLanMgr::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:273"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  S19 -->|calls| T19
  S20["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsLanMgr@Pods/Support/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  T20["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  S20 -->|calls| T20
  S21["method:NSString::add<br/>JobsByPods/JobsLanMgr@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T21["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  T22["method:JobsPodspecKitForJobsLinkageMenuView::standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:266"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:273"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  S24 -->|calls| T24
  S25["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T25["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

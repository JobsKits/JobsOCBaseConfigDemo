# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  T2["method:JobsPodspecKitForJobsGetWindow::standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:266"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsGetWindow::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:273"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  T5["method:JobsPodspecKitForJobsHotLabel::standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:266"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsHotLabel::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:273"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsImageNumberView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsImageNumberView::standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsImageNumberView::apply_standard_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsImageNumberView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsImageNumberView::apply_standard_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsImageNumberView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  T11["method:JobsPodspecKitForJobsLanMgr::standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:266"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsLanMgr::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:273"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  T14["method:JobsPodspecKitForJobsLinkageMenuView::standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:266"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:273"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  S16 -->|calls| T16
  S17["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T17["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSString::jobsFileUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T18["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsLoadingImage::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsLoadingImage::standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsLoadingImage::apply_standard_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsLoadingImage::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsLoadingImage::apply_standard_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsLoadingImage::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsLocker::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:277"]
  T22["method:JobsPodspecKitForJobsLocker::standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:266"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsLocker::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:273"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsLocker::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:277"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsMakes::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:277"]
  T25["method:JobsPodspecKitForJobsMakes::standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:266"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

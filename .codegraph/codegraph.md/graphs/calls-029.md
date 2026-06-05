# `calls 符号关系 - 029`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::endRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T1["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S1 -->|calls| T1
  S2["method:UIView::endRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T2["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S2 -->|calls| T2
  S3["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T3["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S3 -->|calls| T3
  S4["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T4["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S4 -->|calls| T4
  S5["method:JobsBioKit::biometryName<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:46"]
  T5["method:JobsBioKit::biometryType<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:21"]
  S5 -->|calls| T5
  S6["method:JobsBioKit::authenticateWithReason:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:73"]
  T6["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  S6 -->|calls| T6
  S7["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T7["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S7 -->|calls| T7
  S8["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T8["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  T9["method:JobsPodspecKitForJobsBioKit::standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:266"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsBioKit::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:273"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  T12["method:JobsPodspecKitForJobsBitsMonitor::standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:266"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:273"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsBlock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:277"]
  T15["method:JobsPodspecKitForJobsBlock::standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:266"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsBlock::apply_standard_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsBlock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:273"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsBlock::apply_standard_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsBlock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:277"]
  S17 -->|calls| T17
  S18["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T18["method:AVAssetImageGenerator::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVAssetImageGenerator/AVAssetImageGenerator+Extra/AVAssetImageGenerator+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T19["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S19 -->|calls| T19
  S20["method:CALayer::curve<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:107"]
  T20["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S20 -->|calls| T20
  S21["method:CALayer::animaSubtype<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:122"]
  T21["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S21 -->|calls| T21
  S22["method:CALayer::animaTypeWithTransitionType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:136"]
  T22["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S22 -->|calls| T22
  S23["method:NSArray::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T23["method:NSArray::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S23 -->|calls| T23
  S24["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T24["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T25["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 094`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsClass::apply_standard_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsClass::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:273"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsClass::apply_standard_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsClass::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:277"]
  S2 -->|calls| T2
  S3["method:JobsClockView::dealloc<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:30"]
  T3["method:JobsClockView::stop<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:256"]
  S3 -->|calls| T3
  S4["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  T4["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  S4 -->|calls| T4
  S5["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  T5["method:JobsClockView::setupDialLayers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:45"]
  S5 -->|calls| T5
  S6["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  T6["method:JobsClockView::setupNumberLabels<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:76"]
  S6 -->|calls| T6
  S7["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  T7["method:JobsClockView::setupHandLayers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:94"]
  S7 -->|calls| T7
  S8["method:JobsClockView::setupNumberLabels<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:76"]
  T8["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S8 -->|calls| T8
  S9["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  T9["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  S9 -->|calls| T9
  S10["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  T10["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:123"]
  S10 -->|calls| T10
  S11["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  T11["method:JobsClockView::layoutHandLayers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:194"]
  S11 -->|calls| T11
  S12["method:JobsClockView::start<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:218"]
  T12["method:JobsClockView::startByTimerType<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:222"]
  S12 -->|calls| T12
  S13["method:JobsClockView::startByTimerType<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:222"]
  T13["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S13 -->|calls| T13
  S14["method:JobsClockView::updateHandsAnimated:<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:263"]
  T14["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  T15["method:JobsPodspecKitForJobsClockView::standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:266"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsClockView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:273"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  S17 -->|calls| T17
  S18["method:NSError::errorWithCCCryptorStatus:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:56"]
  T18["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S18 -->|calls| T18
  S19["method:NSData::MD2Sum<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:109"]
  T19["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S19 -->|calls| T19
  S20["method:NSData::MD4Sum<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:118"]
  T20["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S20 -->|calls| T20
  S21["method:NSData::MD5Sum<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:127"]
  T21["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S21 -->|calls| T21
  S22["method:NSData::SHA1Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:136"]
  T22["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S22 -->|calls| T22
  S23["method:NSData::SHA224Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:145"]
  T23["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S23 -->|calls| T23
  S24["method:NSData::SHA256Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:154"]
  T24["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S24 -->|calls| T24
  S25["method:NSData::SHA384Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:163"]
  T25["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

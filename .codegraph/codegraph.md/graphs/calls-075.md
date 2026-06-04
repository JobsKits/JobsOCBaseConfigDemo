# `calls 符号关系 - 075`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsClockView::setupNumberLabels<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:76"]
  T1["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S1 -->|calls| T1
  S2["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  T2["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  S2 -->|calls| T2
  S3["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  T3["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:123"]
  S3 -->|calls| T3
  S4["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  T4["method:JobsClockView::layoutHandLayers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:194"]
  S4 -->|calls| T4
  S5["method:JobsClockView::start<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:218"]
  T5["method:JobsClockView::startByTimerType<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:222"]
  S5 -->|calls| T5
  S6["method:JobsClockView::startByTimerType<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:222"]
  T6["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S6 -->|calls| T6
  S7["method:JobsClockView::updateHandsAnimated:<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:263"]
  T7["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsClockView::standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsClockView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:NSData::MD2Sum<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:109"]
  T11["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S11 -->|calls| T11
  S12["method:NSData::MD4Sum<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:118"]
  T12["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S12 -->|calls| T12
  S13["method:NSData::MD5Sum<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:127"]
  T13["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S13 -->|calls| T13
  S14["method:NSData::SHA1Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:136"]
  T14["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S14 -->|calls| T14
  S15["method:NSData::SHA224Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:145"]
  T15["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S15 -->|calls| T15
  S16["method:NSData::SHA256Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:154"]
  T16["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S16 -->|calls| T16
  S17["method:NSData::SHA384Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:163"]
  T17["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S17 -->|calls| T17
  S18["method:NSData::SHA512Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:170"]
  T18["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S18 -->|calls| T18
  S19["method:NSData::AES256EncryptedDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:182"]
  T19["method:NSData::dataEncryptedUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:349"]
  S19 -->|calls| T19
  S20["method:NSData::decryptedAES256DataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:196"]
  T20["method:NSData::decryptedDataUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:422"]
  S20 -->|calls| T20
  S21["method:NSData::DESEncryptedDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:210"]
  T21["method:NSData::dataEncryptedUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:349"]
  S21 -->|calls| T21
  S22["method:NSData::decryptedDESDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:224"]
  T22["method:NSData::decryptedDataUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:422"]
  S22 -->|calls| T22
  S23["method:NSData::CASTEncryptedDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:238"]
  T23["method:NSData::dataEncryptedUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:349"]
  S23 -->|calls| T23
  S24["method:NSData::decryptedCASTDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:252"]
  T24["method:NSData::decryptedDataUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:422"]
  S24 -->|calls| T24
  S25["function:FixKeyLengths<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:268"]
  T25["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

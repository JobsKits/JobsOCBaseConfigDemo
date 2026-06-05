# `calls 符号关系 - 048`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  T1["method:JobsClockView::layoutHandLayers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:194"]
  S1 -->|calls| T1
  S2["method:JobsClockView::start<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:218"]
  T2["method:JobsClockView::startByTimerType<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:222"]
  S2 -->|calls| T2
  S3["method:JobsClockView::updateHandsAnimated:<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:263"]
  T3["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForJobsClockView::standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsClockView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["method:NSData::MD2Sum<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:109"]
  T7["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S7 -->|calls| T7
  S8["method:NSData::MD4Sum<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:118"]
  T8["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S8 -->|calls| T8
  S9["method:NSData::MD5Sum<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:127"]
  T9["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S9 -->|calls| T9
  S10["method:NSData::SHA1Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:136"]
  T10["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S10 -->|calls| T10
  S11["method:NSData::SHA224Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:145"]
  T11["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S11 -->|calls| T11
  S12["method:NSData::SHA256Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:154"]
  T12["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S12 -->|calls| T12
  S13["method:NSData::SHA384Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:163"]
  T13["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S13 -->|calls| T13
  S14["method:NSData::SHA512Hash<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:170"]
  T14["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S14 -->|calls| T14
  S15["method:NSData::AES256EncryptedDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:182"]
  T15["method:NSData::dataEncryptedUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:349"]
  S15 -->|calls| T15
  S16["method:NSData::decryptedAES256DataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:196"]
  T16["method:NSData::decryptedDataUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:422"]
  S16 -->|calls| T16
  S17["method:NSData::DESEncryptedDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:210"]
  T17["method:NSData::dataEncryptedUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:349"]
  S17 -->|calls| T17
  S18["method:NSData::decryptedDESDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:224"]
  T18["method:NSData::decryptedDataUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:422"]
  S18 -->|calls| T18
  S19["method:NSData::CASTEncryptedDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:238"]
  T19["method:NSData::dataEncryptedUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:349"]
  S19 -->|calls| T19
  S20["method:NSData::decryptedCASTDataUsingKey:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:252"]
  T20["method:NSData::decryptedDataUsingAlgorithm:key:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:422"]
  S20 -->|calls| T20
  S21["function:FixKeyLengths<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:268"]
  T21["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S21 -->|calls| T21
  S22["function:FixKeyLengths<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:268"]
  T22["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S22 -->|calls| T22
  S23["method:NSData::_runCryptor:result:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:305"]
  T23["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S23 -->|calls| T23
  S24["method:NSData::_runCryptor:result:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:305"]
  T24["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S24 -->|calls| T24
  S25["method:NSData::dataEncryptedUsingAlgorithm:key:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:339"]
  T25["method:NSData::dataEncryptedUsingAlgorithm:key:initializationVector:options:error:<br/>JobsByPods/JobsCryptography@Pods/Core/HASH 信息摘要/系统拓展/NSData+CommonCrypto.m:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

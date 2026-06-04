# `calls 符号关系 - 080`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  T1["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S1 -->|calls| T1
  S2["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:41"]
  T2["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  S2 -->|calls| T2
  S3["method:GTMBase64::encodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:226"]
  T3["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S3 -->|calls| T3
  S4["method:GTMBase64::decodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:237"]
  T4["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S4 -->|calls| T4
  S5["method:GTMBase64::encodeBytes:length:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:248"]
  T5["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S5 -->|calls| T5
  S6["method:GTMBase64::decodeBytes:length:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:255"]
  T6["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S6 -->|calls| T6
  S7["method:GTMBase64::stringByEncodingData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:262"]
  T7["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S7 -->|calls| T7
  S8["method:GTMBase64::stringByEncodingBytes:length:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:274"]
  T8["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S8 -->|calls| T8
  S9["method:GTMBase64::decodeString:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:284"]
  T9["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S9 -->|calls| T9
  S10["method:GTMBase64::webSafeEncodeData:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:302"]
  T10["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S10 -->|calls| T10
  S11["method:GTMBase64::webSafeDecodeData:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:310"]
  T11["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S11 -->|calls| T11
  S12["method:GTMBase64::webSafeEncodeBytes:length:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:317"]
  T12["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S12 -->|calls| T12
  S13["method:GTMBase64::webSafeDecodeBytes:length:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:326"]
  T13["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S13 -->|calls| T13
  S14["method:GTMBase64::stringByWebSafeEncodingData:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:333"]
  T14["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S14 -->|calls| T14
  S15["method:GTMBase64::stringByWebSafeEncodingBytes:length:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:344"]
  T15["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S15 -->|calls| T15
  S16["method:GTMBase64::webSafeDecodeString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:356"]
  T16["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S16 -->|calls| T16
  S17["method:GTMBase64::md5_base64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:369"]
  T17["method:GTMBase64::encodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:226"]
  S17 -->|calls| T17
  S18["method:GTMBase64::encodeBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:380"]
  T18["method:GTMBase64::encodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:226"]
  S18 -->|calls| T18
  S19["method:GTMBase64::decodeBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:388"]
  T19["method:GTMBase64::decodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:237"]
  S19 -->|calls| T19
  S20["method:GTMBase64::encodeBase64Data<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:397"]
  T20["method:GTMBase64::encodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:226"]
  S20 -->|calls| T20
  S21["method:GTMBase64::decodeBase64Data<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:403"]
  T21["method:GTMBase64::decodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:237"]
  S21 -->|calls| T21
  S22["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  T22["function:CalcEncodedLength<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:178"]
  S22 -->|calls| T22
  S23["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  T23["method:GTMBase64::baseEncode:srcLen:destBytes:destLen:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:494"]
  S23 -->|calls| T23
  S24["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  T24["function:GuessDecodedLength<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:191"]
  S24 -->|calls| T24
  S25["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  T25["method:GTMBase64::baseDecode:srcLen:destBytes:destLen:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:565"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

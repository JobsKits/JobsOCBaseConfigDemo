# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:GTMBase64::webSafeEncodeData:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:302"]
  T1["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S1 -->|calls| T1
  S2["method:GTMBase64::webSafeDecodeData:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:310"]
  T2["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S2 -->|calls| T2
  S3["method:GTMBase64::webSafeEncodeBytes:length:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:317"]
  T3["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S3 -->|calls| T3
  S4["method:GTMBase64::webSafeDecodeBytes:length:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:326"]
  T4["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S4 -->|calls| T4
  S5["method:GTMBase64::stringByWebSafeEncodingData:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:333"]
  T5["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S5 -->|calls| T5
  S6["method:GTMBase64::stringByWebSafeEncodingData:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:333"]
  T6["method:NSString::initByASCIIData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:19"]
  S6 -->|calls| T6
  S7["method:GTMBase64::stringByWebSafeEncodingBytes:length:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:344"]
  T7["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S7 -->|calls| T7
  S8["method:GTMBase64::stringByWebSafeEncodingBytes:length:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:344"]
  T8["method:NSString::initByASCIIData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:19"]
  S8 -->|calls| T8
  S9["method:GTMBase64::webSafeDecodeString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:356"]
  T9["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S9 -->|calls| T9
  S10["method:GTMBase64::md5_base64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:369"]
  T10["method:GTMBase64::encodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:226"]
  S10 -->|calls| T10
  S11["method:GTMBase64::md5_base64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:369"]
  T11["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S11 -->|calls| T11
  S12["method:GTMBase64::encodeBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:380"]
  T12["method:GTMBase64::encodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:226"]
  S12 -->|calls| T12
  S13["method:GTMBase64::encodeBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:380"]
  T13["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S13 -->|calls| T13
  S14["method:GTMBase64::decodeBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:388"]
  T14["method:GTMBase64::decodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:237"]
  S14 -->|calls| T14
  S15["method:GTMBase64::decodeBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:388"]
  T15["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S15 -->|calls| T15
  S16["method:GTMBase64::encodeBase64Data<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:397"]
  T16["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S16 -->|calls| T16
  S17["method:GTMBase64::encodeBase64Data<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:397"]
  T17["method:GTMBase64::encodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:226"]
  S17 -->|calls| T17
  S18["method:GTMBase64::decodeBase64Data<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:403"]
  T18["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S18 -->|calls| T18
  S19["method:GTMBase64::decodeBase64Data<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:403"]
  T19["method:GTMBase64::decodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:237"]
  S19 -->|calls| T19
  S20["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  T20["function:CalcEncodedLength<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:178"]
  S20 -->|calls| T20
  S21["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  T21["method:GTMBase64::baseEncode:srcLen:destBytes:destLen:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:494"]
  S21 -->|calls| T21
  S22["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  T22["function:GuessDecodedLength<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:191"]
  S22 -->|calls| T22
  S23["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  T23["method:GTMBase64::baseDecode:srcLen:destBytes:destLen:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:565"]
  S23 -->|calls| T23
  S24["method:GTMBase64::baseDecode:srcLen:destBytes:destLen:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:565"]
  T24["function:IsSpace<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:141"]
  S24 -->|calls| T24
  S25["method:GTMBase64::baseDecode:srcLen:destBytes:destLen:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:565"]
  T25["function:IsSpace<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:141"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 099`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSData::base64StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:19"]
  T1["method:NSData::base64StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:13"]
  S1 -->|calls| T1
  S2["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:24"]
  T2["method:NSData::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:20"]
  S2 -->|calls| T2
  S3["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:95"]
  T3["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::base64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:19"]
  T4["method:NSString::base64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:13"]
  S4 -->|calls| T4
  S5["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:23"]
  T5["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S5 -->|calls| T5
  S6["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:23"]
  T6["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S6 -->|calls| T6
  S7["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:29"]
  T7["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:23"]
  S7 -->|calls| T7
  S8["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:34"]
  T8["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S8 -->|calls| T8
  S9["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:34"]
  T9["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S9 -->|calls| T9
  S10["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:40"]
  T10["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:34"]
  S10 -->|calls| T10
  S11["method:NSString::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:45"]
  T11["method:NSData::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:20"]
  S11 -->|calls| T11
  S12["method:NSString::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:112"]
  T12["method:NSString::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:45"]
  S12 -->|calls| T12
  S13["method:UIImage::base64Str<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:30"]
  T13["method:UIImage::base64StringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:23"]
  S13 -->|calls| T13
  S14["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  T14["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S14 -->|calls| T14
  S15["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  T15["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S15 -->|calls| T15
  S16["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:41"]
  T16["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  S16 -->|calls| T16
  S17["method:GTMBase64::encodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:226"]
  T17["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S17 -->|calls| T17
  S18["method:GTMBase64::decodeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:237"]
  T18["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S18 -->|calls| T18
  S19["method:GTMBase64::encodeBytes:length:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:248"]
  T19["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S19 -->|calls| T19
  S20["method:GTMBase64::decodeBytes:length:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:255"]
  T20["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S20 -->|calls| T20
  S21["method:GTMBase64::stringByEncodingData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:262"]
  T21["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S21 -->|calls| T21
  S22["method:GTMBase64::stringByEncodingData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:262"]
  T22["method:NSString::initByASCIIData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:19"]
  S22 -->|calls| T22
  S23["method:GTMBase64::stringByEncodingBytes:length:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:274"]
  T23["method:GTMBase64::baseEncode:length:charset:padded:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:423"]
  S23 -->|calls| T23
  S24["method:GTMBase64::stringByEncodingBytes:length:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:274"]
  T24["method:NSString::initByASCIIData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:19"]
  S24 -->|calls| T24
  S25["method:GTMBase64::decodeString:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:284"]
  T25["method:GTMBase64::baseDecode:length:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:457"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 052`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::getImageWithData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:23"]
  T1["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S1 -->|calls| T1
  S2["method:UIImage::getImageWithData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:29"]
  T2["method:UIImage::getImageWithData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:23"]
  S2 -->|calls| T2
  S3["method:UIImage::PNGImageData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:43"]
  T3["method:UIImage::dataWithPNGImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:37"]
  S3 -->|calls| T3
  S4["method:UIImage::base32Str<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:69"]
  T4["method:UIImage::base32StringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:63"]
  S4 -->|calls| T4
  S5["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:73"]
  T5["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S5 -->|calls| T5
  S6["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:73"]
  T6["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S6 -->|calls| T6
  S7["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:79"]
  T7["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:73"]
  S7 -->|calls| T7
  S8["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  T8["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S8 -->|calls| T8
  S9["method:NSData::base64StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:19"]
  T9["method:NSData::base64StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:13"]
  S9 -->|calls| T9
  S10["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:24"]
  T10["method:NSData::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:20"]
  S10 -->|calls| T10
  S11["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:95"]
  T11["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:24"]
  S11 -->|calls| T11
  S12["method:NSString::base64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:19"]
  T12["method:NSString::base64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:13"]
  S12 -->|calls| T12
  S13["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:23"]
  T13["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S13 -->|calls| T13
  S14["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:29"]
  T14["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:23"]
  S14 -->|calls| T14
  S15["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:34"]
  T15["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S15 -->|calls| T15
  S16["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:34"]
  T16["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S16 -->|calls| T16
  S17["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:40"]
  T17["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:34"]
  S17 -->|calls| T17
  S18["method:NSString::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:45"]
  T18["method:NSData::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:20"]
  S18 -->|calls| T18
  S19["method:NSString::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:112"]
  T19["method:NSString::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:45"]
  S19 -->|calls| T19
  S20["method:UIImage::base64Str<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:30"]
  T20["method:UIImage::base64StringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:23"]
  S20 -->|calls| T20
  S21["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  T21["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S21 -->|calls| T21
  S22["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  T22["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S22 -->|calls| T22
  S23["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:41"]
  T23["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  S23 -->|calls| T23
  S24["method:NSData::dataToBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:49"]
  T24["method:NSData::dataToBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:13"]
  S24 -->|calls| T24
  S25["method:NSData::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:79"]
  T25["method:NSData::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:54"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

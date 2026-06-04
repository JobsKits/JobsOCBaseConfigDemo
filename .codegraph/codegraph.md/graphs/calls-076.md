# `calls 符号关系 - 076`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:31"]
  T1["method:MF_Base32Codec::base32StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:135"]
  S1 -->|calls| T1
  S2["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:36"]
  T2["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S2 -->|calls| T2
  S3["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:36"]
  T3["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:42"]
  T4["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S4 -->|calls| T4
  S5["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:42"]
  T5["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S5 -->|calls| T5
  S6["method:NSString::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:47"]
  T6["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  S6 -->|calls| T6
  S7["method:NSString::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:53"]
  T7["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  S7 -->|calls| T7
  S8["method:UIImage::getImageWithData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:23"]
  T8["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S8 -->|calls| T8
  S9["method:UIImage::getImageWithData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:29"]
  T9["method:UIImage::getImageWithData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:23"]
  S9 -->|calls| T9
  S10["method:UIImage::PNGImageData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:43"]
  T10["method:UIImage::dataWithPNGImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:37"]
  S10 -->|calls| T10
  S11["method:UIImage::base32Str<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:69"]
  T11["method:UIImage::base32StringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:63"]
  S11 -->|calls| T11
  S12["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:73"]
  T12["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S12 -->|calls| T12
  S13["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:73"]
  T13["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S13 -->|calls| T13
  S14["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:79"]
  T14["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:73"]
  S14 -->|calls| T14
  S15["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  T15["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S15 -->|calls| T15
  S16["method:NSData::base64StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:19"]
  T16["method:NSData::base64StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:13"]
  S16 -->|calls| T16
  S17["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:24"]
  T17["method:NSData::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:20"]
  S17 -->|calls| T17
  S18["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:95"]
  T18["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:24"]
  S18 -->|calls| T18
  S19["method:NSString::base64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:19"]
  T19["method:NSString::base64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:13"]
  S19 -->|calls| T19
  S20["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:23"]
  T20["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S20 -->|calls| T20
  S21["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:29"]
  T21["method:NSString::nsStringByBase64<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:23"]
  S21 -->|calls| T21
  S22["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:34"]
  T22["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S22 -->|calls| T22
  S23["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:34"]
  T23["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S23 -->|calls| T23
  S24["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:40"]
  T24["method:NSString::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:34"]
  S24 -->|calls| T24
  S25["method:NSString::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSString+Base64/NSString+Base64.m:45"]
  T25["method:NSData::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:20"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

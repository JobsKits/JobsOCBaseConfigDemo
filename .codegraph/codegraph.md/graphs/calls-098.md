# `calls 符号关系 - 098`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::imageByBase16String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base16/Base16（系统拓展）/UIImage+Base16/UIImage+Base16.m:70"]
  T1["method:UIImage::imageByBase16String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base16/Base16（系统拓展）/UIImage+Base16/UIImage+Base16.m:48"]
  S1 -->|calls| T1
  S2["method:NSData::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:13"]
  T2["method:MF_Base32Codec::base32StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:135"]
  S2 -->|calls| T2
  S3["method:NSData::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:19"]
  T3["method:NSData::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:13"]
  S3 -->|calls| T3
  S4["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  T4["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  S4 -->|calls| T4
  S5["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:30"]
  T5["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S5 -->|calls| T5
  S6["method:NSString::stringByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:13"]
  T6["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  S6 -->|calls| T6
  S7["method:NSString::stringByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:13"]
  T7["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S7 -->|calls| T7
  S8["method:NSString::stringByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:20"]
  T8["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  S8 -->|calls| T8
  S9["method:NSString::stringByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:20"]
  T9["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S9 -->|calls| T9
  S10["method:NSString::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:25"]
  T10["method:MF_Base32Codec::base32StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:135"]
  S10 -->|calls| T10
  S11["method:NSString::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:31"]
  T11["method:MF_Base32Codec::base32StringFromData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:135"]
  S11 -->|calls| T11
  S12["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:36"]
  T12["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S12 -->|calls| T12
  S13["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:36"]
  T13["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S13 -->|calls| T13
  S14["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:42"]
  T14["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S14 -->|calls| T14
  S15["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:42"]
  T15["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S15 -->|calls| T15
  S16["method:NSString::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:47"]
  T16["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  S16 -->|calls| T16
  S17["method:NSString::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:53"]
  T17["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  S17 -->|calls| T17
  S18["method:UIImage::getImageWithData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:23"]
  T18["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S18 -->|calls| T18
  S19["method:UIImage::getImageWithData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:29"]
  T19["method:UIImage::getImageWithData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:23"]
  S19 -->|calls| T19
  S20["method:UIImage::PNGImageData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:43"]
  T20["method:UIImage::dataWithPNGImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:37"]
  S20 -->|calls| T20
  S21["method:UIImage::base32Str<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:69"]
  T21["method:UIImage::base32StringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:63"]
  S21 -->|calls| T21
  S22["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:73"]
  T22["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S22 -->|calls| T22
  S23["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:73"]
  T23["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S23 -->|calls| T23
  S24["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:79"]
  T24["method:UIImage::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/UIImage+Base32/UIImage+Base32.m:73"]
  S24 -->|calls| T24
  S25["method:MF_Base32Codec::dataFromBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/MF_Base32Codec（第三方）/MF_Base32Codec.m:16"]
  T25["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

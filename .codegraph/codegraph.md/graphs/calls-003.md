# `calls 符号关系 - 003`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSData::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:19"]
  T1["method:NSData::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:13"]
  S1 -->|calls| T1
  S2["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:30"]
  T2["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S2 -->|calls| T2
  S3["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:36"]
  T3["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:42"]
  T4["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S4 -->|calls| T4
  S5["method:UIImage::base64Str<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:30"]
  T5["method:UIImage::base64StringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:23"]
  S5 -->|calls| T5
  S6["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  T6["method:NSData::initByBase64EncodedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:44"]
  S6 -->|calls| T6
  S7["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:41"]
  T7["method:UIImage::imageByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/UIImage+Base64/UIImage+Base64.m:35"]
  S7 -->|calls| T7
  S8["method:NSData::dataToBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:49"]
  T8["method:NSData::dataToBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:13"]
  S8 -->|calls| T8
  S9["method:NSData::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:79"]
  T9["method:NSData::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:54"]
  S9 -->|calls| T9
  S10["method:NSString::base85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:13"]
  T10["method:NSData::dataToBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:13"]
  S10 -->|calls| T10
  S11["method:NSString::base85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:19"]
  T11["method:NSString::base85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:13"]
  S11 -->|calls| T11
  S12["method:NSString::stringByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:23"]
  T12["method:NSString::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:34"]
  S12 -->|calls| T12
  S13["method:NSString::stringByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:29"]
  T13["method:NSString::stringByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:23"]
  S13 -->|calls| T13
  S14["method:NSString::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:59"]
  T14["method:NSString::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:34"]
  S14 -->|calls| T14
  S15["method:NSString::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:87"]
  T15["method:NSString::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:64"]
  S15 -->|calls| T15
  S16["method:UIImage::base85Str<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:57"]
  T16["method:UIImage::base85StringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:24"]
  S16 -->|calls| T16
  S17["method:UIImage::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:85"]
  T17["method:UIImage::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:62"]
  S17 -->|calls| T17
  S18["method:NSData::dataByMIMEString:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:20"]
  T18["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S18 -->|calls| T18
  S19["method:NSData::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:30"]
  T19["method:NSData::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:24"]
  S19 -->|calls| T19
  S20["method:NSString::mimeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:19"]
  T20["method:NSString::stringByMIMEData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:13"]
  S20 -->|calls| T20
  S21["method:NSString::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:31"]
  T21["method:NSString::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:24"]
  S21 -->|calls| T21
  S22["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  T22["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S22 -->|calls| T22
  S23["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:42"]
  T23["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  S23 -->|calls| T23
  S24["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  T24["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S24 -->|calls| T24
  S25["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:19"]
  T25["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

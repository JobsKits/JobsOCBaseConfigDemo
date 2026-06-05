# `calls 符号关系 - 053`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::base85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:13"]
  T1["method:NSData::dataToBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:13"]
  S1 -->|calls| T1
  S2["method:NSString::base85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:19"]
  T2["method:NSString::base85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:13"]
  S2 -->|calls| T2
  S3["method:NSString::stringByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:23"]
  T3["method:NSString::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:34"]
  S3 -->|calls| T3
  S4["method:NSString::stringByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:29"]
  T4["method:NSString::stringByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:23"]
  S4 -->|calls| T4
  S5["method:NSString::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:59"]
  T5["method:NSString::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:34"]
  S5 -->|calls| T5
  S6["method:NSString::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:64"]
  T6["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S6 -->|calls| T6
  S7["method:NSString::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:87"]
  T7["method:NSString::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:64"]
  S7 -->|calls| T7
  S8["method:UIImage::base85Str<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:57"]
  T8["method:UIImage::base85StringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:24"]
  S8 -->|calls| T8
  S9["method:UIImage::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:62"]
  T9["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S9 -->|calls| T9
  S10["method:UIImage::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:85"]
  T10["method:UIImage::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:62"]
  S10 -->|calls| T10
  S11["method:NSData::hexStringByData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:13"]
  T11["method:NSString::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:80"]
  S11 -->|calls| T11
  S12["method:NSData::hexStringByData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:25"]
  T12["method:NSData::hexStringByData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:13"]
  S12 -->|calls| T12
  S13["method:NSData::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:45"]
  T13["method:NSData::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:30"]
  S13 -->|calls| T13
  S14["method:NSString::stringByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:27"]
  T14["method:NSString::stringByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:13"]
  S14 -->|calls| T14
  S15["method:NSString::hexStringByString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:31"]
  T15["method:NSString::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:80"]
  S15 -->|calls| T15
  S16["method:NSString::hexStringByString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:42"]
  T16["method:NSString::hexStringByString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:31"]
  S16 -->|calls| T16
  S17["method:NSString::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:47"]
  T17["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S17 -->|calls| T17
  S18["method:NSString::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:62"]
  T18["method:NSString::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:47"]
  S18 -->|calls| T18
  S19["method:NSString::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:82"]
  T19["method:NSString::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:67"]
  S19 -->|calls| T19
  S20["method:UIImage::hexStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:13"]
  T20["method:NSString::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:80"]
  S20 -->|calls| T20
  S21["method:UIImage::hexStr<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:24"]
  T21["method:UIImage::hexStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:13"]
  S21 -->|calls| T21
  S22["method:UIImage::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:29"]
  T22["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S22 -->|calls| T22
  S23["method:UIImage::imageByHexString:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:44"]
  T23["method:UIImage::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:29"]
  S23 -->|calls| T23
  S24["method:NSData::dataByMIMEString:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:20"]
  T24["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S24 -->|calls| T24
  S25["method:NSData::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:30"]
  T25["method:NSData::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

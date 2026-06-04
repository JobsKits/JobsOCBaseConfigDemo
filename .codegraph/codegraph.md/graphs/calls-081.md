# `calls 符号关系 - 081`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:GTMBase64::baseDecode:srcLen:destBytes:destLen:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:565"]
  T1["function:IsSpace<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:141"]
  S1 -->|calls| T1
  S2["method:GTMBase64::baseDecode:srcLen:destBytes:destLen:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:565"]
  T2["function:IsSpace<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:141"]
  S2 -->|calls| T2
  S3["method:GTMBase64::baseDecode:srcLen:destBytes:destLen:charset:requirePadding:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:565"]
  T3["function:IsSpace<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/GTMBase64（第三方）/GTMBase64/GTMBase64.m:141"]
  S3 -->|calls| T3
  S4["method:NSData::dataToBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:49"]
  T4["method:NSData::dataToBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:13"]
  S4 -->|calls| T4
  S5["method:NSData::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:79"]
  T5["method:NSData::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:54"]
  S5 -->|calls| T5
  S6["method:NSString::base85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:13"]
  T6["method:NSData::dataToBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSData+Base85/NSData+Base85.m:13"]
  S6 -->|calls| T6
  S7["method:NSString::base85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:19"]
  T7["method:NSString::base85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:13"]
  S7 -->|calls| T7
  S8["method:NSString::stringByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:23"]
  T8["method:NSString::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:34"]
  S8 -->|calls| T8
  S9["method:NSString::stringByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:29"]
  T9["method:NSString::stringByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:23"]
  S9 -->|calls| T9
  S10["method:NSString::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:59"]
  T10["method:NSString::dataByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:34"]
  S10 -->|calls| T10
  S11["method:NSString::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:64"]
  T11["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S11 -->|calls| T11
  S12["method:NSString::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:87"]
  T12["method:NSString::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/NSString+Base85/NSString+Base85.m:64"]
  S12 -->|calls| T12
  S13["method:UIImage::base85Str<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:57"]
  T13["method:UIImage::base85StringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:24"]
  S13 -->|calls| T13
  S14["method:UIImage::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:62"]
  T14["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S14 -->|calls| T14
  S15["method:UIImage::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:85"]
  T15["method:UIImage::imageByBase85String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base85/Base85（系统拓展）/UIImage+Base85/UIImage+Base85.m:62"]
  S15 -->|calls| T15
  S16["method:NSData::hexStringByData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:13"]
  T16["method:NSString::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:80"]
  S16 -->|calls| T16
  S17["method:NSData::hexStringByData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:25"]
  T17["method:NSData::hexStringByData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:13"]
  S17 -->|calls| T17
  S18["method:NSData::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:30"]
  T18["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S18 -->|calls| T18
  S19["method:NSData::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:45"]
  T19["method:NSData::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSData+HexadecimalData/NSData+HexadecimalData.m:30"]
  S19 -->|calls| T19
  S20["method:NSString::stringByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:13"]
  T20["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S20 -->|calls| T20
  S21["method:NSString::stringByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:27"]
  T21["method:NSString::stringByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:13"]
  S21 -->|calls| T21
  S22["method:NSString::hexStringByString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:31"]
  T22["method:NSString::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:80"]
  S22 -->|calls| T22
  S23["method:NSString::hexStringByString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:42"]
  T23["method:NSString::hexStringByString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:31"]
  S23 -->|calls| T23
  S24["method:NSString::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:47"]
  T24["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S24 -->|calls| T24
  S25["method:NSString::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:47"]
  T25["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

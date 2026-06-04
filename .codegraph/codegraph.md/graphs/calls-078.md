# `calls 符号关系 - 078`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:47"]
  T1["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S1 -->|calls| T1
  S2["method:NSString::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:47"]
  T2["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S2 -->|calls| T2
  S3["method:NSString::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:62"]
  T3["method:NSString::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:47"]
  S3 -->|calls| T3
  S4["method:NSString::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:67"]
  T4["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S4 -->|calls| T4
  S5["method:NSString::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:82"]
  T5["method:NSString::dataByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/NSString+HexadecimalData/NSString+HexadecimalData.m:67"]
  S5 -->|calls| T5
  S6["method:UIImage::hexStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:13"]
  T6["method:NSString::initByCapacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:80"]
  S6 -->|calls| T6
  S7["method:UIImage::hexStr<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:24"]
  T7["method:UIImage::hexStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:13"]
  S7 -->|calls| T7
  S8["method:UIImage::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:29"]
  T8["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S8 -->|calls| T8
  S9["method:UIImage::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:29"]
  T9["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S9 -->|calls| T9
  S10["method:UIImage::imageByHexString:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:44"]
  T10["method:UIImage::imageByHexString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/HexadecimalData/UIImage+HexadecimalData/UIImage+HexadecimalData.m:29"]
  S10 -->|calls| T10
  S11["method:NSData::dataByMIMEString:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:20"]
  T11["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S11 -->|calls| T11
  S12["method:NSData::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:30"]
  T12["method:NSData::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:24"]
  S12 -->|calls| T12
  S13["method:NSString::mimeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:19"]
  T13["method:NSString::stringByMIMEData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:13"]
  S13 -->|calls| T13
  S14["method:NSString::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:31"]
  T14["method:NSString::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:24"]
  S14 -->|calls| T14
  S15["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  T15["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S15 -->|calls| T15
  S16["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  T16["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S16 -->|calls| T16
  S17["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:42"]
  T17["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  S17 -->|calls| T17
  S18["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  T18["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S18 -->|calls| T18
  S19["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  T19["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S19 -->|calls| T19
  S20["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:19"]
  T20["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  S20 -->|calls| T20
  S21["method:UIImage::MIMEStr<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:32"]
  T21["method:UIImage::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:25"]
  S21 -->|calls| T21
  S22["method:RSAUtil::stripPublicKeyHeader:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:37"]
  T22["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S22 -->|calls| T22
  S23["method:RSAUtil::stripPrivateKeyHeader:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:69"]
  T23["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S23 -->|calls| T23
  S24["method:RSAUtil::addPublicKey:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:107"]
  T24["function:RSAUtil::base64_decode<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:32"]
  S24 -->|calls| T24
  S25["method:RSAUtil::addPublicKey:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:107"]
  T25["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

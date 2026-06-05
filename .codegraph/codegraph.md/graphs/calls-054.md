# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::mimeData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:19"]
  T1["method:NSString::stringByMIMEData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:13"]
  S1 -->|calls| T1
  S2["method:NSString::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:31"]
  T2["method:NSString::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:24"]
  S2 -->|calls| T2
  S3["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  T3["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  S3 -->|calls| T3
  S4["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  T4["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S4 -->|calls| T4
  S5["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:42"]
  T5["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  S5 -->|calls| T5
  S6["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  T6["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S6 -->|calls| T6
  S7["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  T7["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S7 -->|calls| T7
  S8["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:19"]
  T8["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  S8 -->|calls| T8
  S9["method:UIImage::MIMEStr<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:32"]
  T9["method:UIImage::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:25"]
  S9 -->|calls| T9
  S10["method:RSAUtil::stripPublicKeyHeader:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:37"]
  T10["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S10 -->|calls| T10
  S11["method:RSAUtil::stripPrivateKeyHeader:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:69"]
  T11["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S11 -->|calls| T11
  S12["method:RSAUtil::addPublicKey:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:107"]
  T12["function:RSAUtil::base64_decode<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:32"]
  S12 -->|calls| T12
  S13["method:RSAUtil::addPublicKey:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:107"]
  T13["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S13 -->|calls| T13
  S14["method:RSAUtil::addPrivateKey:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:174"]
  T14["function:RSAUtil::base64_decode<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:32"]
  S14 -->|calls| T14
  S15["method:RSAUtil::addPrivateKey:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:174"]
  T15["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S15 -->|calls| T15
  S16["method:RSAUtil::encryptString:privateKey:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:280"]
  T16["function:RSAUtil::base64_encode_data<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:26"]
  S16 -->|calls| T16
  S17["method:RSAUtil::encryptString:publicKey:<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:374"]
  T17["function:RSAUtil::base64_encode_data<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/非对称加密RSA/RSAUtil.m:26"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsCryptography::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:277"]
  T18["method:JobsPodspecKitForJobsCryptography::standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:266"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsCryptography::apply_standard_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsCryptography::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:273"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsCryptography::apply_standard_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsCryptography::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:277"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  T21["method:JobsPodspecKitForJobsCustomView::standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:266"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsCustomView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:273"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  S23 -->|calls| T23
  S24["method:CALayer::curve<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:107"]
  T24["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S24 -->|calls| T24
  S25["method:CALayer::animaSubtype<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:122"]
  T25["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

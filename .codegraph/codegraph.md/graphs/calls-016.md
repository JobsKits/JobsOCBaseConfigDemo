# `calls 符号关系 - 016`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::bankCardStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:186"]
  T1["method:NSString::Mutable<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:25"]
  S1 -->|calls| T1
  S2["method:NSString::bankCardStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:186"]
  T2["method:NSString::jobsPureString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:324"]
  S2 -->|calls| T2
  S3["method:NSString::GETRequestURLParaBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:202"]
  T3["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S3 -->|calls| T3
  S4["method:NSString::GETRequestURLParaBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:202"]
  T4["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S4 -->|calls| T4
  S5["method:NSString::GETRequestURLParaBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:202"]
  T5["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSString::GETRequestURLParaBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:202"]
  T6["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S6 -->|calls| T6
  S7["method:NSString::stringByContentsOfURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:222"]
  T7["method:NSString::jobsURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  S7 -->|calls| T7
  S8["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.h:1"]
  T8["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S8 -->|calls| T8
  S9["method:NSString::cor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:11"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSString::imageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:16"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSString::jobsImageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:19"]
  T11["method:This::BaseUrl_Image<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:66"]
  S11 -->|calls| T11
  S12["method:NSString::jobsImageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:19"]
  T12["method:This::jobsBaseUrl<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:28"]
  S12 -->|calls| T12
  S13["method:NSString::jobsImageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:19"]
  T13["method:NSString::containsString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S13 -->|calls| T13
  S14["method:NSString::jobsImageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:19"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S14 -->|calls| T14
  S15["method:NSString::jobsImageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:19"]
  T15["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S15 -->|calls| T15
  S16["method:NSString::jobsImageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:19"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S16 -->|calls| T16
  S17["method:NSString::jobsImageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:19"]
  T17["method:This::BaseUrl_Image<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:66"]
  S17 -->|calls| T17
  S18["method:NSString::jobsImageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:19"]
  T18["method:This::BaseUrl_Image<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:66"]
  S18 -->|calls| T18
  S19["method:NSString::jobsImageURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:19"]
  T19["method:This::jobsBaseUrl<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:28"]
  S19 -->|calls| T19
  S20["method:NSString::pasteboard<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:42"]
  T20["function:jobsMakeTextView::jobsMakePasteboard<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:823"]
  S20 -->|calls| T20
  S21["method:NSString::pasteboard<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:42"]
  T21["method:UIPasteboard::byString<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:500"]
  S21 -->|calls| T21
  S22["method:NSString::byFileFullName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:54"]
  T22["method:FileNameModel::byType<br/>JobsByPods/JobsModel@Pods/Core/DAO/FileNameModel/FileNameModel.m:22"]
  S22 -->|calls| T22
  S23["method:NSString::byFileFullName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:54"]
  T23["method:FileNameModel::byName<br/>JobsByPods/JobsModel@Pods/Core/DAO/FileNameModel/FileNameModel.m:12"]
  S23 -->|calls| T23
  S24["method:NSString::getOnlyFileNameByFilePath<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:22"]
  T24["method:NSString::getFullFileNameByFilePath<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:13"]
  S24 -->|calls| T24
  S25["method:NSString::getSuffixFileName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:31"]
  T25["method:NSString::getFullFileNameByFilePath<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:13"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

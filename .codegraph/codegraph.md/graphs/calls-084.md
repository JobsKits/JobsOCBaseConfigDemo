# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::capitalizeFirstLetter<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:13"]
  T1["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S1 -->|calls| T1
  S2["method:NSString::capitalizeFirstLetter<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:13"]
  T2["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:49"]
  S2 -->|calls| T2
  S3["method:NSString::capitalizeFirstLetter<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:13"]
  T3["method:NSString::substringFromIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:41"]
  S3 -->|calls| T3
  S4["method:NSString::substringBeforeColon<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:25"]
  T4["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:65"]
  S4 -->|calls| T4
  S5["method:NSString::substringBeforeColon<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:25"]
  T5["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:49"]
  S5 -->|calls| T5
  S6["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T6["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:18"]
  S6 -->|calls| T6
  S7["method:NSString::addByAttributedString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:47"]
  T7["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S7 -->|calls| T7
  S8["method:NSString::addByAttributedString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:47"]
  T8["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S8 -->|calls| T8
  S9["method:NSString::getLastChars<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:55"]
  T9["method:NSString::substringFromIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:41"]
  S9 -->|calls| T9
  S10["method:NSString::getLastValuedChars<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:64"]
  T10["method:NSString::getLastChars<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:55"]
  S10 -->|calls| T10
  S11["method:NSString::getLastValuedChars<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:64"]
  T11["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S11 -->|calls| T11
  S12["method:NSString::subStringTo<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:81"]
  T12["method:NSString::range<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:73"]
  S12 -->|calls| T12
  S13["method:NSString::subStringTo<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:81"]
  T13["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:65"]
  S13 -->|calls| T13
  S14["method:NSString::subStringTo<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:81"]
  T14["function:jobsMakeRangeByLocationModelBlock<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsLocationModel/JobsLocationModel.h:123"]
  S14 -->|calls| T14
  S15["method:NSString::subStringTo<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:81"]
  T15["method:JobsAppDoorGraphicCaptchaConfig::byLength<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:11"]
  S15 -->|calls| T15
  S16["method:NSString::subStringTo<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:81"]
  T16["method:JobsLocationModel::byLocation<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsLocationModel/JobsLocationModel+DSL/JobsLocationModel+DSL.m:83"]
  S16 -->|calls| T16
  S17["method:NSString::subStringTo<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:81"]
  T17["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:415"]
  S17 -->|calls| T17
  S18["method:NSString::capitalizeFirstLetterAndPrefixSet<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:94"]
  T18["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:49"]
  S18 -->|calls| T18
  S19["method:NSString::capitalizeFirstLetterAndPrefixSet<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:94"]
  T19["method:NSString::substringFromIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:41"]
  S19 -->|calls| T19
  S20["method:NSString::capitalizeFirstLetterAndPrefixSet<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:94"]
  T20["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S20 -->|calls| T20
  S21["method:NSString::capitalizeFirstLetterAndPrefixSet<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:94"]
  T21["method:NSString::jobsPureString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:312"]
  S21 -->|calls| T21
  S22["method:NSString::replace<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S22 -->|calls| T22
  S23["method:NSString::Url_Chinese<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:115"]
  T23["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  S23 -->|calls| T23
  S24["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:132"]
  T24["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:18"]
  S24 -->|calls| T24
  S25["method:NSString::dealWithString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:147"]
  T25["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 079`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseTextView::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:21"]
  T1["method:BaseTextView::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:21"]
  S1 -->|calls| T1
  S2["method:BaseTextView::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:21"]
  T2["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:117"]
  S2 -->|calls| T2
  S3["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:53"]
  T3["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:53"]
  S3 -->|calls| T3
  S4["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:66"]
  T4["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:66"]
  S4 -->|calls| T4
  S5["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:66"]
  T5["method:BaseTextView::adjustContentOffset<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:113"]
  S5 -->|calls| T5
  S6["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:76"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:76"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:117"]
  T8["method:UITextView::switchs<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  S8 -->|calls| T8
  S9["method:NSData::initWithData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T9["method:NSData::initWithData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T10["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S10 -->|calls| T10
  S11["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T11["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S11 -->|calls| T11
  S12["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T13["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S13 -->|calls| T13
  S14["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T14["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T15["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T16["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T17["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S17 -->|calls| T17
  S18["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T18["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S18 -->|calls| T18
  S19["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T19["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T20["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T21["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T22["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

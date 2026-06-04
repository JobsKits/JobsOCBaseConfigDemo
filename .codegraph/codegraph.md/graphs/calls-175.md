# `calls 符号关系 - 175`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MJRefreshAutoStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:37"]
  T1["function:MJRefreshExtraFeedbackIfNeeded<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:25"]
  S1 -->|calls| T1
  S2["method:MJRefreshBackStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:37"]
  T2["function:MJRefreshExtraApplyStateTitles<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:10"]
  S2 -->|calls| T2
  S3["method:MJRefreshBackStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:37"]
  T3["function:MJRefreshExtraApplyStateLabelStyle<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:19"]
  S3 -->|calls| T3
  S4["method:MJRefreshBackStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:37"]
  T4["function:MJRefreshExtraFeedbackIfNeeded<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:25"]
  S4 -->|calls| T4
  S5["method:MJRefreshStateHeader::byMJRefreshHeaderConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:36"]
  T5["function:MJRefreshExtraApplyStateTitles<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:10"]
  S5 -->|calls| T5
  S6["method:MJRefreshStateHeader::byMJRefreshHeaderConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:36"]
  T6["function:MJRefreshExtraApplyStateLabelStyle<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:19"]
  S6 -->|calls| T6
  S7["method:MJRefreshStateHeader::byMJRefreshHeaderConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:36"]
  T7["function:MJRefreshExtraFeedbackIfNeeded<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:25"]
  S7 -->|calls| T7
  S8["method:BaseTextView::init<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:26"]
  T8["method:BaseTextView::init<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:26"]
  S8 -->|calls| T8
  S9["method:BaseTextView::init<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:26"]
  T9["method:BaseTextView::setupDefaults<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:122"]
  S9 -->|calls| T9
  S10["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:58"]
  T10["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:58"]
  S10 -->|calls| T10
  S11["method:BaseTextView::layoutSubviews<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:71"]
  T11["method:BaseTextView::layoutSubviews<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:71"]
  S11 -->|calls| T11
  S12["method:BaseTextView::layoutSubviews<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:71"]
  T12["method:BaseTextView::adjustContentOffset<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:118"]
  S12 -->|calls| T12
  S13["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:81"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:81"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:BaseTextView::setupDefaults<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:122"]
  T15["method:UITextView::switchs<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  S15 -->|calls| T15
  S16["method:NSData::initWithData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T16["method:NSData::initWithData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:NSMutableDictionary::add<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T17["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S17 -->|calls| T17
  S18["method:NSMutableDictionary::add<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T18["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S18 -->|calls| T18
  S19["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T19["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S19 -->|calls| T19
  S20["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T20["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T21["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T22["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

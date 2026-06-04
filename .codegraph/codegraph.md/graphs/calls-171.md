# `calls 符号关系 - 171`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::selectedStateAttributedTitleBy<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:490"]
  T1["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S1 -->|calls| T1
  S2["method:UIButton::focusedStateAttributedTitleBy<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:499"]
  T2["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S2 -->|calls| T2
  S3["method:UIButton::applicationStateAttributedTitleBy<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:508"]
  T3["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S3 -->|calls| T3
  S4["method:UIButton::reservedStateAttributedTitleBy<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:517"]
  T4["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S4 -->|calls| T4
  S5["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T5["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S5 -->|calls| T5
  S6["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T6["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S6 -->|calls| T6
  S7["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T7["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S7 -->|calls| T7
  S8["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T8["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S8 -->|calls| T8
  S9["function:_jobs_bind<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:21"]
  T9["function:jobs_targetsMap<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:13"]
  S9 -->|calls| T9
  S10["method:UIControl::jobs_onChange:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:42"]
  T10["function:_jobs_bind<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:21"]
  S10 -->|calls| T10
  S11["method:UIView::addGesture<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:51"]
  T11["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S11 -->|calls| T11
  S12["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  T12["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  S12 -->|calls| T12
  S13["method:UIView::panGR<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:25"]
  T13["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S13 -->|calls| T13
  S14["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  T14["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S14 -->|calls| T14
  S15["method:NSObject::currentTimeStringByStyle1<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:28"]
  T15["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S15 -->|calls| T15
  S16["method:NSObject::currentTimeStringByStyle2<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:32"]
  T16["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S16 -->|calls| T16
  S17["method:NSObject::currentTimeStringByStyle3<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:36"]
  T17["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S17 -->|calls| T17
  S18["method:NSObject::currentTimeStringByStyle4<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:40"]
  T18["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S18 -->|calls| T18
  S19["method:NSObject::currentTimeStringByStyle5<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:44"]
  T19["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S19 -->|calls| T19
  S20["method:NSObject::currentTimeStringByStyle6<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:48"]
  T20["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S20 -->|calls| T20
  S21["method:NSObject::currentTimestampString<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:82"]
  T21["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S21 -->|calls| T21
  S22["method:NSObject::timeAgo:dateFormat:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:90"]
  T22["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S22 -->|calls| T22
  S23["method:NSObject::daysAgoBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:97"]
  T23["method:NSObject::timeAgo:dateFormat:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:90"]
  S23 -->|calls| T23
  S24["method:NSObject::readableTimeByStyle1<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:116"]
  T24["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S24 -->|calls| T24
  S25["method:NSObject::readableTimeByStyle1<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:116"]
  T25["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

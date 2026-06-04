# `calls 符号关系 - 097`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T1["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S1 -->|calls| T1
  S2["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T2["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S2 -->|calls| T2
  S3["method:JobsLinkageMenuView::setTextColor:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:149"]
  T3["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S3 -->|calls| T3
  S4["method:JobsLinkageMenuView::setTextColor:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:149"]
  T4["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S4 -->|calls| T4
  S5["method:JobsLinkageMenuView::setTextSize:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:157"]
  T5["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S5 -->|calls| T5
  S6["method:JobsLinkageMenuView::lineView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:165"]
  T6["method:UIView::addSubview<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S6 -->|calls| T6
  S7["method:JobsLinkageMenuView::rightview<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:177"]
  T7["method:UIView::addSubview<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S7 -->|calls| T7
  S8["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:218"]
  T8["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S8 -->|calls| T8
  S9["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:218"]
  T9["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S9 -->|calls| T9
  S10["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:218"]
  T10["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S10 -->|calls| T10
  S11["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:218"]
  T11["method:UIView::addSubview<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  T12["method:JobsPodspecKitForJobsLinkageMenuView::standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:266"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:273"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  S14 -->|calls| T14
  S15["method:NSArray::containsObject<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T15["method:NSArray::containsObject<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S15 -->|calls| T15
  S16["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T16["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T17["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T18["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S18 -->|calls| T18
  S19["method:NSArray::jobsVisible<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T20["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSMutableDictionary::add<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S21 -->|calls| T21
  S22["method:NSMutableDictionary::add<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T22["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S22 -->|calls| T22
  S23["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T23["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S23 -->|calls| T23
  S24["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T24["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

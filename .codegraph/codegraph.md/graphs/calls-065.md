# `calls 符号关系 - 065`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::shakeAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:136"]
  T1["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S1 -->|calls| T1
  S2["method:UIScrollView::shakeAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:136"]
  T2["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S2 -->|calls| T2
  S3["method:UIScrollView::layDownAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:277"]
  T3["method:NSValue::byRect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:36"]
  S3 -->|calls| T3
  S4["method:UIScrollView::roteAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:317"]
  T4["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S4 -->|calls| T4
  S5["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:16"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:16"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:16"]
  T7["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S7 -->|calls| T7
  S8["method:UIScrollView::scrollViewCells<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:32"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIScrollView::scrollViewCells<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:32"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:45"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:45"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  T12["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  S12 -->|calls| T12
  S13["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  T13["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  S13 -->|calls| T13
  S14["method:UITableView::didSelectRowAtIndexPath:tableViewCellClass:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:205"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UITableView::tableViewCellClass:tableViewCellStyleValue1Salt:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:259"]
  T15["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S15 -->|calls| T15
  S16["method:UITableView::tableViewCellClass:tableViewCellStyleDefaultSalt:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:266"]
  T16["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S16 -->|calls| T16
  S17["method:UITableView::tableViewCellClass:tableViewCellStyleValue2Salt:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:273"]
  T17["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S17 -->|calls| T17
  S18["method:UITableView::tableViewCellClass:tableViewCellStyleSubtitleSalt:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:280"]
  T18["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  S18 -->|calls| T18
  S19["method:UIView::BySize<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:100"]
  T19["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S19 -->|calls| T19
  S20["method:UIView::ByFrame<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:111"]
  T20["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S20 -->|calls| T20
  S21["method:UIView::ByOrigin<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:122"]
  T21["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S21 -->|calls| T21
  S22["method:UIView::ByWidth<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T22["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S22 -->|calls| T22
  S23["method:UIView::ByHeight<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T23["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S23 -->|calls| T23
  S24["method:UIView::ByCenter<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T24["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S24 -->|calls| T24
  S25["method:UIView::resetContentSize<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:498"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 078`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::layDownAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:277"]
  T1["method:NSValue::byRect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:36"]
  S1 -->|calls| T1
  S2["method:UIScrollView::roteAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:317"]
  T2["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S2 -->|calls| T2
  S3["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T4["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S4 -->|calls| T4
  S5["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T6["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S6 -->|calls| T6
  S7["method:UIScrollView::scrollViewCells<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:40"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIScrollView::scrollViewCells<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:40"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:53"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:53"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  T11["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  S11 -->|calls| T11
  S12["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  T12["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  S12 -->|calls| T12
  S13["method:UITableView::didSelectRowAtIndexPath:tableViewCellClass:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:205"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  T14["method:UITableViewCell::settingForTableViewCell<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:77"]
  S14 -->|calls| T14
  S15["method:UITableView::tableViewCellClass:tableViewCellStyleValue1Salt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:244"]
  T15["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S15 -->|calls| T15
  S16["method:UITableView::tableViewCellClass:tableViewCellStyleDefaultSalt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:251"]
  T16["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S16 -->|calls| T16
  S17["method:UITableView::tableViewCellClass:tableViewCellStyleValue2Salt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:258"]
  T17["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S17 -->|calls| T17
  S18["method:UITableView::tableViewCellClass:tableViewCellStyleSubtitleSalt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:265"]
  T18["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S18 -->|calls| T18
  S19["method:UITableView::registerTableViewClass<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:12"]
  T19["method:GXCardView::registerClass:forCellReuseIdentifier:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:453"]
  S19 -->|calls| T19
  S20["method:UITableView::byRegisterTableViewClass<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:17"]
  T20["method:GXCardView::registerClass:forCellReuseIdentifier:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:453"]
  S20 -->|calls| T20
  S21["method:UITableView::registerTableViewCellClass<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:51"]
  T21["method:GXCardView::registerClass:forCellReuseIdentifier:<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:453"]
  S21 -->|calls| T21
  S22["method:UITableView::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:12"]
  T22["method:NSObject::ww_swizzInstanceMethod:withMethod:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:93"]
  S22 -->|calls| T22
  S23["method:UITableView::ww_foldSection:fold:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:67"]
  T23["method:ASTableNode::reloadSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:804"]
  S23 -->|calls| T23
  S24["method:UITableView::ww_foldSection:fold:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:67"]
  T24["method:GXCardView::reloadData<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:259"]
  S24 -->|calls| T24
  S25["method:UITableViewCell::modifySysChildViewFrame1<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:59"]
  T25["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

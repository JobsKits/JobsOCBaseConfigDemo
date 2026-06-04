# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::roteAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:317"]
  T1["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S1 -->|calls| T1
  S2["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T4["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S4 -->|calls| T4
  S5["method:UIScrollView::scrollViewCells<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:40"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIScrollView::scrollViewCells<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:40"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:53"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:53"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  T9["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  S9 -->|calls| T9
  S10["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  T10["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  S10 -->|calls| T10
  S11["method:UITableView::didSelectRowAtIndexPath:tableViewCellClass:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:205"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UITableView::tableViewCellClass:tableViewCellStyleValue1Salt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:244"]
  T12["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S12 -->|calls| T12
  S13["method:UITableView::tableViewCellClass:tableViewCellStyleDefaultSalt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:251"]
  T13["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S13 -->|calls| T13
  S14["method:UITableView::tableViewCellClass:tableViewCellStyleValue2Salt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:258"]
  T14["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S14 -->|calls| T14
  S15["method:UITableView::tableViewCellClass:tableViewCellStyleSubtitleSalt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:265"]
  T15["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S15 -->|calls| T15
  S16["method:UITableView::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:12"]
  T16["method:NSObject::ww_swizzInstanceMethod:withMethod:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:93"]
  S16 -->|calls| T16
  S17["method:UITableView::ww_foldSection:fold:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:67"]
  T17["method:ASTableNode::reloadSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:804"]
  S17 -->|calls| T17
  S18["method:UITableViewCell::customCellEditStateImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:191"]
  T18["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S18 -->|calls| T18
  S19["method:UITableViewCell::customCellEditStateImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:191"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UITableViewCell::customAccessoryView:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+WhiteArrows/UITableViewCell+WhiteArrows.m:12"]
  T20["method:UIButton::initByBackgroundImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  S20 -->|calls| T20
  S21["method:UITableViewHeaderFooterView::initByReuseIdentifier<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:12"]
  T21["method:UITableView::tableViewHeaderFooterView<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:86"]
  S21 -->|calls| T21
  S22["method:UITableViewHeaderFooterView::jobsRichViewByModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:48"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UITextField::isValidate:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:13"]
  T23["method:UITextField::shakeAnimationForView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:25"]
  S23 -->|calls| T23
  S24["method:UITextField::isEmptyText<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:19"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S24 -->|calls| T24
  S25["method:UITextField::isEmptyText<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:19"]
  T25["method:UITextField::shakeAnimationForView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

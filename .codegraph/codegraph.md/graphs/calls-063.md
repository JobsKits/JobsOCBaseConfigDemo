# `calls 符号关系 - 063`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::scrollViewCells<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:40"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:53"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:53"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  T4["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  S4 -->|calls| T4
  S5["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  T5["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  S5 -->|calls| T5
  S6["method:UITableView::didSelectRowAtIndexPath:tableViewCellClass:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:205"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UITableView::tableViewCellClass:tableViewCellStyleValue1Salt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:244"]
  T7["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S7 -->|calls| T7
  S8["method:UITableView::tableViewCellClass:tableViewCellStyleDefaultSalt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:251"]
  T8["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S8 -->|calls| T8
  S9["method:UITableView::tableViewCellClass:tableViewCellStyleValue2Salt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:258"]
  T9["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S9 -->|calls| T9
  S10["method:UITableView::tableViewCellClass:tableViewCellStyleSubtitleSalt:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:265"]
  T10["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:232"]
  S10 -->|calls| T10
  S11["method:UITableView::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:12"]
  T11["method:NSObject::ww_swizzInstanceMethod:withMethod:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:93"]
  S11 -->|calls| T11
  S12["method:UITableView::ww_foldSection:fold:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableView/UITableView+WWFoldableTableView/UITableView+WWFoldableTableView.m:67"]
  T12["method:ASTableNode::reloadSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:804"]
  S12 -->|calls| T12
  S13["method:UITableViewCell::customCellEditStateImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:191"]
  T13["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S13 -->|calls| T13
  S14["method:UITableViewCell::customCellEditStateImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:191"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UITableViewCell::customAccessoryView:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+WhiteArrows/UITableViewCell+WhiteArrows.m:12"]
  T15["method:UIButton::initByBackgroundImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  S15 -->|calls| T15
  S16["method:UITableViewHeaderFooterView::initByReuseIdentifier<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:12"]
  T16["method:UITableView::tableViewHeaderFooterView<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:86"]
  S16 -->|calls| T16
  S17["method:UITableViewHeaderFooterView::jobsRichViewByModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:48"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:UITextField::isValidate:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:13"]
  T18["method:UITextField::shakeAnimationForView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:25"]
  S18 -->|calls| T18
  S19["method:UITextField::isEmptyText<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:19"]
  T19["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S19 -->|calls| T19
  S20["method:UITextField::isEmptyText<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:19"]
  T20["method:UITextField::shakeAnimationForView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:25"]
  S20 -->|calls| T20
  S21["method:UITextField::getCurrentTextFieldValueByReplacementString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:22"]
  T21["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S21 -->|calls| T21
  S22["method:UITextField::customSysClearBtn<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:44"]
  T22["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S22 -->|calls| T22
  S23["method:UITextField::placeholderLabel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Placeholder/UITextField+Placeholder.m:18"]
  T23["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S23 -->|calls| T23
  S24["method:UITextField::titleAttributedDataMutArr<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Placeholder/UITextField+Placeholder.m:57"]
  T24["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S24 -->|calls| T24
  S25["method:UITextView::switchs<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T25["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

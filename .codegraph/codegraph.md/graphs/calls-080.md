# `calls 符号关系 - 080`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITableViewCell::cellStyleValue2WithTableView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:53"]
  T1["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S1 -->|calls| T1
  S2["method:UITableViewCell::cellStyleValue2WithTableView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:53"]
  T2["method:UITableViewCell::initTableViewCell:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:22"]
  S2 -->|calls| T2
  S3["method:UITableViewCell::cellStyleValue2WithTableView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:53"]
  T3["method:UITableViewCell::settingForTableViewCell<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:77"]
  S3 -->|calls| T3
  S4["method:UITableViewCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:65"]
  T4["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S4 -->|calls| T4
  S5["method:UITableViewCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:65"]
  T5["method:UITableViewCell::initTableViewCell:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:22"]
  S5 -->|calls| T5
  S6["method:UITableViewCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:65"]
  T6["method:UITableViewCell::settingForTableViewCell<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:77"]
  S6 -->|calls| T6
  S7["method:UITableViewCell::jobsRichElementsTableViewCellBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:106"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UITableViewCell::cellHeightByModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:128"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:UITableViewCell::roundedCornerFirstAndLastCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:431"]
  T9["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S9 -->|calls| T9
  S10["method:UITableViewCell::roundedCornerFirstAndLastCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:431"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:UITableViewCell::roundedCornerFirstAndLastCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:431"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:UITableViewCell::roundedCornerFirstAndLastCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:431"]
  T12["method:UITableView::rowsInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:197"]
  S12 -->|calls| T12
  S13["method:UITableViewCell::roundedCornerLastCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:489"]
  T13["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S13 -->|calls| T13
  S14["method:UITableViewCell::roundedCornerLastCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:489"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:UITableViewCell::roundedCornerLastCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:489"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:UITableViewCell::roundedCornerFirstCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:567"]
  T16["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S16 -->|calls| T16
  S17["method:UITableViewCell::roundedCornerFirstCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:567"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:UITableViewCell::roundedCornerFirstCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:567"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:UITableViewCell::leftAndRightLineCellByTableView:indexPath:layerConfig:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:645"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:UITableViewCell::customAccessoryView:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+WhiteArrows/UITableViewCell+WhiteArrows.m:12"]
  T20["method:UIButton::initByBackgroundImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  S20 -->|calls| T20
  S21["method:UITableViewCell::customAccessoryView:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+WhiteArrows/UITableViewCell+WhiteArrows.m:12"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:UITableViewCell::arrows_size<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+WhiteArrows/UITableViewCell+WhiteArrows.m:45"]
  T22["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S22 -->|calls| T22
  S23["method:UITableViewCell::arrows_size<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+WhiteArrows/UITableViewCell+WhiteArrows.m:45"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:UITableViewCell::arrows_size<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+WhiteArrows/UITableViewCell+WhiteArrows.m:45"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:UITableViewHeaderFooterView::initByReuseIdentifier<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:12"]
  T25["method:UITableView::tableViewHeaderFooterView<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:86"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

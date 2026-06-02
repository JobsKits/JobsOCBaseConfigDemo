# `calls 符号关系 - 040`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBaseTableViewCell::cellStyleValue2WithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:58"]
  T1["method:UITableViewCell::initTableViewCell:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:22"]
  S1 -->|calls| T1
  S2["method:JobsBaseTableViewCell::cellStyleValue2WithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:58"]
  T2["method:UITableViewCell::settingForTableViewCell<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:77"]
  S2 -->|calls| T2
  S3["method:JobsBaseTableViewCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:70"]
  T3["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S3 -->|calls| T3
  S4["method:JobsBaseTableViewCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:70"]
  T4["method:UITableViewCell::initTableViewCell:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:22"]
  S4 -->|calls| T4
  S5["method:JobsBaseTableViewCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:70"]
  T5["method:UITableViewCell::settingForTableViewCell<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:77"]
  S5 -->|calls| T5
  S6["method:JobsBaseTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:82"]
  T6["method:JobsBaseTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:82"]
  S6 -->|calls| T6
  S7["method:JobsBaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:118"]
  T7["method:JobsBaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:118"]
  S7 -->|calls| T7
  S8["method:JobsBaseTableViewCell::setEditing:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:131"]
  T8["method:JobsBaseTableViewCell::setEditing:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:131"]
  S8 -->|calls| T8
  S9["method:JobsBaseTableViewCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:136"]
  T9["method:JobsBaseTableViewCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:136"]
  S9 -->|calls| T9
  S10["method:JobsBaseTableViewCell::heightForFooterInSectionByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:163"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:JobsBaseTableViewCell::jobsRichElementsTableViewCellBy<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:179"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:JobsBaseTableViewCell::jobsRichElementsTableViewCellBy<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:179"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:JobsBaseTableViewCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:244"]
  T13["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S13 -->|calls| T13
  S14["method:JobsBaseTableViewCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:244"]
  T14["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S14 -->|calls| T14
  S15["method:JobsBaseTableViewCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:244"]
  T15["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S15 -->|calls| T15
  S16["method:JobsBaseTableViewCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:244"]
  T16["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S16 -->|calls| T16
  S17["method:JobsBaseTableViewCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:244"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:JobsBtnsStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:32"]
  T18["method:JobsBtnsStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:32"]
  S18 -->|calls| T18
  S19["method:JobsBtnsStyleTBVCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:58"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T20["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S20 -->|calls| T20
  S21["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T22["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S22 -->|calls| T22
  S23["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T23["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S23 -->|calls| T23
  S24["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T24["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S24 -->|calls| T24
  S25["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T25["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

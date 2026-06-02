# `calls 符号关系 - 058`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITableViewCell::modifySysChildViewFrame1<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:59"]
  T1["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S1 -->|calls| T1
  S2["method:UITableViewCell::modifySysChildViewFrame1<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:59"]
  T2["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S2 -->|calls| T2
  S3["method:UITableViewCell::modifySysChildViewFrame1<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:59"]
  T3["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S3 -->|calls| T3
  S4["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S5 -->|calls| T5
  S6["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S13 -->|calls| T13
  S14["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:UITableViewCell::modifySysChildViewFrame2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:169"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:UITableViewCell::customCellEditStateImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:191"]
  T16["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S16 -->|calls| T16
  S17["method:UITableViewCell::customCellEditStateImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewCell/UITableViewCell+Margin/UITableViewCell+Margin.m:191"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:UITableViewHeaderFooterView::initByReuseIdentifier<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:12"]
  T18["method:UITableView::tableViewHeaderFooterView<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:86"]
  S18 -->|calls| T18
  S19["method:UITableViewHeaderFooterView::jobsRichViewByModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:48"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UITableViewHeaderFooterView::viewHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:59"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:UITableViewHeaderFooterView::viewFrameByModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableViewHeaderFooterView/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol/UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m:65"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:UITextField::getCurrentTextFieldValueByReplacementString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:31"]
  T22["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S22 -->|calls| T22
  S23["method:UITextField::customSysClearBtn<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:53"]
  T23["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S23 -->|calls| T23
  S24["method:UITextField::placeholderLabel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Placeholder/UITextField+Placeholder.m:18"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S24 -->|calls| T24
  S25["method:UITextField::titleAttributedDataMutArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Placeholder/UITextField+Placeholder.m:57"]
  T25["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

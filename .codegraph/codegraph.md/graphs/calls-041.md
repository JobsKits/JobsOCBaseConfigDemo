# `calls 符号关系 - 041`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T1["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S1 -->|calls| T1
  S2["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T3["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T4["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S4 -->|calls| T4
  S5["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T5["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S5 -->|calls| T5
  S6["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T7["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S7 -->|calls| T7
  S8["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T8["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S8 -->|calls| T8
  S9["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T9["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:372"]
  S9 -->|calls| T9
  S10["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T10["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S10 -->|calls| T10
  S11["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T12["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T13["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S13 -->|calls| T13
  S14["method:JobsImageStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsImageStyleTBVCell/JobsImageStyleTBVCell.m:27"]
  T14["method:JobsImageStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsImageStyleTBVCell/JobsImageStyleTBVCell.m:27"]
  S14 -->|calls| T14
  S15["method:JobsImageStyleTBVCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsImageStyleTBVCell/JobsImageStyleTBVCell.m:49"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsTextLabStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextLabStyleTBVCell/JobsTextLabStyleTBVCell.m:24"]
  T16["method:JobsTextLabStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextLabStyleTBVCell/JobsTextLabStyleTBVCell.m:24"]
  S16 -->|calls| T16
  S17["method:JobsTextLabStyleTBVCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextLabStyleTBVCell/JobsTextLabStyleTBVCell.m:46"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:JobsTextViewStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextViewStyleTBVCell/JobsTextViewStyleTBVCell.m:29"]
  T18["method:JobsTextViewStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextViewStyleTBVCell/JobsTextViewStyleTBVCell.m:29"]
  S18 -->|calls| T18
  S19["method:JobsTextViewStyleTBVCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextViewStyleTBVCell/JobsTextViewStyleTBVCell.m:51"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsTextViewStyleTBVCell::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextViewStyleTBVCell/JobsTextViewStyleTBVCell.m:118"]
  T20["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S20 -->|calls| T20
  S21["method:JobsTextViewStyleTBVCell::jobsTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextViewStyleTBVCell/JobsTextViewStyleTBVCell.m:143"]
  T21["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S21 -->|calls| T21
  S22["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  T22["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  S22 -->|calls| T22
  S23["method:CJTextField::keyboardInputShouldDelete:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:21"]
  T23["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  S23 -->|calls| T23
  S24["method:HQTextField::textRectForBounds:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/HQTextField（警示框动画）/HQTextField.m:41"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:HQTextField::textRectForBounds:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/HQTextField（警示框动画）/HQTextField.m:41"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

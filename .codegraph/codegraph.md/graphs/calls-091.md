# `calls 符号关系 - 091`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:207"]
  T1["'method:JobsAppDoorContentView::一些UI的初始状态'<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:772"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:207"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:207"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:207"]
  T4["method:JobsAppDoorInputViewBaseStyleModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:1223"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:207"]
  T5["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:235"]
  T6["method:UICollectionViewCell::bySelected<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+BaseViewProtocol/UICollectionViewCell+BaseViewProtocol.m:21"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:235"]
  T7["method:JobsAppDoorContentView::animationChangeRegisterBtnFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:916"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::checkTelePhoneNum<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:248"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::checkTelePhoneNum<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:248"]
  T9["method:NSString::isPureInt<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:129"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::allRise<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:261"]
  T10["method:JobsAppDoorContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:291"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::allRise<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:261"]
  T11["method:JobsAppDoorContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:291"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  T12["method:JobsAppDoorContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:291"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  T13["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  T14["method:UITextField::byFont<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:40"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  T15["function:JobsAppDoorFormFont<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:15"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  T16["method:UITextField::byPlaceholderFont<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:101"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  T17["function:JobsAppDoorFormFont<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:15"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  T18["method:UITextField::byPlaceholderColor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:86"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  T19["function:JobsAppDoorPlaceholderColor<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:23"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  T20["method:JobsMagicTextField::byPlaceholdAnimationable<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:21"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::jobs_textByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:329"]
  T21["method:JobsAppDoorContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:291"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:345"]
  T22["method:JobsAppDoorContentView::jobs_textIsNotEmpty<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:281"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:345"]
  T23["method:JobsAppDoorContentView::jobs_textByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:329"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:345"]
  T24["method:JobsAppDoorContentView::jobs_textByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:329"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:345"]
  T25["method:JobsAppDoorContentView::jobs_textByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:329"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

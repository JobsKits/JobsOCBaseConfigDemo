# `calls 符号关系 - 010`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S1 -->|calls| T1
  S2["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T2["function:JobsMainScreen_WIDTH<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:304"]
  S2 -->|calls| T2
  S3["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T4["function:jobsMakeTextView::jobsMakeView<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:420"]
  S4 -->|calls| T4
  S5["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T5["method:UICollectionViewLayoutAttributes::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:470"]
  S5 -->|calls| T5
  S6["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T6["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S6 -->|calls| T6
  S7["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T7["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  S7 -->|calls| T7
  S8["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T8["function:UIFontWeightSemiboldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:43"]
  S8 -->|calls| T8
  S9["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T9["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S9 -->|calls| T9
  S10["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T10["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S10 -->|calls| T10
  S11["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T11["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S11 -->|calls| T11
  S12["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T12["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S12 -->|calls| T12
  S13["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T13["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S13 -->|calls| T13
  S14["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T14["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  S14 -->|calls| T14
  S15["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T15["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S15 -->|calls| T15
  S16["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T16["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S16 -->|calls| T16
  S17["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T17["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S17 -->|calls| T17
  S18["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T18["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S18 -->|calls| T18
  S19["method:UIViewController::gk_navTitleViewBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:48"]
  T19["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S19 -->|calls| T19
  S20["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:115"]
  T20["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S20 -->|calls| T20
  S21["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:115"]
  T21["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S21 -->|calls| T21
  S22["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:115"]
  T22["method:UIView::addSubview<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:11"]
  S22 -->|calls| T22
  S23["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:115"]
  T23["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S23 -->|calls| T23
  S24["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:115"]
  T24["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S24 -->|calls| T24
  S25["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:115"]
  T25["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

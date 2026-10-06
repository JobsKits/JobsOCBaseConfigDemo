# `calls 符号关系 - 151`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseContentView::showContentViewWithOffsetY<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':80"]
  T1["method:MasonryModel::byCenterY<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:116"]
  S1 -->|calls| T1
  S2["method:BaseContentView::showContentViewWithOffsetY<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':80"]
  T2["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S2 -->|calls| T2
  S3["method:BaseContentView::showContentViewWithOffsetY<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':80"]
  T3["function:JobsMainScreen_WIDTH<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:304"]
  S3 -->|calls| T3
  S4["method:BaseContentView::removeContentViewWithOffsetY<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':102"]
  T4["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':60"]
  S4 -->|calls| T4
  S5["method:BaseContentView::removeContentViewWithOffsetY<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':102"]
  T5["method:JobsTabBar::byY<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/BaseTabBar/JobsTabBar/JobsTabBar.m:339"]
  S5 -->|calls| T5
  S6["method:BaseContentView::removeContentViewWithOffsetY<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':102"]
  T6["method:JobsScrollYView::byX<br/>'JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m':179"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorForgotCodeContentView::init<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':32"]
  T7["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorForgotCodeContentView::drawRect:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':38"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':58"]
  T9["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':58"]
  T10["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':58"]
  T11["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':58"]
  T12["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':58"]
  T13["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':58"]
  T14["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':58"]
  T15["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':58"]
  T16["method:JobsAppDoorForgotCodeContentView::jobs_updateConfirmBtnState<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':73"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorForgotCodeContentView::jobs_updateConfirmBtnState<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':73"]
  T17["method:JobsAppDoorForgotCodeContentView::jobs_canConfirmPassword<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':86"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorForgotCodeContentView::jobs_updateConfirmBtnState<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':73"]
  T18["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorForgotCodeContentView::jobs_updateConfirmBtnState<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':73"]
  T19["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorForgotCodeContentView::jobs_updateConfirmBtnState<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':73"]
  T20["method:UIGestureRecognizer::byEnabled<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:30"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':97"]
  T21["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':97"]
  T22["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':97"]
  T23["function:jobsMakeAppDoorInputViewBaseStyleModel<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.h:88"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':97"]
  T24["method:NSValue::byOffset<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:59"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m':97"]
  T25["method:FMBannerAdsModel::byPlaceHolderOffset<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2009"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

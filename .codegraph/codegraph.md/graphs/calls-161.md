# `calls 符号关系 - 161`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITabBar::tl_setSelectedItem:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:37"]
  T1["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  S1 -->|calls| T1
  S2["method:UITabBar::tl_setSelectedItem:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:37"]
  T2["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  S2 -->|calls| T2
  S3["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  T3["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S3 -->|calls| T3
  S4["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  T6["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S6 -->|calls| T6
  S7["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:JobsTabBarItem::initWithConfig:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBarItem/BaseTabBarItem/JobsTabBarItem.m:30"]
  T9["method:TransitionController::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：手势横向滚动子VC联动Tabbar切换/TransitionController/TransitionController.m:33"]
  S9 -->|calls| T9
  S10["method:JobsTabBarItem::initWithConfig:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBarItem/BaseTabBarItem/JobsTabBarItem.m:30"]
  T10["method:UITabBarItem::titleTextAttributesByNormalState<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITabBarItem/UITabBarItem+Extra/UITabBarItem+Extra.m:11"]
  S10 -->|calls| T10
  S11["method:JobsTabBarItem::initWithConfig:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBarItem/BaseTabBarItem/JobsTabBarItem.m:30"]
  T11["method:UITabBarItem::titleTextAttributesBySelectedState<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITabBarItem/UITabBarItem+Extra/UITabBarItem+Extra.m:38"]
  S11 -->|calls| T11
  S12["function:playFrameAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:30"]
  T12["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S12 -->|calls| T12
  S13["method:TLBounceAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:124"]
  T13["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S13 -->|calls| T13
  S14["method:TLBounceAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:124"]
  T14["function:playFireworksAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:42"]
  S14 -->|calls| T14
  S15["method:TLFumeAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:152"]
  T15["function:TLFumeAnimation::playMoveIconAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:168"]
  S15 -->|calls| T15
  S16["method:TLFumeAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:152"]
  T16["function:TLFumeAnimation::playSelectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:179"]
  S16 -->|calls| T16
  S17["method:TLFumeAnimation::playDeselectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:160"]
  T17["function:TLFumeAnimation::playMoveIconAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:168"]
  S17 -->|calls| T17
  S18["method:TLFumeAnimation::playDeselectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:160"]
  T18["function:TLFumeAnimation::playDeselectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:199"]
  S18 -->|calls| T18
  S19["function:TLFumeAnimation::playMoveIconAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:168"]
  T19["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S19 -->|calls| T19
  S20["function:TLFumeAnimation::playSelectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:179"]
  T20["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S20 -->|calls| T20
  S21["function:TLFumeAnimation::playSelectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:179"]
  T21["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S21 -->|calls| T21
  S22["function:TLFumeAnimation::playSelectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:179"]
  T22["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S22 -->|calls| T22
  S23["function:TLFumeAnimation::playDeselectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:199"]
  T23["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S23 -->|calls| T23
  S24["function:TLFumeAnimation::playDeselectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:199"]
  T24["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S24 -->|calls| T24
  S25["method:TLFrameAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:237"]
  T25["function:playFrameAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

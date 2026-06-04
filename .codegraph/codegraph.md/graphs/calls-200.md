# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABFormAnimated::updateScrollViewDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:154"]
  T1["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S1 -->|calls| T1
  S2["method:TABFormAnimated::getIndexIsRuning:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:243"]
  T2["method:TABFormAnimated::getIndexWithIndex:dict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:260"]
  S2 -->|calls| T2
  S3["method:TABFormAnimated::getIndexWithIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:248"]
  T3["method:TABFormAnimated::getIndexWithIndex:dict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:260"]
  S3 -->|calls| T3
  S4["method:TABFormAnimated::getHeaderIndexWithIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:252"]
  T4["method:TABFormAnimated::getIndexWithIndex:dict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:260"]
  S4 -->|calls| T4
  S5["method:TABFormAnimated::getFooterIndexWithIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:256"]
  T5["method:TABFormAnimated::getIndexWithIndex:dict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:260"]
  S5 -->|calls| T5
  S6["method:TABFormAnimated::getIndexWithIndex:dict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:260"]
  T6["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S6 -->|calls| T6
  S7["method:TABFormAnimated::reloadAnimationWithKey:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:278"]
  T7["method:TABFormAnimated::_reloadWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:326"]
  S7 -->|calls| T7
  S8["method:TABFormAnimated::reloadAnimationWithKey:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:278"]
  T8["method:TABFormAnimated::_reloadWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:326"]
  S8 -->|calls| T8
  S9["method:TABFormAnimated::reloadAnimationWithKey:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:278"]
  T9["method:TABFormAnimated::_reloadWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:326"]
  S9 -->|calls| T9
  S10["method:TABFormAnimated::endAnimationWithKey:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:300"]
  T10["method:TABFormAnimated::_endWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:339"]
  S10 -->|calls| T10
  S11["method:TABFormAnimated::endAnimationWithKey:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:300"]
  T11["method:TABFormAnimated::_endWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:339"]
  S11 -->|calls| T11
  S12["method:TABFormAnimated::endAnimationWithKey:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:300"]
  T12["method:TABFormAnimated::_endWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:339"]
  S12 -->|calls| T12
  S13["method:TABFormAnimated::_reloadWithIndex:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:322"]
  T13["method:TABFormAnimated::_reloadWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:326"]
  S13 -->|calls| T13
  S14["method:TABFormAnimated::_reloadWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:326"]
  T14["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S14 -->|calls| T14
  S15["method:TABFormAnimated::_endWithIndex:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:335"]
  T15["method:TABFormAnimated::_endWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:339"]
  S15 -->|calls| T15
  S16["method:TABFormAnimated::_endWithKey:resultDict:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:339"]
  T16["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S16 -->|calls| T16
  S17["method:TABFormAnimated::scrollEnabled<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:364"]
  T17["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S17 -->|calls| T17
  S18["method:TABTableAnimated::animatedWithCellClass:cellHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:45"]
  T18["method:TABTableAnimated::_animatedWithCellClass:cellHeight:animatedCount:toIndex:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:138"]
  S18 -->|calls| T18
  S19["method:TABTableAnimated::animatedWithCellClass:cellHeight:animatedCount:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:51"]
  T19["method:TABTableAnimated::_animatedWithCellClass:cellHeight:animatedCount:toIndex:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:138"]
  S19 -->|calls| T19
  S20["method:TABTableAnimated::animatedWithCellClass:cellHeight:toSection:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:58"]
  T20["method:TABTableAnimated::_animatedWithCellClass:cellHeight:animatedCount:toIndex:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:138"]
  S20 -->|calls| T20
  S21["method:TABTableAnimated::animatedWithCellClass:cellHeight:animatedCount:toSection:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:65"]
  T21["method:TABTableAnimated::_animatedWithCellClass:cellHeight:animatedCount:toIndex:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:138"]
  S21 -->|calls| T21
  S22["method:TABTableAnimated::animatedInRowModeWithCellClass:cellHeight:toRow:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:119"]
  T22["method:TABTableAnimated::_animatedWithCellClass:cellHeight:animatedCount:toIndex:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:138"]
  S22 -->|calls| T22
  S23["method:TABTableAnimated::animatedWithCellClass:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:128"]
  T23["method:TABTableAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:184"]
  S23 -->|calls| T23
  S24["method:TABTableAnimated::_animatedWithCellClass:cellHeight:animatedCount:toIndex:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:138"]
  T24["method:TABTableAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:184"]
  S24 -->|calls| T24
  S25["method:TABTableAnimated::_animatedWithCellClassArray:cellHeightArray:animatedCountArray:indexArray:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:153"]
  T25["method:TABTableAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABTableAnimated.m:184"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

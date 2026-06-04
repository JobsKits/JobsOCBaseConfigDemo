# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UICollectionViewCell::cutFirstAndLastCollectionViewCellWithBackgroundCor:cellOutLineCor:bottomLineCor:borderWidth:cornerRadiusSize:dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:68"]
  T1["method:UICollectionViewCell::dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:291"]
  S1 -->|calls| T1
  S2["method:UICollectionViewCell::cutFirstAndLastCollectionViewCellWithBackgroundCor:cellOutLineCor:bottomLineCor:borderWidth:cornerRadiusSize:dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:68"]
  T2["method:UIBezierPath::initByRect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:75"]
  S2 -->|calls| T2
  S3["method:UICollectionViewCell::cutFirstAndLastCollectionViewCellWithBackgroundCor:cellOutLineCor:bottomLineCor:borderWidth:cornerRadiusSize:dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:68"]
  T3["method:UICollectionViewCell::makeBottomLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:136"]
  S3 -->|calls| T3
  S4["method:UICollectionViewCell::cutFirstAndLastCollectionViewCellWithBackgroundCor:cellOutLineCor:bottomLineCor:borderWidth:cornerRadiusSize:dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:68"]
  T4["method:UICollectionViewCell::makeTopLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:166"]
  S4 -->|calls| T4
  S5["method:UICollectionViewCell::makeBottomLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:136"]
  T5["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S5 -->|calls| T5
  S6["method:UICollectionViewCell::makeBottomLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:136"]
  T6["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S6 -->|calls| T6
  S7["method:UICollectionViewCell::makeTopLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:166"]
  T7["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S7 -->|calls| T7
  S8["method:UICollectionViewCell::makeTopLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:166"]
  T8["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S8 -->|calls| T8
  S9["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  T9["function:jobs_targetsMap<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  T10["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S10 -->|calls| T10
  S11["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  T11["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S11 -->|calls| T11
  S12["method:UIControl::jobs_on:throttle:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:66"]
  T12["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S12 -->|calls| T12
  S13["method:UIControl::jobs_on:throttle:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:66"]
  T13["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S13 -->|calls| T13
  S14["method:UIControl::jobs_on:debounce:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:74"]
  T14["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S14 -->|calls| T14
  S15["method:UIControl::jobs_on:debounce:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:74"]
  T15["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S15 -->|calls| T15
  S16["method:UIControl::jobs_once:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:82"]
  T16["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S16 -->|calls| T16
  S17["method:UIControl::jobs_once:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:82"]
  T17["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S17 -->|calls| T17
  S18["method:UIControl::jobs_onTap:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:89"]
  T18["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  S18 -->|calls| T18
  S19["method:UIControl::jobs_onChange:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:93"]
  T19["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  S19 -->|calls| T19
  S20["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T20["function:jobs_targetsMap<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T21["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:384"]
  S21 -->|calls| T21
  S22["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T22["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S22 -->|calls| T22
  S23["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T23["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:384"]
  S23 -->|calls| T23
  S24["method:UIControl::jobs_removeAllHandlers<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:123"]
  T24["function:jobs_targetsMap<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIControl::jobs_removeAllHandlers<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:123"]
  T25["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:384"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

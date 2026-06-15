# `calls 符号关系 - 033`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSArray::widthEqualTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:232"]
  T1["method:TABBaseComponent::widthEqualTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:573"]
  S1 -->|calls| T1
  S2["method:NSArray::heightEqualTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:241"]
  T2["method:TABBaseComponent::heightEqualTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:581"]
  S2 -->|calls| T2
  S3["method:NSArray::leftEqualToRight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:250"]
  T3["method:TABBaseComponent::leftEqualToRight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:589"]
  S3 -->|calls| T3
  S4["method:NSArray::rightEqualToLeft<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:259"]
  T4["method:TABBaseComponent::rightEqualToLeft<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:597"]
  S4 -->|calls| T4
  S5["method:NSArray::topEqualToBottom<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:268"]
  T5["method:TABBaseComponent::topEqualToBottom<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:605"]
  S5 -->|calls| T5
  S6["method:NSArray::bottomEqualToTop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:277"]
  T6["method:TABBaseComponent::bottomEqualToTop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:613"]
  S6 -->|calls| T6
  S7["method:NSArray::leftEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:291"]
  T7["method:TABBaseComponent::leftEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:623"]
  S7 -->|calls| T7
  S8["method:NSArray::rightEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:303"]
  T8["method:TABBaseComponent::rightEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:631"]
  S8 -->|calls| T8
  S9["method:NSArray::topEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:315"]
  T9["method:TABBaseComponent::topEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:639"]
  S9 -->|calls| T9
  S10["method:NSArray::bottomEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:327"]
  T10["method:TABBaseComponent::bottomEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:647"]
  S10 -->|calls| T10
  S11["method:NSArray::widthEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:336"]
  T11["method:TABBaseComponent::widthEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:655"]
  S11 -->|calls| T11
  S12["method:NSArray::heightEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:345"]
  T12["method:TABBaseComponent::heightEqualTo_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:663"]
  S12 -->|calls| T12
  S13["method:NSArray::leftEqualToRight_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:354"]
  T13["method:TABBaseComponent::leftEqualToRight_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:671"]
  S13 -->|calls| T13
  S14["method:NSArray::rightEqualToLeft_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:363"]
  T14["method:TABBaseComponent::rightEqualToLeft_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:679"]
  S14 -->|calls| T14
  S15["method:NSArray::topEqualToBottom_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:372"]
  T15["method:TABBaseComponent::topEqualToBottom_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:687"]
  S15 -->|calls| T15
  S16["method:NSArray::bottomEqualToTop_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:381"]
  T16["method:TABBaseComponent::bottomEqualToTop_offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:695"]
  S16 -->|calls| T16
  S17["method:TABAnimatedChainManagerImpl::chainAdjustWithBackgroundLayer:layers:adjustBlock:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABAnimatedChainManagerImpl.m:14"]
  T17["property:TABViewAnimated::adjustBlock<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.h:44"]
  S17 -->|calls| T17
  S18["method:TABAnimatedChainManagerImpl::chainAdjustWithBackgroundLayer:layers:adjustWithClassBlock:targetClass:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABAnimatedChainManagerImpl.m:24"]
  T18["property:TABViewAnimated::adjustWithClassBlock<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.h:47"]
  S18 -->|calls| T18
  S19["method:TABBaseComponent::componentWithLayer:manager:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:29"]
  T19["method:TABBaseComponent::initWithLayer:manager:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:33"]
  S19 -->|calls| T19
  S20["method:TABBaseComponent::initWithLayer:manager:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:33"]
  T20["method:TABBinAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Bin/TABBinAnimation.m:12"]
  S20 -->|calls| T20
  S21["method:TABBaseComponent::reducedWidth_vertical<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:227"]
  T21["method:TABBaseComponent::reducedWidth_vertical<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:227"]
  S21 -->|calls| T21
  S22["method:TABBaseComponent::remove<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:403"]
  T22["method:TABBaseComponent::result_remove<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:415"]
  S22 -->|calls| T22
  S23["method:TABBaseComponent::preview_remove<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:411"]
  T23["method:TABBaseComponent::result_remove<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:415"]
  S23 -->|calls| T23
  S24["method:TABBaseComponent::cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:440"]
  T24["method:TABBaseComponent::result_cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:452"]
  S24 -->|calls| T24
  S25["method:TABBaseComponent::preview_cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:448"]
  T25["method:TABBaseComponent::result_cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:452"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

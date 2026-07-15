# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  T1["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S1 -->|calls| T1
  S2["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  T3["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S3 -->|calls| T3
  S4["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T4["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S4 -->|calls| T4
  S5["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T5["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S5 -->|calls| T5
  S6["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T6["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S6 -->|calls| T6
  S7["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T7["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S7 -->|calls| T7
  S8["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T8["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S8 -->|calls| T8
  S9["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T9["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S9 -->|calls| T9
  S10["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T10["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S10 -->|calls| T10
  S11["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T11["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T13["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T14["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T15["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T16["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T17["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T18["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S18 -->|calls| T18
  S19["function:string<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:249"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T21["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T22["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T23["method:ASDisplayNode::baseDidInit<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/CatDealsCollectionView/Sample/ASDisplayNode+CatDeals.mm:24"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T24["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T25["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

# `calls 符号关系 - 169`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASWeakProxy::isKindOfClass:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakProxy.mm:45"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:ASWeakProxy::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakProxy.mm:50"]
  T2["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S2 -->|calls| T2
  S3["method:ASWeakSet::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:18"]
  T3["method:ASWeakSet::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:18"]
  S3 -->|calls| T3
  S4["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  T4["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S4 -->|calls| T4
  S5["method:ASWeakSet::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:79"]
  T5["method:ASWeakSet::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:79"]
  S5 -->|calls| T5
  S6["function:asdk_diffWithArray:insertions:deletions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:19"]
  T6["function:asdk_diffWithArray:insertions:deletions:moves:compareBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:37"]
  S6 -->|calls| T6
  S7["function:asdk_diffWithArray:insertions:deletions:compareBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:24"]
  T7["function:asdk_diffWithArray:insertions:deletions:moves:compareBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:37"]
  S7 -->|calls| T7
  S8["function:asdk_diffWithArray:insertions:deletions:moves:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:30"]
  T8["function:asdk_diffWithArray:insertions:deletions:moves:compareBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:37"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:1"]
  T9["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S9 -->|calls| T9
  S10["method:NSIndexSet::as_indexesByMapping:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:17"]
  T10["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S10 -->|calls| T10
  S11["method:NSIndexSet::as_indexesByMapping:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:17"]
  T11["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S11 -->|calls| T11
  S12["method:NSIndexSet::as_intersectionWithIndexes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:31"]
  T12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S12 -->|calls| T12
  S13["method:NSIndexSet::as_indexSetFromIndexPaths:inSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:42"]
  T13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S13 -->|calls| T13
  S14["method:NSIndexSet::as_sectionsFromIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:82"]
  T14["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S14 -->|calls| T14
  S15["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:16"]
  T15["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S15 -->|calls| T15
  S16["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:16"]
  T16["method:NSMutableAttributedString::attributeTextInRange:withTextKitParagraphStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:42"]
  S16 -->|calls| T16
  S17["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:maximumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:26"]
  T17["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S17 -->|calls| T17
  S18["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:maximumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:26"]
  T18["method:NSMutableAttributedString::attributeTextInRange:withTextKitParagraphStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:42"]
  S18 -->|calls| T18
  S19["method:NSMutableAttributedString::attributeTextInRange:withTextKitLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:37"]
  T19["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:maximumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:26"]
  S19 -->|calls| T19
  S20["method:NSMutableAttributedString::attributeTextInRange:withTextKitParagraphStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:42"]
  T20["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S20 -->|calls| T20
  S21["method:ASAsyncTransactionOperation::initWithOperationCompletionBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:34"]
  T21["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S21 -->|calls| T21
  S22["function:ASAsyncTransactionQueue::GroupImpl<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:106"]
  T22["function:ASAsyncTransactionQueue::GroupImpl<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:106"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T23["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S23 -->|calls| T23
  S24["function:pushOperation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:201"]
  T24["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S24 -->|calls| T24
  S25["function:schedule<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:209"]
  T25["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

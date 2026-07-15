# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.h:1"]
  T1["function:ASTextAttributeGetType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:31"]
  S1 -->|calls| T1
  S2["method:ASTextBackedString::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:119"]
  T2["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S2 -->|calls| T2
  S3["method:ASTextBinding::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:146"]
  T3["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S3 -->|calls| T3
  S4["method:ASTextShadow::shadowWithNSShadow:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:171"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:ASTextShadow::shadowWithNSShadow:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:171"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:ASTextShadow::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:203"]
  T6["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S6 -->|calls| T6
  S7["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  T7["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S7 -->|calls| T7
  S8["method:ASTextDecoration::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:251"]
  T8["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S8 -->|calls| T8
  S9["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  T9["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S9 -->|calls| T9
  S10["method:ASTextBorder::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:305"]
  T10["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S10 -->|calls| T10
  S11["method:ASTextAttachment::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:348"]
  T11["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S11 -->|calls| T11
  S12["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T14["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S14 -->|calls| T14
  S15["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T15["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S15 -->|calls| T15
  S16["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T16["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S16 -->|calls| T16
  S17["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T17["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S17 -->|calls| T17
  S18["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T18["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S18 -->|calls| T18
  S19["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T19["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S19 -->|calls| T19
  S20["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T20["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S20 -->|calls| T20
  S21["method:ASTextHighlight::setStrokeWidth:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:432"]
  T21["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S21 -->|calls| T21
  S22["method:ASTextHighlight::setStrokeWidth:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:432"]
  T22["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S22 -->|calls| T22
  S23["method:ASTextHighlight::setStrokeWidth:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:432"]
  T23["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S23 -->|calls| T23
  S24["method:ASTextHighlight::setStrokeColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:441"]
  T24["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S24 -->|calls| T24
  S25["method:ASTextHighlight::setStrokeColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:441"]
  T25["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

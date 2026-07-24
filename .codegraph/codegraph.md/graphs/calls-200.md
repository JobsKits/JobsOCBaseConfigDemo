# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  T1["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S1 -->|calls| T1
  S2["method:ASTextDecoration::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:251"]
  T2["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S2 -->|calls| T2
  S3["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  T3["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S3 -->|calls| T3
  S4["method:ASTextBorder::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:305"]
  T4["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S4 -->|calls| T4
  S5["method:ASTextAttachment::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:348"]
  T5["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S5 -->|calls| T5
  S6["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T8["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S8 -->|calls| T8
  S9["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T9["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S9 -->|calls| T9
  S10["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T10["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S10 -->|calls| T10
  S11["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T11["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S11 -->|calls| T11
  S12["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T12["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S12 -->|calls| T12
  S13["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T13["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S13 -->|calls| T13
  S14["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T14["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S14 -->|calls| T14
  S15["method:ASTextHighlight::setStrokeWidth:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:432"]
  T15["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S15 -->|calls| T15
  S16["method:ASTextHighlight::setStrokeWidth:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:432"]
  T16["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S16 -->|calls| T16
  S17["method:ASTextHighlight::setStrokeWidth:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:432"]
  T17["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S17 -->|calls| T17
  S18["method:ASTextHighlight::setStrokeColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:441"]
  T18["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S18 -->|calls| T18
  S19["method:ASTextHighlight::setStrokeColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:441"]
  T19["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S19 -->|calls| T19
  S20["method:ASTextHighlight::setStrokeColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:441"]
  T20["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S20 -->|calls| T20
  S21["method:ASTextHighlight::setStrokeColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:441"]
  T21["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S21 -->|calls| T21
  S22["method:ASTextHighlight::setTextAttribute:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:452"]
  T22["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S22 -->|calls| T22
  S23["method:ASTextHighlight::setTextAttribute:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:452"]
  T23["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S23 -->|calls| T23
  S24["method:ASTextHighlight::setShadow:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:458"]
  T24["method:ASTextHighlight::setTextAttribute:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:452"]
  S24 -->|calls| T24
  S25["method:ASTextHighlight::setInnerShadow:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:462"]
  T25["method:ASTextHighlight::setTextAttribute:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:452"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

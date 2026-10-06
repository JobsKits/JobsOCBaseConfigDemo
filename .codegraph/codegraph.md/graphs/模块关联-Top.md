# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["JobsByPods/JobsBlock@Pods"]
  M2["JobsByPods/JobsBluetooth@Pods"]
  M3["JobsByPods/JobsAPIs@Pods"]
  M4["JobsByPods/JobsAppDoor@Pods"]
  M5["JobsByPods/JobsModelDSL@Pods"]
  M6["JobsByPods/JobsOCDefs@Pods"]
  M7["JobsByPods/JobsBaseUI@Pods"]
  M8["JobsByPods/JobsOCDSL@Pods"]
  M9["JobsByPods/JobsByOCPods@Pods"]
  M10["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M11["JobsByPods/ManualByOCPods@Pods"]
  M12["JobsByPods/JobsFuseAnimation@Pods"]
  M13["JobsByPods/JobsMakes@Pods"]
  M14["JobsByPods/JobsLinkageMenuView@Pods"]
  M15["JobsByPods/JobsDropDownListView@Pods"]
  M16["JobsByPods/JobsCustomView@Pods"]
  M17["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M18["JobsByPods/JobsStringUtils@Pods"]
  M19["JobsByPods/JobsBasePopupView@Pods"]
  M20["JobsByPods/JobsModel@Pods"]
  M21["JobsByPods/JobsCryptography@Pods"]
  M22["JobsByPods/JobsMenuView@Pods"]
  M23["JobsByPods/JobsGestureLock@Pods"]
  M24["JobsByPods/MJRefreshExtra@Pods"]
  M25["JobsByPods/JobsBitsMonitor@Pods"]
  M26["JobsByPods/BRPickerViewExtra@Pods"]
  M27["JobsByPods/JobsMarqueeView@Pods"]
  M1 -->|calls:3264| M2
  M3 -->|calls:682| M1
  M4 -->|calls:397| M5
  M4 -->|calls:385| M6
  M7 -->|calls:342| M8
  M9 -->|calls:323| M8
  M7 -->|calls:293| M1
  M4 -->|calls:278| M10
  M4 -->|calls:274| M8
  M7 -->|calls:255| M5
  M7 -->|calls:219| M6
  M7 -->|calls:182| M10
  M7 -->|calls:172| M11
  M4 -->|calls:170| M11
  M9 -->|calls:164| M10
  M9 -->|calls:158| M5
  M4 -->|calls:154| M7
  M12 -->|calls:148| M8
  M9 -->|calls:144| M13
  M4 -->|calls:137| M1
  M14 -->|calls:137| M10
  M9 -->|calls:132| M6
  M7 -->|calls:109| M9
  M9 -->|calls:102| M1
  M9 -->|calls:97| M11
  M13 -->|calls:97| M8
  M7 -->|calls:96| M13
  M15 -->|calls:88| M8
  M16 -->|calls:87| M10
  M4 -->|calls:77| M17
  M4 -->|calls:76| M9
  M16 -->|calls:73| M6
  M9 -->|calls:70| M18
  M19 -->|calls:67| M10
  M7 -->|calls:64| M18
  M7 -->|calls:62| M20
  M10 -->|calls:57| M5
  M19 -->|calls:53| M5
  M16 -->|calls:52| M8
  M14 -->|calls:50| M6
  M19 -->|calls:48| M8
  M9 -->|calls:48| M7
  M14 -->|calls:48| M8
  M16 -->|calls:47| M11
  M19 -->|calls:46| M18
  M21 -->|calls:46| M10
  M10 -->|calls:45| M8
  M9 -->|calls:45| M20
  M10 -->|calls:44| M18
  M15 -->|calls:43| M6
  M9 -->|calls:41| M22
  M19 -->|calls:40| M1
  M3 -->|calls:39| M18
  M4 -->|calls:39| M20
  M7 -->|calls:39| M17
  M16 -->|calls:39| M13
  M16 -->|calls:39| M18
  M10 -->|calls:37| M6
  M7 -->|calls:37| M22
  M14 -->|calls:37| M18
  M10 -->|calls:36| M11
  M14 -->|calls:35| M13
  M23 -->|calls:34| M8
  M10 -->|calls:33| M24
  M7 -->|calls:33| M25
  M7 -->|calls:33| M24
  M9 -->|calls:33| M26
  M9 -->|calls:33| M24
  M16 -->|calls:33| M24
  M14 -->|calls:33| M24
  M27 -->|calls:33| M10
  M19 -->|calls:32| M6
  M14 -->|calls:32| M5
  M10 -->|calls:30| M13
  M16 -->|calls:30| M5
  M12 -->|calls:30| M5
  M10 -->|calls:29| M20
  M4 -->|calls:29| M13
  M23 -->|calls:29| M10
  M14 -->|calls:29| M7
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

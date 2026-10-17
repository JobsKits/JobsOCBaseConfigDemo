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
  M7["JobsByPods/JobsByOCPods@Pods"]
  M8["JobsByPods/JobsOCDSL@Pods"]
  M9["JobsByPods/JobsBaseUI@Pods"]
  M10["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M11["JobsByPods/ManualByOCPods@Pods"]
  M12["JobsByPods/JobsMakes@Pods"]
  M13["JobsByPods/JobsFuseAnimation@Pods"]
  M14["JobsByPods/JobsLinkageMenuView@Pods"]
  M15["JobsByPods/JobsNavBar@Pods"]
  M16["JobsByPods/JobsCustomView@Pods"]
  M17["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M18["JobsByPods/JobsDropDownListView@Pods"]
  M19["JobsByPods/JobsStringUtils@Pods"]
  M20["JobsByPods/JobsBasePopupView@Pods"]
  M21["JobsByPods/JobsModel@Pods"]
  M22["JobsByPods/JobsCryptography@Pods"]
  M23["JobsByPods/JobsMenuView@Pods"]
  M24["JobsByPods/JobsGestureLock@Pods"]
  M25["JobsByPods/MJRefreshExtra@Pods"]
  M1 -->|calls:1519| M2
  M3 -->|calls:682| M1
  M4 -->|calls:397| M5
  M4 -->|calls:385| M6
  M7 -->|calls:322| M8
  M9 -->|calls:300| M8
  M9 -->|calls:283| M1
  M4 -->|calls:278| M10
  M4 -->|calls:271| M8
  M9 -->|calls:251| M5
  M9 -->|calls:194| M6
  M9 -->|calls:182| M10
  M9 -->|calls:172| M11
  M4 -->|calls:170| M11
  M7 -->|calls:164| M10
  M7 -->|calls:158| M5
  M4 -->|calls:152| M9
  M7 -->|calls:144| M12
  M13 -->|calls:141| M8
  M4 -->|calls:137| M1
  M14 -->|calls:137| M10
  M15 -->|calls:121| M10
  M9 -->|calls:108| M7
  M7 -->|calls:105| M6
  M7 -->|calls:102| M1
  M9 -->|calls:95| M12
  M15 -->|calls:93| M5
  M7 -->|calls:91| M11
  M16 -->|calls:87| M10
  M17 -->|calls:85| M10
  M18 -->|calls:81| M8
  M4 -->|calls:77| M17
  M17 -->|calls:77| M8
  M4 -->|calls:76| M7
  M7 -->|calls:70| M19
  M20 -->|calls:67| M10
  M9 -->|calls:64| M19
  M21 -->|calls:63| M7
  M15 -->|calls:61| M8
  M9 -->|calls:60| M21
  M10 -->|calls:57| M5
  M17 -->|calls:55| M19
  M20 -->|calls:53| M5
  M17 -->|calls:53| M11
  M15 -->|calls:48| M19
  M7 -->|calls:47| M9
  M16 -->|calls:47| M6
  M16 -->|calls:47| M11
  M20 -->|calls:46| M19
  M22 -->|calls:46| M10
  M17 -->|calls:46| M9
  M7 -->|calls:45| M21
  M16 -->|calls:45| M8
  M17 -->|calls:45| M12
  M10 -->|calls:44| M19
  M18 -->|calls:43| M6
  M14 -->|calls:43| M8
  M15 -->|calls:43| M11
  M15 -->|calls:42| M1
  M7 -->|calls:41| M23
  M20 -->|calls:40| M1
  M3 -->|calls:39| M19
  M4 -->|calls:39| M21
  M9 -->|calls:39| M17
  M16 -->|calls:39| M12
  M16 -->|calls:39| M19
  M15 -->|calls:39| M6
  M17 -->|calls:38| M5
  M10 -->|calls:37| M8
  M9 -->|calls:37| M23
  M14 -->|calls:37| M19
  M17 -->|calls:37| M7
  M10 -->|calls:36| M11
  M20 -->|calls:36| M8
  M15 -->|calls:36| M9
  M14 -->|calls:35| M12
  M15 -->|calls:35| M21
  M24 -->|calls:34| M8
  M15 -->|calls:34| M12
  M10 -->|calls:33| M25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

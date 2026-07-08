# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["App/JobsOCBaseConfigDemo"]
  M2["JobsByPods/JobsModelDSL@Pods"]
  M3["JobsByPods/ManualByOCPods@Pods"]
  M4["JobsByPods/JobsBaseUI@Pods"]
  M5["JobsByPods/JobsClass@Pods"]
  M6["JobsByPods/JobsOCTools@Pods"]
  M7["JobsByPods/JobsByOCPods@Pods"]
  M8["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M9["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M10["JobsByPods/JobsOCDSL@Pods"]
  M11["JobsByPods/JobsNavBar@Pods"]
  M12["JobsByPods/JobsModel@Pods"]
  M13["JobsByPods/JobsLinkageMenuView@Pods"]
  M14["JobsByPods/JobsCustomView@Pods"]
  M15["JobsByPods/MJRefreshExtra@Pods"]
  M16["JobsByPods/JobsBasePopupView@Pods"]
  M17["JobsByPods/JobsOCSplash@Pods"]
  M18["JobsByPods/JobsTimeUtils@Pods"]
  M19["JobsByPods/JobsDropDownListView@Pods"]
  M20["JobsByPods/JobsSuspend@Pods"]
  M21["JobsByPods/JobsAppTools@Pods"]
  M22["JobsByPods/JobsCryptography@Pods"]
  M1 -->|calls:785| M2
  M1 -->|calls:485| M3
  M4 -->|calls:191| M2
  M3 -->|calls:186| M5
  M6 -->|calls:173| M2
  M4 -->|calls:160| M3
  M7 -->|calls:144| M3
  M1 -->|calls:128| M8
  M6 -->|calls:84| M3
  M1 -->|calls:78| M4
  M9 -->|calls:75| M3
  M10 -->|calls:75| M3
  M7 -->|calls:71| M8
  M7 -->|calls:66| M2
  M9 -->|calls:63| M8
  M11 -->|calls:61| M3
  M1 -->|calls:58| M7
  M1 -->|calls:58| M10
  M11 -->|calls:57| M2
  M1 -->|calls:50| M12
  M4 -->|calls:49| M10
  M13 -->|calls:49| M3
  M13 -->|calls:47| M2
  M14 -->|calls:46| M3
  M9 -->|calls:45| M2
  M15 -->|calls:45| M2
  M7 -->|calls:41| M5
  M12 -->|calls:41| M3
  M13 -->|calls:40| M8
  M15 -->|calls:40| M3
  M8 -->|calls:39| M2
  M8 -->|calls:39| M3
  M16 -->|calls:30| M3
  M4 -->|calls:30| M8
  M9 -->|calls:29| M5
  M3 -->|calls:29| M4
  M1 -->|calls:27| M9
  M16 -->|calls:27| M2
  M11 -->|calls:27| M8
  M17 -->|calls:27| M3
  M18 -->|calls:27| M2
  M7 -->|calls:26| M12
  M14 -->|calls:25| M8
  M15 -->|calls:25| M8
  M19 -->|calls:23| M3
  M4 -->|calls:22| M12
  M6 -->|calls:22| M5
  M16 -->|calls:20| M8
  M14 -->|calls:20| M2
  M7 -->|calls:19| M4
  M20 -->|calls:19| M3
  M1 -->|calls:18| M21
  M6 -->|calls:18| M8
  M4 -->|calls:17| M5
  M9 -->|calls:17| M12
  M20 -->|calls:17| M2
  M22 -->|calls:16| M8
  M13 -->|calls:16| M12
  M18 -->|calls:16| M12
  M8 -->|calls:15| M12
  M14 -->|calls:15| M12
  M11 -->|calls:15| M12
  M15 -->|calls:15| M12
  M8 -->|calls:14| M15
  M4 -->|calls:14| M15
  M7 -->|calls:14| M21
  M7 -->|calls:14| M15
  M14 -->|calls:14| M15
  M13 -->|calls:14| M15
  M11 -->|calls:14| M21
  M11 -->|calls:14| M15
  M9 -->|calls:14| M21
  M9 -->|calls:14| M15
  M10 -->|calls:14| M6
  M6 -->|calls:14| M4
  M8 -->|calls:13| M21
  M16 -->|calls:13| M21
  M4 -->|calls:13| M21
  M4 -->|calls:13| M7
  M14 -->|calls:13| M21
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

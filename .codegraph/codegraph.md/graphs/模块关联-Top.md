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
  M4["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M5["JobsByPods/JobsClass@Pods"]
  M6["JobsByPods/JobsOCTools@Pods"]
  M7["JobsByPods/JobsOCDefs@Pods"]
  M8["JobsByPods/JobsBaseUI@Pods"]
  M9["JobsByPods/JobsByOCPods@Pods"]
  M10["JobsByPods/JobsOCProtocols@Pods"]
  M11["JobsByPods/JobsModel@Pods"]
  M12["JobsByPods/JobsStringUtils@Pods"]
  M13["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M14["JobsByPods/JobsNavBar@Pods"]
  M15["JobsByPods/JobsLinkageMenuView@Pods"]
  M16["JobsByPods/MJRefreshExtra@Pods"]
  M17["JobsByPods/JobsBasePopupView@Pods"]
  M18["JobsByPods/JobsAPIs@Pods"]
  M19["JobsByPods/JobsCustomView@Pods"]
  M20["JobsByPods/JobsTimeUtils@Pods"]
  M21["JobsByPods/JobsCryptography@Pods"]
  M22["JobsByPods/JobsBitsMonitor@Pods"]
  M23["JobsByPods/JobsOCDSL@Pods"]
  M24["JobsByPods/JobsDeviceInfo@Pods"]
  M25["JobsByPods/JobsAppTools@Pods"]
  M1 -->|calls:664| M2
  M1 -->|calls:283| M3
  M1 -->|calls:277| M4
  M3 -->|calls:188| M5
  M6 -->|calls:140| M2
  M1 -->|calls:121| M7
  M8 -->|calls:113| M2
  M9 -->|calls:110| M2
  M10 -->|calls:95| M11
  M1 -->|calls:89| M9
  M6 -->|calls:87| M4
  M1 -->|calls:83| M8
  M9 -->|calls:83| M5
  M9 -->|calls:83| M12
  M9 -->|calls:73| M4
  M9 -->|calls:68| M11
  M4 -->|calls:65| M2
  M8 -->|calls:65| M4
  M13 -->|calls:65| M5
  M14 -->|calls:64| M2
  M1 -->|calls:62| M12
  M8 -->|calls:62| M3
  M8 -->|calls:61| M12
  M13 -->|calls:61| M12
  M14 -->|calls:60| M4
  M1 -->|calls:58| M11
  M13 -->|calls:58| M4
  M15 -->|calls:55| M4
  M8 -->|calls:54| M5
  M16 -->|calls:54| M4
  M3 -->|calls:52| M8
  M14 -->|calls:50| M12
  M17 -->|calls:48| M12
  M13 -->|calls:48| M2
  M4 -->|calls:46| M12
  M6 -->|calls:46| M3
  M9 -->|calls:45| M3
  M18 -->|calls:40| M12
  M19 -->|calls:40| M12
  M14 -->|calls:40| M3
  M16 -->|calls:40| M12
  M4 -->|calls:38| M3
  M15 -->|calls:38| M12
  M11 -->|calls:37| M3
  M16 -->|calls:37| M2
  M17 -->|calls:31| M2
  M14 -->|calls:31| M5
  M13 -->|calls:31| M11
  M13 -->|calls:30| M3
  M6 -->|calls:29| M5
  M1 -->|calls:28| M5
  M14 -->|calls:27| M11
  M20 -->|calls:27| M2
  M17 -->|calls:26| M4
  M4 -->|calls:25| M11
  M4 -->|calls:25| M16
  M8 -->|calls:25| M11
  M9 -->|calls:25| M8
  M6 -->|calls:25| M7
  M4 -->|calls:24| M7
  M19 -->|calls:24| M3
  M16 -->|calls:24| M11
  M16 -->|calls:23| M3
  M15 -->|calls:22| M3
  M11 -->|calls:22| M12
  M21 -->|calls:21| M4
  M15 -->|calls:21| M11
  M1 -->|calls:20| M6
  M22 -->|calls:20| M2
  M9 -->|calls:20| M6
  M19 -->|calls:20| M11
  M20 -->|calls:20| M12
  M19 -->|calls:19| M4
  M13 -->|calls:19| M9
  M6 -->|calls:19| M11
  M23 -->|calls:18| M3
  M24 -->|calls:17| M12
  M15 -->|calls:17| M2
  M16 -->|calls:17| M5
  M1 -->|calls:16| M25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

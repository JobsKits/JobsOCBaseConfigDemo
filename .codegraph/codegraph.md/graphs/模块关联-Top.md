# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["JobsByPods/JobsBlock@Pods"]
  M2["JobsByPods/JobsMakes@Pods"]
  M3["App/JobsOCBaseConfigDemo"]
  M4["JobsByPods/JobsModelDSL@Pods"]
  M5["JobsByPods/ManualByOCPods@Pods"]
  M6["JobsByPods/JobsClass@Pods"]
  M7["JobsByPods/JobsBaseUI@Pods"]
  M8["JobsByPods/JobsByOCPods@Pods"]
  M9["JobsByPods/JobsOCDSL@Pods"]
  M10["JobsByPods/JobsOCDefs@Pods"]
  M11["JobsByPods/JobsOCProtocols@Pods"]
  M12["JobsByPods/JobsModel@Pods"]
  M13["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M14["JobsByPods/JobsNavBar@Pods"]
  M15["JobsByPods/JobsCustomView@Pods"]
  M16["JobsByPods/JobsStringUtils@Pods"]
  M17["JobsByPods/JobsLinkageMenuView@Pods"]
  M18["JobsByPods/JobsBasePopupView@Pods"]
  M19["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M20["JobsByPods/JobsFiltrationView@Pods"]
  M21["JobsByPods/MJRefreshExtra@Pods"]
  M22["JobsByPods/JobsAPIs@Pods"]
  M23["JobsByPods/JobsDropDownListView@Pods"]
  M24["JobsByPods/JobsCryptography@Pods"]
  M25["JobsByPods/FileFolderHandleTool@Pods"]
  M26["JobsByPods/JobsSuspend@Pods"]
  M27["JobsByPods/JobsOCCalendar@Pods"]
  M28["JobsByPods/JobsOCTools@Pods"]
  M1 -->|calls:911| M2
  M3 -->|calls:252| M4
  M5 -->|calls:188| M6
  M7 -->|calls:153| M5
  M8 -->|calls:141| M5
  M9 -->|calls:110| M5
  M7 -->|calls:103| M10
  M2 -->|calls:95| M9
  M11 -->|calls:84| M12
  M7 -->|calls:79| M9
  M13 -->|calls:74| M5
  M7 -->|calls:66| M4
  M8 -->|calls:66| M4
  M14 -->|calls:57| M5
  M15 -->|calls:51| M5
  M8 -->|calls:50| M16
  M17 -->|calls:48| M5
  M18 -->|calls:47| M5
  M7 -->|calls:46| M16
  M8 -->|calls:45| M10
  M14 -->|calls:45| M4
  M19 -->|calls:44| M5
  M13 -->|calls:40| M16
  M7 -->|calls:38| M15
  M12 -->|calls:38| M5
  M18 -->|calls:37| M16
  M14 -->|calls:37| M16
  M18 -->|calls:36| M4
  M17 -->|calls:36| M10
  M14 -->|calls:36| M10
  M5 -->|calls:36| M20
  M19 -->|calls:35| M16
  M19 -->|calls:35| M21
  M7 -->|calls:35| M21
  M8 -->|calls:35| M21
  M15 -->|calls:35| M21
  M17 -->|calls:35| M21
  M14 -->|calls:35| M21
  M13 -->|calls:35| M21
  M8 -->|calls:34| M12
  M7 -->|calls:33| M12
  M8 -->|calls:33| M9
  M13 -->|calls:33| M4
  M22 -->|calls:30| M16
  M15 -->|calls:30| M16
  M17 -->|calls:29| M16
  M19 -->|calls:27| M4
  M15 -->|calls:27| M10
  M7 -->|calls:26| M19
  M17 -->|calls:26| M15
  M18 -->|calls:25| M10
  M13 -->|calls:25| M10
  M19 -->|calls:24| M10
  M23 -->|calls:23| M5
  M13 -->|calls:23| M12
  M21 -->|calls:23| M5
  M19 -->|calls:22| M12
  M17 -->|calls:22| M4
  M5 -->|calls:22| M7
  M18 -->|calls:21| M9
  M8 -->|calls:21| M19
  M24 -->|calls:21| M19
  M24 -->|calls:21| M5
  M3 -->|calls:20| M12
  M19 -->|calls:20| M15
  M14 -->|calls:20| M15
  M14 -->|calls:20| M12
  M13 -->|calls:20| M15
  M21 -->|calls:20| M4
  M25 -->|calls:19| M19
  M7 -->|calls:19| M8
  M15 -->|calls:18| M4
  M17 -->|calls:18| M12
  M9 -->|calls:18| M12
  M18 -->|calls:17| M19
  M7 -->|calls:17| M1
  M15 -->|calls:17| M12
  M26 -->|calls:17| M4
  M27 -->|calls:15| M9
  M9 -->|calls:15| M28
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

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
  M9["JobsByPods/JobsOCDefs@Pods"]
  M10["JobsByPods/JobsOCDSL@Pods"]
  M11["JobsByPods/JobsOCProtocols@Pods"]
  M12["JobsByPods/JobsModel@Pods"]
  M13["JobsByPods/JobsCustomView@Pods"]
  M14["JobsByPods/JobsStringUtils@Pods"]
  M15["JobsByPods/JobsBasePopupView@Pods"]
  M16["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M17["JobsByPods/JobsFiltrationView@Pods"]
  M18["JobsByPods/MJRefreshExtra@Pods"]
  M19["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M20["JobsByPods/JobsAPIs@Pods"]
  M21["JobsByPods/JobsLinkageMenuView@Pods"]
  M22["JobsByPods/JobsNavBar@Pods"]
  M23["JobsByPods/JobsDropDownListView@Pods"]
  M24["JobsByPods/JobsCryptography@Pods"]
  M25["JobsByPods/FileFolderHandleTool@Pods"]
  M26["JobsByPods/JobsSuspend@Pods"]
  M27["JobsByPods/JobsOCTools@Pods"]
  M28["JobsByPods/JobsBitsMonitor@Pods"]
  M29["JobsByPods/JobsAppTools@Pods"]
  M30["JobsByPods/JobsDebug@Pods"]
  M1 -->|calls:2259| M2
  M3 -->|calls:252| M4
  M5 -->|calls:188| M6
  M7 -->|calls:153| M5
  M8 -->|calls:141| M5
  M7 -->|calls:103| M9
  M2 -->|calls:95| M10
  M11 -->|calls:84| M12
  M7 -->|calls:79| M10
  M10 -->|calls:79| M5
  M7 -->|calls:66| M4
  M8 -->|calls:66| M4
  M13 -->|calls:51| M5
  M8 -->|calls:50| M14
  M15 -->|calls:47| M5
  M7 -->|calls:46| M14
  M8 -->|calls:45| M9
  M16 -->|calls:44| M5
  M7 -->|calls:38| M13
  M15 -->|calls:37| M14
  M15 -->|calls:36| M4
  M5 -->|calls:36| M17
  M16 -->|calls:35| M14
  M16 -->|calls:35| M18
  M7 -->|calls:35| M18
  M8 -->|calls:35| M18
  M13 -->|calls:35| M18
  M8 -->|calls:34| M12
  M12 -->|calls:34| M5
  M7 -->|calls:33| M12
  M8 -->|calls:33| M10
  M19 -->|calls:31| M5
  M20 -->|calls:30| M14
  M13 -->|calls:30| M14
  M21 -->|calls:28| M5
  M16 -->|calls:27| M4
  M13 -->|calls:27| M9
  M7 -->|calls:26| M16
  M15 -->|calls:25| M9
  M22 -->|calls:25| M4
  M16 -->|calls:24| M9
  M23 -->|calls:23| M5
  M22 -->|calls:23| M5
  M18 -->|calls:23| M5
  M16 -->|calls:22| M12
  M19 -->|calls:22| M4
  M5 -->|calls:22| M7
  M15 -->|calls:21| M10
  M8 -->|calls:21| M16
  M24 -->|calls:21| M16
  M24 -->|calls:21| M5
  M3 -->|calls:20| M12
  M16 -->|calls:20| M13
  M18 -->|calls:20| M4
  M25 -->|calls:19| M16
  M7 -->|calls:19| M8
  M13 -->|calls:18| M4
  M21 -->|calls:18| M4
  M10 -->|calls:18| M12
  M15 -->|calls:17| M16
  M7 -->|calls:17| M1
  M13 -->|calls:17| M12
  M26 -->|calls:17| M4
  M10 -->|calls:15| M27
  M5 -->|calls:15| M8
  M28 -->|calls:14| M4
  M8 -->|calls:14| M6
  M13 -->|calls:14| M16
  M22 -->|calls:14| M29
  M5 -->|calls:14| M16
  M16 -->|calls:13| M29
  M16 -->|calls:13| M10
  M15 -->|calls:13| M29
  M7 -->|calls:13| M29
  M8 -->|calls:13| M29
  M24 -->|calls:13| M30
  M13 -->|calls:13| M29
  M21 -->|calls:13| M29
  M19 -->|calls:13| M29
  M26 -->|calls:13| M29
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

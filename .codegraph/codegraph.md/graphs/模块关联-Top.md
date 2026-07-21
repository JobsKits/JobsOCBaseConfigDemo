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
  M5["JobsByPods/JobsBaseUI@Pods"]
  M6["JobsByPods/JobsOCDSL@Pods"]
  M7["JobsByPods/ManualByOCPods@Pods"]
  M8["JobsByPods/JobsClass@Pods"]
  M9["JobsByPods/JobsOCDefs@Pods"]
  M10["JobsByPods/JobsCustomView@Pods"]
  M11["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M12["JobsByPods/JobsOCProtocols@Pods"]
  M13["JobsByPods/JobsModel@Pods"]
  M14["JobsByPods/JobsStringUtils@Pods"]
  M15["JobsByPods/JobsBasePopupView@Pods"]
  M16["JobsByPods/JobsByOCPods@Pods"]
  M17["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M18["JobsByPods/JobsFiltrationView@Pods"]
  M19["JobsByPods/MJRefreshExtra@Pods"]
  M20["JobsByPods/YTKNetworkExtra@Pods"]
  M21["JobsByPods/JobsAPIs@Pods"]
  M22["JobsByPods/JobsLinkageMenuView@Pods"]
  M23["JobsByPods/JobsNavBar@Pods"]
  M24["JobsByPods/FileFolderHandleTool@Pods"]
  M25["JobsByPods/JobsSuspend@Pods"]
  M26["JobsByPods/JobsOCTools@Pods"]
  M27["JobsByPods/JobsAppTools@Pods"]
  M28["JobsByPods/JobsBitsMonitor@Pods"]
  M29["JobsByPods/JobsCryptography@Pods"]
  M30["JobsByPods/JobsRichTextUtils@Pods"]
  M1 -->|calls:2233| M2
  M3 -->|calls:268| M4
  M5 -->|calls:257| M6
  M5 -->|calls:227| M7
  M7 -->|calls:188| M8
  M5 -->|calls:161| M9
  M5 -->|calls:125| M4
  M5 -->|calls:103| M10
  M2 -->|calls:95| M6
  M6 -->|calls:94| M7
  M5 -->|calls:93| M11
  M12 -->|calls:84| M13
  M5 -->|calls:58| M13
  M11 -->|calls:57| M7
  M5 -->|calls:53| M14
  M10 -->|calls:53| M7
  M15 -->|calls:52| M7
  M5 -->|calls:46| M16
  M11 -->|calls:45| M4
  M16 -->|calls:43| M7
  M15 -->|calls:42| M4
  M15 -->|calls:40| M14
  M11 -->|calls:38| M14
  M7 -->|calls:38| M5
  M17 -->|calls:36| M7
  M7 -->|calls:36| M18
  M11 -->|calls:35| M19
  M5 -->|calls:35| M19
  M3 -->|calls:34| M20
  M13 -->|calls:34| M7
  M16 -->|calls:32| M4
  M21 -->|calls:30| M14
  M3 -->|calls:29| M6
  M11 -->|calls:28| M13
  M22 -->|calls:28| M7
  M15 -->|calls:27| M6
  M11 -->|calls:26| M9
  M15 -->|calls:26| M9
  M5 -->|calls:26| M1
  M10 -->|calls:25| M9
  M23 -->|calls:25| M4
  M3 -->|calls:24| M13
  M23 -->|calls:23| M7
  M19 -->|calls:23| M7
  M3 -->|calls:22| M11
  M17 -->|calls:22| M4
  M11 -->|calls:21| M10
  M19 -->|calls:20| M4
  M3 -->|calls:19| M7
  M24 -->|calls:19| M11
  M10 -->|calls:19| M4
  M10 -->|calls:19| M6
  M15 -->|calls:18| M11
  M22 -->|calls:18| M4
  M6 -->|calls:18| M13
  M25 -->|calls:17| M4
  M7 -->|calls:16| M3
  M16 -->|calls:15| M11
  M6 -->|calls:15| M26
  M7 -->|calls:15| M16
  M11 -->|calls:14| M27
  M11 -->|calls:14| M6
  M15 -->|calls:14| M27
  M5 -->|calls:14| M27
  M28 -->|calls:14| M4
  M16 -->|calls:14| M13
  M10 -->|calls:14| M11
  M23 -->|calls:14| M27
  M7 -->|calls:14| M11
  M3 -->|calls:13| M9
  M28 -->|calls:13| M9
  M16 -->|calls:13| M27
  M29 -->|calls:13| M11
  M10 -->|calls:13| M27
  M22 -->|calls:13| M27
  M17 -->|calls:13| M27
  M30 -->|calls:13| M7
  M25 -->|calls:13| M27
  M19 -->|calls:13| M27
  M3 -->|calls:12| M14
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

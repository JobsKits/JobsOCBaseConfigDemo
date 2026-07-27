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
  M6["JobsByPods/ManualByOCPods@Pods"]
  M7["JobsByPods/JobsClass@Pods"]
  M8["JobsByPods/JobsOCDSL@Pods"]
  M9["JobsByPods/JobsOCDefs@Pods"]
  M10["JobsByPods/JobsCustomView@Pods"]
  M11["JobsByPods/JobsByOCPods@Pods"]
  M12["JobsByPods/JobsOCProtocols@Pods"]
  M13["JobsByPods/JobsModel@Pods"]
  M14["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M15["JobsByPods/JobsBasePopupView@Pods"]
  M16["JobsByPods/JobsStringUtils@Pods"]
  M17["JobsByPods/JobsFiltrationView@Pods"]
  M18["JobsByPods/MJRefreshExtra@Pods"]
  M19["JobsByPods/YTKNetworkExtra@Pods"]
  M20["JobsByPods/JobsNavigationTransitionMgr@Pods"]
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
  M1 -->|calls:2259| M2
  M3 -->|calls:268| M4
  M5 -->|calls:204| M6
  M6 -->|calls:188| M7
  M5 -->|calls:159| M8
  M5 -->|calls:157| M9
  M5 -->|calls:98| M10
  M2 -->|calls:95| M8
  M5 -->|calls:90| M4
  M11 -->|calls:89| M6
  M12 -->|calls:84| M13
  M8 -->|calls:79| M6
  M11 -->|calls:61| M4
  M5 -->|calls:53| M14
  M10 -->|calls:53| M6
  M14 -->|calls:52| M6
  M15 -->|calls:52| M6
  M5 -->|calls:50| M16
  M11 -->|calls:48| M16
  M14 -->|calls:45| M4
  M15 -->|calls:42| M4
  M5 -->|calls:42| M11
  M5 -->|calls:41| M13
  M15 -->|calls:40| M16
  M14 -->|calls:38| M16
  M6 -->|calls:36| M17
  M14 -->|calls:35| M18
  M5 -->|calls:35| M18
  M3 -->|calls:34| M19
  M13 -->|calls:34| M6
  M20 -->|calls:31| M6
  M21 -->|calls:30| M16
  M14 -->|calls:28| M13
  M22 -->|calls:28| M6
  M15 -->|calls:26| M9
  M14 -->|calls:25| M9
  M10 -->|calls:25| M9
  M23 -->|calls:25| M4
  M3 -->|calls:24| M13
  M5 -->|calls:24| M1
  M11 -->|calls:23| M14
  M23 -->|calls:23| M6
  M18 -->|calls:23| M6
  M3 -->|calls:22| M14
  M20 -->|calls:22| M4
  M6 -->|calls:22| M5
  M14 -->|calls:21| M10
  M15 -->|calls:21| M8
  M11 -->|calls:21| M9
  M3 -->|calls:20| M8
  M11 -->|calls:20| M8
  M18 -->|calls:20| M4
  M3 -->|calls:19| M6
  M24 -->|calls:19| M14
  M10 -->|calls:19| M4
  M15 -->|calls:18| M14
  M22 -->|calls:18| M4
  M8 -->|calls:18| M13
  M11 -->|calls:17| M13
  M25 -->|calls:17| M4
  M6 -->|calls:16| M3
  M8 -->|calls:15| M26
  M6 -->|calls:15| M11
  M14 -->|calls:14| M27
  M15 -->|calls:14| M27
  M28 -->|calls:14| M4
  M11 -->|calls:14| M7
  M10 -->|calls:14| M14
  M23 -->|calls:14| M27
  M6 -->|calls:14| M14
  M3 -->|calls:13| M9
  M14 -->|calls:13| M8
  M5 -->|calls:13| M27
  M11 -->|calls:13| M27
  M29 -->|calls:13| M14
  M10 -->|calls:13| M27
  M22 -->|calls:13| M27
  M20 -->|calls:13| M27
  M30 -->|calls:13| M6
  M25 -->|calls:13| M27
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

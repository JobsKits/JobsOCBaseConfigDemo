---
title: Web Flexbox Differences
layout: docs
permalink: /docs/layout2-web-flexbox-differences.html
---

The goal of Texture's Layout API is *not* to re-implement all of CSS. It only targets a subset of CSS and Flexbox container, and there are no plans to implement support for tables, floats, or any other CSS concepts. The Texture Layout API also does not plan to support styling properties which do not affect layout such as color or background properties.

The layout system tries to stay as close as possible to CSS. There are, however, certain cases where it differs from the web, these include:

### <span id="前言">Naming properties <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span>

Certain properties have a different naming as on the web. For example `min-height` equivalent is the `minHeight` property. The full list of properties that control layout is documented in the Layout Properties section.

### No margin / padding properties <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Layoutables don't have a padding or margin property. Instead wrapping a layoutable within an `ASInsetLayoutSpec` to apply padding or margin to the layoutable is the recommended way. See `ASInsetLayout` section for more information.

### Missing features <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Certain features are not supported currently. See <a href = "layout2-layout-element-properties.html">Layout Properties</a> for the full list of properties that are supported.

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

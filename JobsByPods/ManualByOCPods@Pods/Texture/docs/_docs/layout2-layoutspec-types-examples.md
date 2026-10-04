---
title: Layout Spec Composition Examples
layout: docs
permalink: /docs/layout2-layoutspec-types-examples.html
---

## <span id="前言">Text Overlaid on an Image <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span>
<img src="/static/images/layoutSpec-examples/layout-example-inset-overlay.png" width="75%">

<div class = "highlight-group">
<span class="language-toggle"><a data-lang="swift" class="swiftButton">Swift</a><a data-lang="objective-c" class = "active objcButton">Objective-C</a></span>

<div class = "code">
<pre lang="objc" class="objcCode">
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
  ...
  UIEdgeInsets *insets = UIEdgeInsetsMake(0, HORIZONTAL_BUFFER, 0, HORIZONTAL_BUFFER);
  ASInsetLayoutSpec *headerWithInset = [ASInsetLayoutSpec alloc] initWithInsets:insets child:textNode];
  ...
}
</pre>
<pre lang="swift" class = "swiftCode hidden">
</pre>
</div>
</div>

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
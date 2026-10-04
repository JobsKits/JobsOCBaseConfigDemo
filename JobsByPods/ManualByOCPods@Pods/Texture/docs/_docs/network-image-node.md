---
title: ASNetworkImageNode
layout: docs
permalink: /docs/network-image-node.html
prevPage: image-node.html
nextPage: video-node.html
---

`ASNetworkImageNode` can be used any time you need to display an image that is being hosted remotely.  All you have to do is set the `.URL` property with the appropriate `NSURL` instance and the image will be asynchonously loaded and concurrently rendered for you.

<div class = "highlight-group">
<span class="language-toggle"><a data-lang="swift" class="swiftButton">Swift</a><a data-lang="objective-c" class = "active objcButton">Objective-C</a></span>

<div class = "code">
	<pre lang="objc" class="objcCode">
ASNetworkImageNode *imageNode = [[ASNetworkImageNode alloc] init];
imageNode.URL = [NSURL URLWithString:@"https://someurl.com/image_uri"];
	</pre>

	<pre lang="swift" class = "swiftCode hidden">
let imageNode = ASNetworkImageNode()
imageNode.url = URL(string: "https://someurl.com/image_uri")
	</pre>
</div>
</div>

### <span id="前言">Laying Out a Network Image Node <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span>

Since an `ASNetworkImageNode` has no intrinsic content size when it is created, it is necessary for you to explicitly specify how they should be laid out.

<h4><i>Option 1: .style.preferredSize</i></h4>

If you have a standard size you want the image node's frame size to be you can use the `.style.preferredSize` property.

<div class = "highlight-group">
<span class="language-toggle"><a data-lang="swift" class="swiftButton">Swift</a><a data-lang="objective-c" class = "active objcButton">Objective-C</a></span>

<div class = "code">
<pre lang="objc" class="objcCode">
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constraint
{
	imageNode.style.preferredSize = CGSizeMake(100, 200);
	...
	return finalLayoutSpec;
}
</pre>

<pre lang="swift" class = "swiftCode hidden">
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
	imageNode.style.preferredSize = CGSize(width: 100, height: 200)
	...
	return finalLayoutSpec
}
</pre>
</div>
</div>

<h4><i>Option 2: ASRatioLayoutSpec</i></h4>

This is also a perfect place to use `ASRatioLayoutSpec`.  Instead of assigning a static size for the image, you can assign a ratio and the image will maintain that ratio when it has finished loading and is displayed.

<div class = "highlight-group">
<span class="language-toggle"><a data-lang="swift" class="swiftButton">Swift</a><a data-lang="objective-c" class = "active objcButton">Objective-C</a></span>

<div class = "code">
<pre lang="objc" class="objcCode">
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constraint
{
	CGFloat ratio = 3.0/1.0;
	ASRatioLayoutSpec *imageRatioSpec = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:ratio child:self.imageNode];
	...
	return finalLayoutSpec;
}
</pre>

<pre lang="swift" class = "swiftCode hidden">
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
	let ratio: CGFloat = 3.0/1.0
	let imageRatioSpec = ASRatioLayoutSpec(ratio:ratio, child:self.imageNode)
	...
	return finalLayoutSpec
}
</pre>
</div>
</div>

### Under the Hood <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

<div class = "note">If you choose not to include the <code>PINRemoteImage</code> and <code>PINCache</code> dependencies you will lose progressive jpeg support and be required to include your own custom cache that conforms to <code>ASImageCacheProtocol</code>.</div>

#### Progressive JPEG Support <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Thanks to the inclusion of <a href = "https://github.com/pinterest/PINRemoteImage">PINRemoteImage</a>, network image nodes now offer full support for loading progressive JPEGs.  This means that if your server provides them, your images will display quickly at a lower quality that will scale up as more data is loaded. 

To enable progressive loading, just set `shouldRenderProgressImages` to `YES` like so:

<div class = "highlight-group">
<span class="language-toggle"><a data-lang="swift" class="swiftButton">Swift</a><a data-lang="objective-c" class = "active objcButton">Objective-C</a></span>

<div class = "code">
<pre lang="objc" class="objcCode">
networkImageNode.shouldRenderProgressImages = YES;
</pre>

<pre lang="swift" class = "swiftCode hidden">
networkImageNode.shouldRenderProgressImages = true
</pre>
</div>
</div>

It's important to remember that this is using one image that is progressively loaded.  If your server is constrained to using regular JPEGs, but provides you with multiple versions of increasing quality, you should check out <a href = "/docs/multiplex-image-node.html">ASMultiplexImageNode</a> instead. 

#### Automatic Caching <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`ASNetworkImageNode` now uses <a href = "https://github.com/pinterest/PINCache">PINCache</a> under the hood by default to cache network images automatically.

#### GIF Support <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`ASNetworkImageNode` provides GIF support through `PINRemoteImage`'s beta `PINAnimatedImage`. Of note! This support will not work for local files unless `shouldCacheImage` is set to `NO`.

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

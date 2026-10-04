# <span id="前言">Texture Documentation</span> 

We use [Jekyll](http://jekyllrb.com/) to build the site using Markdown and host it on [Github Pages](https://pages.github.com/).

### Dependencies <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Github Pages uses Jekyll to host a site and Jekyll has the following dependencies.

 - [Ruby](http://www.ruby-lang.org/) (version >= 2.0.0)
 - [RubyGems](http://rubygems.org/) (version >= 1.3.7)
 - [Bundler](http://gembundler.com/)

Mac OS X comes pre-installed with Ruby, but you may need to update RubyGems (via `gem update --system`).
Once you have RubyGems, use it to install bundler. 

```sh
$ gem install bundler
$ cd gh-pages # Go to folder
$ bundle install # Might need sudo.
```

### Run Jekyll Locally <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Use Jekyll to serve the website locally (by default, at `http://localhost:4000`):

```sh
$ bundle exec jekyll serve [--incremental]
$ open http://localhost:4000/
```

For more, see https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

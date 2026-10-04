# <span id="前言">Release Process</span>
This document describes the process for a public Texture release.

### Preparation <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>
- Install [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator): `sudo gem install github_changelog_generator`
- Generate a GitHub Personal Access Token to prevent running into public GitHub API rate limits: https://github.com/github-changelog-generator/github-changelog-generator#github-token

### Process <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>
- Run `github_changelog_generator` in Texture project directory: `github_changelog_generator --token <generated personal token> --user TextureGroup --project Texture`. To avoid hitting rate limit, the generator will replace the entire file with just the changes from this version – revert that giant deletion to get the entire new changelog.
- Update `spec.version` within `Texture.podspec` and the `since-tag` and `future-release` fields in `.github_changelog_generator`.
- Create a new PR with the updated `Texture.podspec` and `.github_changelog_generator`, and the newly generated changelog.
- After merging in the PR, [create a new GitHub release](https://github.com/TextureGroup/Texture/releases/new). Use the generated changelog for the new release.
- Push to Cocoapods with `pod trunk push`

### Problems <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>
- Sometimes we will still run into GitHub rate limit issues although using a personal token to generate the changelog. For now there is no solution for this. The issue to track is: [Triggering Github Rate limits #656](https://github.com/github-changelog-generator/github-changelog-generator/issues/656)

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

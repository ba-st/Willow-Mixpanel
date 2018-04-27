![Logo](resources/logo128x128.png) Willow-Mixpanel
==================================================
![GitHub release](https://img.shields.io/github/release/ba-st/Willow-Mixpanel.svg)
[![Build Status](https://travis-ci.org/ba-st/Willow-Mixpanel.svg?branch=master)](https://travis-ci.org/ba-st/Willow-Mixpanel)
[![Coverage Status](https://coveralls.io/repos/github/ba-st/Willow-Mixpanel/badge.svg?branch=master)](https://coveralls.io/github/ba-st/Willow-Mixpanel?branch=master)

**Integration between [Willow](https://github.com/ba-st/Willow/) and the [Mixpanel Javascript API](https://mixpanel.com/help/reference/javascript)**

### Installation
On Pharo 6.1 or 7 open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'WillowMixpanel';
  repository: 'github://ba-st/Willow-Mixpanel:master/source';
  load
```

### Usage

Include `WillowMixpanelMetadataLibrary` in the libraries updating the application root.

```smalltalk
(WillowMixpanelMetadataLibrary using: 'YOUR_MIXPANEL_TOKEN') updateRoot: aRoot
```
This will load the mixpanel support and then start tracking your events:

```smalltalk
  button onTrigger sendToMixpanel: [:mixpanel | mixpanel track: 'User event' ]
```

### Deployment
In order to include Willow-Mixpanel as part of your project, you should reference the *Deployment* package in your product baseline.
For example:
```
setUpDependencies: spec

	spec
		baseline: 'WillowMixpanel'
			with: [ spec
				repository: 'github://ba-st/Willow-Mixpanel:v1/source';
				loads: #('Deployment') ];
		import: 'WillowMixpanel'.
```
and
```
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec package: 'My-Package' with: [ spec requires: #('WillowMixpanel') ] ]
```

### Credits
- This integration was initially made at [Mercap](https://www.mercapsoftware.com/en/) by @fortizpenaloza
- [Pharo](https://pharo.org) and GitHub migration by @gcotelli

### Legal
- The project source code is [MIT](LICENSE) licensed. Any contribution submitted to the code repository is considered to be under the same license.
- The documentation is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/)
- The [Mixpanel Javascript API](https://github.com/mixpanel/mixpanel-js) is copyright of [Mixpanel, Inc.](https://mixpanel.com) and released under [Apache License Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)

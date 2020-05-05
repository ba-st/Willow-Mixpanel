<p align="center"><img src="assets/logos/128x128.png">
 <h1 align="center">Willow-Mixpanel</h1>
  <p align="center">
    Integration between <a href="https://github.com/ba-st/Willow/">Willow</a> and the <a href="https://mixpanel.com/help/reference/javascript">Mixpanel Javascript API</a>
    <br>
    <a href="docs/"><strong>Explore the docs »</strong></a>
    <br>
    <br>
    <a href="https://github.com/ba-st/Willow-Mixpanel/issues/new?labels=Type%3A+Defect">Report a defect</a>
    |
    <a href="https://github.com/ba-st/Willow-Mixpanel/issues/new?labels=Type%3A+Feature">Request feature</a>
  </p>
</p>

[![GitHub release](https://img.shields.io/github/release/ba-st/Willow-Mixpanel.svg)](https://github.com/ba-st/Willow-Mixpanel/releases/latest)
[![Build Status](https://github.com/ba-st/Willow-Mixpanel/workflows/Build/badge.svg?branch=release-candidate)](https://github.com/ba-st/Willow-Mixpanel/actions?query=workflow%3ABuild)
[![Coverage Status](https://codecov.io/github/ba-st/Willow-Mixpanel/coverage.svg?branch=release-candidate)](https://codecov.io/gh/ba-st/Willow-Mixpanel/branch/release-candidate)
[![Pharo 6.1](https://img.shields.io/badge/Pharo-6.1-informational)](https://pharo.org)
[![Pharo 7.0](https://img.shields.io/badge/Pharo-7.0-informational)](https://pharo.org)
[![Pharo 8.0](https://img.shields.io/badge/Pharo-8.0-informational)](https://pharo.org)

## License
- The code is licensed under [MIT](LICENSE).
- The documentation is licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).
- The [Mixpanel Javascript API](https://github.com/mixpanel/mixpanel-js) is copyright of [Mixpanel, Inc.](https://mixpanel.com) and released under [Apache License Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)

## Quick Start

- Download the latest [Pharo 32](https://get.pharo.org/) or [64 bits VM](https://get.pharo.org/64/).
- Download a ready to use image from the [release page](https://github.com/ba-st/Willow-Mixpanel/releases/latest)
- Explore the [documentation](docs/)

Include `WillowMixpanelMetadataLibrary` in the libraries updating the application root.

```smalltalk
(WillowMixpanelMetadataLibrary using: 'YOUR_MIXPANEL_TOKEN') updateRoot: aRoot
```
This will load the mixpanel support and then start tracking your events:

```smalltalk
  button onTrigger sendToMixpanel: [:mixpanel | mixpanel track: 'User event' ]
```

## Installation

To load the project in a Pharo image, or declare it as a dependency of your own project follow this [instructions](docs/Installation.md).

## Contributing

Check the [Contribution Guidelines](CONTRIBUTING.md)

### Credits
- This integration was initially made at [Mercap](https://www.mercapsoftware.com/en/) by @fortizpenaloza
- [Pharo](https://pharo.org) and GitHub migration by @gcotelli

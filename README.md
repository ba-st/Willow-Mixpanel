# Willow Mixpanel

![Logo](assets/logos/128x128.png)

Integration between [Willow](https://github.com/ba-st/Willow/)
and the [Mixpanel Javascript API](https://mixpanel.com/help/reference/javascript)

[![Unit Tests](https://github.com/ba-st/Willow-Mixpanel/actions/workflows/unit-tests.yml/badge.svg)](https://github.com/ba-st/Willow-Mixpanel/actions/workflows/unit-tests.yml/badge.svg)
[![Coverage Status](https://codecov.io/github/ba-st/Willow-Mixpanel/coverage.svg?branch=release-candidate)](https://codecov.io/gh/ba-st/Willow-Mixpanel/branch/release-candidate)
[![Baseline Groups](https://github.com/ba-st/Willow-Mixpanel/actions/workflows/loading-groups.yml/badge.svg)](https://github.com/ba-st/Willow-Mixpanel/actions/workflows/loading-groups.yml)
[![Markdown Lint](https://github.com/ba-st/Willow-Mixpanel/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/ba-st/Willow-Mixpanel/actions/workflows/markdown-lint.yml)

[![GitHub release](https://img.shields.io/github/release/ba-st/Willow-Mixpanel.svg)](https://github.com/ba-st/Willow-Mixpanel/releases/latest)
[![Pharo 7.0](https://img.shields.io/badge/Pharo-7.0-informational)](https://pharo.org)
[![Pharo 8.0](https://img.shields.io/badge/Pharo-8.0-informational)](https://pharo.org)
[![Pharo 9.0](https://img.shields.io/badge/Pharo-9.0-informational)](https://pharo.org)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-informational)](https://pharo.org)

## Quick links

- [**Explore the docs**](docs/README.md)
- [Report a defect](https://github.com/ba-st/Willow-Mixpanel/issues/new?labels=Type%3A+Defect)
- [Request a feature](https://github.com/ba-st/Willow-Mixpanel/issues/new?labels=Type%3A+Feature)

## License

- The code is licensed under [MIT](LICENSE).
- The documentation is licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).

## Quick Start

To load the project in a Pharo image follow this [instructions](docs/how-to/how-to-load-in-pharo.md).

Include `WillowMixpanelMetadataLibrary` in the libraries updating the application
root.

```smalltalk
(WillowMixpanelMetadataLibrary using: 'YOUR_MIXPANEL_TOKEN') updateRoot: aRoot
```

This will load the mixpanel support and then start tracking your events:

```smalltalk
  button onTrigger sendToMixpanel: [:mixpanel | mixpanel track: 'User event' ]
```

## Contributing

Check the [Contribution Guidelines](CONTRIBUTING.md)

## Credits

- This integration was initially made at [Mercap](https://www.mercapsoftware.com/en/)
  by @fortizpenaloza
- [Pharo](https://pharo.org) and GitHub migration by @gcotelli

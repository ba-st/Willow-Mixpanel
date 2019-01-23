# Installation

## Basic Installation

You can load **Willow-Mixpanel** evaluating:
```smalltalk
Metacello new
	baseline: 'WillowMixpanel';
	repository: 'github://ba-st/Willow-Mixpanel:release-candidate/source';
	load.
```
>  Change `release-candidate` to some released version if you want a pinned version

## Using as dependency

In order to include **Willow-Mixpanel** as part of your project, you should reference the package in your product baseline:

```smalltalk
setUpDependencies: spec

	spec
		baseline: 'WillowMixpanel'
			with: [ spec
				repository: 'github://ba-st/Willow-Mixpanel:v{XX}/source';
				loads: #('Deployment') ];
		import: 'WillowMixpanel'.
```
> Replace `{XX}` with the version you want to depend on

```smalltalk
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec package: 'My-Package' with: [ spec requires: #('WillowMixpanel') ] ]
```

## Provided groups

- `Deployment` will load all the packages needed in a deployed application
- `Tests` will load the test cases
- `Dependent-SUnit-Extensions` will load the extensions to the SUnit framework
- `Tools` will load the extensions to the SUnit framework and development tools (inspector and spotter extensions)
- `CI` is the group loaded in the continuous integration setup
- `Development` will load all the needed packages to develop and contribute to the project

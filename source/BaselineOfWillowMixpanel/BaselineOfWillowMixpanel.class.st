Class {
	#name : #BaselineOfWillowMixpanel,
	#superclass : #BaselineOf,
	#category : #BaselineOfWillowMixpanel
}

{ #category : #baselines }
BaselineOfWillowMixpanel >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Willow-Mixpanel' with: [ spec requires: #('Willow') ];
				package: 'Willow-Mixpanel-Tests' with: [ spec requires: #('Willow-Mixpanel' 'Willow-Tests') ].
			spec
				group: 'Deployment' with: #('Willow-Mixpanel');
				group: 'Development' with: #('Deployment' 'Willow-Mixpanel-Tests');
				group: 'default' with: #('Deployment') ]
]

{ #category : #initialization }
BaselineOfWillowMixpanel >> setUpDependencies: spec [

	spec
		baseline: 'Willow'
			with: [ spec
				repository: 'github://ba-st/Willow:v11/source';
				loads: #('Willow') ];
		project: 'Willow-Tests' copyFrom: 'Willow' with: [ spec loads: #('Willow-Tests') ]
]

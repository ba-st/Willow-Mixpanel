Class {
	#name : #BaselineOfWillowMixpanel,
	#superclass : #BaselineOf,
	#category : #BaselineOfWillowMixpanel
}

{ #category : #baselines }
BaselineOfWillowMixpanel >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self
				setUpDependencies: spec;
				baselineWillowMixpanel: spec.
			spec
				group: 'CI' with: 'Tests';
				group: 'Dependent-SUnit-Extensions' with: 'Willow-SUnit';
				group: 'Tools' with: 'Willow-Tools';
				group: 'Development' with: #('Tests' 'Tools')
			]
]

{ #category : #baselines }
BaselineOfWillowMixpanel >> baselineWillowMixpanel: spec [

	spec
		package: 'Willow-Mixpanel' with: [ spec requires: #('Willow-Deployment') ];
		group: 'Deployment' with: #('Willow-Mixpanel');
		package: 'Willow-Mixpanel-Tests' with: [ spec requires: #('Willow-Mixpanel' 'Willow-SUnit') ];
		group: 'Tests' with: 'Willow-Mixpanel-Tests'
]

{ #category : #accessing }
BaselineOfWillowMixpanel >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #initialization }
BaselineOfWillowMixpanel >> setUpDependencies: spec [

	spec
		baseline: 'Willow' with: [ spec repository: 'github://ba-st/Willow:v11/source' ];
		project: 'Willow-Deployment' copyFrom: 'Willow' with: [ spec loads: 'Deployment' ];
		project: 'Willow-SUnit' copyFrom: 'Willow' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Willow-Tools' copyFrom: 'Willow' with: [ spec loads: 'Tools' ]
]

Class {
	#name : #UserIdentificationCommand,
	#superclass : #MixpanelEventTrackingCommand,
	#instVars : [
		'distinctIDProvider',
		'setOnceParametersProvider'
	],
	#category : #'Willow-Mixpanel'
}

{ #category : #'instance creation' }
UserIdentificationCommand class >> identifiedBy: aDistinctIDProvider storingTheFirstTime: aSetOnceParametersProvider [
	^ self new
		initializeIdentifyedBy: aDistinctIDProvider
		storingTheFirstTime: aSetOnceParametersProvider
]

{ #category : #processing }
UserIdentificationCommand >> applyTo: anHTMLDocument on: aCanvas [
	| script |
	
	script := JSScript new
		<< (aCanvas mixpanel identify: distinctIDProvider value);
		<<
			(aCanvas mixpanel people
				setPropertiesIfAbsent: (self trackingParametersConfiguredBy: setOnceParametersProvider));
		yourself.
		
	anHTMLDocument addLoadScript: script
]

{ #category : #initialization }
UserIdentificationCommand >> initializeIdentifyedBy: aDistinctIDProvider storingTheFirstTime: aSetOnceParametersProvider [

	distinctIDProvider := aDistinctIDProvider.
	setOnceParametersProvider := aSetOnceParametersProvider
]

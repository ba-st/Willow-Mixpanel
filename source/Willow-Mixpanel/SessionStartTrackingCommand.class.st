Class {
	#name : #SessionStartTrackingCommand,
	#superclass : #MixpanelEventTrackingCommand,
	#instVars : [
		'trackingCustomization'
	],
	#category : #'Willow-Mixpanel'
}

{ #category : #'instance creation' }
SessionStartTrackingCommand class >> configuredBy: aTrackingCustomization [

	^ super new initializeConfiguredBy: aTrackingCustomization
]

{ #category : #'instance creation' }
SessionStartTrackingCommand class >> new [
	^ self configuredBy: [  ]
]

{ #category : #processing }
SessionStartTrackingCommand >> applyTo: anHTMLDocument on: aCanvas [
	| script |
	
	script := JSScript new
		<<
			(aCanvas mixpanel
				track: '$session_start'
				with: (self trackingParametersConfiguredBy: trackingCustomization));
		yourself.
	
	anHTMLDocument addLoadScript: script
]

{ #category : #initialization }
SessionStartTrackingCommand >> initializeConfiguredBy: aTrackingCustomization [

	trackingCustomization := aTrackingCustomization
]

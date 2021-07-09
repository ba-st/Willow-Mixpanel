Class {
	#name : #MixpanelEventTrackingCommand,
	#superclass : #Object,
	#pools : [
		'Willow'
	],
	#category : #'Willow-Mixpanel'
}

{ #category : #processing }
MixpanelEventTrackingCommand >> applyTo: aComponent on: aCommand [

	self subclassResponsibility
]

{ #category : #processing }
MixpanelEventTrackingCommand >> trackingParametersConfiguredBy: aBlock [

	| parameters |

	parameters := GRSmallDictionary new.
	aBlock cull: parameters.
	^parameters
]

Class {
	#name : #MixpanelNamespace,
	#superclass : #JSObject,
	#pools : [
		'Willow'
	],
	#category : #'Willow-Mixpanel'
}

{ #category : #'class initialization' }
MixpanelNamespace class >> initialize [

	<ignoreForCoverage>
	Constants bind: #mixpanel to: Namespace new.
	( Constants >> #mixpanel )
		bind: #alias to: 'alias';
		bind: #identify to: 'identify';
		bind: #mixpanel to: 'mixpanel';
		bind: #register to: 'register';
		bind: #registerOnce to: 'register_once';
		bind: #timeEvent to: 'time_event';
		bind: #track to: 'track';
		bind: #trackForms to: 'track_forms';
		bind: #trackLinks to: 'track_links'
]

{ #category : #private }
MixpanelNamespace >> call: aString withArguments: anArray [

	^(super call: aString withArguments: anArray)
		condition: (self class new typeOf notIdenticalTo: JSStream undefined greaseString)
]

{ #category : #private }
MixpanelNamespace >> constants [

	^ super constants >> #mixpanel
]

{ #category : #methods }
MixpanelNamespace >> createAlias: aUniqueIdentifier [

	"Create an alias, which Mixpanel will use to link two distinct_ids going forward (not retroactively). 
	Multiple aliases can map to the same original ID, but not vice-versa. Aliases can also be chained."

	^ self call: self constants >> #alias with: aUniqueIdentifier
]

{ #category : #methods }
MixpanelNamespace >> identify: aUniqueIdentifier [

	"Identify a user with a unique ID instead of a Mixpanel randomly generated distinct_id. 
	If the method is never called, then unique visitors will be identified by a UUID generated the first time they visit the site."

	^ self call: self constants >> #identify with: aUniqueIdentifier
]

{ #category : #printing }
MixpanelNamespace >> javascriptContentOn: aStream [

	aStream nextPutAll: self constants >> #mixpanel
]

{ #category : #accesing }
MixpanelNamespace >> people [

	| userProfile |

	userProfile := MixpanelUserProfile new.
	self addDecoration: userProfile.
	self access: 'people'.
	^userProfile
]

{ #category : #methods }
MixpanelNamespace >> register: propertiesSet [

	"Register a set of super properties, which are included with all events. 
	This will overwrite previous super property values."

	^ self call: self constants >> #register with: propertiesSet
]

{ #category : #methods }
MixpanelNamespace >> registerOnce: propertiesSet [

	"Register a set of super properties only once. 
	This will not overwrite previous super property values, unlike register()."

	^ self call: self constants >> #registerOnce with: propertiesSet
]

{ #category : #methods }
MixpanelNamespace >> timeEvent: anEventName [

	^ self call: self constants >> #timeEvent with: anEventName
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName [

	^ self call: self constants >> #track with: anEventName
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName whenClicked: aDOMQuery [

	^ self call: self constants >> #trackLinks with: aDOMQuery with: anEventName
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName whenSubmitted: aDOMQuery [

	^ self call: self constants >> #trackForms with: aDOMQuery with: anEventName
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName with: propertiesSet [

	^ self call: self constants >> #track with: anEventName with: propertiesSet
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName with: propertiesSet whenClicked: aDOMQuery [

	^ self
		call: self constants >> #trackLinks
		with: aDOMQuery
		with: anEventName
		with: propertiesSet
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName with: propertiesSet whenSubmitted: aDOMQuery [

	^ self
		call: self constants >> #trackForms
		with: aDOMQuery
		with: anEventName
		with: propertiesSet
]

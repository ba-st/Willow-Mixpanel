Class {
	#name : #MixpanelNamespace,
	#superclass : #JSObject,
	#category : #'Willow-Mixpanel'
}

{ #category : #private }
MixpanelNamespace >> call: aString withArguments: anArray [

	^(super call: aString withArguments: anArray)
		condition: (self class new typeOf notIdenticalTo: JSStream undefined greaseString)
]

{ #category : #methods }
MixpanelNamespace >> createAlias: aUniqueIdentifier [

	"Create an alias, which Mixpanel will use to link two distinct_ids going forward (not retroactively). 
	Multiple aliases can map to the same original ID, but not vice-versa. Aliases can also be chained."

	^ self call: MixpanelConstants alias with: aUniqueIdentifier
]

{ #category : #methods }
MixpanelNamespace >> identify: aUniqueIdentifier [

	"Identify a user with a unique ID instead of a Mixpanel randomly generated distinct_id. 
	If the method is never called, then unique visitors will be identified by a UUID generated the first time they visit the site."

	^ self call: MixpanelConstants identify with: aUniqueIdentifier
]

{ #category : #printing }
MixpanelNamespace >> javascriptContentOn: aStream [

	aStream nextPutAll: MixpanelConstants mixpanel
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

	^ self call: MixpanelConstants register with: propertiesSet
]

{ #category : #methods }
MixpanelNamespace >> registerOnce: propertiesSet [

	"Register a set of super properties only once. 
	This will not overwrite previous super property values, unlike register()."

	^ self call: MixpanelConstants registerOnce with: propertiesSet
]

{ #category : #methods }
MixpanelNamespace >> timeEvent: anEventName [

	^ self call: MixpanelConstants timeEvent with: anEventName
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName [

	^ self call: MixpanelConstants track with: anEventName
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName whenClicked: aDOMQuery [

	^ self call: MixpanelConstants trackLinks with: aDOMQuery with: anEventName
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName whenSubmitted: aDOMQuery [

	^ self call: MixpanelConstants trackForms with: aDOMQuery with: anEventName
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName with: propertiesSet [

	^ self call: MixpanelConstants track with: anEventName with: propertiesSet
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName with: propertiesSet whenClicked: aDOMQuery [

	^ self
		call: MixpanelConstants trackLinks
		with: aDOMQuery
		with: anEventName
		with: propertiesSet
]

{ #category : #methods }
MixpanelNamespace >> track: anEventName with: propertiesSet whenSubmitted: aDOMQuery [

	^ self
		call: MixpanelConstants trackForms
		with: aDOMQuery
		with: anEventName
		with: propertiesSet
]

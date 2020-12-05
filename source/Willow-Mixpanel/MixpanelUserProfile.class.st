Class {
	#name : #MixpanelUserProfile,
	#superclass : #JSDecoration,
	#category : #'Willow-Mixpanel'
}

{ #category : #methods }
MixpanelUserProfile >> add: aValue ifAbsentTo: aPropertyName [

	^ owner call: 'union' with: aPropertyName with: aValue
]

{ #category : #methods }
MixpanelUserProfile >> append: aValue to: aPropertyName [

	^ owner call: 'append' with: aPropertyName with: aValue
]

{ #category : #methods }
MixpanelUserProfile >> at: aPropertyName ifAbsentPut: aValue [

	^ self
		setPropertiesIfAbsent:
			(GRSmallDictionary new
				at: aPropertyName put: aValue;
				yourself)
]

{ #category : #methods }
MixpanelUserProfile >> at: aPropertyName put: aValue [

	^ self
		setProperties:
			(GRSmallDictionary new
				at: aPropertyName put: aValue;
				yourself)
]

{ #category : #methods }
MixpanelUserProfile >> clearCharges [

	^ owner call: 'clear_charges'
]

{ #category : #methods }
MixpanelUserProfile >> deleteUser [

	^ owner call: 'delete_user'
]

{ #category : #methods }
MixpanelUserProfile >> increment: aPropertyNameOrJSObject [

	^ owner call: 'increment' with: aPropertyNameOrJSObject
]

{ #category : #methods }
MixpanelUserProfile >> increment: aPropertyName by: anInteger [

	^ owner call: 'increment' with: aPropertyName with: anInteger
]

{ #category : #methods }
MixpanelUserProfile >> setProperties: aJSObject [

	^ owner call: 'set' with: aJSObject
]

{ #category : #methods }
MixpanelUserProfile >> setPropertiesIfAbsent: aJSObject [

	^ owner call: 'set_once' with: aJSObject
]

{ #category : #methods }
MixpanelUserProfile >> trackCharge: anInteger [

	^ owner call: 'track_charge' with: anInteger
]

{ #category : #methods }
MixpanelUserProfile >> trackCharge: anInteger on: aDateAndTime [

	^ owner
		call: 'track_charge'
		with: anInteger
		with:
			(GRSmallDictionary new
				at: '$time' put: aDateAndTime printString;
				yourself)
]

{ #category : #methods }
MixpanelUserProfile >> unsetProperties: aPropertyNameOrArray [

	^ owner call: 'unset' with: aPropertyNameOrArray
]

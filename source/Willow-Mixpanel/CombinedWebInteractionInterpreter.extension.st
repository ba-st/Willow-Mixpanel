Extension { #name : #CombinedWebInteractionInterpreter }

{ #category : #'*Willow-Mixpanel' }
CombinedWebInteractionInterpreter >> sendToMixpanel: aBlock [

	^ self interpretersDo: [ :interpreter | interpreter sendToMixpanel: aBlock ]
]

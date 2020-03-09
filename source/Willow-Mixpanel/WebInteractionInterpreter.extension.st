Extension { #name : #WebInteractionInterpreter }

{ #category : #'*Willow-Mixpanel' }
WebInteractionInterpreter >> sendToMixpanel: aBlock [

	^ self
		executeOnClient: [ :canvas | 
			| mixpanel |

			mixpanel := canvas mixpanel.
			aBlock cull: mixpanel cull: canvas.
			mixpanel ]
]

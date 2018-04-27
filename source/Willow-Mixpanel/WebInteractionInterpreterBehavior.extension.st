Extension { #name : #WebInteractionInterpreterBehavior }

{ #category : #'*Willow-Mixpanel' }
WebInteractionInterpreterBehavior >> sendToMixpanel: aBlock [

	^ self
		executeOnClient: [ :script :canvas | 
			| mixpanel |

			mixpanel := canvas mixpanel.
			aBlock cull: mixpanel cull: canvas.
			script << mixpanel ]
]

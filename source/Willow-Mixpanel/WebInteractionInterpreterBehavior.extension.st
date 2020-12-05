Extension { #name : #WebInteractionInterpreterBehavior }

{ #category : #'*Willow-Mixpanel' }
WebInteractionInterpreterBehavior >> sendToMixpanel: aBlock [

	^ self
		userAgentDo: [ :canvas | 
			| mixpanel |

			mixpanel := canvas mixpanel.
			aBlock cull: mixpanel cull: canvas.
			mixpanel ]
]

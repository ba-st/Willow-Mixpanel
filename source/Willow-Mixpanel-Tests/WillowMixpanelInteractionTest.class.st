Class {
	#name : #WillowMixpanelInteractionTest,
	#superclass : #WARenderingTest,
	#category : #'Willow-Mixpanel-Tests'
}

{ #category : #tests }
WillowMixpanelInteractionTest >> testSendToMixpanel [

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter sendToMixpanel: [ :mixpanel | mixpanel track: 'Testing' ].
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas button ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="submit"></button><script type="text/javascript">$("#button-id1").click(function(event){if(typeof mixpanel!=="undefined"){mixpanel.track("Testing")}});</script>'
]

Class {
	#name : #UnexpectedSessionEndTrackingCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Mixpanel-Tests'
}

{ #category : #tests }
UnexpectedSessionEndTrackingCommandTest >> testApplyTo [
	| script |
	script := self
		renderUsing: [ :canvas | 
			UnexpectedSessionEndTrackingCommand new
				applyTo: canvas document
				on: canvas ].
	self
		assert: script
		equals:
			'<script type="text/javascript">window.addEventListener("beforeunload",function(e){e.preventDefault();if(typeof mixpanel!=="undefined"){mixpanel.track("$session_end",{"reason":"Close browser''s tab"})}});</script>'
]

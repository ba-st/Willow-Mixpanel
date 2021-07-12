Class {
	#name : #SessionStartTrackingCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Mixpanel-Tests'
}

{ #category : #tests }
SessionStartTrackingCommandTest >> testApplyTo [
	| command script |

	command := SessionStartTrackingCommand
		configuredBy: [ :params | params at: '$tracked_param' put: 'Tracked value' ].

	script := self
		renderUsing: [ :canvas | command applyTo: canvas document on: canvas ].

	self
		assert: script
		equals:
			'<script type="text/javascript">if(typeof mixpanel!=="undefined"){mixpanel.track("$session_start",{"$tracked_param":"Tracked value"})};</script>'
]

{ #category : #tests }
SessionStartTrackingCommandTest >> testDefaultApplyTo [
	| command script |

	command := SessionStartTrackingCommand new.

	script := self
		renderUsing: [ :canvas | command applyTo: canvas document on: canvas ].

	self
		assert: script
		equals:
			'<script type="text/javascript">if(typeof mixpanel!=="undefined"){mixpanel.track("$session_start",{})};</script>'
]

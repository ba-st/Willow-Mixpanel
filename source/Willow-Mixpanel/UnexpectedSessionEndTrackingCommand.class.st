Class {
	#name : #UnexpectedSessionEndTrackingCommand,
	#superclass : #MixpanelEventTrackingCommand,
	#category : #'Willow-Mixpanel'
}

{ #category : #processing }
UnexpectedSessionEndTrackingCommand >> applyTo: anHTMLDocument on: aCanvas [
	| trackSessionEnd callback script |
	
	trackSessionEnd := aCanvas mixpanel
		track: #'$session_end' greaseString
		with:
			(self
				trackingParametersConfiguredBy: [ :params | 
					params
						at: #reason greaseString
						put: #'Close browser''s tab' greaseString ]).
					
	callback := JSFunction new
		arguments: #('e');
		<< (JSStream on: 'e.preventDefault()');
		<< trackSessionEnd;
		yourself.
		
	script := (JSStream new alias: 'window')
		call: 'addEventListener'
		with: 'beforeunload'
		with: callback.
		
	anHTMLDocument addLoadScript: script
]

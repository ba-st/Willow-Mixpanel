Class {
	#name : #UserIdentificationCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Mixpanel-Tests'
}

{ #category : #tests }
UserIdentificationCommandTest >> testApplyTo [
	| command script |
	
	command := UserIdentificationCommand
		identifiedBy: [ 'user_unique_id' ]
		storingTheFirstTime: [ :params | 
			params
				at: '$email' put: 'johndoe@nowhere.com';
				at: '$avatar' put: 'http://mugshots.com/johndoe';
				at: '$name' put: 'John Doe';
				yourself ].

	script := self
		renderUsing: [ :canvas | command applyTo: canvas document on: canvas ].

	self
		assert: script
		equals:
			'<script type="text/javascript">if(typeof mixpanel!=="undefined"){mixpanel.identify("user_unique_id")};if(typeof mixpanel!=="undefined"){mixpanel.people.set_once({"$email":"johndoe@nowhere.com","$avatar":"http://mugshots.com/johndoe","$name":"John Doe"})};</script>'
]

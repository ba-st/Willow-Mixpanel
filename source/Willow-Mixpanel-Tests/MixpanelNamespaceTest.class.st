"
A MixpanelNamespaceTest is a test class for testing the behavior of MixpanelNamespace
"
Class {
	#name : #MixpanelNamespaceTest,
	#superclass : #JSObjectTest,
	#category : #'Willow-Mixpanel-Tests'
}

{ #category : #Accessing }
MixpanelNamespaceTest >> fixedDateAndTime [

	^ DateAndTime
		year: 2013
		month: 1
		day: 2
		hour: 0
		minute: 0
		offset: (Duration hours: -3)
]

{ #category : #Accessing }
MixpanelNamespaceTest >> mixpanel [

	^ MixpanelNamespace new
]

{ #category : #tests }
MixpanelNamespaceTest >> testAlias [

	self
		assert: (self mixpanel createAlias: 'sally@gmail.com')
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.alias("sally@gmail.com")}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testIdentify [

	self
		assert: (self mixpanel identify: 'sally@gmail.com')
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.identify("sally@gmail.com")}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testJavascriptContentOn [

	self assert: MixpanelNamespace new equals: 'mixpanel'
]

{ #category : #tests }
MixpanelNamespaceTest >> testRegister [

	self
		assert:
			(self mixpanel
				register:
					{('Email' -> 'jdoe@example.com').
					('Account Type' -> 'Free')} asDictionary)
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.register({"Email":"jdoe@example.com","Account Type":"Free"})}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testRegisterOnce [

	self
		assert:
			(self mixpanel
				registerOnce:
					{('Email' -> 'jdoe@example.com').
					('Account Type' -> 'Free')} asDictionary)
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.register_once({"Email":"jdoe@example.com","Account Type":"Free"})}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testTimeEvent [

	self
		assert: (self mixpanel timeEvent: 'Registered')
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.time_event("Registered")}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testTrack [

	self
		assert: (self mixpanel track: 'Registered')
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.track("Registered")}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testTrackForms [

	self
		assert: (self mixpanel track: 'Created Account' whenSubmitted: '#register')
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.track_forms("#register","Created Account")}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testTrackFormsWithProperties [

	self
		assert:
			(self mixpanel
				track: 'Created Account'
				with:
					{('amount' -> 1000).
					('unit' -> 'AY24')} asDictionary
				whenSubmitted: '#register')
		equals:
			'if(typeof mixpanel!=="undefined"){mixpanel.track_forms("#register","Created Account",{"amount":1000,"unit":"AY24"})}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testTrackLinks [

	self
		assert: (self mixpanel track: 'Clicked Nav Link' whenClicked: '#nav')
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.track_links("#nav","Clicked Nav Link")}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testTrackLinksWithProperties [

	self
		assert: (self mixpanel track: 'Clicked Nav Link' with: {('genre' -> 'hip-hop')} asDictionary whenClicked: '#nav')
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.track_links("#nav","Clicked Nav Link",{"genre":"hip-hop"})}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testTrackWithProperties [

	self
		assert: (self mixpanel track: 'Registered' with: {('genre' -> 'hip-hop')} asDictionary)
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.track("Registered",{"genre":"hip-hop"})}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testUserProfileAddIfAbsent [

	self
		assert: (self mixpanel people add: 'homepage' ifAbsentTo: 'Pages Visited')
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.union("Pages Visited","homepage")}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testUserProfileAppend [

	self
		assert: (self mixpanel people append: 'homepage' to: 'Pages Visited')
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.append("Pages Visited","homepage")}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testUserProfileDelete [

	self
		assert: self mixpanel people deleteUser
		equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.delete_user()}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testUserProfileIncrement [

	self
		assert: (self mixpanel people increment: 'Login Count')
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.increment("Login Count")}';
		assert: (self mixpanel people increment: 'Points Earned' by: 500)
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.increment("Points Earned",500)}';
		assert:
			(self mixpanel people
				increment:
					{('credits remaining' -> -34).
					('dollars spent' -> 17)} asDictionary)
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.increment({"credits remaining":-34,"dollars spent":17})}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testUserProfileProperties [

	self
		assert: (self mixpanel people setProperties: {('Plan' -> 'Premium')} asDictionary)
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.set({"Plan":"Premium"})}';
		assert: (self mixpanel people at: 'Plan' put: 'Premium')
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.set({"Plan":"Premium"})}';
		assert: (self mixpanel people at: 'Plan' ifAbsentPut: 'Premium')
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.set_once({"Plan":"Premium"})}'.

	self
		assert: (self mixpanel people unsetProperties: #('Plan' 'Gender'))
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.unset(["Plan","Gender"])}';
		assert: (self mixpanel people unsetProperties: 'Plan')
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.unset("Plan")}'
]

{ #category : #tests }
MixpanelNamespaceTest >> testUserProfileTrackingRevenue [

	self
		assert: (self mixpanel people trackCharge: 100)
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.track_charge(100)}';
		assert: (self mixpanel people trackCharge: -50)
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.track_charge(-50)}';
		assert: (self mixpanel people trackCharge: 25 on: self fixedDateAndTime)
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.track_charge(25,{"$time":"2013-01-02T00:00:00-03:00"})}';
		assert: self mixpanel people clearCharges
			equals: 'if(typeof mixpanel!=="undefined"){mixpanel.people.clear_charges()}'
]

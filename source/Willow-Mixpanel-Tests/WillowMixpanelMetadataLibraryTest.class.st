"
A WillowMixpanelMetadataLibraryTest is a test class for testing the behavior of WillowMixpanelMetadataLibrary
"
Class {
	#name : #WillowMixpanelMetadataLibraryTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Mixpanel-Tests'
}

{ #category : #tests }
WillowMixpanelMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: (WillowMixpanelMetadataLibrary forDeployment using: 'YOUR_TOKEN')
		createsAsFolders: #('willow-mixpanel-1.0.0')
		andFileContentsMatching: {('willow-mixpanel-1.0.0/loader.js' -> '4c08e4eddddf646df1154b8cabcd48fe5ee9a950')}
]

{ #category : #tests }
WillowMixpanelMetadataLibraryTest >> testInstanceCreation [

	self
		assert: WillowMixpanelMetadataLibrary forDeployment equals: WillowMixpanelMetadataLibrary;
		assert: WillowMixpanelMetadataLibrary forDevelopment equals: WillowMixpanelMetadataLibrary
]

{ #category : #tests }
WillowMixpanelMetadataLibraryTest >> testTesting [

	self
		assert: WillowMixpanelMetadataLibrary isForDeployment;
		assert: WillowMixpanelMetadataLibrary isForDevelopment
]

{ #category : #tests }
WillowMixpanelMetadataLibraryTest >> testUpdateRoot [

	| html |

	html := self fullDocumentRendering: (WillowMixpanelMetadataLibrary forDeployment using: 'YOUR_TOKEN').

	self assert: html equals: '<html><head><title></title><script type="text/javascript" src="/files/willow-mixpanel-1.0.0/loader.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]

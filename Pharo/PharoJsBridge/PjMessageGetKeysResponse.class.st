Class {
	#name : #PjMessageGetKeysResponse,
	#superclass : #PjMessageC2sInResponseTo,
	#category : #'PharoJsBridge-Messages'
}

{ #category : #public }
PjMessageGetKeysResponse >> getValueWithBridge: aBridge [
	^ self contents
]

{ #category : #printing }
PjMessageGetKeysResponse >> logDescription [
	^ String
		streamContents: [ :ws | 
			ws nextPutAll: self class name.
			ws nextPutAll: ' id: '.
			ws nextPutAll: self id asString.
			ws nextPutAll: ' inResponseToId: '.
			ws
				nextPutAll:
					(self inResponseToId
						ifNotNil: [ :aNumber | aNumber asString ]
						ifNil: [ '-' ]).
			ws nextPutAll: ' contents: '.
			ws
				nextPutAll: self contents size asString , ' key-value pairs' ]
]

{ #category : #printing }
PjMessageGetKeysResponse >> printOn: ws [
	<pharoJsSkip>
	super printOn: ws.
	ws space.
	ws << 'ir2id: '.
	ws << (self inResponseToId ifNil: ['-']).
	ws space.
	ws << self contents
]

accessing
start
	^leftBar isNil 
		ifTrue: [statements isEmpty ifTrue: [1] ifFalse: [statements first start]]
		ifFalse: [leftBar]